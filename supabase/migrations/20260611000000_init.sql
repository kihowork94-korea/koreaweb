-- =====================================================
-- 지능형 바이오 모니터링 연구실 — 초기 스키마
-- =====================================================

-- 구성원
CREATE TABLE members (
  id              SERIAL PRIMARY KEY,
  sort_order      INTEGER DEFAULT 0,
  role            TEXT NOT NULL CHECK (role IN ('professor','postdoc','phd','combined','ms','undergraduate','alumni')),
  name            JSONB NOT NULL,
  image_url       TEXT,
  email           TEXT,
  bio             JSONB,
  description     JSONB,
  research_interests    JSONB DEFAULT '[]',
  research_description  JSONB,
  education       JSONB DEFAULT '[]',
  achievements    JSONB DEFAULT '[]',
  publication_ids INTEGER[] DEFAULT '{}',
  homepage        TEXT,
  google_scholar  TEXT,
  researchgate    TEXT,
  orcid           TEXT,
  cv_url          TEXT,
  github          TEXT,
  -- 졸업생 전용
  graduated_year        INTEGER,
  graduated_degree      JSONB,
  current_position      JSONB,
  current_institution   JSONB,
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- 논문
CREATE TABLE publications (
  id              SERIAL PRIMARY KEY,
  type            TEXT NOT NULL CHECK (type IN ('journal','conference','patent','preprint','book')),
  title           TEXT NOT NULL,
  authors         TEXT[] NOT NULL DEFAULT '{}',
  venue           TEXT,
  year            INTEGER,
  month           INTEGER,
  volume          TEXT,
  issue           TEXT,
  pages           TEXT,
  article_number  TEXT,
  publisher       TEXT,
  doi             TEXT,
  abstract        TEXT,
  links           JSONB DEFAULT '{}',
  award           JSONB,
  is_highlighted  BOOLEAN DEFAULT FALSE,
  tags            TEXT[] DEFAULT '{}',
  patent_number   TEXT,
  patent_country  TEXT,
  patent_status   TEXT CHECK (patent_status IN ('registered','pending')),
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- 연구 분야
CREATE TABLE research_areas (
  id          SERIAL PRIMARY KEY,
  sort_order  INTEGER DEFAULT 0,
  title       JSONB NOT NULL,
  description JSONB,
  keywords    JSONB DEFAULT '[]',
  icon_name   TEXT,
  image_url   TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 프로젝트
CREATE TABLE projects (
  id              SERIAL PRIMARY KEY,
  title           JSONB NOT NULL,
  description     JSONB,
  status          TEXT NOT NULL CHECK (status IN ('ongoing','completed')),
  start_year      INTEGER,
  end_year        INTEGER,
  funding_agency  JSONB,
  funding_amount  TEXT,
  member_ids      INTEGER[] DEFAULT '{}',
  tags            TEXT[] DEFAULT '{}',
  links           JSONB DEFAULT '{}',
  created_at      TIMESTAMPTZ DEFAULT NOW(),
  updated_at      TIMESTAMPTZ DEFAULT NOW()
);

-- 뉴스
CREATE TABLE news (
  id           SERIAL PRIMARY KEY,
  category     TEXT NOT NULL CHECK (category IN ('announcement','award','press','recruitment','event')),
  title        JSONB NOT NULL,
  content      JSONB,
  date         DATE NOT NULL,
  image_url    TEXT,
  external_url TEXT,
  is_pinned    BOOLEAN DEFAULT FALSE,
  created_at   TIMESTAMPTZ DEFAULT NOW(),
  updated_at   TIMESTAMPTZ DEFAULT NOW()
);

-- 연구실 기본 정보 (1행)
CREATE TABLE lab_info (
  id          INTEGER PRIMARY KEY DEFAULT 1,
  name        JSONB,
  short_name  JSONB,
  slogan      JSONB,
  description JSONB,
  university  JSONB,
  department  JSONB,
  established INTEGER,
  location    JSONB,
  contact     JSONB,
  sns         JSONB,
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 연혁
CREATE TABLE lab_history (
  id         SERIAL PRIMARY KEY,
  year       INTEGER NOT NULL,
  month      INTEGER,
  content    JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- RLS (Row Level Security)
-- 읽기: 전체 공개
-- 쓰기: service_role 키만 (어드민 서버에서 처리)
-- =====================================================

ALTER TABLE members       ENABLE ROW LEVEL SECURITY;
ALTER TABLE publications  ENABLE ROW LEVEL SECURITY;
ALTER TABLE research_areas ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects      ENABLE ROW LEVEL SECURITY;
ALTER TABLE news          ENABLE ROW LEVEL SECURITY;
ALTER TABLE lab_info      ENABLE ROW LEVEL SECURITY;
ALTER TABLE lab_history   ENABLE ROW LEVEL SECURITY;

-- 공개 읽기 정책
CREATE POLICY "public read" ON members        FOR SELECT USING (true);
CREATE POLICY "public read" ON publications   FOR SELECT USING (true);
CREATE POLICY "public read" ON research_areas FOR SELECT USING (true);
CREATE POLICY "public read" ON projects       FOR SELECT USING (true);
CREATE POLICY "public read" ON news           FOR SELECT USING (true);
CREATE POLICY "public read" ON lab_info       FOR SELECT USING (true);
CREATE POLICY "public read" ON lab_history    FOR SELECT USING (true);

-- updated_at 자동 갱신
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_members        BEFORE UPDATE ON members        FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER trg_publications   BEFORE UPDATE ON publications   FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER trg_research_areas BEFORE UPDATE ON research_areas FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER trg_projects       BEFORE UPDATE ON projects       FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER trg_news           BEFORE UPDATE ON news           FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER trg_lab_info       BEFORE UPDATE ON lab_info       FOR EACH ROW EXECUTE FUNCTION update_updated_at();

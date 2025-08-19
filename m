Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E233A03E
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605817; cv=none; b=RVsQpFIg5hGTSqZqz9PrFJUPerGvi9nXKSI8vVJehR4hQA/MDguPHTlJu1KyHQublaxj8nbjPaO9OsqwiLPVaXj/gOatr7ea9IO3+Gd4SFcahmXjg6J2V46/yKzo35xZj7gqbOLEEnpcK4PpF/ImmZKp3FJepy7QUsfXhCuo3Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605817; c=relaxed/simple;
	bh=pkf0aRlSU2bh9TSov8FMjnf/h7aem5KbMyfOa0trfco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7dwqY5mROH3QaxVlQ9RaLGpghuT6TcR4SvhURFslezdVcNgW66nvpjPLcpA+UJb6VJ1aGku4rTzltttjzC29jCxkRcGscVD6Cw2k/s/WGut2rYW+P+zTY1Chb/qGC5nca5y0d6LbjnYF9z1kgPoLDGCoOXYjxnFO1cYfDltOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdF/Id/z; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdF/Id/z"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7a0442bso768678866b.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605814; x=1756210614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiixv77psU4RDvOrkp4fJ28vu40GaS8M7efoSdjRzBY=;
        b=DdF/Id/zP073GQL5EVREBHkAdwzt1C3koHP5HalH87FhoXPOkg0zSqVYMqiu057YRJ
         rY8WjQAk1GUSYDGafJQunNYOT+s7R1wP8Jg37fdmESXAt5eim80jkwgpsY4hYhSSAhH7
         edMrAhwnAGHzLmn/RRYgH7IXyaKWYcOLNAA3SYy8zGuDd1gXaFB06mREkgYRE3/W357N
         hI/k6r3Dcz5VbEY33VcA1UK0J8pXNnWREZ8GvxhMh+rfTMIRbRiZwRvaXrYC8X4WIxgy
         laPt65gZVpaWZG8G7XTyCc8/OfGi64ogNZV7Pl7VkLHux29flNf/eboDV6VH4XuHcNv1
         cemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605814; x=1756210614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiixv77psU4RDvOrkp4fJ28vu40GaS8M7efoSdjRzBY=;
        b=tqJ8O0EThMegS/L6mTq0JCFCHQ7UjLkIzydhEqSCJeH2x3NtRPzV9otrXS7R2m9YmW
         PsPwfVz528T1ijImEpF3At6oN0FGytvQaVXDFqWhSXqBS/NDQ8A65Hz8fAqNDuP2jjOh
         cvIwEmCmo1sbjpVN1BVdo0lH0d66HGSSytPDL1RvtjP3LytKSBqIPDnilc9Tiqw9Zg+L
         0fVE3hDfnYl+GLmDnVmXdgtrvLATv9e3xhlLM6pR+KhEkpREmb9kjGMBudVlpKIKuX5D
         Wp3BKO9r0vVhNABc+qDtz0hXMznIcEd71Yz/oNdIah3b4ngwhkO4ddE1HBTZc/AX6jqC
         zFLw==
X-Forwarded-Encrypted: i=1; AJvYcCVSeKR/Yzejk1jpgwI3FOrb26W6eW7GAaVxTaaxzZXkyPFCIL3MoFZryXA/EIbV56HCHQpQc/ThmRxTaNRU@lists.linux.dev
X-Gm-Message-State: AOJu0YwnqTdaujoeIJuIsySCV3EQl/EcWBNhbPeAg9YPMBOzUs2CMtb+
	TkcKJ6gV0sSTggckgKBGKfmaDXJG/VEAscysw4EhSTXMfXXZ3AUwNdEb
X-Gm-Gg: ASbGnctyyC0Seu+000GksD4mWPYKvd5uMo7cc9HzMBuPnINEXlrPNltS5T7+MzIX2sS
	TWLLDWWdsdkaTsjQVvRj3LoO+/8oTKgnUuhsqnJ+0TiCyQkJAVVwJoXpREBHWpm2WxW8ZhKswaF
	5g/+BkcLi13K69Gu4TTv7Wth+mWJsWkNZ3GrQf4RqI/q/AlIlIMsQqalnGuVYF5F3m5v+qIP029
	2+EXm5r4ep1ltu6SzT4pB769muYt1Vu96SysUD1ZtJSravC4IGIJHFcloTIb6TRVaK5mJDClAkD
	g0rS8oEggJSLStUvhiVJPhI4YGu1lbvOovxtBsT0XMGoZLwxS7wOe9DXShd3KGzhEaiFrf4TQVg
	OU7Ns1HYc8caBqg==
X-Google-Smtp-Source: AGHT+IHoW7cmlDSj4FeLC0Y6L5fKUHnHWGAThm5Gw2ojTL8jZq6/7sTeg99ABpe7CZ+VwcMWcDndRA==
X-Received: by 2002:a17:907:3d43:b0:ae3:bd96:78cd with SMTP id a640c23a62f3a-afddc95d9cemr232522666b.7.1755605814133;
        Tue, 19 Aug 2025 05:16:54 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 07/19] staging: media: tegra-video: csi: parametrize MIPI calibration device presence
Date: Tue, 19 Aug 2025 15:16:19 +0300
Message-ID: <20250819121631.84280-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dedicated MIPI calibration block appears only in Tegra114, before Tegra114
all MIPI calibration pads were part of VI block.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c      | 12 +++++++-----
 drivers/staging/media/tegra-video/csi.h      |  1 +
 drivers/staging/media/tegra-video/tegra210.c |  1 +
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 74c92db1032f..2f9907a20db1 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -485,11 +485,13 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return 0;
 
-	chan->mipi = tegra_mipi_request(csi->dev, node);
-	if (IS_ERR(chan->mipi)) {
-		ret = PTR_ERR(chan->mipi);
-		chan->mipi = NULL;
-		dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+	if (csi->soc->has_mipi_calibration) {
+		chan->mipi = tegra_mipi_request(csi->dev, node);
+		if (IS_ERR(chan->mipi)) {
+			ret = PTR_ERR(chan->mipi);
+			chan->mipi = NULL;
+			dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+		}
 	}
 
 	return ret;
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3ed2dbc73ce9..400b913bb1cb 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -128,6 +128,7 @@ struct tegra_csi_soc {
 	unsigned int num_clks;
 	const struct tpg_framerate *tpg_frmrate_table;
 	unsigned int tpg_frmrate_table_size;
+	bool has_mipi_calibration;
 };
 
 /**
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..305472e94af4 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -1218,4 +1218,5 @@ const struct tegra_csi_soc tegra210_csi_soc = {
 	.num_clks = ARRAY_SIZE(tegra210_csi_cil_clks),
 	.tpg_frmrate_table = tegra210_tpg_frmrate_table,
 	.tpg_frmrate_table_size = ARRAY_SIZE(tegra210_tpg_frmrate_table),
+	.has_mipi_calibration = true,
 };
-- 
2.48.1


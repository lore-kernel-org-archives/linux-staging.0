Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7330FC29
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813465; cv=none; b=aC13bwgRk0z/AGzSLvVrpa06zwt7ur0lJ7rDJs06rwtMbNdkxfYJcSjlwm2muxhxuVeLv4j0xqWHeBe5Ce08jUYDuxI0298W0DIRklEJ+YOCDY7fe9dp4oG9saHJkztTkWzxCIQS+F+2UAQhbftcF7BKa/d+T5zgLszAl2uPuQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813465; c=relaxed/simple;
	bh=faNEH5cqnjXg/gz+BC2wvXan6ZNvtxWC+YqN8DJQyXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fP9oH7ApNUpgaTIqB/Lrr1KSgll0IZJGR08nco8GuZXiv0jEjRk6TOnmD6ZLFOIYO5cx2MbIowMMaz3Yd8dphmQbVYDNItIkPkRtk1ojDSBqqLpewOyBNi33LXgzpf5pIC+XhLaG8M0eFFb+VMjMHrZq7lOaEnTr7uKkcGGnN3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Je+3scKG; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Je+3scKG"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57e36125e8aso1019730e87.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813460; x=1759418260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fx8+4vdRQ/UAxNBt+6HBXITvbdfxM4xzJ6LhrqnP1X8=;
        b=Je+3scKG4R6LezK2BDW0zA+zb/ukS7mAdQGA8GTl+qDFIl5Cb65ORIZ6UwMCleEW/Y
         AdkGzMteVfeIfOfov5Xk8i+/gveLP0gzfJMRNadPzVd1FewwCOXsNt2vZLXORQKfo/Mj
         w0/jiow0g69UWj7uTTRHIVdAoJ0tZVeGoC/2TCiPEuEiprv5uzv1iPaLr1r1RWT1801z
         dIvxVFGJe/RybxMxVqqI2Eba6TJy3uqhVnRAnLmnvbnT8u/65gQnoNngqQRNjpzVECDi
         qDMygRLs8dCoBJaXwYp8IIVA/qbk8ooXaJ2Gu3mUvQVtaNCgYM2UlTMfYfeztW3C/OqU
         OC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813460; x=1759418260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fx8+4vdRQ/UAxNBt+6HBXITvbdfxM4xzJ6LhrqnP1X8=;
        b=i2z5UbPymR4FvulXMLo3LeFvlNYxy4Yf3wMTC2VuY14TR7OJ7kyqt78EMxEDw/sdPG
         0T+3HCRlNeZwD2F7+W3JFIwTd/wK2RvPreyvd73WTgmHI4+smk4vVtek35ewzkV/Pa9v
         01V+xLLHoevy4KUAlGXsElFJe3VXBD0pUKju86KYSIEcxnunmdpk0A9SLir1S2twqN5G
         jd0GrfZt09hzO6aQOH38twOl6zNi9/zDgBs7bYrd24UQO+ciUmpqGltvOmnaHhMdCIZL
         a5gfhiN2DHvemxIONibJHneXDsMesG2usUNTHa5gOz3OlNfsgriE0pTF6zhDa5vFHPNl
         WhDg==
X-Forwarded-Encrypted: i=1; AJvYcCX1MdNJkOg+Akp+tIA5ubVLhEm4EaXfxceTqDnC2lUW5KhDBU8bnsO9qgjwKR4ICYsG5/aDWL8SMAOKp722@lists.linux.dev
X-Gm-Message-State: AOJu0YzkKSrdQqvdst9TbXYQirrpcQzIu/uab/rVyxpIourI7Rq4A/t6
	gVpBcToiVNUQGAn6MXohepxRN0YcViiyr7j+hQqb7DOMmWFBjECjs97Z
X-Gm-Gg: ASbGncusOBd94a6PUYl7Wc1HWYWBWcdeXwXDBV97/6AH9CSDKd/R7h6YFDHHWjq2GM+
	GFVV9bVdAE54+FJyNyIE5Doh123JH0fjzcOwFsZvPbrsf6ct+b+5aRspipi7SngEZzXkHYQLV/q
	lDw/mfLNB5032UCysTPBYlD5octqz8wo9A38AhOm6mK5bvs89GyRquhDzpSKO8Ksh3CJhIgToSE
	hjfpbWjRf5LRCBspu8X6YAT1vYAUhWIxFJUmDlXY3mgNE4nh1O5K3cSL9j6SbZAUsNfUcMNECPE
	TZI7SnV9FvrndgreLup1GITTlBQdBatiB6PnYn1fey3BvC99BR7ycRq+MehHuBf0eJQw0DmQM4j
	OwOqIdkvuz7ozAV33YSJHnGaO
X-Google-Smtp-Source: AGHT+IEtsXlkJh4zDVIxsS8Hs/r9wYDKZCtJ2sfjXml1D1zv5EDl/W0Gpd3rSyCqcwLuY7gdFAOzVw==
X-Received: by 2002:a05:6512:ea3:b0:57d:a69c:7083 with SMTP id 2adb3069b0e04-582d0c2a408mr1257970e87.24.1758813459477;
        Thu, 25 Sep 2025 08:17:39 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 16/22] staging: media: tegra-video: tegra20: set VI HW revision
Date: Thu, 25 Sep 2025 18:16:42 +0300
Message-ID: <20250925151648.79510-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index b7a39723dfc2..4b69b556387c 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -589,6 +589,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


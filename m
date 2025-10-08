Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C42FABEE
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908709; cv=none; b=jSDuqUWrY29DvTNmUBnqHnwajIYg1lNCDNMcUB50ToDJCcEio2DkJGqATHm9fk82GLmqQtG0sgJqqSff8Ng7qBAY5ehMYz/tmSEtk+rMkC/bonVZUmjhbP5ZmU7VKhT9hp8J1lMztRThsKeKsWiEyiCZDzdporkDq5M2dtFTE5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908709; c=relaxed/simple;
	bh=vH0xJgN2W2szoe//wNhYvtT1BAPozP86dafTWttSucw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lgwn8WbpYvUmg1AA9KqPSvYUhZ7ibXL1YnmVdWUD6Kd7edmG/OjsYdngix2n+O1JT4ePJBYHQ2e5/0luMrAPNIxmOz/bUnKbqYFseKL6X4CpOBKgJDRN/K50GbTdBmAMJJ+ngV4e50+X9gRcWS/BTMEX4XseLEDEGAE5R5ucSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsVeRgkr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsVeRgkr"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57992ba129eso8154241e87.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908704; x=1760513504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=KsVeRgkrC/8STbRlUSOcHMbvaTodbFFZviUMfIdBwYmm0WCEHaOq+UYXRypi6zjLC/
         OIm8q60wPCJJ0T4/Avsy5B9j28CPBDBTAhHQ+myfNzCzRljzI2O7HG+ckeHEY114orA/
         BX7QWD562n/PsNulXwDtyllMK6judC6A+ZdRVIz7QI25BEM1JInNcCro+dZY4Rany299
         bhOeFM4ExnUtK1Frh/75FmZPQ64jE8fPa7L9M0pMxPbivgJCFjT/rpAj5Y0yFbgTTjHM
         w1Gi1NJHGQbqbr6Jwsly9NlvpWuvfYaviGTzJzECW5oLmktiqK7wLDD7vHlObZdoAxDU
         FUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908704; x=1760513504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=aFbVTrNlBNeVPh0bDgVL18SI61Y7/fc1qfiNejb786qR5g4JBYjWKVHSGED4WfXQ41
         wk/PjDj+HVJZQxNyfCiYhDKMmWFXDbD5rdBdMp7t7Gu/xZwHv1Kav55PfLaT/9nseTnU
         f0IOBY4z4qAa64sU69A7HZBeKE9xy7wM28Z1x3iktJvsMyMww8fwJY5b4IwKDWLM5ihM
         Of0bZOAVXyZXJAy9AOR4OvpL7qUxDzLFPRB7bmQIRUkcmyYiVctebFfECZcjr8QXT45B
         OIZ0VQfMxYwhGS3JXz/J4GsQZyv/y/hJJtkvmhOMzsi3eRCq8DLGX26guJVnOsI9AGrd
         SSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/un2JVHkLoXqhtqAlrdQUeKUnSXbvGQf+pSG98X5OMFKjCO7goeBNbI37vbEb2WampOH6JgGM7zp9erdi@lists.linux.dev
X-Gm-Message-State: AOJu0YxUCJcuuHJEWUFrCcJEod4CTpfq6LZyJ1o45hz+uu4h6GLcvC1l
	vf3FJYvjLvQNQS740vMbCoS5d7Hu4937uVAmKsKadtQKbg1bWVY5rN11
X-Gm-Gg: ASbGncuz6HC6Wle6TkjMJFjIy5JJ4FLoDB7N/75/fv9u5DSQBd99u/I6L5tZq/9D/zx
	hUnoDd9r3qtXtxlrPXfiLfQDP7d0L9eMbN6L4rE7PyLChbwKTyniGWsr99iHI/hFHXZ34DWG3cQ
	1LTQCdm4MeyMjFqKMrJkLPZuNNasCWAScpXduHgVbhk2oDdHVr8smh8nkpdhXzegLBvShI015EO
	ap7A+9qqAnyaJbVd8LcgmcuC17z1YarhZAJYQgzKgDCT0wC3Kd7ex0TJYAu0xNaDRNIpo/1Ojta
	EFlm7AXaO9YVKRWcC9Y8PMu39ROz24hp0FflRcVGX0fQar/7qbegyTh5StI6ZI3UXtnoCP2syxn
	8nSJhpEcBZxGLvuxGvg3YXD4gb8hY8MGvu8VsFw==
X-Google-Smtp-Source: AGHT+IHW/s8/FSLeLjY2E3RMDJLZGpJL6irCGCDXRSSnmLe1/pIzWAPaX9pmCT2OHt3ka3/mSzeg5w==
X-Received: by 2002:a05:6512:2399:b0:567:68ad:428e with SMTP id 2adb3069b0e04-5906d888441mr673178e87.0.1759908703855;
        Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 18/24] staging: media: tegra-video: tegra20: set VI HW revision
Date: Wed,  8 Oct 2025 10:30:40 +0300
Message-ID: <20251008073046.23231-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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
index ffaaa2bb8269..93105ed57ca7 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


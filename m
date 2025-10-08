Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E792F6182
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908699; cv=none; b=gRLo9H3EIuFVneWQZWPRFUV25sZ1UaQw688VEZcE1U/QoqYzOs28ZEFON/FHI1OLbGc1JodP3Ph8L+7hoLr53sctkIR0CHKaQ8UbU0LucIkLyNbI66TgZdLx7L5yO3uxMZSNxGioOW1LHqBF5gF6DLFT8naqKHJxFc9Q28RPtMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908699; c=relaxed/simple;
	bh=1E4pIC1QsHHkQt4ekahhKEIh+y+kem4KLZqEezDk7/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9ZwQzk7452sMVVWfZaWt7U9VEPfildOckZVyll20sUAbBVFzIQtkFtCj02klMma2qvCQ7eoqDrVO95Mwdp19VwioEZdtz9euoDASxRkDq1Qi+oTMMLWbThKvSEGvQV45Ih5jxs9Yyi+NbPoF/t8D5e0VC7hTW3T8P9BUOsCWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJqG0E4e; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJqG0E4e"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57bf912cbf6so7584072e87.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908692; x=1760513492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J0PH9dJMfz5boSq++S0Cav+gbesPYUNWBRR+flsya0=;
        b=VJqG0E4e4jUeBgGsfw7XSKIiR/urNuX+rIGLbEdLbZAqpCftLq3gsGCR99hOoaIkQO
         qZXzW+OB+X99IIzux1rRQHw+brfwNu5W4qbA2sg4U6HPklfvzvU6T0G73+xnwHTx6lOJ
         ORHRAxn999szHG2s9vyOF0XOlxmmYLN79MKLc8x89Ymb1zX8U9DAu3yob1Tp24m/M9BQ
         188ifykn2ntZ3SV4eY01dFRB3dXLwamFGxWQz8PCMFV8S6SO18cxOgVF3rE39NeUyWjY
         Anwgzynld2nbdgrD9tx/Lm2z9pLJ05NqbQaWYFUyHJ6imL1On8i0oMzQEyU0kVcd8s2p
         3Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908692; x=1760513492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J0PH9dJMfz5boSq++S0Cav+gbesPYUNWBRR+flsya0=;
        b=UF+v4c+LdV7Hyq76RHqn1LL7ME3+PsZ3ad3EoKls1+q03ihHzWMERDW35wSoLkL4h+
         fu9a8g6yChbbGYy7FOy7u9sD6S4DCSTkfUVFSE79LG5jIiFg8DSBl09IoWd9p605FU+C
         QBRyTnB6noIooxbY6zV1rV/9OdpFpPZIKbyZV30aQm/lq4ie77vEAV+ScQUNeF6gZp8t
         iB6p9SfEy+LOLKnE9/e/kZvrR06EM0ThsSKBpKFkTrWyEgD00DJ+iHvIXCUcSsHERAnu
         7FhWHnpz2lgyTipz/TQN5dRYXLmogpCX+1ygafTz2uNp2hjZt9GJxmLHBiUmtwq41m9U
         giew==
X-Forwarded-Encrypted: i=1; AJvYcCWIOjitwvZmDJaMFPqQ8yIsXM4g9MXIfZwp0KWdqfT802HzwCPMJm2Zc6UuucgBqtgJdeM32zfGhG+tb0xi@lists.linux.dev
X-Gm-Message-State: AOJu0YwT15zKtpPql7gpLm1QsPIWP1Y1pctsR1Z+WOwEdx44FqzoB8gL
	8y7nPlDROdfwy0OPDRZ5IMe7aOhAE2KYRSm4eBm6Wsf5fzIyz+huosmL
X-Gm-Gg: ASbGncsxbGyv0Z/04G/o98ugeg9C2YKcFPIChT7/yUdtMo7xn6d0sVe6q1S+4nB2VDX
	TFI76Z8MhaDYIhOgOFXJppcaqiEDNu+OdcQkq3IIieL2NTmZbX0Ggbj+/C5nW/YNtjge3tVPX7D
	6+kHJa1oYeruL43bjdcvcCmeabvMFMDBG96kL/oENegfjjrmN2MJ7usQoaIiA7NVN3pOS+86UM1
	9UZp2ADHH8yzL3C+bb1Dwe2Z3zncxOXI0T9d0DLGmkHUPXiz9mQVP67tA8YaFf5NTKfFzirdqar
	sf6Jzxqx0KCZBQqLuwMcza48iubHfWddMAuXvEio6SoDNLrPxG1WNPqL27p9+KpuraW2HQDf+OG
	s9anI3i0mEbyh/eMmYHj0bsUi+FIVIOU1tK6t2g==
X-Google-Smtp-Source: AGHT+IGohM+FjzJZWI2mxJtv1ojEP0dXBrfZwMch9BdyXmNUeB5wEHKzwj5zcjMl3VMz4m5oNM6M4Q==
X-Received: by 2002:a05:6512:3b8f:b0:590:651b:10e4 with SMTP id 2adb3069b0e04-5906dd54146mr641087e87.37.1759908692226;
        Wed, 08 Oct 2025 00:31:32 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:31 -0700 (PDT)
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
Subject: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
Date: Wed,  8 Oct 2025 10:30:33 +0300
Message-ID: <20251008073046.23231-12-clamor95@gmail.com>
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

Document MIPI calibration device found in Tegra132.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1


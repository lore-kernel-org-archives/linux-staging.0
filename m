Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012AA30C62A
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813460; cv=none; b=RtqZoJGcnEupMwxKSqdhqyh+SZP5StlR+LpNuTkix8GzCAQ29/i/3SNdvxVrBHhww5brfCImj/qTEnHYWZjKX9wbscwm+HhbbeluxFUm4p8+fQiVqTJ+UB28DhHZFAQI5lhWKft7270oEdb4kPLBIQ5fNknvxK/8BKtBx/UwWr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813460; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOQ0A5iIuW/RXdBDxtoya9UfMCSX5BeHA/xhTM7voGoOqjI3agjD4RzPI+t286ulLuAvLEq7Pb5QSupclZ8Ik5jD4Zb6eyheNRpJAIWj4t4+nkaKmZhweFjjCtyXI0N9MKfPbDxycmrlcY3xDKIYthxbP6OV5AuSeKl86q59KVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuAfO6Jo; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuAfO6Jo"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57e36125e8aso1019635e87.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813454; x=1759418254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=FuAfO6JobnpRsuwmOPsuKwQpIHfaZXBokHDD/nbkxHpN+wo38ulJpocHUkMolNUFRj
         aDlD0UfO/KwoO46QdKyELnqaldE0V0XjW76iMN+5nQVrKvVLsLL1WUHXjWpN3e3ELRew
         Qrt9vg1B+Uc8VmIJd5Fhq6AixBexy4dHvd6ETnyy2mCzWToyt5lxBkOH+kUJgGWIrbOk
         7CSMT+OJh8z3cr6YYcoIkhmkAqMKEPEt9Ol1Kg4NhqBYHlXWBA33dk5DS/32O4zYGKVE
         5bsG+Nks5pWT2dWWO33Ln5wVlz7bg/b+9nDgwkUWDQI0AkAWR8mJU+TFY2Ev4oeGMAzr
         5k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813454; x=1759418254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=v82/TIjn+mpHeA0aYrj/EwAohnN5tcUNN1iT4vQzNLlJavZMhXBm00M7/6AzV0rIAI
         o0LbrtIb6SMH4IpIwat1hzv6eavG6XKOmWfmq1dshYDXjTXiJPGBUtfzbQhqSvKIfS2C
         92wMUfkB+xWESg5t8sgVi91y8JmCM40VlJRuEtCNBQvor+CfxbwLBeX3XVvH9q3++t7j
         uveCJ7OeSonMBTX69lb4XyHYArCOh2wSf0pNs8judcOZHb87UsYsDwdnOLiu6w0qJnj9
         ErE8Lk0M0i+6iOVNZYJvfzNgT9DGp/teK6kbg1H4VqthBzpGCTltPBTs+Au5TpSHgBka
         MalQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcYYiwJ/Wiwcaq5BLwnfPKrNn/6ke8dpjq0Ubke12J5HlwSYbPkidHU5Qj2UzV6p1Sz/2K6VKnIfuP3GGB@lists.linux.dev
X-Gm-Message-State: AOJu0Yxijs5PJi6zGC0CuBRTMWuvD/MDHAwlqr+vejRlpeBvzFShT4D1
	qEsJj2TQgh+b7wO9OjtP/7ktzaerjr77i7tB8B6opZF1nF5VbiJ5JPoi
X-Gm-Gg: ASbGncvCkhigsflgCNhBS/61H75PxnrKRn2X1+4Iz0hcKmhKFjc/Ix1m/KG/bEWRdtu
	cRDgLLeTB+baRooqhsTEnFXPwCIYbQVPD6KOUgkb6aundPQsxRHckYmXjkwKS0EUwXOMVC+ILId
	i8M3hggwD5NwfzqXq0raqZRrUdwPx3KRPjuQQU065Z4+RIDk1whih1boiJnAYj853btBUT2oEOu
	KW/FmFs3dSP2MlC5nR34r2So+5qiB8BnltY+hdIb1cWQCCEoKFTiayg4vV33bphS6jCLNd+IGX1
	8LnGQhC79BkV0OWEQEnPbSQ8dknja7cGTB2ymSQ10mued6//QsPq53LM9aWCly8Z9OMxt8YUDm5
	jJn5G8S7IACOtkw==
X-Google-Smtp-Source: AGHT+IG7KKCjilkRoVVQO6eRQmwua4ImxUfDI3+PmQybBw/b1Fvta80npFLTel5v2tEHntPHpbmfnw==
X-Received: by 2002:a05:6512:1392:b0:573:68fd:7ad2 with SMTP id 2adb3069b0e04-582d25840c9mr1251932e87.35.1758813454230;
        Thu, 25 Sep 2025 08:17:34 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:33 -0700 (PDT)
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
Subject: [PATCH v3 13/22] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Thu, 25 Sep 2025 18:16:39 +0300
Message-ID: <20250925151648.79510-14-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1


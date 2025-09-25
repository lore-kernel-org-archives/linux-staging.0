Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E03115BD
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813466; cv=none; b=ND1TR+ZaUJ2GRfLyYRHndz6a92w79kqIzmwo7YZQY4csx11WQf5b01qq9ln5vj/B1422qQLFGfzQbILEGvFmw2CcqINQ/nH3Ee2/Y1sLIM3DLx/jIi5Ahkn5D+c02Vb8kH4SwypdLjg0H411Ykw3eLfbSen3b33eRTx4wmUIq4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813466; c=relaxed/simple;
	bh=xEdfxaJK8UlRjMN0vvEHNNvzu0cwg9hFbDlCPM7oEtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oReeJWGZAfviK/hitz7xWfu8Xr867/QAupsEEAPnuU2auntm03KqM7WOKDEHp1kIu9RyxU1AtyIeKVZxmR7Jo7l0wCQCrVceYecP9C5u7MG9jxrVWhu5joVoKA641gF8GKgXSpyUezC4p4f95Wd8dzXkJ7xmyUXTMpwr/x4tm8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Md6QUJ6A; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md6QUJ6A"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso1155880e87.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813461; x=1759418261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUp5v1UIpnZY/yoewRvmgW706IOEqdQHhaBwZbL9eqA=;
        b=Md6QUJ6A8Io+8K4tRDMEjXdcq3Kj1jBllFRUfpcbZ8JNV6F9lH2hNu3/B+bKFDy/75
         +U849FQB8geuARH9rh+8oDl03XNxcI8UyYONiKZaYggKyDyq7ZLCiq4rNDRfMXQJ/rIy
         H9bk5rvkLVtstJfR5mxQ6SgnCB1XG8kWdCMczHHYVm0OiMNzEIKubunZxzkwA8vW23Xs
         80lvLqTWgFD6hSb5jxlMH8XNQHzeO1srQdYKoLbk+yfNfyOmb8nJnWY9m7GqOn6ia2fL
         FesqsZzaaJmKOpH5fA7Te4LoOBbr0LyOwuv2Y+qeICKtCtGyTZDG7D3Ga0rNT/WnKiu2
         nAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813461; x=1759418261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUp5v1UIpnZY/yoewRvmgW706IOEqdQHhaBwZbL9eqA=;
        b=Vh7Be10yHyuq2paK6Ug94aalGFpEVS9Rg6UaMJKU/qNpCcbD/s+J/O+9crzcHF27CC
         Sd61ydszSkAXOju9uYv1B4CnT68nn0o9lYifMMf3RqBoHE4ZL/3dpeiuIwak3r7ROBxk
         vog/wD51MAhqBz8g7JjHSr9xNNXJSWmTGKHJlteAjqzL5js4SrE75lUVwDu57Fu1r9kh
         RV852XhBgolMSVpPXLJWSDR/w9iRoFfzcq49LNIDnCHExWQ2dO7r3lSeWXcwpH5LX0JF
         FdSwW8ddgNtaHsv9QIYTyNoqjCdcF7j6QwuA5J6StqAvYHWWguJQZNuCKO9wEVzyKP4q
         hRJg==
X-Forwarded-Encrypted: i=1; AJvYcCVrDMIwXZQkwS0+VP7cdbeaPBMI0nqkTwKx01mzGEy4ULqdbdEGMmHht7Ms//9mVw0+pGIfiuTq7qWzpcxP@lists.linux.dev
X-Gm-Message-State: AOJu0YwKD9Yvkyr6VywnI3FJFICyuB8VEXKOvkpXqn+oruRC0+DrkU7y
	SlnEWt1U6Eflhhs/WpJ3TzAVq9kWw/EwhvkgqWG2cMSckrVkQJbtcU+4
X-Gm-Gg: ASbGncsBuYrs9pO5OqaqtMDMVlXiXSnMMDJuD3ZYi1eKPG9dF34DYqu2JNa2YQptY14
	MikxlPEQ+xyhhWSdZBXmk0lKgyM5rIkx4txAfy3kJQUvKFPj4zHcGBig9Y3JxVjfe6DiBFnZGMs
	7ex3jGOON2EoK8+gRoqM+D1bsS9O55WTYk6e1KJCeH0TXAwOk29C8bC6hERE3ZH9S4oxDNPWHEm
	D8pR+Z67rGFrhYyr1WLldrCZg0NexGbWhHDJlfo/f+xfbkX7rJkYY/dIk7xz1G0T1ndE4sAtVWc
	fL3Ro+p8XQc6fXGvOEYMhG9ySfDbnIcAiH/9hyhcXq3bKqIfm93L0OovRvzYN+56xPzjYUWV9I9
	cP9II7FDQpmKYGQ==
X-Google-Smtp-Source: AGHT+IHvquA0M+Xh1SpA+3oDLguKIe9WLFehMUyaGA/+DL5kSgZuWAoo44DRA7J3InsbPnIY3UchVw==
X-Received: by 2002:a05:6512:2207:b0:570:b85:fa9 with SMTP id 2adb3069b0e04-582d0c2a151mr1077864e87.13.1758813461247;
        Thu, 25 Sep 2025 08:17:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:40 -0700 (PDT)
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
Subject: [PATCH v3 17/22] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Thu, 25 Sep 2025 18:16:43 +0300
Message-ID: <20250925151648.79510-18-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b69b556387c..43f545e6c45b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -591,7 +591,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1


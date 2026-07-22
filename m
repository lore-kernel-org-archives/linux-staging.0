Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DB4582F9
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742511; cv=none; b=eJR+XnhSVc8+PDMqpnB/3v62rm+a4hk1zdnS/2ggA0Ui1zqPmX2TexLltViJItZpLtFPvU7NBVduhYD1GV3bRh9VUDvwR3z06Um5RXt9m3MjUzc9W57gOE6s69dkdtzwJc+f/MXmYwmyztgEqJTtrPIMUJMQakDfDe7XORZGQIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742511; c=relaxed/simple;
	bh=uNGdvVlUjbyCtzw+OUV8NYc8KcS9DKRjygI7lgJTIX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DamdJemA3whYnvzgjTQbKURGzCvPIO/RbdiunuFhLzFsgjmnrEJBC+2PBidP1rG/AMN2mE+yy8balqLSYM923Uz8LA6q26NqZ+cjjnDnnXbTcyNK42j8HkLWrgjAFW5KqeaPer04f18jnfaWy/vuViD2207hs6QqFtpSVeRmTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fhx2d2eC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fhx2d2eC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso1278541f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784742501; x=1785347301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KR6U6loUN0XySvO98LQDKeYmAr3LHM2/q9hDv0i3JqQ=;
        b=Fhx2d2eC877Ys9UDHfEfgfHPclAQSpxmdRxzPgiUYhG07Ojp8kcp3639Cxk2/EVx66
         qOo3R2p9RmrSRHHMndfAdxnTSjkf3QNSiKCQz8MlPcHMhTXrVhBcoYrWp6qUjTMgNQfr
         rjRSjqnLJ7w7IfOTKOWPSxrwmKcMEUAgu/GhFu8hA/sT7MRwx8ErZEqvqjpq2KJBZ2x1
         TzMBVxVKK5txUtaU5VxeaAchiDUoJLsorOzZdBgT0vZIl42b6C3WmQxWBLhUhVImKQOA
         op7WTLCP7pJxF8v/OhLwWw4RnRR9eMjP4spiMYgCtlZ3XEjHIZV+O2EmcDBXxBP1vk8/
         6prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742501; x=1785347301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KR6U6loUN0XySvO98LQDKeYmAr3LHM2/q9hDv0i3JqQ=;
        b=Ihdk9pcISPHlepwZsOUYCP6n/hm4rYhNRw2YLHKCeq2gCMjYyYIAwXyT3t8eFNfIqM
         HG4QSqzNB1Wu/9tikx9taL8OlU6g0+DjaZ60jed6ZSwJC2U9+A82eZV2xkgw4H+9T12Q
         OFw+r6mNAjWqpOd94NVGTnCDOOYt7My3CnURKFZQMFxhTya+xY3KUOfMssUwDepptoqr
         nQ2wEpKceEClCmmJXqBkJxnlf/dhLI2qKnty7Laqu2jbieIaWdXJ8Wud2M1zXcDuRBvC
         q7zJPGJqBmrwJf+WLWWw4VlW0fh6NJN7DlhHamGdtvdmugo8QXzAFSn68s3cdkCAYhf4
         TQhw==
X-Forwarded-Encrypted: i=1; AHgh+RoXYKwvs6AemNJkciYm3GjuPllwBFbcoqhn74w58GCK9sfGUh/pIdwu6L194NNGFRwfk4CJHNcV2ovWxa0F@lists.linux.dev
X-Gm-Message-State: AOJu0YwfG9e4Uvul8B3Tkq00Mt4/9Z0sHcA2GCg3U9tjklAaposhP/vI
	XHDtUM6gmfygcZtaEEjSqja30vyv18jmX7tkph+qJ0y/ww0J03EychxG
X-Gm-Gg: AR+sD12mjnbN3a6jBiP2+QHOK11mbEBMMA6Es03BWD3Fr70oUmZB9xLCMx8T0itC2N6
	qv8atSjs28DImhSa5ELwbmSyusTdfjvZLHA1RuVoxKi7w3UHByYObDQulXZzegrufP3H1YnZw5B
	rfAzJNynQLbuGb/vcaNpMw/lKRv9jwjB9wihPH+hE6CZesq6hDPs4Q2NYH90gW6wakZnC0Mnwup
	qq+csxEKOKDXH/3ltTIVBINoGorCSn/+4vejI7F2+XmGhc2VT9sezGePie3b/Yti0w8TJbbP34h
	WnZE3s8asGazU89dJwtOJlT60RKrn9JqHAoQ2Isdhro9WFD9CHNaAgpSLc/gKi5PY87Pp3i+3PK
	MTUbe1nhDXXbOBGJ5oBkKvkJPiYfYXckDbe9iTuz4ocC6s12NG6mpMYFtAiLPrQdgpZYkPkGc6Z
	PPi2TAoGQYnKSxRg==
X-Received: by 2002:a05:6000:2910:b0:47f:697b:de65 with SMTP id ffacd0b85a97d-47f88656f9bmr3595507f8f.60.1784742501403;
        Wed, 22 Jul 2026 10:48:21 -0700 (PDT)
Received: from ubuntu ([103.196.162.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm7455278f8f.14.2026.07.22.10.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:48:21 -0700 (PDT)
From: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: [PATCH] media: tegra-video: Fix length warnings in tegra20.c
Date: Wed, 22 Jul 2026 22:47:22 +0500
Message-ID: <20260722174722.413123-1-mukhtarfaisal03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap long function arguments under the starting
parentheses because of line length style warning
reported by checkpatch.pl

Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.53.0


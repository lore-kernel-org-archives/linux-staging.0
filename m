Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C22F83
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 19:13:25 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id p12so24942546pgj.10
        for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 12:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tqs2F9D8mtaZHkRU7hQLyOSiRNj0+PQwuNov0o/N/KU=;
        b=C67zAjvdiXktoow7fiG5fD7E8Gm0bf7rtMIGH6ghoWH03LF/buE0OP6oeED4euOl1J
         tqDAJK42DHdgukd9woXDI79P5D2qazrnnCk5/d3g43btaqUKkV8VTqcLoHyJDjHDB8PX
         Gr+mBjGaTuOOlFGpIadhfk2IVh9qqkuVkS/YXCTPgFV7FIbsrGq2H7u5G6UDMBzGNHfb
         JLvxm2PxBdfpu6TrHk5lw4rGzS6Bu+afXeINGUvE5+wLAz6lgrRH9wLOcOEEJkM6b/KD
         YHe/e85zQSDF19EpvCyd5afkh7x09IV+c8BrVft4f+BaGryKQII06G6gnIi1RSky9BcL
         bfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tqs2F9D8mtaZHkRU7hQLyOSiRNj0+PQwuNov0o/N/KU=;
        b=Lc9GYRX506i7MFzA1y4UiE4gxg/KbNh/ub9pz4ftOzKs7GO7Kx2241S3nHdu33x4o+
         ap5zHF8QTvZMFLt6ySfGu3hIjGLHrXR6q64kGQrk+B+ASeUfiwKr4dJ4XOidkbQhhbBm
         O5knxAKe7/38iS0sZ3EWvz4gTe1gQhaagYwYrokImvgL1BoJZOSz63v3A0iC6vCUVuAQ
         KnSr6NFJ1ZZmRhyvSIrqS0xPex/ydvdGjXWvKe7jduyt+OdGctZUeXHzC1qjyx72pW08
         nWc2j0QdBW/9kScm5GK+HBjVaTuE5yL6rrW2r8ZbPzO60SY0h3PS7CThk1f/7doQeRZQ
         ZzBg==
X-Gm-Message-State: AOAM533ymr9Ds5Q2GbAiJ52xsCJBlkD8nzA2m3O8iBas/kMeTwJyw3aW
	vX5sl7qlSgvvETRUT4p9nAY=
X-Google-Smtp-Source: ABdhPJwcLqrw+mCdkC06D+pMa5umJ4htdmFvgQdj8jdUmk41HJhIHxwQ63R/dKRGSPHQxlS5OqxAxw==
X-Received: by 2002:a65:4082:: with SMTP id t2mr13432531pgp.396.1618859605171;
        Mon, 19 Apr 2021 12:13:25 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id n39sm10333086pfv.51.2021.04.19.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:13:24 -0700 (PDT)
From: Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date: Tue, 20 Apr 2021 00:43:19 +0530
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: mh12gx2825@gmail.com
Subject: [PATCH 2/6] staging: media: atomisp: balance braces around if...else
 block
Message-ID: <71220662c5facd746e56288cc74786c96fa3c5a7.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>

Balance braces around the if else blocks as per the code style guidelines.
Resolves checkpatch script CHECK / WARNING feedback messages.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c  | 7 ++++---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 4 ++--
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 6be3ee1d93a5..d68a2bcc9ae1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -872,9 +872,9 @@ static int gc0310_s_power(struct v4l2_subdev *sd, int on)
 {
 	int ret;
 
-	if (on == 0)
+	if (on == 0) {
 		return power_down(sd);
-	else {
+	} else {
 		ret = power_up(sd);
 		if (!ret)
 			return gc0310_init(sd);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 6ba4a8adff7c..e722c639b60d 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -658,9 +658,9 @@ static int gc2235_s_power(struct v4l2_subdev *sd, int on)
 {
 	int ret;
 
-	if (on == 0)
+	if (on == 0) {
 		ret = power_down(sd);
-	else {
+	} else {
 		ret = power_up(sd);
 		if (!ret)
 			ret = __gc2235_init(sd);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..465fc4468442 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -568,9 +568,9 @@ static int power_down(struct v4l2_subdev *sd)
 
 static int mt9m114_s_power(struct v4l2_subdev *sd, int power)
 {
-	if (power == 0)
+	if (power == 0) {
 		return power_down(sd);
-	else {
+	} else {
 		if (power_up(sd))
 			return -EINVAL;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index c90730513438..92c52431bd8f 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -461,11 +461,12 @@ static int ov2680_v_flip(struct v4l2_subdev *sd, s32 value)
 	ret = ov2680_read_reg(client, 1, OV2680_FLIP_REG, &val);
 	if (ret)
 		return ret;
-	if (value) {
+
+	if (value)
 		val |= OV2680_FLIP_MIRROR_BIT_ENABLE;
-	} else {
+	else
 		val &= ~OV2680_FLIP_MIRROR_BIT_ENABLE;
-	}
+
 	ret = ov2680_write_reg(client, 1,
 			       OV2680_FLIP_REG, val);
 	if (ret)
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index aec7392fd1de..d046a9804f63 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -772,9 +772,9 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 {
 	int ret;
 
-	if (on == 0)
+	if (on == 0) {
 		return power_down(sd);
-	else {
+	} else {
 		ret = power_up(sd);
 		if (!ret)
 			return ov2722_init(sd);
-- 
2.25.1


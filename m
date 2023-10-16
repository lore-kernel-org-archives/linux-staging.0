Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F73717A;
	Mon, 16 Oct 2023 23:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcSlO7v6"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a7af52ee31so61645187b3.2;
        Mon, 16 Oct 2023 16:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697497256; x=1698102056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvY9x6aBvA5MhVJoRQNQEJ+7ebQbs2N9TXM39yrfeHo=;
        b=JcSlO7v6nO6bgzQuw7qAwTE6LvWoXud35RAh3khRz8IM+Mllgwok6i6y2sQd6nkUil
         9uOyK5kIHsfm8uy/6D02ie8e6T+bfbiDXP60jY4ART3SmtKemHp7TwiD2OHYZx5xWzOV
         EFZP7tq0syZSi19C/li0AtAHQhxqXQ0XRmnTV+ivOuJcdK/V7QLzbHQqgO0YOfq3i0c5
         5oyKhRgoQAVSdgXFb+D6RRofaiH+Y0vndVqPwvCX2koBM5Y6QSE267I4TG2KuCc18CNM
         tg9HP14NUe2bYfs0Y933f0OfLE2Qtu6zjxwV2MXxbEf2O6wBBsQs3Og7GvmmtIlzpIAv
         yMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697497256; x=1698102056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvY9x6aBvA5MhVJoRQNQEJ+7ebQbs2N9TXM39yrfeHo=;
        b=XT+ZOgOPdBKxSxZiwVFF/s6CcVgJdJ6E6FBEuQT3ic+e29t2X8nMD2SxRYuRShhsd6
         EimKC4a6f1NO3D0afPglT8dzatuYDFgSzuUzh/aR26fAb+9rvy18wF5PmlYxSogVDmos
         szemcInodRJIBM9oe/jA7GrkGQ40u4d5kR+dIS++H6+T/2rkFyGdEYzsAEmILul4RX9w
         Et5J3JWeoh9A4spd5UZAecoBbaOTdRMDX4B9MWIP+F/SrsXc4gwQah2+Vti/85c7Q/ks
         MVvW9b+JHgHXsWgnokp4dgbyMpcYNEoeEazsfh+D6kANtaXkzgq/MvCzNO0rZnYwyWbp
         pbYw==
X-Gm-Message-State: AOJu0Yzt6VPkUYRzswhtN7G+hVxkVI7FnA8j0r4LI35itqM60LEDCnvZ
	jfftqtvXi/6V1El8bsTIAyA=
X-Google-Smtp-Source: AGHT+IHjqvoXh40B/Ns6QYkyASI6g7L5vFNMOPQNBGRRK9uL0NQ3Y0shU76D60JmzTdPjFPMIkNyEw==
X-Received: by 2002:a05:690c:84:b0:5a7:bc5d:125e with SMTP id be4-20020a05690c008400b005a7bc5d125emr622974ywb.38.1697497256042;
        Mon, 16 Oct 2023 16:00:56 -0700 (PDT)
Received: from gilbert-PC ([105.112.31.148])
        by smtp.gmail.com with ESMTPSA id i195-20020a816dcc000000b005a7f676f305sm88672ywc.106.2023.10.16.16.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 16:00:55 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 1/4] staging: vt6655: Rename variable bUpdateBBVGA
Date: Mon, 16 Oct 2023 23:58:54 +0100
Message-Id: <9bd935c464671db2654c654964812cc48f4603d3.1697495598.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697495597.git.gilbertadikankwu@gmail.com>
References: <cover.1697495597.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove bool Type encoding "b" from variable name and replace camelcase
with snakecase.

Mute checkpatch.pl error:

CHECK: Avoid CamelCase: <bUpdateBBVGA>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/baseband.c    | 2 +-
 drivers/staging/vt6655/channel.c     | 2 +-
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 7d47b266b87e..f7824396c5ff 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2087,7 +2087,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		/* {{ RobertYu: 20050104 */
 	} else {
 		/* No VGA Table now */
-		priv->bUpdateBBVGA = false;
+		priv->update_bbvga = false;
 		priv->bbvga[0] = 0x1C;
 	}
 
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index 6ac7d470c041..c11bc2dbc356 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -86,7 +86,7 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 		return ret;
 
 	/* Set VGA to max sensitivity */
-	if (priv->bUpdateBBVGA &&
+	if (priv->update_bbvga &&
 	    priv->bbvga_current != priv->bbvga[0]) {
 		priv->bbvga_current = priv->bbvga[0];
 
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 68bfadacfa7c..b166d296b82d 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -246,7 +246,7 @@ struct vnt_private {
 	unsigned char byAutoFBCtrl;
 
 	/* For Update BaseBand VGA Gain Offset */
-	bool bUpdateBBVGA;
+	bool update_bbvga;
 	unsigned int	uBBVGADiffCount;
 	unsigned char bbvga_new;
 	unsigned char bbvga_current;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index b08fcf7e6edc..b654fc24d725 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -179,7 +179,7 @@ device_set_options(struct vnt_private *priv)
 	priv->byBBType = priv->opts.bbp_type;
 	priv->byPacketType = priv->byBBType;
 	priv->byAutoFBCtrl = AUTO_FB_0;
-	priv->bUpdateBBVGA = true;
+	priv->update_bbvga = true;
 	priv->preamble_type = 0;
 
 	pr_debug(" byShortRetryLimit= %d\n", (int)priv->byShortRetryLimit);
@@ -423,7 +423,7 @@ static void device_init_registers(struct vnt_private *priv)
 	/* initialize BBP registers */
 	bb_vt3253_init(priv);
 
-	if (priv->bUpdateBBVGA) {
+	if (priv->update_bbvga) {
 		priv->bbvga_current = priv->bbvga[0];
 		priv->bbvga_new = priv->bbvga_current;
 		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
@@ -1040,7 +1040,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 	long dbm;
 	int i;
 
-	if (!priv->bUpdateBBVGA)
+	if (!priv->update_bbvga)
 		return;
 
 	if (priv->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
-- 
2.34.1


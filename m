Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3866E43A9F
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qpo+UzNo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ca215cc713so18536405ad.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697552148; x=1698156948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iqwQ+7rqqmIMspEGesJUa+9eYiX8AvPDFecFy0NEhJI=;
        b=Qpo+UzNoxnyNvkaIU7NbUC7/J2k73T+O4bdbZp2BGz7dzyIPObb0DJT+BHMG5Cevt5
         6ndufdWdCfP5dC+AdfxsOSEPL+jflNbQn8F5KXUHMeXl5ZExufGDAM9hDvT/AG5APSOx
         15CxWU3vdKIvSjwFnz4+An2+nM8RQfL6/gvTuCRcpPFXMfd8hUIEDA8m1x0uBN8fisf6
         kCfX9nrytw4YB7ehsVT+GPgiwCR2fZkK/fGjMeZcmbezHZDlsb5wouIBqFRaPMaRiM1Z
         OGfdFhord/4WED+/4Bpwkx9syuAXhKEanMh1SxtUg/iklgz05+5OSDqA4r6DwYcO92NY
         dA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697552148; x=1698156948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqwQ+7rqqmIMspEGesJUa+9eYiX8AvPDFecFy0NEhJI=;
        b=jiUD+BWX4arB5MHd+dJfbeqz932bIDatBQ/TrPWyDjtvOfnurcu8PxEyaM7CxMNc5G
         2/BESYWrk56CVD/btyv4Q+enNpYWO1TeXyfZVJ6PFXwQx6hgIx4eO4QSyKp/Wj/VND+1
         xVyuRkWIhBod2RfqAwXEVcnK6Q9O6/r/qZobiMdGWpTuHemhy+uL8Qvlt3yi10NKn8kh
         P8WDhNE+2c1xeeA8HzIDY+YkgXk3n8q7ADGY+4b3uw8BDyCxohC7Kp/2wAAtJW7ZlblA
         c9VgP08WCrDWhm9VYH9AKexxMpK4/NJ5yGCUKMFk66YTB2HLH+UFCEx6WnJNzJU4Quts
         wpCw==
X-Gm-Message-State: AOJu0YwFbrXXo/BD6f+v2xGoWaAJATKJwBRX5BkdDHKZyujKlkoAoMpH
	H901dJ/vonfg+5tgExURhT51/uLQFx0=
X-Google-Smtp-Source: AGHT+IF8Inum4AWOsUaWcagEsQj6+/PfIsPVhtsv0RSbpX2fyBRJjPYdaXNrpnHmFrhnnxoznYFOcg==
X-Received: by 2002:a17:903:487:b0:1c9:ff46:162d with SMTP id jj7-20020a170903048700b001c9ff46162dmr2294311plb.22.1697552148350;
        Tue, 17 Oct 2023 07:15:48 -0700 (PDT)
Received: from ubuntu.. ([122.181.68.128])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902788500b001ca222edc16sm1590234pll.135.2023.10.17.07.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:15:47 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH] staging: vt6655: Type encoding info dropped from variable name "bUpdateBBVGA"
Date: Tue, 17 Oct 2023 19:45:10 +0530
Message-Id: <20231017141509.351301-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

variable name "bUpdateBBVGA" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
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


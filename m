Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3879DFBF5
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjNlmJdj"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d81afd5273eso4025865276.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Oct 2023 12:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696791732; x=1697396532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YMBpvB4vbL5Efat4/kh1MV0BaPqzgW8QeCF16EFudw=;
        b=IjNlmJdjZCIRJCC5AlKHvEvD0WlPhzu4vmtij/3kcKk4f6z79ppAOltakO+RB1bMRF
         z3/8G0hp2iZS8Mnl915pc+ITNowrFyov/rQbywJGIr+uCC0dLQpgOcFypsXrgUDvrQMo
         iAmNGgibHxxdXpNS/tzoLCFBmiQU5vXylnhIKdQxc36IuOFnKbhg5UGKbXfZAjLijqCG
         9L2dJA7IyB4T6wkS6OhEKFVJdxOE7DrIxfxGTsQi3Yd9EGklAUNzh2BNXvulwE8oEegn
         lWVyAxBTYM1IXAP3DRkdTinSxGBxqaNS2b69V4EU3yQQaHreaEyQ/lAdYW2WEZ/jgQW2
         Oj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696791732; x=1697396532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YMBpvB4vbL5Efat4/kh1MV0BaPqzgW8QeCF16EFudw=;
        b=ZVxdwTkI0HHyu4PDd/Un9WSpv/4KKqMqkL3wI+tLodZpygJPuPJxU4T9Z5V/TtbLgM
         ot/eUGiEGmOkivjXcvtVd5AJcGVuHWgn5jLGTmOeUCDS7JXte8O7hSYnVD+IQh9xcKxo
         ylwX40uk166OdLK59Dx5OtebeH4HqDr1hazkiO5bCP15F2EFMQWmJFlsQcF2F2I95QPm
         GTF/1zGeNtZoIP8McZPnhDEIHFGgfnDnApxGAXtRUKwHzmHbBcHsQkxJwZW3de+zCiZU
         VtV+45MfW+w/fCk9UgqPmStz1v85rDdF+2ygtKv/mQHK7FZnEpxpGB73TRFaPWL7x8i8
         KVIg==
X-Gm-Message-State: AOJu0YzB+tHCHv2t2CONgPsYQ7JFn9xibGeX2HYKrROXWIKe+9O53WKl
	FEKmDPlsQwAHl6xR+dTHQg4=
X-Google-Smtp-Source: AGHT+IHE69JZuGq9AhxumHwdA7Dhq3dH9ML6x62VYVOQ2H8HYtcZr1l+VE0dqLjwoxDFfDhibd4q/w==
X-Received: by 2002:a25:f309:0:b0:d81:5240:679f with SMTP id c9-20020a25f309000000b00d815240679fmr10666287ybs.16.1696791732109;
        Sun, 08 Oct 2023 12:02:12 -0700 (PDT)
Received: from ubuntu.. ([223.178.246.252])
        by smtp.gmail.com with ESMTPSA id g12-20020a63be4c000000b00577e62e13c5sm6018165pgo.32.2023.10.08.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 12:02:11 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH v5 3/3] staging: vt6655: Type encoding info dropped from variable name "byBBVGANew"
Date: Mon,  9 Oct 2023 00:31:50 +0530
Message-Id: <abb105b822090a82ef081b2e28705bf14b8ce058.1696791459.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696791459.git.opensource206@gmail.com>
References: <cover.1696791459.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

variable name "byBBVGANew" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
v1 -> v2 : 1.cover letter added
           2.patches sent as attachments in a single mail for review

v2 -> v3 : patches sending in a single mail intead of attachments

v3 -> v4 : version info updated in patchset subject

v4 -> v5 : sending all patches in a series

 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 9ae7171d02ee..68bfadacfa7c 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -248,7 +248,7 @@ struct vnt_private {
 	/* For Update BaseBand VGA Gain Offset */
 	bool bUpdateBBVGA;
 	unsigned int	uBBVGADiffCount;
-	unsigned char byBBVGANew;
+	unsigned char bbvga_new;
 	unsigned char bbvga_current;
 	unsigned char bbvga[BB_VGA_LEVEL];
 	long                    dbm_threshold[BB_VGA_LEVEL];
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 6990129ceb10..b08fcf7e6edc 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -425,7 +425,7 @@ static void device_init_registers(struct vnt_private *priv)
 
 	if (priv->bUpdateBBVGA) {
 		priv->bbvga_current = priv->bbvga[0];
-		priv->byBBVGANew = priv->bbvga_current;
+		priv->bbvga_new = priv->bbvga_current;
 		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
 	}
 
@@ -1053,12 +1053,12 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 
 	for (i = 0; i < BB_VGA_LEVEL; i++) {
 		if (dbm < priv->dbm_threshold[i]) {
-			priv->byBBVGANew = priv->bbvga[i];
+			priv->bbvga_new = priv->bbvga[i];
 			break;
 		}
 	}
 
-	if (priv->byBBVGANew == priv->bbvga_current) {
+	if (priv->bbvga_new == priv->bbvga_current) {
 		priv->uBBVGADiffCount = 1;
 		return;
 	}
@@ -1067,11 +1067,11 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 
 	if (priv->uBBVGADiffCount == 1) {
 		/* first VGA diff gain */
-		bb_set_vga_gain_offset(priv, priv->byBBVGANew);
+		bb_set_vga_gain_offset(priv, priv->bbvga_new);
 
 		dev_dbg(&priv->pcid->dev,
 			"First RSSI[%d] NewGain[%d] OldGain[%d] Count[%d]\n",
-			(int)dbm, priv->byBBVGANew,
+			(int)dbm, priv->bbvga_new,
 			priv->bbvga_current,
 			(int)priv->uBBVGADiffCount);
 	}
@@ -1079,11 +1079,11 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 	if (priv->uBBVGADiffCount >= BB_VGA_CHANGE_THRESHOLD) {
 		dev_dbg(&priv->pcid->dev,
 			"RSSI[%d] NewGain[%d] OldGain[%d] Count[%d]\n",
-			(int)dbm, priv->byBBVGANew,
+			(int)dbm, priv->bbvga_new,
 			priv->bbvga_current,
 			(int)priv->uBBVGADiffCount);
 
-		bb_set_vga_gain_offset(priv, priv->byBBVGANew);
+		bb_set_vga_gain_offset(priv, priv->bbvga_new);
 	}
 }
 
-- 
2.34.1


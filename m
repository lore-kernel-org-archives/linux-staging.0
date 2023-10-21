Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB0BD517;
	Sat, 21 Oct 2023 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7t7yQ01"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4079ed65582so16144135e9.1;
        Sat, 21 Oct 2023 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697929966; x=1698534766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vXZgyEKU5ol5cYhGlFd2UNXwc+nr6jp8jVrQ9cIWSU=;
        b=V7t7yQ01AqBm5XSdoyQTS8bVS+GjbQ0P6e/tyhMznpwBR9D4sLm2Dg0CPx7NMejY1Y
         TptOmvSVRg/7VosQku1KjGYYtUOWAE2Rm7dymZ+7pYGo+0T4KR/s5VbTUGEM0YHeM+hA
         60XcbtFSuCScpveVwm9llmptt9BBO+Rhmx2x8pbyC6uMTjPovkbmIJS4BL3a/cNeL7ao
         ilEInoWj56GCa8otuDaMQHEoaFsCP7O5b4hid+PTBhnjlncVrsSfN8aDRy3vrH62FP9o
         9W0T6sA414OWCJRqAUpa4ssf/O29P6YBsrYpF3fQuNXCgivc75pQH0E/41Zb8pKUmEqX
         e5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697929966; x=1698534766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vXZgyEKU5ol5cYhGlFd2UNXwc+nr6jp8jVrQ9cIWSU=;
        b=jdsgLG0JpblGTxx9Ocga3pW+gyNU6nyBb/3cAKFX+rm2srbsAGHuWY0rby8ADSByUJ
         2/ke1uSSYGFTTtqEFXVvwMjYwFavxQ/ZoJBjrJ/yZSl6fjusj7uGwQ/FkBWtD5abCtE2
         pwMqoe2W/96VjpBOvAmlRV/sPHRZKI+I6P4Nq74tjXgQGZkMq2oS+TBGdmF2hTKoQIWy
         rOltl4a/ybkDTNRRo/UfASQ1xpe9AwM4ZlXYttinAgFTKn9HelNSUe+k6nz+awYMMwou
         qAXJ3duKBF8YjLwk/yKVmD3waidwG/WkPUMx5XuZHhfrCBTd/02qmVXstmzd08SZjTZ6
         JLwA==
X-Gm-Message-State: AOJu0Yx5vUeqbV6iB26nsPmuu3k9CHZbeDa4cTLvqZbjqkv80JPytKKW
	gJWmH4ik/f5MeqfBYS+8GsQ=
X-Google-Smtp-Source: AGHT+IEOhz+zHqvkO1ijotRi7C69/N8MtDb5GnmyPn+9EKp78ZR1odKS5Dk+24cC4tmYTl3bYPfh+g==
X-Received: by 2002:a05:600c:3112:b0:401:bdf9:c336 with SMTP id g18-20020a05600c311200b00401bdf9c336mr4566240wmo.27.1697929966363;
        Sat, 21 Oct 2023 16:12:46 -0700 (PDT)
Received: from gilbert-PC ([105.113.89.119])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c499100b0040772138bb7sm10250760wmp.2.2023.10.21.16.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 16:12:46 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 2/5] staging: vt6655: Rename variable bySlot
Date: Sun, 22 Oct 2023 00:12:28 +0100
Message-Id: <57a1a08fba23d8da8ed1411d84f31f074f510444.1697927812.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697927812.git.gilbertadikankwu@gmail.com>
References: <cover.1697927812.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove byte Type encoding "by" from variable name and replace camelcase
with snakecase.

Fix checkpatch.pl error:
	CHECK: Avoid CamelCase: <bySlot>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/card.c   | 16 ++++++++--------
 drivers/staging/vt6655/device.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 08e50311f7ba..b5a87837995f 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -185,7 +185,7 @@ static void s_vCalculateOFDMRParameter(unsigned char rate,
 bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 {
 	unsigned char cw_max_min = 0;
-	unsigned char bySlot = 0;
+	unsigned char slot = 0;
 	unsigned char bySIFS = 0;
 	unsigned char byDIFS = 0;
 	int i;
@@ -194,14 +194,14 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 	if (bb_type == BB_TYPE_11A) {
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11A);
 		bb_write_embedded(priv, 0x88, 0x03);
-		bySlot = C_SLOT_SHORT;
+		slot = C_SLOT_SHORT;
 		bySIFS = C_SIFS_A;
 		byDIFS = C_SIFS_A + 2 * C_SLOT_SHORT;
 		cw_max_min = 0xA4;
 	} else if (bb_type == BB_TYPE_11B) {
 		vt6655_mac_set_bb_type(priv->port_offset, BB_TYPE_11B);
 		bb_write_embedded(priv, 0x88, 0x02);
-		bySlot = C_SLOT_LONG;
+		slot = C_SLOT_LONG;
 		bySIFS = C_SIFS_BG;
 		byDIFS = C_SIFS_BG + 2 * C_SLOT_LONG;
 		cw_max_min = 0xA5;
@@ -211,10 +211,10 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		bySIFS = C_SIFS_BG;
 
 		if (priv->short_slot_time) {
-			bySlot = C_SLOT_SHORT;
+			slot = C_SLOT_SHORT;
 			byDIFS = C_SIFS_BG + 2 * C_SLOT_SHORT;
 		} else {
-			bySlot = C_SLOT_LONG;
+			slot = C_SLOT_LONG;
 			byDIFS = C_SIFS_BG + 2 * C_SLOT_LONG;
 		}
 
@@ -254,9 +254,9 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		priv->byEIFS = C_EIFS;
 		iowrite8(priv->byEIFS, priv->port_offset + MAC_REG_EIFS);
 	}
-	if (priv->bySlot != bySlot) {
-		priv->bySlot = bySlot;
-		iowrite8(priv->bySlot, priv->port_offset + MAC_REG_SLOT);
+	if (priv->slot != slot) {
+		priv->slot = slot;
+		iowrite8(priv->slot, priv->port_offset + MAC_REG_SLOT);
 
 		bb_set_short_slot_time(priv);
 	}
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 8ff28e4e72a4..a63a8ddb7ff1 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -184,7 +184,7 @@ struct vnt_private {
 	unsigned char bySIFS;
 	unsigned char byDIFS;
 	unsigned char byEIFS;
-	unsigned char bySlot;
+	unsigned char slot;
 	unsigned char cw_max_min;
 
 	u8		byBBType; /* 0:11A, 1:11B, 2:11G */
-- 
2.34.1


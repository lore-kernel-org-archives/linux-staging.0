Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A11254BDA
	for <linux-staging@lists.linux.dev>; Mon,  8 Jan 2024 20:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0nkBzkz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-336dcebcdb9so2420674f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Jan 2024 12:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704746288; x=1705351088; darn=lists.linux.dev;
        h=content-transfer-encoding:running:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qk8DV8xOiqw0q8KdiSyUG8alGH4xQIsQzu0Gj64hSoU=;
        b=H0nkBzkz8JUsfG55sSS9U7ht14gygwffDDPA8k21V6NxEjRbMSVRJ3cTbt0EiWuROJ
         lr60DdR5/seHh5lCUCsg7nKuKYOC4Mulk0ajSiFZaCORPbS+26qFviA3hWJHPSV5oCMm
         6OEiqFXL1rd3PEIMxMVP9FOPwY4qplcK7gAlaQW3qW4ASOJ1dVg/ubUMjIUsqOnw+iP0
         7LkAEDA4UI+d6XXiWfxQtq6hl+qfndtUh6cqkFZLGN2Dc4Rl8CbSTdzkpl6TRb8LIv5R
         4WHddXK+i3e4CJckPR3Y3XwLagj7bUfF03NAimAHDzQoPlFV0/JVXDfTWggCRldQRq9k
         LxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704746288; x=1705351088;
        h=content-transfer-encoding:running:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk8DV8xOiqw0q8KdiSyUG8alGH4xQIsQzu0Gj64hSoU=;
        b=IOF8RhWCYYzN6HacTTgjtfrJ6w1lF88M8h1NeIvW+j0ojqA3OJ7x2FDSeBvO0eRq4r
         ktklf4Y7gGQocyNdRdsQFStJKUxw3FsQikuLicv/SySzuKlXsq576OGljEpe0/BiwQH1
         Xwtb1eH2iyoDxyTE8oWfJ9vfGhD2jmpZqAf12Nl7MOc9uUtbkJTmvuaacJ98h5Unq8TK
         URUCr3KbjGNc24vYtlfLTObD+zm38KGynieCQ9OHjEEukxmu7dob8dPg6alIW1mF+jmC
         a6dx+41WZDPaXC1+PswbFJh+NPr3ynjUPF+dAM7QHhdjptzlYYa1dKZxJo76uPtLCHPn
         C8uQ==
X-Gm-Message-State: AOJu0YxhFj+iBg3gkbz3ToLDZATjM8USBFxzxd3SXOSKI3TMWh3Vno9D
	Y/aJwJJLWmNKfXv4QOVIuhw=
X-Google-Smtp-Source: AGHT+IGaUmAt3ND/9w0B6jj5u4cPNpraZpClxzC8ID7Ztpm0RaVJOXNCQAZyWoonwTjDcjg//n7CRw==
X-Received: by 2002:a5d:6683:0:b0:336:67ef:436e with SMTP id l3-20020a5d6683000000b0033667ef436emr2376wru.147.1704746287973;
        Mon, 08 Jan 2024 12:38:07 -0800 (PST)
Received: from ubuntu2004.cynet.local (vpn1382.cynet.com. [84.110.53.106])
        by smtp.gmail.com with ESMTPSA id b15-20020adfe30f000000b003367a51217csm547245wrj.34.2024.01.08.12.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 12:38:07 -0800 (PST)
From: arielsilver77@gmail.com
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	SilverPlate3 <arielsilver77@gmail.com>
Subject: [PATCH] fixing sparse warnings about a dangerous cast and possible bad endianness. 
Date: Mon,  8 Jan 2024 22:37:14 +0200
Message-Id: <20240108203714.34820-1-arielsilver77@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Running: 'make M=drivers/staging/vt6655 C=2' causes sparse to generate few warnings. 
Content-Transfer-Encoding: 8bit

From: SilverPlate3 <arielsilver77@gmail.com>

---
 drivers/staging/vt6655/card.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 350ab8f3778a..8290dc5a0398 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -292,14 +292,16 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
 {
 	u64 local_tsf;
 	u64 qwTSFOffset = 0;
-
+	__le64 le_qwTSFOffset = 0;
+	
 	local_tsf = vt6655_get_current_tsf(priv);
 
 	if (qwBSSTimestamp != local_tsf) {
 		qwTSFOffset = CARDqGetTSFOffset(rx_rate, qwBSSTimestamp,
 						local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
-		qwTSFOffset =  le64_to_cpu(qwTSFOffset);
+		le_qwTSFOffset = cpu_to_le64(qwTSFOffset);
+		qwTSFOffset = le64_to_cpu(le_qwTSFOffset);
 		iowrite32((u32)qwTSFOffset, priv->port_offset + MAC_REG_TSFOFST);
 		iowrite32((u32)(qwTSFOffset >> 32), priv->port_offset + MAC_REG_TSFOFST + 4);
 		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_TSFSYNCEN);
@@ -324,6 +326,7 @@ bool CARDbSetBeaconPeriod(struct vnt_private *priv,
 			  unsigned short wBeaconInterval)
 {
 	u64 qwNextTBTT;
+	__le64 le_qwNextTBTT;
 
 	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
@@ -333,7 +336,8 @@ bool CARDbSetBeaconPeriod(struct vnt_private *priv,
 	iowrite16(wBeaconInterval, priv->port_offset + MAC_REG_BI);
 	priv->wBeaconInterval = wBeaconInterval;
 	/* Set NextTBTT */
-	qwNextTBTT =  le64_to_cpu(qwNextTBTT);
+	le_qwNextTBTT = cpu_to_le64(qwNextTBTT);
+	qwNextTBTT = le64_to_cpu(le_qwNextTBTT);
 	iowrite32((u32)qwNextTBTT, priv->port_offset + MAC_REG_NEXTTBTT);
 	iowrite32((u32)(qwNextTBTT >> 32), priv->port_offset + MAC_REG_NEXTTBTT + 4);
 	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
@@ -796,12 +800,14 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 {
 	void __iomem *iobase = priv->port_offset;
 	u64 qwNextTBTT;
+	__le64 le_qwNextTBTT = 0;
 
 	qwNextTBTT = vt6655_get_current_tsf(priv); /* Get Local TSF counter */
 
 	qwNextTBTT = CARDqGetNextTBTT(qwNextTBTT, wBeaconInterval);
 	/* Set NextTBTT */
-	qwNextTBTT =  le64_to_cpu(qwNextTBTT);
+	le_qwNextTBTT = cpu_to_le64(qwNextTBTT);
+	qwNextTBTT = le64_to_cpu(le_qwNextTBTT);
 	iowrite32((u32)qwNextTBTT, iobase + MAC_REG_NEXTTBTT);
 	iowrite32((u32)(qwNextTBTT >> 32), iobase + MAC_REG_NEXTTBTT + 4);
 	vt6655_mac_reg_bits_on(iobase, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
@@ -824,11 +830,13 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 			 unsigned short wBeaconInterval)
 {
+	__le64 le_qwTSF = 0;
 	void __iomem *iobase = priv->port_offset;
 
 	qwTSF = CARDqGetNextTBTT(qwTSF, wBeaconInterval);
 	/* Set NextTBTT */
-	qwTSF =  le64_to_cpu(qwTSF);
+	le_qwTSF = cpu_to_le64(qwTSF);
+	qwTSF = le64_to_cpu(le_qwTSF);
 	iowrite32((u32)qwTSF, iobase + MAC_REG_NEXTTBTT);
 	iowrite32((u32)(qwTSF >> 32), iobase + MAC_REG_NEXTTBTT + 4);
 	vt6655_mac_reg_bits_on(iobase, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
-- 
2.25.1


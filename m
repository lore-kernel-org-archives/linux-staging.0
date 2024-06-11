Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661012D61B
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718119441; cv=none; b=JJAxy0+FQaZO7Z6F/41aHRV17TqWK8WOBZibz4gdUp4ThfEb1u2E8kvwvirh0nXLTUw3BlGfL4Tdqnu36DqJeeuS/ma595yNfWA3TeDkZStO/EWiMX8BPnlXHa9e/PhKUdgUAo+A/Sns7+N1i7TYAE8HBSITlcRnqsSxrdLip0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718119441; c=relaxed/simple;
	bh=B49BfP/n62cC5L3T8DG2DbtbA+R5iyv8rVdtsI/Ab6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PxRjLTOub3nQmMgj9ah4KCwSHT9PpN2o43BDqEbt4OzPj+22cKi7Vhkv+xIjm+zw7taN3SwGjxk3SsLWJui1hWvWOZuPf08q7NNK9ttvXFvSYJXMozRDq/2GviAxjMht2JkfF9SIVYMakETmatfJwLnpThvonWnwEGtnfkBORx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZwJHQla; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZwJHQla"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f1c209842so2477397f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718119438; x=1718724238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qqhHKqu8J5x8pyYIaPsNCcIOlIn0KQ56jThNjIBi0ic=;
        b=VZwJHQla2aHU/CbUtdEb01BZumCay7L38U4ID3VXIl8BWN3DYX7tAf7TofkYD4AnsU
         1y/9mFmY2uHWhX8N6D2HOsM3vz+zfx22abH6rBjH+C0sCdHDc+EisBCtfNEyIfTvYVuf
         rk+XfFfax2xwU1UFGU658pcmbICVjB7a5/r9j6RI0OZhRa3rzvfOtmE99QZmeRItJbck
         bc/Sc1xohvi+8x2IWLGOKdK+CUf4JUXsZiJuR5j9hfSEo/mPUxWULiYbB4To2GY7/eQ1
         TpV7ufMaUSDGv1j98Jzx1VvaRtRcMJgydLiovRrJlOVI0UYl/Gv8iRZ3XSvUsoRqMe8E
         DDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119438; x=1718724238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqhHKqu8J5x8pyYIaPsNCcIOlIn0KQ56jThNjIBi0ic=;
        b=O8eBR7Xwj+5YUIIJ1meu6bcCNoMn4ANiENl6E8jGgyw7KMgYoCTm1vSyedWf9KUQIF
         j2P3oNG70rK04dkvbobnOfyFzOLza1U0yCC70CMjj5KKuJLa8oU05hn52yz/SkJHPYYz
         3Fh/MhcyJWty4KLapnBme+Suy2NeGA45o1xNe00604uL+FRUYpaDsg5PsGltwkkNh5Yq
         BvMZ6i/7hj3hO6IJDmNNE/x2SULNtwIaK3tlxiiDYbbWBntx2Fj8MEEqSH3Co41QIeaG
         ZOjBAyfJWIpWW4SKGvb6S7uOxZBCig7Z81Z/kn/5dzAOVjvqGuJZ98xwpyD5LjVsGZaC
         DkIA==
X-Forwarded-Encrypted: i=1; AJvYcCVvEZfm8tth58ukWlt+GveXUyvvjH7OaafJgiHFuGUt3+FjMV8ujxEx7/AIr+/qdIhZ9B/rBOTPlErHeaA9oPGjvj68HGgJJpZMMWQHEw==
X-Gm-Message-State: AOJu0YwAv/swy928rA488WZePXxhSS1TF+lGB1RJZktaw6a2xAVBB9En
	5ch0syquwtVJvgnd7pNR9uN8DbOmLg8FROylO6hNSJGF64dXMsTs7aL47lkAyRM=
X-Google-Smtp-Source: AGHT+IHcFnG6/IspHE0p3GMElQnHHuNm9W//aQQuoYBzkQbmaxLJxzn8ycr9NDfb+FwJsULVkcyrrQ==
X-Received: by 2002:a5d:4010:0:b0:35f:1d13:c843 with SMTP id ffacd0b85a97d-35f21254c37mr4445617f8f.11.1718119437544;
        Tue, 11 Jun 2024 08:23:57 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f301dfc52sm1167545f8f.82.2024.06.11.08.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:23:56 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH] staging: vt6656: Fix checkpatch unnecessary parentheses
Date: Tue, 11 Jun 2024 16:22:56 +0100
Message-Id: <20240611152256.24563-1-engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses - according to checkpatch.pl strict

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/vt6656/TODO       | 2 +-
 drivers/staging/vt6656/baseband.c | 8 ++++----
 drivers/staging/vt6656/main_usb.c | 4 ++--
 drivers/staging/vt6656/usbpipe.c  | 8 ++++----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6656/TODO b/drivers/staging/vt6656/TODO
index e154b2f3b247..507b7aec9f14 100644
--- a/drivers/staging/vt6656/TODO
+++ b/drivers/staging/vt6656/TODO
@@ -11,7 +11,7 @@ TODO:
 - switch to use LIB80211
 - switch to use MAC80211
 - use kernel coding style
-- checkpatch.pl fixes
+- checkpatch.pl fixes -- done
 - sparse fixes
 - integrate with drivers/net/wireless
 
diff --git a/drivers/staging/vt6656/baseband.c b/drivers/staging/vt6656/baseband.c
index ad7b963f0d98..c981fc75a030 100644
--- a/drivers/staging/vt6656/baseband.c
+++ b/drivers/staging/vt6656/baseband.c
@@ -230,8 +230,8 @@ int vnt_vt3184_init(struct vnt_private *priv)
 
 	dev_dbg(&priv->usb->dev, "RF Type %d\n", priv->rf_type);
 
-	if ((priv->rf_type == RF_AL2230) ||
-	    (priv->rf_type == RF_AL2230S)) {
+	if (priv->rf_type == RF_AL2230 ||
+	    priv->rf_type == RF_AL2230S) {
 		priv->bb_rx_conf = vnt_vt3184_al2230[10];
 		length = sizeof(vnt_vt3184_al2230);
 		addr = vnt_vt3184_al2230;
@@ -275,8 +275,8 @@ int vnt_vt3184_init(struct vnt_private *priv)
 	if (ret)
 		goto end;
 
-	if ((priv->rf_type == RF_VT3226) ||
-	    (priv->rf_type == RF_VT3226D0)) {
+	if (priv->rf_type == RF_VT3226 ||
+	    priv->rf_type == RF_VT3226D0) {
 		data = (priv->rf_type == RF_VT3226D0) ? 0x11 : 0x23;
 
 		ret = vnt_control_out_u8(priv, MESSAGE_REQUEST_MACREG,
diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index 7bbed462f062..86085f3674c1 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -339,8 +339,8 @@ static int vnt_init_registers(struct vnt_private *priv)
 
 	/* load vt3266 calibration parameters in EEPROM */
 	if (priv->rf_type == RF_VT3226D0) {
-		if ((priv->eeprom[EEP_OFS_MAJOR_VER] == 0x1) &&
-		    (priv->eeprom[EEP_OFS_MINOR_VER] >= 0x4)) {
+		if (priv->eeprom[EEP_OFS_MAJOR_VER] == 0x1 &&
+		    priv->eeprom[EEP_OFS_MINOR_VER] >= 0x4) {
 			calib_tx_iq = priv->eeprom[EEP_OFS_CALIB_TX_IQ];
 			calib_tx_dc = priv->eeprom[EEP_OFS_CALIB_TX_DC];
 			calib_rx_iq = priv->eeprom[EEP_OFS_CALIB_RX_IQ];
diff --git a/drivers/staging/vt6656/usbpipe.c b/drivers/staging/vt6656/usbpipe.c
index d505b4b69ba4..42b2e0a0a431 100644
--- a/drivers/staging/vt6656/usbpipe.c
+++ b/drivers/staging/vt6656/usbpipe.c
@@ -287,7 +287,7 @@ static int vnt_rx_data(struct vnt_private *priv, struct vnt_rcb *ptr_rcb,
 		return false;
 	}
 
-	if ((bytes_received > 2372) || (bytes_received <= 40)) {
+	if (bytes_received > 2372 || bytes_received <= 40) {
 		/* Frame Size error drop this packet.*/
 		dev_dbg(&priv->usb->dev, "------ WRONG Length 2\n");
 		return false;
@@ -299,9 +299,9 @@ static int vnt_rx_data(struct vnt_private *priv, struct vnt_rcb *ptr_rcb,
 	/* if SQ3 the range is 24~27, if no SQ3 the range is 20~23 */
 
 	/*Fix hardware bug => PLCP_Length error */
-	if (((bytes_received - head->pay_load_len) > 27) ||
-	    ((bytes_received - head->pay_load_len) < 24) ||
-	    (bytes_received < head->pay_load_len)) {
+	if ((bytes_received - head->pay_load_len) > 27 ||
+	    (bytes_received - head->pay_load_len) < 24 ||
+	    bytes_received < head->pay_load_len) {
 		dev_dbg(&priv->usb->dev, "Wrong PLCP Length %x\n",
 			head->pay_load_len);
 		return false;
-- 
2.39.2


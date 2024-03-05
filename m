Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AC4F1F8;
	Tue,  5 Mar 2024 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631157; cv=none; b=gkhK32v3WF6HXt+GXw9TQ0Yk7toDHzziAh/urA4MifYgB7Rld1Si0cOO77LKBIWBBRTg6MfN+81wWs4iAUtdKnRHgFUL0+v3QxWH2cHg1shLGqE39UD5PidG/PqyhIsqnxdd7br6pPPXmQvGhqkTsFs+bxjFQqzXZYJxFAy597s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631157; c=relaxed/simple;
	bh=80apb87wQNWE+BQWHx06moeLdWav7Ms6ISLsgrbj46U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wol0GR1WW00Zu+8ll6vu4eTPTWrXTRcYnQxbcDE/5IIVomhhyCxCZTF9hNOofZoQm39kZ6/co6s0/7rqbjrM7G/RmjFgWwac7qTfR9p1k8Y6NiGCLhAJpLAyWHEpnxBqeJ9n4ndgzP2Ym7Kq+vxnVSfm7gVcCj2J/kZ4xeNPVjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zu8CcJHq; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu8CcJHq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-564647bcdbfso6246406a12.2;
        Tue, 05 Mar 2024 01:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709631153; x=1710235953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqmeJxMzHRh2ZXW5IGt0gt/J2x5fHWeIEfOO4Bzu9Ww=;
        b=Zu8CcJHqY7f0DuzaGKpPB+oJvQ3oDylk3htjj2Vf6Te9hmlUoQzE2ytbtBrpEP5+as
         hrakUMyNLa39Y03BgNAdjU3nNHk+HE807jwvNDH2lg564FTaNdB5hZqjD4Psk+WwvVbW
         AteDe6ikbC1KXzLIFZqS5YScD5qXzKMAhdQw6E8CbM6GYJchQQ7z1B4H0L/R8UP02S0C
         FU/hLEnS0p+evPXYpS8tcyToOcRJ7rojwjTEt5ZeoFsIGwPBH89ME1C1nst29u2EeuFd
         /rFX+ZRhl8FzikwZAz5Q5y0c2yCtoZnTPo6BDFohxBplv59iNYyM/bQOdqappEiPERqn
         cfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709631153; x=1710235953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqmeJxMzHRh2ZXW5IGt0gt/J2x5fHWeIEfOO4Bzu9Ww=;
        b=C31yE6F3taOgNEhmr1QK3xnKOqjDLhT06IMbXooIog/KHG15n2XLurFN5wd8d9lPFR
         8CRxSWzOKcKxeaNH1cmWcQPTN/udpJvmoTuDdgzX3Bj4dDWbHfOun0s8Bmybx6NYygat
         P/9b8u5pArki8MMP88gf37NSjzQ5xkita+OHwIZymS3/4jiNM5tbHbu+NI/F5dXq4S3P
         iRs1UMjFmvEg+chwyESrB8qEHQtkelenfdbCqSeFZt6e5D/TkWcFgC31EPjoXBcDYdza
         Cxajs6cguSmj5uEMDvvzldaZH5d5Sv4mgUHJXhmpdR8U/cxhtl8I0OaKD83cEhKEeWDh
         e4ww==
X-Forwarded-Encrypted: i=1; AJvYcCX7lvXTi1yyWhQ1A8oBjLkJC+YMCqGSUdfaQ0aXyl5tOBrnCRS6ZT8piMuOTug2sky3+pmw/N9VoNUGa/uVh13qdeL56/Zm4b/yMlDOQgKVZXWvR3uvpSDqFvysDlbzKAanZrrXpfh9IA==
X-Gm-Message-State: AOJu0YzwtySqx+4lRXT3FwiCkMPLhCYhcEILdHx/vNiHnSyStRV+hbD2
	+/2dt5m9Uik6E86hLngTL9lYAfr/RN+sfYhq0fzdT8gJSNvsXbEI
X-Google-Smtp-Source: AGHT+IHzP3RH04hMNwNG9VMOVquDSAgLsgsVpVMasvO3ZiBfXKPE+hRX8T0d+FF2yLSyj12iJchmTw==
X-Received: by 2002:a17:906:c411:b0:a44:e3c:c4dd with SMTP id u17-20020a170906c41100b00a440e3cc4ddmr7725415ejz.48.1709631153273;
        Tue, 05 Mar 2024 01:32:33 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id h4-20020a1709063b4400b00a433f470cf1sm5723765ejf.138.2024.03.05.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:32:32 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v6] staging: vt6655: Match open parentheses
Date: Tue,  5 Mar 2024 09:32:13 +0000
Message-Id: <20240305093213.4280-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240305091410.2798-1-dorine.a.tipo@gmail.com>
References: <20240305091410.2798-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the function parameters to silence a checkpatch warning.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changelog:
V2: Modified subjects to be unique for each patch, as requested by
<gregkh@linuxfoundation.org>
    Fixed the warnings in the patches as suggested by
<philipp.g.hortmann@gmail.com>

V3: Combined the vt6655 patches into one patch as suggested by
<dan.carpenter@linaro.org>

V4: Removed the multiple signed-off-by as suggested by
    <philipp.g.hortmann@gmail.com>
    Omitted the cover letter as the changes have been combined into one
    patch
    Reworked the patch subject to be concise

V5: Fixed the commit message to "Align
    the function parameters to silence a checkpatch warning." as
    suggested by <dan.carpenter@linaro.org>

V6: Fix trailing white spaces in the patch to silence checkpatch warning

 drivers/staging/vt6655/card.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 36183f2a64c1..3f807d898607 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -81,9 +81,9 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
-				       u8 bb_type,
-				       unsigned char *tx_rate,
-				       unsigned char *rsv_time)
+				      u8 bb_type,
+				      unsigned char *tx_rate,
+				      unsigned char *rsv_time)
 {
 	switch (rate) {
 	case RATE_6M:
@@ -288,7 +288,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  * Return Value: none
  */
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 bss_timestamp)
+		     u64 bss_timestamp)
 {
 	u64 local_tsf;
 	u64 tsf_offset = 0;
@@ -297,7 +297,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,

 	if (bss_timestamp != local_tsf) {
 		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
-						local_tsf);
+						 local_tsf);
 		/* adjust TSF, HW's TSF add TSF Offset reg */
 		tsf_offset =  le64_to_cpu(tsf_offset);
 		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);
@@ -321,7 +321,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  * Return Value: true if succeed; otherwise false
  */
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short beacon_interval)
+			    unsigned short beacon_interval)
 {
 	u64 next_tbtt;

--
2.25.1


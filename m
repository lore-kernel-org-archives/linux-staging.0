Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE04DA08
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709570216; cv=none; b=Qpsz7OR+9r+sL877dbvy9vEJx3PkPUY23eydYWcurRT3WiGP2SjBC2Ul2z1RDgKZA3CCR0DYcnk7qCXgmlTzRliyShcUmVRA30a3SaR8HjeuUHDXtrqPz7p62HAqbQGHmAawENq573hdQCW6/EToHMxMuEFQhsvo/E811w/JV8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709570216; c=relaxed/simple;
	bh=Ej60zq9e+noor8l8VQt9/EUPvGw1IOSzz6TNKr1Mhfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jpbsl0UeMV/qSWRgmxSxNatboKpqFa3YSszaLujFmS4SqUJx5/xejAqR03IR5dBEwcqYBykbjyaaFmIsPrr+tPuRcuNHWrRlE9VrTcugNTAQUF0ldJ7KWNVHM8AbTWs4ahV05zlw03mxsE7P9RYyE76OKyECaUi6MadYljfGPvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXAtrCht; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXAtrCht"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56682b85220so7573069a12.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 08:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709570212; x=1710175012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpMSXWVTpKje7QTXaNBWLJJgqd03SSyBNpqas6L8ES4=;
        b=GXAtrChtQGwODGiBMF2SkPCzxS6PHCB9xpRffAwSZZNc6ZM8G0VwoIO5WiQXesbozE
         dVJRebilxRj9LwdUFmLTHbvcY8cYGRvloRnvxDYTgQP2hSFbrpbF5zYY3mMIGa8q9uAd
         MWspFB9eY0wah1ha/3kAQQNsullPDWOs/BdfPKlc1bMERGYpy5Mws0/LEzvyQGaH4rhj
         lpUnbY1ARi36DonyBskm+LbtK/jSjQYmcgjZpLS0a2IAH8SbZ9aGpeR3IJ5KDoF66BVb
         PLLwrDwleY3alVq0qGx0jG4O+V56uTT2BzdAwczIE3ddlP3Ck8Z7UKKZrZ5ww7b8aW9X
         nC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570212; x=1710175012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpMSXWVTpKje7QTXaNBWLJJgqd03SSyBNpqas6L8ES4=;
        b=i+to/kYxdVRe04QewtkIDAjHlUD/5YZI/FEaTlPaedHGZqk8SBwO8xkTDYc7BEBWlG
         iEWZL6groNvdoZ7RBFk6zaSyR8/jhVHru4CFDAEBwB7Du2FUVxxck6JFgTy1f7UIvVbr
         Ut1idWe4SjqY931x3+PHnxDFKGcJY7jU0D4qYDqN4iqjoOSysz7coJ0DJWp/BzHLXlSO
         WZJmJr53mwXAd/Ch1DwqiacbD4lybtUEoBl6k7cc13LUb8fBHMbFTFXtV5i/SFIMp1Z8
         vG+LlOIOX7mSGo6bsafAQ4tVqr26qcv6xItDSQVgVIq41tKPbmQziXbDJrKcEokHsQem
         qUOA==
X-Forwarded-Encrypted: i=1; AJvYcCX+ugvFwJcoPROscUUA5xh4O6R2tmr9rLfs6FBx0+6FdfQ1gItAEFaSUNf6w/kuFc7RvI8z82sitas4XiWZQUoPzvKSGlza67iTTnfLGw==
X-Gm-Message-State: AOJu0YyGFa/GQswmtAMreiw7u2YwxbnxcttZZ6iPF+jii3jCQixmBe9f
	7bysCQYCcv62xc5ZknMCM+V/Mj0XdqSbVc5PL2UcPaIpS85E3Cap
X-Google-Smtp-Source: AGHT+IEP0VJJNqKbC/r6wzj/3M443Kr8XLY7jYAZptwikMmikcF5aMv5ztKNRoB6QlpGVvnd7Z8McQ==
X-Received: by 2002:a17:906:4148:b0:a44:f89:a04e with SMTP id l8-20020a170906414800b00a440f89a04emr7248692ejk.35.1709570212320;
        Mon, 04 Mar 2024 08:36:52 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id qh22-20020a170906ecb600b00a4558314ec9sm1130924ejb.192.2024.03.04.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 08:36:52 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 1/1] staging: vt6655: Correct parameters alignment
Date: Mon,  4 Mar 2024 14:26:03 +0000
Message-Id: <20240304142603.32982-2-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304142603.32982-1-dorine.a.tipo@gmail.com>
References: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
 <20240304142603.32982-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align parameters in static void calculate_ofdmr_parameter()

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>

Correct parameter alignment in bool card_update_tsf()

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>

Align parameters in card_get_tsf_offset()

This patch aligns the 'local_tsf' parameter with the open parenthesis.
This change improves code readability and maintains consistency with coding
standards.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>

Correct parameter alignment in bool card_set_beacon_period().

This patch aligns the beacon_interval parameter with the opening
parenthesis.
This change improves code readability and adheres to coding style
guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
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


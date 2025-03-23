Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C14E1B4248
	for <linux-staging@lists.linux.dev>; Sun, 23 Mar 2025 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769995; cv=none; b=jBGy1n+BdCP+poh2J/V888dq6lVELpAOSB0sONArmA5giOEAjC23KEiqslFnBRfuhmbvmwyP/n/pOAVOD59/c8Rtp8Nj/sosh+UzyP6CKTEC6pOWedHtd/ysyhOVDGecjMmSBehT4MQnsGtAjbYc2IStQgmEN+aRadVx5q8tPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769995; c=relaxed/simple;
	bh=ccm0vWMDBLowOtsgeC0Np4Dq+ieIsmlaDmtQ0vxCKuc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BdAESbjPhxY82I+m4t+7dedxKtnTxx7L92fBPc3s2pFP+kadw7t2syjna3jItCVONE72jjYpd/+q9uQB4P8mFqAwqM1cXuSLOG46bDzgowQPmgSJQU+ehINdtyC8T3X3bjWepMQOS0WQ70Z51VsOqWDpk3m/XMQc2RYIWJJXD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe6TxWCJ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe6TxWCJ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso6448849a91.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Mar 2025 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742769993; x=1743374793; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YQbIxlTNY+cHu7R6IhUq3rHgE0kIfvcWVGQIcjca71s=;
        b=Oe6TxWCJnhYQBa0eK5A7fwTtdEGcFa+9ni7HqVj79D+mCyRacoDFnUpNOcWGJc+iDz
         UY+qAMJ+CKJEQtrrd7YqIia2XYR9fSjVf3ysZtSyJHEun4zJBJldH/CbrLSlTLMxYEob
         ad9rnhAbDm6gI5Xe149wgfJuPx0XOQvAM/xjQj0pqRe1wW9us9kZHW3zBGcZrBSZg1eO
         9PiwzJHIj4Rom0itbp95f2f9U8pfVvAtc7H827RDXHzHttGZSn8vcY9pjgqdqNzxhUg2
         +cuk8D3iSOGBDqXhYcP8JzBSNGqEuK7ba47m47IFYP6wSJoJAts26X2DnizX7woHvAN/
         1yjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769993; x=1743374793;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQbIxlTNY+cHu7R6IhUq3rHgE0kIfvcWVGQIcjca71s=;
        b=C4TMUu/ElKRdieEZ1i8E4l4YL/Ppp0PBWXkjP3VZ+btD8o1PLVydqN1EMemhN7vayq
         QtJUsq+yRGi0ezU6DzsIbR9sJbjsl6TBLNQbZcI8wB2XjHVheHUB6F08RURpgsZz2Xr8
         3I60aggVUeVigN8nBe2fYmIoeoifTcq9ycLrUaNGHagKIQw9QAjYZkZsgSaSk4/27rh7
         sSgPhbRFfzFqRscnTavp0pjSNc/eMs+5ZzcTtxvbmYFLI/udno8da851K256hLMbrZR3
         jTWYs2lG2h+Cs5/fgd7JBtPHxxn75Q6p+BlfoeWFiF6npdhK947/OyCOSna+7xMyraUc
         csfw==
X-Forwarded-Encrypted: i=1; AJvYcCX6WYUnHgNi1+KGpSi9CsWHLAesPKlOWST0rug1mEuP+ACwDJDUcEgHqGeoZMc8s4vnpJNcb+GW1tsCYdgL@lists.linux.dev
X-Gm-Message-State: AOJu0YwcAbIiLcqtbRoAxrUO7reEW5MgF4gYJeam+C4o62jBN8MlxhPi
	bt05Yql+ZbiHNhzCwnmfHIwnUL9bp1EYWzDD30cMO/LQKFxCxRp7
X-Gm-Gg: ASbGncslo47V/lgMSlk6RxQ3egfMZr5dV//y3jJ044u5fadFHsr9LMdi8PIjFVwRu6w
	UKAHVBbvEnvu4EmasjHenQN1vEhuOvdXa5C2pPcuk/MXLNHJGIoMithXY4+DXB5YVWTw7nX4fQJ
	CJZjQHBg67A4koKRVP+maAkKX9M3d7D+946FKPD+7/Yje9kiaDRDo1KOC8Pv6xCWE4n7ARmUQ7A
	gqbR0/+6WJMKRUAuQorU+5vyZnkILf2ZpKObUkYu/fCch5v+Wo/Fq3uu5i9kd6Mc2WUOBnN99nY
	VgPE+FAvhT51hx5cfh+Qt/8TSjPTfCHddr8DuQui/iwAISIOJ5X0OONSb5M/0W4u8vVa97Ll7q7
	Ya0H6GHKtZV5WoBfrppQ=
X-Google-Smtp-Source: AGHT+IEzb/FSn36rD8g3bjC3CLhUP4bXdLZq4w66P1jvHqoP8f7Ex/B/4Qt/Da6+yywl+F0R0SDUjw==
X-Received: by 2002:a17:90b:4c52:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-3030fea76f8mr16980734a91.18.1742769993320;
        Sun, 23 Mar 2025 15:46:33 -0700 (PDT)
Received: from fedora (c-66-235-14-182.sea.wa.customer.broadstripe.net. [66.235.14.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d4e46sm6589100a91.14.2025.03.23.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:46:32 -0700 (PDT)
Sender: Justin Cromer <justin.cromer@gmail.com>
Date: Sun, 23 Mar 2025 15:46:27 -0700
From: Justin Cromer <justincromer@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: fix casing style on getDeviceID
Message-ID: <Z-CPQ7dGuTBZ3sWv@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes camel casing for getDeviceID function. This includes an update to
the internal function variable 'deviceID' as it's relevant, needs updating,
and is clearly scoped to the small function.

Signed-off-by: Justin Cromer <justincromer@gmail.com>
---

First patch for me, so I chose a checkpatch.pl issue to get comfortable
with the workflow. Any and all nits welcome. 

Verified my change by recompiling and loading the module in question.
Additionaly, checkpatch.pl reports two fewer errors.

 drivers/staging/sm750fb/ddk750_dvi.c    |  2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 12 ++++++------
 drivers/staging/sm750fb/ddk750_sii164.h |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 8b81e8642f9e..3fb14eff2de1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,7 +16,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 	{
 		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
-		.get_device_id = sii164GetDeviceID,
+		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164ResetChip,
 		.get_chip_string = sii164GetChipString,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 2532b60245ac..d50c71824321 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -48,22 +48,22 @@ unsigned short sii164_get_vendor_id(void)
 }
 
 /*
- *  sii164GetDeviceID
+ *  sii164_get_device_id
  *      This function gets the device ID of the DVI controller chip.
  *
  *  Output:
  *      Device ID
  */
-unsigned short sii164GetDeviceID(void)
+unsigned short sii164_get_device_id(void)
 {
-	unsigned short deviceID;
+	unsigned short device_id;
 
-	deviceID = ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+	device_id = ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
 					       SII164_DEVICE_ID_HIGH) << 8) |
 		   (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
 					      SII164_DEVICE_ID_LOW);
 
-	return deviceID;
+	return device_id;
 }
 
 /*
@@ -141,7 +141,7 @@ long sii164_init_chip(unsigned char edge_select,
 
 	/* Check if SII164 Chip exists */
 	if ((sii164_get_vendor_id() == SII164_VENDOR_ID) &&
-	    (sii164GetDeviceID() == SII164_DEVICE_ID)) {
+	    (sii164_get_device_id() == SII164_DEVICE_ID)) {
 		/*
 		 *  Initialize SII164 controller chip.
 		 */
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 71a7c1cb42c4..a76091f6622b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -28,7 +28,7 @@ long sii164_init_chip(unsigned char edgeSelect,
 		      unsigned char pllFilterValue);
 
 unsigned short sii164_get_vendor_id(void);
-unsigned short sii164GetDeviceID(void);
+unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
 void sii164ResetChip(void);
-- 
2.49.0


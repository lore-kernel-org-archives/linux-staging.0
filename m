Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223952E62C0;
	Sat,  5 Apr 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743848044; cv=none; b=d7EkP3yfH21StT5hpKE6FSeCoTDGU6A1nh57b44z3K5iw0i9X3trqBz+5dx56Yw3BVMOWfjAYkYBch452yNtp8JCHZFeIliFp7QT9syzmKKJ1T9Qg/xqqh6n/VFLQc3vWSzBRV2hqMtj7yPyJnCBHqJKUb96WFRE9BsNGO3C5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743848044; c=relaxed/simple;
	bh=Z6xq/h+Qly0PKUGsSPTgPJbf66WR5pT+E85G1cdl378=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=La3yAMiLIftaCB4mAxSUOb+5b/ZW7NzAD69BlRQDo28SVvDiSTjyHheKbF9HEM1xz04O5zvl6sctK9GecYYFF6gKPv/ytDvkmtruY+sQm9YWThJ8J/skCxIFXEferTvadF7qTlJqQJQqlfyUKP4LWXPbvL7QpryvF9MxF9q+1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD+ReW9d; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD+ReW9d"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c2688619bso1729194f8f.1;
        Sat, 05 Apr 2025 03:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743848041; x=1744452841; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVTlKXlj09u3x3cF5cGmCUxBsTXjfJU7FwaBPii2bKY=;
        b=FD+ReW9dvwpY67ebYaGeFtUYp+RLlpBqrIuPYaY2SPQZMbEJEuf9t5c6Im8b29YJH+
         daxZpyyiHv/QBQFaC9YTI7kiZ6RU3C71QE+ydZFXeJBq5L6wOda47ObG6h16TC7xrb9H
         nEtzxNTLYDwh4Z/Uv/tuKu1ohx0LTdmbALoWM39ysBhYBgaC1Udb6QcyGACXvMcxmMl3
         PMVhh8a1d4d10K6ugg5ugBSV5uQRV/7xrdFbCbC6OOLvjx+z9MoFaRswzKe7/VoFn+qH
         K5NNFVtpWXQvK0X6dU18hGo7RejUBfBWr5mV5/8rljgZgIk48HHyw4om7JYBNL9cC7An
         rv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743848041; x=1744452841;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVTlKXlj09u3x3cF5cGmCUxBsTXjfJU7FwaBPii2bKY=;
        b=dAZ+yDg+9gpB2xN8m7h+G1gUdk0sggyL8E36fFm/MlSWb9bRZ+p9DT3KM8PeDgMAya
         bklg1JOZKo1zN8l7q+yDb/gn8NQN3PMFooF7Vx4dUbvdCdYzkx/AqSFRDLe0x558yim3
         Eo8+qD7vHa+FPu1Q3HEzcYsI8hB/xiRL8Fzs+ST/TV65QVpuTLDyw9chM6VoRs0bjpXP
         oORCUoWl4VD6t9H12ak6p7XKEW1O1byIXKVeezQ+nomSVYEDaoKNv5foQBbw/8FOUktn
         5zkz1eX6qcDoEvsS9YX+tnh27FgS9Wm083g2l1gxf4nesXXFeyq5TboIWGJ/7Ae2q992
         6H4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIf7GUhCkW4P49nU1a0dViXpAz4ERVqtH8HxJCr1pC1m4S6Zy5zJvO2+EWUVrzjGdEM5Hzgr4mDObMxWck@lists.linux.dev, AJvYcCUp8JCwJh6hGHnahOhU4VrR8Zg8WYaUy935YTErDDwfOFtSDWwBZ8f/xkahQIESW37S3TISlC+6EoTo@lists.linux.dev
X-Gm-Message-State: AOJu0YzBYv3qekmO16RvZWC6+1Z3jxSFum7zAvA1mktlLz+/lIqXONMu
	WppOyp03a0Zz7fBZsekuZsQlIvf1ItJ3JW2SD37KZ50tzmq0Lqx0
X-Gm-Gg: ASbGncsoxy53vi08e0BIM+yQxmio4VlcU801xOvOPFQyc/kxLviBICiZT/uBxu0Lg+m
	pkc/h5fhtD9zRgoUK9JQj1ud41tNhRDuJc+MIBMd9Adpey81wf5KQKsUJiW2NYtQfxI15M7e5lJ
	3Tq2luCawyJO7Wq4WUS2MU/nN6zJAkkpzueJfnPO7dW3ds15NXW5IexACrbctHeXwaVOZama3T+
	U2Vtx/CoBfMe0ukeN7Q460v18S3WSF4UDNl/Hr+S5yQheLfMP58XLWYz9tvdVQ7SU8PAicJQhAk
	NjUHn4dkiypPg7TV3ULLwt4v+w==
X-Google-Smtp-Source: AGHT+IFCh0hVBGoDPAG7S2CedA/2FDhHjSLG9yIfWQFMEtwHcSqkydT2iBYHe3/5ULlE8y5r40hTWw==
X-Received: by 2002:a05:6000:40d9:b0:39c:1257:feb9 with SMTP id ffacd0b85a97d-39cba980edamr5166552f8f.57.1743848041232;
        Sat, 05 Apr 2025 03:14:01 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226acfsm6358675f8f.88.2025.04.05.03.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 03:14:00 -0700 (PDT)
Message-ID: <67f10268.5d0a0220.18864.f8cf@mx.google.com>
X-Google-Original-Message-ID: <Z_ECRdLnNb-6bR35@princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 11:13:58 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH 1/8] staging: sm750fb: change sii164GetDeviceID to snake_case
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164GetDeviceID to sii164_get_device_id
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164GetDeviceID>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 6 +++---
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

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
index 2532b60245ac..223c181dc649 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -48,13 +48,13 @@ unsigned short sii164_get_vendor_id(void)
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
 	unsigned short deviceID;
 
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
2.39.5


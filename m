Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650548;
	b=ux9L9NcEiEg127NKhPYplgNOv+Lh5sCwnLCsakI40LJFaZ5kQIGX61k1LUOThZgykn6u
	 uiy3dpb4O0uBiLF8fTyt3sJJhTETs/D7j2pRAP24WDx04Shk5Lj97vjOn6NgMM0bOpkNy
	 UQmNkE/np6b50AusfV9eB76XaKLpzjG8O9OSKf6j1g+7H6Qroun9Dbbri0QjMCCcoAWtT
	 WDFGgBvNxq0twxL99tj89P/A6Fz2Mp0C4qPxSvMwfOrPH73Frub6vsPjCdC15XJRwgckH
	 c1pVqewZdImYLWQwH5IVJhPE3wkyBGc1s3nL8/8NOeavhbFW6RZ1im/Z7/z6ZRfCaaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fcsL6m/fL6wR5N1Uy9uUPHQ01kHmtdk2koYY4a/ebJg=;
	b=P7fycpOcrogI7XU6r5gwueLQ9z96c3ylJKwIdc8XnZ4EOQNd90vZOSureoY4tuj+9k7e
	 skrqSiXn/P7J9U2yOSzPBfQqnrWQcxbVAHNLTLnGmgfTrTvIL92Bn7FpGXjpMkxlm5rwp
	 +cL/a0tg/5xIjayTQhcHG85aYVb1PeWzHVP9nYNxZgJqELjstbvpB60q+NAs6yeYPYKlL
	 cXWj8LNesTlzT70lDa/6X6AUYQDNhZk+sdSntFHiq/gRBzutZDM9k35xQ3i01XzT0my8x
	 /gPV3Er7YJ1dxesJ67ys+0QlLgceuFYDh5gVSJYPfCZluEXl+1CryX5pZ6zMRsTvirg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lmRml/AZ";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ED0606A8A0
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 10:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6ED0606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmRml/AZ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa5103so738205f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 02:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650546; x=1795255346; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcsL6m/fL6wR5N1Uy9uUPHQ01kHmtdk2koYY4a/ebJg=;
        b=lmRml/AZ8iQovVlElo8SB6HhPryeV2JB468UK8/8CsD2Om+Y8FiBLt1s3ZmcNa+KCj
         5/M7TTapXx9xU9JfL6AVymzyKbhe0MkEylOVBvZCBo5jHAQaIABCRsUilikrk/dXaAi6
         iDWg3Z/vX7OR13dSmlcr8srWsoP0Gx5xqKGcjMEjlTO0PRFAyb78P/+Ie4tlbR+XXaKj
         FZpMP33JHfv+TNTesy34Y3OSETuBaTuMZ9xgM7Yp6f+rUw5GY7elTVw4iPeuaQ7Pm9Wz
         KkBtCVW2vf+wvjWXuWjR9pOsRXs5/GmdSyHpM2KCYCm74mnmS46sJOJrjRxUX3ynMBk1
         YfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650546; x=1795255346;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcsL6m/fL6wR5N1Uy9uUPHQ01kHmtdk2koYY4a/ebJg=;
        b=EseXrcQMMeQI2fqSQfxAGAAY9PMZGIJ/k02YJv6drzkU0gmjOWadDyG0w9bN7WtvG/
         9KN4DH/BtnNaMJ3l6ddJiq8JkpmeJm9apfxduOi9IXTslogBfwP0psAfzAsVxSb0zTHy
         8bPbUxh1qB08qoHn3sT36C+Dx1HY9p7b5F3xX4wwu1QCoOP63WRmj0onk/F69QNUHzW3
         JhdsR4DPLsFYOVTb2lq+XTa3cKX3R/PDyY7c+abV9kGE+tvIn7u07hBE6IY2a55cK5CL
         wJl1tNmjRAIHL9OOGYqRa44VtJe3JuswmR5zSpfi5bSX2nesVeg3lDOYOr8xewDxqn0C
         +Ptg==
X-Forwarded-Encrypted: i=1; AL+hErG1UZpBgqDaCjabE8gbLQwSOfjF448VCRkbTJBIjy8r0HsxdZPZjZVYnN4E432LZ6rEjSo0k5uCyFA7v9jm@lists.linux.dev
X-Gm-Message-State: APuU4Z+urFAlfexzq9ykEszOpmR+Q257Dc2VK03J1DTzeQr0cu9al095
	FmeKHViqRWD7MtVdZA5tFrKcCs+GKjE7cbDRCK066xm9R/x5UTNdEzoEZyCNoY1Yjj4=
X-Gm-Gg: AYBFou0L00YZblu+1clWopAWx50oa/gZzfs+n4T/rSMG+Fjc4aKW+Z7aVYI+ifW6X3o
	IMw55+lS0c1NSXVV4bllwq3zze60LiuOHET9NYL7nylTGvj43BGqkfxG+MI17nZXgXh7YkXBuyf
	MkWIMvBaT5ZiooAUDsDplcTJ1dAJdX+g2QDdhYU/LUFFEs41cWGo3r9eCx0kDaFJy0oJ6etz/5f
	5y41wroJA1xPDpQGuNKayheJV+faX60FEN3A4MpPUBXmoWa2VWIpJAFtO8Q3mq2HZkOhaIbYqTZ
	UaUctzbO/nJqpvpb2lrEhCqCedxgp8MZIbeYPI7x2DOWnBHzEF4t9DmKVOlyh3Rzqm0JRa870qu
	l7EPeVWeJBMC3TPOpp1zN0w0tH1yVMyngpmrF9BFaQoGN1WIJq9moh0uVR3PQaqZSktOthm9WF4
	C7rpd/fYylz12wl0GPOPY9HXoNj2gbtV2rPLQwbmjjAOPZ7ctyXFUOsgq/suR9CBI/Yl50QPEaN
	B1UPKphwXJ1TYn+A8KpVLJQ06ML06qf9ObSQEkZoP07sCdsJnOG11N7/uwzlqE7+OTZ+gHlFr2/
	+5TANQln2wZhegtkyV4aIc1p4+sH+22oJA==
X-Received: by 2002:a05:6000:250b:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-49c6dc01593mr9674006f8f.4.1794650546159;
        Sat, 14 Nov 2026 02:02:26 -0800 (PST)
Received: from DESKTOP-TMG47OE ([176.41.25.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm10520184f8f.43.2026.11.14.02.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:02:25 -0800 (PST)
From: =?UTF-8?q?Ali=20K=C3=B6se?= <shroot1337@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	rppt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: sm750fb: Remove empty software I2C acknowledgement helper
Date: Sat, 14 Nov 2026 13:02:07 +0300
Message-ID: <20261114100207.9124-4-shroot1337@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114100207.9124-1-shroot1337@gmail.com>
References: <20261114100207.9124-1-shroot1337@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sw_i2c_ack() contains only a return statement, so calling it has
no effect. Remove the empty helper and the ack parameter from
sw_i2c_read_byte(), along with the parameter documentation.

Update the only caller to use the parameterless helper. The GPIO
operations and existing I2C bus behavior remain unchanged.

Signed-off-by: Ali Köse <shroot1337@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00ec4c..54ce355e535f 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -201,14 +201,6 @@ static unsigned char sw_i2c_read_sda(void)
 		return 0;
 }
 
-/*
- *  This function sends ACK signal
- */
-static void sw_i2c_ack(void)
-{
-	return;  /* Single byte read is ok without it. */
-}
-
 /*
  *  This function sends the start command to the slave device
  */
@@ -300,14 +292,10 @@ static long sw_i2c_write_byte(unsigned char data)
 /*
  *  This function reads one byte from the slave device
  *
- *  Parameters:
- *      ack    - Flag to indicate either to send the acknowledge
- *            message to the slave device or not
- *
  *  Return Value:
  *      One byte data read from the Slave device
  */
-static unsigned char sw_i2c_read_byte(unsigned char ack)
+static unsigned char sw_i2c_read_byte(void)
 {
 	int i;
 	unsigned char data = 0;
@@ -326,9 +314,6 @@ static unsigned char sw_i2c_read_byte(unsigned char ack)
 		data |= (sw_i2c_read_sda() << i);
 	}
 
-	if (ack)
-		sw_i2c_ack();
-
 	/* Set the SCL Low and SDA High */
 	sw_i2c_scl(0);
 	sw_i2c_sda(1);
@@ -458,7 +443,7 @@ unsigned char sm750_sw_i2c_read_reg(unsigned char addr, unsigned char reg)
 	/* Get the bus again and get the data from the device read address */
 	sw_i2c_start();
 	sw_i2c_write_byte(addr + 1);
-	data = sw_i2c_read_byte(1);
+	data = sw_i2c_read_byte();
 
 	/* Stop swI2C and release the bus */
 	sw_i2c_stop();
-- 
2.53.0


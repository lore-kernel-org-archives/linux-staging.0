Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FEC376
	for <linux-staging@lists.linux.dev>; Wed,  7 May 2025 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628291; cv=none; b=uIEoAzRSUp/CL0cllgOF9YKqGk7LnkqvhPOzanBJJC3J1056uaDZAIuNtvodm1U628RjFqOcg1uu6aOybcLZrOVhzO+3BOIwA6Si+J4blS2OfyQG58rwTGXLkD5DwUUT+xD0+g9+DIyhJEBMjGzPWo/IwB+/m/zdhj9AtpUE+IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628291; c=relaxed/simple;
	bh=IVv2wzn+wTsvN/udaFjlb4jJzZjRBVWq7YxzJC7vqBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPqo6D0Nhu5vHn92B2uvxZrzp1jwI5ot4WkN/7Xkp5cbTyu+Q7A37kMQV1scTYfqpjOKbLHstKO892rFYc+FOM+87dHsZgQKxKSdfGbtlGHlMseDTMRgon7MnH+tgu8KUEH4KH2vOBB+KjacHJiCpc9UI6WJ/bG/4GDA+np0iGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Emalcb5c; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Emalcb5c"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73712952e1cso7007432b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 07 May 2025 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628289; x=1747233089; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V00gbHB3f6Rug7OZkkSXyWv7lM+Ur/ljUZ4R35v0M9U=;
        b=Emalcb5cIrMVuzlRp7B5bXOTe1u0ab61YsPCfqkNFgbYsysnP3pP+UBrSsGJ7ADLPy
         dfb8Cp8OvD2kvVJQ43E8vUkAEpO2xZjJgddWuBKsKhUjGWYX3wGfLcBN5CoAz0iOsVzZ
         h87i9/s95o/3eiTcYX/jtU6Cb8xVVfNt+KgqJJ8RomMJzt5UrdhjfzhX9MUg/fn0vHOg
         K81keVj4ona+lPutVxzQkSNHf54rFxxGar+YnnuGJUCV7dg265Pf45j5mvO+/odzH1ZB
         1/t7spQM54nefYJevlOvf5Ou7fFLC4Mm07/h1FSyLJjvD5jdddGsH5TBjg/b41Yiinq/
         5S3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628289; x=1747233089;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V00gbHB3f6Rug7OZkkSXyWv7lM+Ur/ljUZ4R35v0M9U=;
        b=nguiBNbmK4utmz8pUmsij6RpvH9Bc49c8yOOiMQ7B78hURx8lh92PrFpd8UOizrsFW
         Y4PjuATiNLQNPCi5b/YhJuQPcnGDkyxTqLqJxS/yw6jndp5N8VfiEDfrbTHSW8p63J0w
         sHV9dEibTBK/X+tVkAYz0RF5gdwRB2DwmxuDg6r+MsG+aP6kX51+MepLVUxe+tzXOis9
         3I0gxK1QYQgwZoIr/uiO286jhYx8xaXF4O89nfNxqSvlmsNM9WvapoCFhqcd0VcBAebB
         KqOlc2ZByFE6YQYY0LEYs0yk2U0hduY+/EZscQQ7DUjP75IanVq0nqOTQMFhaEnhBF1/
         cxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW552sDaE2g8es4jz78XsJ/SIstNL+ixs4Ar7/rhdLSKJ3M0W0qhSad1lyx6lYfQeoAnyNJbKmviI+MBY1s@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6zvu3T6QNmMfxDWIAw83ZxILokJaJpOztr4EgAlYXW/mS+19v
	42XBfsaf60RHbucOX6Rnb+efJ7csJY+OQWwjiLiaz7GP1KHippGE
X-Gm-Gg: ASbGnct93fEEJx7o303A4OosnOfxtkzEDwGtPUm6k7nSEK7Vdd9X+jntyIR5odC+s5v
	OmaSPnR6AYwrn4c18gJMehTL5SWwzL0zh7bcgA8A0p1X8r/QOxySMjilw4ZXQO5TltJLmFBRufc
	gKA6OdavYGK/ItyU2pInGusZNSlbBmJVrHFxDzQLoivgg9/6msroSG3qwDieR4IXK3YC0lV0s24
	ErpavYjucxxUX5d843Zm1MeNhyEq/700HBtzjzrY/bj6R43qo585THW3k1HoMKmHpJ6HdkgDLrJ
	rqRk0xryj1Ie/1sDrjLZGeg4ObzjnZCl5yjQ26DCT8PTIYXK
X-Google-Smtp-Source: AGHT+IGu2cTVUe8urLeyXyOnJF7jzhdXw0YVp7nGLn1w1fUwSNZlmndsJQEgNnb9ekMO9wXE2KT13A==
X-Received: by 2002:a05:6a00:3003:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7409cefc3f6mr4524741b3a.7.1746628289560;
        Wed, 07 May 2025 07:31:29 -0700 (PDT)
Received: from brak3rDesk ([115.96.77.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7c13asm11366231b3a.31.2025.05.07.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:31:29 -0700 (PDT)
Date: Wed, 7 May 2025 20:01:26 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [FIRST-PATCH] staging : sm750fb : ddk750_mode.c fixed codespell
 issue.
Message-ID: <aBtuviJ2FhJXNg7r@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

instead of "parm" structure variable, used "param" to ease the readability.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 3b25892af713..8f2708632c88 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -203,19 +203,19 @@ static void program_mode_registers(struct mode_parameter *mode_param,
 	}
 }
 
-int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock)
+int ddk750_set_mode_timing(struct mode_parameter *param, enum clock_type clock)
 {
 	struct pll_value pll;
 
 	pll.input_freq = DEFAULT_INPUT_CLOCK;
 	pll.clock_type = clock;
 
-	sm750_calc_pll_value(parm->pixel_clock, &pll);
+	sm750_calc_pll_value(param->pixel_clock, &pll);
 	if (sm750_get_chip_type() == SM750LE) {
 		/* set graphic mode via IO method */
 		outb_p(0x88, 0x3d4);
 		outb_p(0x06, 0x3d5);
 	}
-	program_mode_registers(parm, &pll);
+	program_mode_registers(param, &pll);
 	return 0;
 }
-- 
2.43.0


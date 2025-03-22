Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBAE1FAC30;
	Sat, 22 Mar 2025 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742651819; cv=none; b=iw98ZNa23nHq0/lpZH9fQMBhZR4Excp5WRpw827YobItg+VkN4juiOdEfYKJU+8X5kwwqCe0SuJLozp5ta9st1Hk7BtZlK5QDn0eijAefu5WIxHHssxUQqkbSnlVdnuP/iteui/C26HL9vAObF8zVPrfU/CUzLFP7Z8UUxhzHZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742651819; c=relaxed/simple;
	bh=HC5SXTLXqFRyIjOWdF51T9PS7pYFW9s1HxRd3bt8qOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qm+Thu9hRdZavr87JzyqdwU8Q0EioV2AGa2eETkr8GuOFL0+Rbe1FKw15PcQBckXmV/1U3b1T028gnqaGPpMup/1xQusMeFz7HlSHsD1JMw0CzH02VNeQPE9u71Wkx39YM9GxLrn178WUTOMFiMYZIhaHCdmppW9cci5oupimfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNFl3QYF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNFl3QYF"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso5233140a12.2;
        Sat, 22 Mar 2025 06:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742651816; x=1743256616; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwJQ+DNaXcBNm+hFjnYMaifHycz52RS1oOBrKBk6QeQ=;
        b=nNFl3QYFhB4P2bmrFzudscDzasR6unLoNtiwp6H6UaAGCgbF4F1bjtUZgtarcWHiPf
         C7vz2GRjNwhNoc8dk0v6TmPeT9rXJIRYoYNWEierucNPVu4kLYdiFySby93ET2OvFsWw
         aEQcfC0b1bw/h+zBOp2MCL9WQsa0/FcwDDiQv2zZoHyIDqkxWnKm5Z2jLw3KZMuOImFX
         gru7+GoeL+qzem+QiqTy+Ggw+xaQwZp4tSuiWoIjRGj9VIV2QSWKFAcDy212ct51Gj8U
         VRJpCpe13K9ItawrnNloSTJ6+o2ldxZ4+0fthuZpi8m6lERX1bXgY+RMn7iZXKGxNhUr
         vDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742651816; x=1743256616;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwJQ+DNaXcBNm+hFjnYMaifHycz52RS1oOBrKBk6QeQ=;
        b=uadZfZyprGGy7NAEHkKAeFzy63gKLbA4fLlTg/cRO9a2YJHrNsLrXPx3HqZFw5DI7a
         QidJUDIW7X4N+BW84BZvfVLjSHu0ck8pq9EnLLcBEiSCzJqij7Xuo5bZFKtSSnHcHaWD
         4fg0x+LOwzWH54nLTCHm8iFiD3PppZP1cpZcHSKxphGObe8C0Q2SdgMeBhJ9WJM59drK
         ClcOX9OyF0KxeD7Y8zNtxy6PpLXslH4cWBacGFnkxceBo90/Z226sEPfmU5R7fHKVurj
         738eNkR/LAJCkHyj/flX/wC+91J5HcgRLtMkSI/ovIhtMRBte5SGttSWu6Z8uN4ftFjS
         k26w==
X-Forwarded-Encrypted: i=1; AJvYcCUTAVHVsx8WWqJDTTiJ9KcjvB+ZO5YkO4wW9ShHsPxSFfEN4cnhrUNNnXGZts0QKojkH7V0otMVLPtnjf+E@lists.linux.dev
X-Gm-Message-State: AOJu0YzgR35JRdBiUYTm/yDbcFOMNGOz0yeIDiOF57tbxnHVvyTDIQfp
	C3E8N46iDlcTYPKashrRCcomah8n7yiPLwYGCjO82F3uGgWDkfew7xLWwAT9
X-Gm-Gg: ASbGnctksOYlwDKxkL1FIGgjRcnH2MRDWxCSAQrPyD0UkR6aKH7ruKEkp12Mcv8Fz8X
	wlm3CmmLeLoeD4Ypy1K7y10XXyxRLV/DhJ6lueM6XurH5knWk01rD9y6+gCp0RJNfdMcMqQaJKx
	uvEGUGUjWM2KSVSYzi0yrEFttzYXyE2P1tu3mp6vPHfKR7ArrX4yCil4DXHdOHkSDWnX+3SO/4+
	fCfvMYx3a/7mx8BGtLSD8USyTVtX657ImQFpKA3JA4q4eSDog2gBbTkAW5vgS1y4x4PFaxnRI+W
	4ZT2W7EVhIfidEkRiRw2cxbQKvWqTnFidDaGN0q+gwwiFzSyvg==
X-Google-Smtp-Source: AGHT+IHeUSR4IRAOBL64PNtQnwHsKu+y5XZcQEY1c53MZvjTaUb6Z4dobWK5HSz6Vpm04MO7+l2K1g==
X-Received: by 2002:a05:6402:1e94:b0:5dc:94ce:42a6 with SMTP id 4fb4d7f45d1cf-5ebcd4f3234mr5903696a12.22.1742651816068;
        Sat, 22 Mar 2025 06:56:56 -0700 (PDT)
Received: from HP-650 ([105.112.226.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf85890sm3207084a12.24.2025.03.22.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 06:56:55 -0700 (PDT)
Date: Sat, 22 Mar 2025 14:56:39 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev, julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: bcm2835-camera: Modify function call formatting
Message-ID: <Z97Bl9RyFRGZUXNM@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The line is a function call which ends with an opening parenthesis
thereby not adhering to the Linux kernel coding style.

Modify the function call to include parameters on the same line as
the opening parenthesis to improve readability and consistency while
adhering to Linux coding styles.

Reported by checkpatch:

CHECK: Lines should not end with '('

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 .../vc04_services/bcm2835-camera/controls.c        | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 6bce45925bf1..e670226f1edf 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -533,17 +533,15 @@ static int ctrl_set_image_effect(struct bcm2835_mmal_dev *dev,
 
 		control = &dev->component[COMP_CAMERA]->control;
 
-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
-				&imagefx, sizeof(imagefx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance, control,
+						    MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
+						    &imagefx, sizeof(imagefx));
 		if (ret)
 			goto exit;
 
-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_COLOUR_EFFECT,
-				&dev->colourfx, sizeof(dev->colourfx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance, control,
+						    MMAL_PARAMETER_COLOUR_EFFECT,
+						    &dev->colourfx, sizeof(dev->colourfx));
 	}
 
 exit:
-- 
2.34.1


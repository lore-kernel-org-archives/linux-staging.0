Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A403375C5
	for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761739840; cv=none; b=i2omPiY/qNwhbONLOnwcQ3+KEf1WX2z1HgY6K9zJu6RqMs+tSv1/hqwfWcV5TJC0HKGeGdeOh1qbSGq0tdLuJ3y24h+wmiONAo+464+ZiAFjmpyGV5bVfhZTTiMonuq6WGp+dzPcZLMSyWcJ8EXQVjAwfdfrnH7tecSH+7BNFQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761739840; c=relaxed/simple;
	bh=nmmmsqfKVAJAISlF0v0aoOiHV4ihW5X2wUL2HaVO778=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCoOcJ8nfG9/c8IvpIysCJtiuTNIM5tLkZoKC0YZOoEvUbnkohSKSkL4PHwho40N3/l15bHlTVps4fZb3vnK6XC+INhBwHKbdD/GUZGMR8lHsu1BMkKmctDcyO6dfnBpPpMtusK+b9Pg/Wp1WolGGViYKke1dE+kFjrT1zacB/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PGllS+TX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PGllS+TX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso27443975e9.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761739837; x=1762344637; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9+YREs/dwvkAURlYBalhERi7T5HA8/ejvJOwTN6088=;
        b=PGllS+TXztR41JiRamJOzP8CC7BFnJfe0V65XayF0HKcVcvItTi0gLooB97nNQnJhe
         L6eGovPZsonY4vmdut39RuJPjKlcyl3tDcQdw7PvLpp0ZuVTQwgYELpIoeoQIf/zAzqD
         Wz47j1020VizqwF2BmrmTXFT7fJhJ8OCgN4dVCFdRGP96cYDBGA9xhXZS8pk878aD1n5
         zCtn/YcwkjLWMgdOoBZ1Yvl3iRHVXKntnBJPqIGwP/Zan9b1uwuk/W+CHQal1J5tWUKh
         D+jK4CLq1gV3SL0CHzcU1s56XQ9NOpiKiAxelprxGjbHudOZVCqNbcltZ9m5tI5GKb/q
         6Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761739837; x=1762344637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9+YREs/dwvkAURlYBalhERi7T5HA8/ejvJOwTN6088=;
        b=jx9xQ96T+Lp9f1n1ocrh3idM8LpZGJ8fl4BCRqdxIU2rTHub96Akzn5YaXs7IbfB0v
         wYg5xfu14yecJclAGM7xFxmHdtD6qj4RXmsgMz5bHpKy7nbOI5TbL9CNNNVYEhkldMAy
         aEY5bLkOVjv2h5zvQMnmNMWf1k5P4scBwN37vXXOBZoqAY6UZp74WDtBqAC70R84KvqA
         +fr8OhveeiQrYfqk5Qk86c2n3RJ/XZGupgQYBrDxb5bpIngcjsQXdFwptwb4400vKOry
         1sb2ms2hIugbAmqiBQFHJSjL4koKAHnApBH+jjksVg6AR94ZWwPs/cO8eNMSF9+NiIlX
         sjaw==
X-Forwarded-Encrypted: i=1; AJvYcCX/itrjK1RlrxSupWe1meicAbM/8ZMewrAHEw2H+8oiqRCwDcvLqBMPAfxFsBb8qAOnRsoZxPGSwU2qbl7a@lists.linux.dev
X-Gm-Message-State: AOJu0YxdEcjm9X8JUOR/q7tBCnU0JLHxtIPx0PGEWPxhFA0I/FkUqKw0
	7EHK3Tshb11oYM8uhZ/TtH11BF2vYqku9/vAKfoyGaaICuqgDwLlhNP//f1FI4ri3rQ=
X-Gm-Gg: ASbGncu4D32Le6+oIMQcgkMke82pelNZkTWc3WUIaJwg2pdXrUon/2NrQVtu9unW9If
	iIINZN+F6lgxoZ4+7/cGLKKbTEpVXvp2v6wBeU6aDdhiezk3sfHtZPu99zscxUDGKdSdJaNWuxT
	fliGn0V9ypDm/DumdYJTknznGgBzZT/K20RrL3gySyFGmh4AkvxgNv2IaZYfcZL2u5dzm/2k8ku
	2Q/gg8rI9/3Mlr03U1oOrgn6e2cEDOusx2uSBctIq3Ne4BqbrrNT5VhrQhmnJHkU4ekcCvFH0vI
	okdNFHmwH+1jXIioJ40GZ2DEn40WpjVGXpUDYyCQtXC7Wbe6kMqvuZp1/6+kToLPWQQ+FPgVPLR
	543OQRVxhNKssOiQJiY1vqi2rrcNM7jEI4H22fu17HrMSvES75xIBsA6XxLd/v6cu3eOpl8Bciz
	F+5xYQ4+KklExMc+/7
X-Google-Smtp-Source: AGHT+IGIDloDBN8XL8rmy10flsio+t482MTy1ZQ7mnd0IkV1PLp8bTgCqmolXedNqKzaaInabxjXJw==
X-Received: by 2002:a05:600c:528b:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-4771e3937a8mr26462945e9.23.1761739837097;
        Wed, 29 Oct 2025 05:10:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771e3b68fesm44788135e9.13.2025.10.29.05.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:10:36 -0700 (PDT)
Date: Wed, 29 Oct 2025 15:10:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>
Subject: Re: [PATCH v3 0/7] staging: Destage VCHIQ interface and MMAL
Message-ID: <aQIEOJUHdVMriz7S@stanley.mountain>
References: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>

I did a review of some Smatch warnings.  These aren't published because
they generate too many false positives.  Only number 3 and number 7
are actual issues the rest are style nit-picks.

1. drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:2728 vchiq_add_service_internal() info: returning a literal zero is cleaner
s/return service;/return NULL;/

2. drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:408 vchiq_shutdown() info: returning a literal zero is cleaner
Delete the "ret" variable.

3. drivers/staging/vc04_services/bcm2835-camera/controls.c:198 ctrl_set_iso() warn: array off by one? 'iso_values[ctrl->val]'
There seems to be a mixup between iso_qmenu[] and iso_values[].  The one
is only used for ARRAY_SIZE() and the other is never checked for
ARRAY_SIZE().

4. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:337 buffer_cb() warn: can 'buf' even be NULL?
Delete the NULL check.

5. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:513 start_streaming() pedantic: propagate return from 'enable_camera' instead of returning '-EINVAL'
-       if (enable_camera(dev) < 0) {
+       ret = enable_camera(dev);
+       if (ret) {
                v4l2_err(&dev->v4l2_dev, "Failed to enable camera\n");
-               return -EINVAL;
+               return ret;
        }
6. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:576 start_streaming() pedantic: propagate return from 'disable_camera' instead of returning '-EINVAL'
Same.

7. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:881 vidioc_querycap() error: uninitialized symbol 'major'.
   drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:881 vidioc_querycap() error: uninitialized symbol 'minor'.
No error checking on vchiq_mmal_version()

8. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:1276 mmal_setup_components() info: returning a literal zero is cleaner
s/return ret;/return 0;/

regards,
dan carpenter

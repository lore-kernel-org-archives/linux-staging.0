Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51915184C
	for <linux-staging@lists.linux.dev>; Fri,  3 Nov 2023 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="YTdPRB/Z"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5b31c5143a0so25961807b3.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Nov 2023 08:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699024276; x=1699629076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S26xEcJ6RrMKogkKju8z/wS2kOlw+fpVzbtyMFDLFD4=;
        b=oZWAelNKBhIeYJm+rv7Gx+xc9kbdsqvYVyYuakoAUT/irz5CmT9neDUXGunjg2AY2v
         iBG6Z0zrq4ZNP/hTF3dTL62ddVmgC2GVZrqryl9tcLlBYO2HqQl7JwplPiu405tOxB65
         nocC02pKumPQmRjl/CX/2LdQQfVKfsdu923X+cogYW2Cyv640K8jwqxqcuKakGB6pkSI
         Jy5VF+EShjUdrBPxRy9Zvio9zyz7QHat/YD4++g6UpXeNCzFvb6k5RtJYgXUXYz7Phgt
         zPocC39BAWzAAjC1AtxigcJhglkwIiixy+FrzePp2ktvumcIWRk+mcBGr1Z52xyHRO8v
         zuFQ==
X-Gm-Message-State: AOJu0Yz5FflnD48pywog/9R0weEg8giibBQuFYei1LZNb9Dms1rDDUAp
	5WzMDgsdgStRhU5k0q9+CcU=
X-Google-Smtp-Source: AGHT+IFwCzatobvRkKNdFA9jKAK4k+sIFWNUrVKL+Cjyljt6nHhkBR4eUG7dY1eDoZTEORiete9MAA==
X-Received: by 2002:a81:6582:0:b0:5a8:960d:e538 with SMTP id z124-20020a816582000000b005a8960de538mr3208928ywb.47.1699024275155;
        Fri, 03 Nov 2023 08:11:15 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id dy17-20020a05690c271100b0059b20231f1dsm1000248ywb.121.2023.11.03.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 08:11:14 -0700 (PDT)
Date: Fri, 3 Nov 2023 12:11:08 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1699024272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S26xEcJ6RrMKogkKju8z/wS2kOlw+fpVzbtyMFDLFD4=;
	b=YTdPRB/ZsJrakkluV5VoWO/Bj+7Far6XFikWeoRrpacnT3K9lzKEZANZbkpOSuaIRbThnn
	X3Yso2cw7++DrqGV3jAcka3POwVmnoSY143rtkZXJarRfTwAPWhH8GuV57BRFruEJIAsZL
	MmbsDe13Lw/g2bO24Eq8yihGYoNSWFJLsv/OVSNwAIHKpHEyxAMton35qeNsYC7Xfgf2QO
	GBUS1dtBrP6JDP4spWH9MVNeeGoedADnNqq5LIzpqw90npi2DugmdYLvw+PgEmtXQnY+m5
	QgroGgn8f/EoUUGun2E8SjIXDuao+hWOWSRU7xsxCruHIonPZ5bC9wwkASSjzA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Stefan Wahren <stefan.wahren@i2se.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Phil Elwell <phil@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 0/3] staging: vc04: Smatch analysis fixes
Message-ID: <ag464m3uji63g7y2ycdh64vrr5geufq6g7spjk7x2lj4blsnhj@6h4spnjmvnso>
References: <20231102210603.1201311-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102210603.1201311-1-umang.jain@ideasonboard.com>

On 23/11/02 05:06PM, Umang Jain wrote:
> low-hanging fruits series that solve a few of the warnings exposed by
> smatch analysis. See individual patch for details.
> 
> Umang Jain (3):
>   staging: vc04_services: vchiq_core: Log through struct vchiq_instance
>   staging: vc04_services: Log using pr_err() when vchiq_state is unset
>   staging: vc04_services: bcm2835-camera: Remove redundant null check
> 
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 7 ++-----
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 6 ++----
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 6 +++---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 7 +++----
>  4 files changed, 10 insertions(+), 16 deletions(-)
> 
> 
> base-commit: a4000df5300fdbe10d84e3b70e2d6a98686310a9
> -- 
> 2.41.0
> 

Whole series is

Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>

Thank you,
-	Ricardo

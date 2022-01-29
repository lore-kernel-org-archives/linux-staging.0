Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FE12CA6
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 03:35:14 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id j10so6957713pgc.6
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 19:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xpheXdEDJM6VvCfIU64qNXEiyDxBWjW4KluJVHuQUq8=;
        b=qk0s19Q63d4FCHY6zN3MYD2/RLhB2CtR31+rQUXSro1imnRPKWj9qn1DpvmGx4hZCn
         siQ1TchQPOw6yc/jzjh7F+vMKNWN9lKn1VxOkWB4osIvobPGht+fYITAZgXhQXLjtHwE
         3hpXHGUNSMGWeva0d+Y8DXATmYSdfiaxqv2mZ39x5OSQ6U2n3FLN1ageb0/CW0O331AI
         iritYYNhUWQiYrwNv4Z9rRaZGtVgLY9jJJo4yF64qOmKegu/DcSIqFo5KWwchuNI0RuU
         gtpJWiW8Az9qt6XIt2b8q5724Cic2RKAdF6G0h0uCYmEoGSWXElY9RtqjYFb/W0o+u6S
         WTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xpheXdEDJM6VvCfIU64qNXEiyDxBWjW4KluJVHuQUq8=;
        b=XJCP8onEn+q2cefpGVRFeDSKMdFq83l/2qVDK6zxorvSa2Eq5G4e7J3KBwOXMdgA4d
         vhq1RoYV3X3bRlGbAV3k7EcIiq7YLOa3rLV/Bz+SFGWPUj4fLrB8mY2UzPUNBjF27ICS
         SxeyxM3mEk38wQibXFXW50WKPpnMy0JX/LTMt9QtpiybgDU2SetUGfJZKZJ+MIZsSkMt
         GD/sZX4WWugPiRiwgMyrVEY6u6ydyuooZIzyUIRwaqLemNsEWmemYfTr3mTMOjb2IG/h
         ohaj0N87fZq/phOToUkQo9rtWN8Ga/88B9bpJWJk1EZf7fDjSRp+tvIs/yg6gidc1aj6
         0PWQ==
X-Gm-Message-State: AOAM531amHuuTE4XYhK5MzUZ7Rt6MZeXUtqytnu5bG3AMsX9Tgs98ZMm
	egSZ1cBcGPOV3EbkZdKsc3Q=
X-Google-Smtp-Source: ABdhPJzeKLGw416T+p9clA7uBhbAloo6Y7BlYFBP1/1XY4HpKuYJVe4Ng0C83GcCvAyaFMeYJotKWA==
X-Received: by 2002:aa7:9838:: with SMTP id q24mr11061113pfl.76.1643427314445;
        Fri, 28 Jan 2022 19:35:14 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id s37sm5963592pfg.144.2022.01.28.19.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 19:35:14 -0800 (PST)
Date: Sat, 29 Jan 2022 16:35:09 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: pi433: add debugfs interface
Message-ID: <YfS17W10UTAKn3dc@mail.google.com>
References: <20220124042506.GA7662@mail.google.com>
 <20220124042721.GA8078@mail.google.com>
 <YfE4d4UY1yIVvapC@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YfE4d4UY1yIVvapC@kroah.com>

On Wed, Jan 26, 2022 at 01:03:03PM +0100, Greg KH wrote:
> 
> Breaks the build:
> 
> drivers/staging/pi433/pi433_if.c:1166:25: error: initialization of ‘int (*)(struct inode *, struct file *)’ from incompatible pointer type ‘ssize_t (*)(struct inode *, struct file *)’ {aka ‘long int (*)(struct inode *, struct file *)’} [-Werror=incompatible-pointer-types]
>  1166 |         .open =         pi433_debugfs_regs_open,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~
> 
> 

My apologies, I will be more careful next time. I must have missed
something out on my module-specific makefile. 

I will incorporate the changes that Dan Carpenter suggested and submit a
new version of this patch shortly.

thanks,

Paulo A.

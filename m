Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E864E360
	for <linux-staging@lists.linux.dev>; Tue,  6 Jun 2023 05:26:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f623adec61so57922295e9.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Jun 2023 22:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686029186; x=1688621186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dDsCLYgxw0cAllMIv7aPZnktih/2jRXLUmlxWaBI1IA=;
        b=IwxvokNMCgzhhXOUSzqxqBgRxmi+htg/TlgMk4ZYeM32beHp0ygBO8euxAR0AQm+1o
         c41sqH0a03Ang8oPH4q5RE2TIZ7EzDBicWi5Upqo1LS+VH8cHLDoXkXA27jwp8wo48rf
         eZmiyl/UL9g3tnTKk1UqirKGm7+TsJwBv75CZSJH9zuV9IOtgE6Ar+SpSBJxi9gqZ6mz
         BpNyY5nVfJPTkaELNR9yt+4F16iw3qCLjesDjgrzXMwNg4ryEavCgFDHvFNOiEnpPwU9
         qlbDzpvSAdN661d7mnDQUfmS53+gK8Qv4j+Yvm6y3AX2CWfAiZFODcAcPaKId8yVzZ1t
         9Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686029186; x=1688621186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDsCLYgxw0cAllMIv7aPZnktih/2jRXLUmlxWaBI1IA=;
        b=Fc7v9/Sz/6EI8K16poVCRMAYQg0ht7GD57fH5UCUTWxveXKycw2kGkQXCUXvMo6wfh
         ey0TudmHCsD4Ak9gxgq/onAm5bkBneoXqbs2ELKKyw02bn3Ff9byoqvRrUNS02pM+kWB
         CuGIQ4LR8jT85jU7qKOCcgvLS3AmFopXsVZeHsaPgQKpuBp6mxg/KvYmk+dlC5e0zuL6
         cGfDDkpzHQUU5V9v5bLMApvJO4pLN13bWYD5UJKtf4i8MCbMSj1/+21IDo2GHpfKAWpd
         dM3sby7Y9V/Pzf3fn08mXk5j3/FPVX7zjoaxADxBa5M7oqAHMbsR86mJr+JElMyj8PqX
         MZ+A==
X-Gm-Message-State: AC+VfDzLPYJm0lWvElgFktpWYu5dBdjlEkQgOTKyQvXvlMgdEcuE4aNM
	Bljw/H3EuA5tsDOucQgteG9mQA==
X-Google-Smtp-Source: ACHHUZ7O2HWP67RgSNqCAyjbTAYsyzDWwhj4EAisp0m7UY5KYbL/2OK6vhedUYAPw7jtmm/0lF9awg==
X-Received: by 2002:a7b:cc8e:0:b0:3f6:766:f76f with SMTP id p14-20020a7bcc8e000000b003f60766f76fmr979213wma.36.1686029185900;
        Mon, 05 Jun 2023 22:26:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f18-20020a1cc912000000b003f4e3ed98ffsm12686196wmb.35.2023.06.05.22.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 22:26:23 -0700 (PDT)
Date: Tue, 6 Jun 2023 08:26:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
	jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/30] fbdev/ep93xx-fb: Do not assign to struct
 fb_info.dev
Message-ID: <dbff5ba5-f34f-41d3-b8d5-2bfb7d34df5b@kadam.mountain>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-12-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-12-tzimmermann@suse.de>

On Mon, Jun 05, 2023 at 04:47:53PM +0200, Thomas Zimmermann wrote:
> Do not assing the Linux device to struct fb_info.dev. The call to
> register_framebuffer() initializes the field to the fbdev device.
> Drivers should not override its value.
> 
> Fixes a bug where the driver incorrectly decreases the hardware
> device's reference counter and leaks the fbdev device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Fixes: 88017bda96a5 ("ep93xx video driver")

regards,
dan carpenter


Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32955CB0
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 10:40:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f61b45ee0dso6540729e87.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652820; x=1689244820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdczPZ7i6NweZc4Vs1GEhNBw4P6SDuu4rOPlRce3Cp8=;
        b=AUbPJ07Z1odDHtCnZ823RkphdvcZ3F/p41LyifJZBZRycWLx87uEthbAheLUd9d4fw
         QvGkzgij5648YDEodj6ptRqC3+VUPZMSTPRxfifNBvFk5k/G8mO9kSrJUgsPUDjdDQf2
         kTU3N5IYasoX9y19jal1hK3/EAY3Gdp4ouqToLfnrCAWts9kY7jbGAedRlMQMqFpKqCy
         eb1lJENWNoO1+j3VwToC/V/8Akbn4QHdPdYSHoF7cFV/ajJMbhAiqrkPreFsPsLO2TV4
         MDumvPKSRlKZUoPI2Otf7G3PXB8R+eOO8N757C70cMrALim/UT87sS73D5gj3sewQNnL
         sDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652820; x=1689244820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdczPZ7i6NweZc4Vs1GEhNBw4P6SDuu4rOPlRce3Cp8=;
        b=JFK3SlzEJlV/0To9hzbwCW8CYYyJYks1Z289PVdntY2nGbOI/hFtTPdhyXTETs56J4
         7we9Xc5c1kiOPon5/tuyDLH+ZiqHsyl4B/alqTf1KTOanBBjNYd6IrzqOWqNnzVK3I/F
         JkuyKRzcTB/8nZp5jGROXd1YO+ESZLGodyMa9T6BcxFoQwy32GLx/n/m6TEPfBSUGAVg
         AOAWX5rGl/Tyb9J483xZCdSC7NUWja32phpe7edt/T/0nlcpf5vygh12Q9klB/Sg5vTy
         t4TVpKA8cX3qQymBfXM3WL/MpRpsvtU71XjGxrGAN/i9+8oBCQzqkPho6alx9NPZMwiA
         TxFA==
X-Gm-Message-State: AC+VfDziXC55gQqZIjDsYcEWnYB7sSacmFcxkCPnFzbJOdDw5ppR+fts
	0amMYf/Fee8M3TAHM7hWMqxnjw==
X-Google-Smtp-Source: ACHHUZ4WVznCWcsmGLMHRuA7VS6Lfj4mur40fa3EhFHuVyQQIFEL0bzMUHobk+R5es5R/aHSdgmKUw==
X-Received: by 2002:a19:6402:0:b0:4f6:2cd8:5ff4 with SMTP id y2-20020a196402000000b004f62cd85ff4mr5562119lfb.2.1686652820609;
        Tue, 13 Jun 2023 03:40:20 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id m7-20020a056000008700b0030fa166d8a1sm12458137wrx.34.2023.06.13.03.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:40:20 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:40:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, lee@kernel.org, jingoohan1@gmail.com,
	dan.carpenter@linaro.org, michael.j.ruhl@intel.com,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 06/38] backlight/lv5207lp: Rename struct
 lv5207lp_platform_data.fbdev to 'dev'
Message-ID: <20230613104018.GF169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-7-tzimmermann@suse.de>

On Mon, Jun 12, 2023 at 04:07:44PM +0200, Thomas Zimmermann wrote:
> Rename struct lv5207lp_platform_data.fbdev to 'dev', as it stores a
> pointer to the Linux platform device; not the fbdev device. Makes
> the code easier to understand.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

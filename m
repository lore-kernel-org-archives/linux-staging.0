Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B133CE
	for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 20:56:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k126-20020a1ca184000000b003943fd07180so6081781wme.3
        for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 13:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JXAlvtqqW6tfWflMXAoMdK3ghKA1sIU+pzaSVEJLAmE=;
        b=7YZUaGRBM2D6w5PSxPK+8AGXtQOmH0OOGAxLMRkZ34PDC26aBd6KUnTgaF8pCpgEML
         uuNCtAv7lIHMnHch5/EVcM9nWsUaqD/JWVfOhT9bw47ONAQ3RF3OHrW/rymoX/KWwAXl
         0WBpOyql/vf4q7QBUyUE9BoCfwJwrGqSUyvJ1lNklD8xdbSBqTAWMP+fLySoetn5Ixxo
         ntwUfizpGU4V5haYxQGf0zxeLL2OBsktEm9CagdWR52b4yNxVKlRN190w0bX/bJpxzDM
         WwngLGgL318HCtcvviKBkTv2Xm2nWTtVgkyFgwPdS2KBjSVziT6u29wAtoUw+IAF7lpf
         XHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JXAlvtqqW6tfWflMXAoMdK3ghKA1sIU+pzaSVEJLAmE=;
        b=qfkuRN7o0Jbw4dJ/IS6bFjug1Y+a22LH0ROJqoj1uQD6Jq5uFe5muBWPGKa6AQZpNL
         deuMYYMI3FQdY39s5WzTSKfWsbpnyBbvEzN4Wgfz9mtvW58iQx+lu/tbd5nGPCypW3sO
         Sc7uUKVYwIbd3t7S/Zv7LwTnKzeT29NIfRwvtdhYt9atJ3NMpwZbIE8m8gBubehW+UAq
         vFE+ZyqejwB+pert51tTbq5GVAO6+4X53HR9qGaiyFG5SSm+LTMpQpWGkuhJ+M8J9hLq
         y0DZLMXzcY8f5muKz/Rm//5IYThz9PSGCVcLANLVIl2fip8y8+hD05hadeVVDKZqzOUF
         FZEg==
X-Gm-Message-State: AOAM533EzITnysCya0tBrbnL7Dw81VmwbasS8ACgzRc5ALlI1sGz0rhi
	xbw/vWn5DDxlYQZACQwviRbS9w==
X-Google-Smtp-Source: ABdhPJwn4p5tuLjJ5faKGoRXTKmKV9Q5uXCJJuKbncS7PnIH8x5TWbFDZfn4WmxepzG1jlVsvAcUvg==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id l1-20020a7bc341000000b0037bc619c9f4mr14140840wmj.38.1653166614153;
        Sat, 21 May 2022 13:56:54 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id n1-20020a1c2701000000b003942a244ec5sm5367747wmn.10.2022.05.21.13.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:56:53 -0700 (PDT)
Date: Sat, 21 May 2022 21:56:51 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Martin Kaiser <lists@kaiser.cx>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, gregkh@linuxfoundation.org,
	straube.linux@gmail.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: r8188eu: add check for kzalloc
Message-ID: <YolRut+PJ68J9mcM@KernelVM>
References: <20220518075957.514603-1-jiasheng@iscas.ac.cn>
 <20220521155017.7jjz7prdnspm2276@viti.kaiser.cx>
 <8fb49b5b-106b-3346-a75d-d54e0a065587@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fb49b5b-106b-3346-a75d-d54e0a065587@gmail.com>

On Sat, May 21, 2022 at 11:26:55PM +0300, Pavel Skripkin wrote:
> Hi Martin,
> 
> On 5/21/22 18:50, Martin Kaiser wrote:
> > 
> > >  	for (i = 0; i < 4; i++)
> > > @@ -1474,7 +1479,7 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
> > 
> > 
> > res is still 0 here - but the caller of _rtw_init_xmit_priv compares
> > this return value with _SUCCESS (1) or _FAIL (0) and interprets it as
> > _FAIL.
> > 
> 
> I think, it's time to make
> 
> s/_SUCCESS/0/
> s/_FAIL/-1
> 
> since developers from outside of staging are confused.
> The main problem will be with functions that return an int (or s32).
> 
> Will take a look.
> 
> 
> 
> With regards,
> Pavel Skripkin

Hi Pavel,

I agree with you totally - we should change these semantics to reflect
how the rest of the kernel generally does things. That said, that is a
bigger patch set and I noticed the driver was broken before I read this
thread, so I've submitted a patch already just to fix the breakage for
now.

Changing these semantics is a bigger patch/patchset and I wanted to get
this out in the meantime - if you are looking at doing this conversion I
will by all means leave that alone as no desire to tread on anyones
toes :-)

Regards,
Phil

Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0123270
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 07:28:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r12so20003654wrp.1
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 00:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lL/T9tKkLDZBnEdhk0ozmZWsOYDWqY6ffZ6HvfWIgbs=;
        b=Ceoyn7ldDAayDOl1FwPj5Ot9iRdkTEJqV8rEJMhbhQlBWqJJH2rn/24Pa1aMd0f5pY
         n+rGYbZCiOY3ZWSqVCkDBawKH/X1Bq8BAhpo3uEguIrtx1YIDv3fLJwQ4A3FtB6OhecJ
         DutqaYiyIWBrUspDN5l9sC/YgsEFmgrHzVEJP0EJEKC/B/kn9gyyr4WEK7RsDWKMwGDA
         0NypC8LmFJyGsF56/ncixXZ3+0pX8fiEfEI2VCdnJLj1MHdE3g+fwjJk1RPDZE9G+fzR
         U1a2gmyplkW9T9fJm4FHBUkdzPl8cnR3MEU2tmEluRZUvVrYRNsm1FgvkVgddfeIO3kn
         nVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lL/T9tKkLDZBnEdhk0ozmZWsOYDWqY6ffZ6HvfWIgbs=;
        b=qt1az3xo7IdvX8Gj2lfxuMdREyhawt/j4okHYNUql9ft9r+tUrj5em4WFQ31Rw+jLe
         EEinBTxwNVJvi/jXgxQjHlT/qHHNlq8JHxby1mg+SK/MCyPuzO4UjWtuGrXxgzRcHRmp
         4deMC50yMfiAkdYtYKfd9D7atSyg7cPEjFUx6oa0XZzf17Ok1gnmUPH1908eOwu9EH8N
         qwTLPbSWnXle6GFcgBin/Gqs0A1SWxHff0K65glcBw4fyZ7aW4mldoY5gAeYxSyUK0NU
         2HesDbCHe28Bpz/zLuqWtIyWWYsS/iw1olIR5fXIbA3/QKli/3gvNTHeThO4fh4KwoLC
         POfg==
X-Gm-Message-State: AOAM530miSo+Jtyuhtcg84yR/96PK6p2oWA2jTstF+dvm7XLsK/JN5KH
	hhovQcOoneATJwEWhBFFVe+mZy/b9HquFp2a
X-Google-Smtp-Source: ABdhPJza8l4RoojyAAr5ExFIr6FWcZiqqC3dKLk0ENmThHCjYt8xkFtyjBxsGEsyHmBGn/V14j1kgw==
X-Received: by 2002:a5d:6701:: with SMTP id o1mr8258946wru.390.1621582126616;
        Fri, 21 May 2021 00:28:46 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id e20sm11488349wme.26.2021.05.21.00.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 00:28:46 -0700 (PDT)
Date: Fri, 21 May 2021 08:28:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Anders Blomdell <anders.blomdell@control.lth.se>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/6] comedi: drivers: jr3_pci: Remove set but unused
 variable 'min_full_scale'
Message-ID: <20210521072844.GZ2549456@dell>
References: <20210520122538.3470259-1-lee.jones@linaro.org>
 <20210520122538.3470259-3-lee.jones@linaro.org>
 <9d0ac108-7256-be1a-fdd9-f48f52aaa38e@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d0ac108-7256-be1a-fdd9-f48f52aaa38e@mev.co.uk>

On Thu, 20 May 2021, Ian Abbott wrote:

> On 20/05/2021 13:25, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >   drivers/staging/comedi/drivers/jr3_pci.c: In function ‘jr3_pci_poll_subdevice’:
> >   drivers/staging/comedi/drivers/jr3_pci.c:507:22: warning: variable ‘min_full_scale’ set but not used [-Wunused-but-set-variable]
> > 
> > Cc: Ian Abbott <abbotti@mev.co.uk>
> > Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
> > Cc: Anders Blomdell <anders.blomdell@control.lth.se>
> > Cc: linux-staging@lists.linux.dev
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >   drivers/comedi/drivers/jr3_pci.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Actually, that one is stale now (or will be when Greg's staging-next branch
> gets merged into linux-next soon):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-next&id=b9f38e913a926b455e5048a95f53a993b515509f
> 
> | staging: comedi: Remove unused variable ‘min_full_scale’ and function
> 'get_min_full_scales'
> |
> | The variable ‘min_full_scale’ and function 'get_min_full_scales' are
> | not used, So delete them.
> 

No worries, if it's fixed, it's fixed.

Could you please take the patches that you are happy with.

I'll rework or drop the remainder, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1B06D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 09:52:53 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id f8so27271951edd.11
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 02:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jqk85jcp1CgJeODOUcztiz6h1RU5+xOxDLRjfSfhkOA=;
        b=Uc+nG8spCoPVY15XaL+6cF2AqftQ74Ym6tZcb+zNAp9y0LPcEOb2vHyFESETHdoASf
         h8w5tELp6L4a5truv4RxGQnLAMNPki5oun3jvdjeG21T8/tKZRBNlByWh6TAuGLnd85/
         w59HJ572Gb7oiYUYnTn6ViTtn7kh6Dop64KJY0nJ4vt5t1/gG5WDt9Fd6Bw1mgFvqNJz
         nUvBjqvVU/MiH6EtTUT8GvcdbUxAPftOFGq75hqY1mp+UhJR/NviftUwKdthjI7S939l
         N9ZMOOceLLjgYpBptVUmJ0YhvZHNLSIJeGPlL+jETS0gBXO8hfeJi5n76AyknW4nCy8Q
         3qtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jqk85jcp1CgJeODOUcztiz6h1RU5+xOxDLRjfSfhkOA=;
        b=QfvBpLLC2EhmLQk2HNrPFYxq5RuiJ7ApeuRKLcVGOFfMxVUQiWfJflZtPYNPvRYnAc
         Mcju8/64mGUfWmzr2d6+UekONPrr+Vx0FDuhSi7ioytApB61yaJweKUPPBh0+kFO14ku
         37jlk4sSSQwaxyyQFOpEG6xCV8eFGfWv9krfYmnT6+i4XLQykCKAUjNvUUYHeUFKImKZ
         lbNjDg1+l9BDpOSgK2gskHEQQ9N27tHXAfA+bLk9SA4XnSQmmlwEMRSo1v+yYG5M+rPu
         MFNx39kN1vzbyzh3RwH2hlAPgYr/h1Csspys9b7wvC+ITArMmzAoS7dpJctx8XbAfsDX
         DkOw==
X-Gm-Message-State: AOAM532k03T1H7HnsohS7Gtv40ngTMJS+pVCyy9Ndzyh0C+Qblht/eor
	hhzbnMYtxBRviKzlujUbb+NDtw==
X-Google-Smtp-Source: ABdhPJzMheoKxuIQgjFPHqkXkWDzlviec56G0OscLsDaNGS3wOE2qrJj6tmNFKXrXXotnYFJf6Y1cQ==
X-Received: by 2002:aa7:c247:: with SMTP id y7mr3136820edo.305.1618480371653;
        Thu, 15 Apr 2021 02:52:51 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id i10sm2000122edt.3.2021.04.15.02.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:52:51 -0700 (PDT)
Date: Thu, 15 Apr 2021 10:52:49 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Ian Abbott <abbotti@mev.co.uk>
Cc: linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Anders Blomdell <anders.blomdell@control.lth.se>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 48/57] staging: comedi: drivers: jr3_pci: Remove set but
 unused variable 'min_full_scale'
Message-ID: <20210415095249.GW4869@dell>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210414181129.1628598-49-lee.jones@linaro.org>
 <9ccd6fe2-91ce-3a0d-d652-567ecf6b8b0a@mev.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ccd6fe2-91ce-3a0d-d652-567ecf6b8b0a@mev.co.uk>

On Thu, 15 Apr 2021, Ian Abbott wrote:

> On 14/04/2021 19:11, Lee Jones wrote:
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
> >   drivers/staging/comedi/drivers/jr3_pci.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/comedi/drivers/jr3_pci.c b/drivers/staging/comedi/drivers/jr3_pci.c
> > index 7a02c4fa3cda8..afa2f8d5c8c0c 100644
> > --- a/drivers/staging/comedi/drivers/jr3_pci.c
> > +++ b/drivers/staging/comedi/drivers/jr3_pci.c
> > @@ -504,10 +504,9 @@ jr3_pci_poll_subdevice(struct comedi_subdevice *s)
> >   			result = poll_delay_min_max(20, 100);
> >   		} else {
> >   			/* Set full scale */
> > -			struct six_axis_t min_full_scale;
> >   			struct six_axis_t max_full_scale;
> > -			min_full_scale = get_min_full_scales(sensor);
> > +			get_min_full_scales(sensor);
> >   			max_full_scale = get_max_full_scales(sensor);
> >   			set_full_scales(sensor, max_full_scale);
> > 
> 
> get_min_full_scales() could be removed altogether.  It was only being called
> originally so the driver could printk the values, but those printks have
> since been removed.

Even better.  Thanks Ian.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

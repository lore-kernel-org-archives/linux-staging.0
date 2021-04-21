Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5522F9B
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 07:22:21 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id j7so11187625eds.8
        for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N9Lu+2EkyPc97u3JeBNOPqYRH3WJQAnr+EGGrDKay8E=;
        b=LzfoePVob4Bl1Emm/wtoROFlrI0nj71/IeNXz/DLjHWOBMx6EPuz5L4P7yaSiaVMQX
         WgNcjSmK9m65HFTKwNoCrqtK3sQz+f2PrBGUIcF/SoTmEFMDmwpD1C1nm6WpwLx4ZF+f
         qGx/z2efX4mC12XzvJufdpo7oiqOtsz3zjnTVdmb/zEMj3BydWNQfoZuW7cdUWKaQWFg
         nawYky0ruz1u8sbHymhhDI8wu0IZpdKhGa7sKZ0WXR0yCeQP3QCqjmsHZWYOaOZtjUCu
         GQEnGwmQOCamvys5/TpUh9wpOm1yY4Rst0MS6CrxLoCinPSYUVPw4xUOL7w2rHi91Izj
         d8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N9Lu+2EkyPc97u3JeBNOPqYRH3WJQAnr+EGGrDKay8E=;
        b=tnHteBUHztXkVjFd5MpjayaqkwScZSn9pUwHupaO8wMT8yvKlSX0yxwKq/Hqvs8Wur
         XehslrSENZxv1BBEOz6fnV7+y3ZvZk3XYvAszfj7an2T61yDu8jOLmHUb9gbzccef1Vj
         Pn/tFkx263fpvgUKIrLyQKTo8mYPZGPzNahs/qsWR60xG00PrLot6V4nlLKfTccsK+c3
         0uZhdhI8iMnTZt1ks7Bfe6vccnspNWIAmUI/PBxDCUKffytGkmF3BMhsXCRO18R3AAeX
         ecczSW6BlBNy+NQbcnh9MN1YEKtt6rFg9WTfdEPa9W93FGSTC4XEts7ux79ABkEsn+Jo
         BUaQ==
X-Gm-Message-State: AOAM532NeAXTQibcE96Wg66NdXo14AsOYYCvCPp1Te9PIPgc9eCHqlGi
	GJWgV1t/m8R6GFzT22m65To=
X-Google-Smtp-Source: ABdhPJzHn6OUCv5g7dvApzrkAjmKrENzNxDgZkdOlTiceuQITIcNEsH57QsZojBKRuoi+wxrOj+DQg==
X-Received: by 2002:a05:6402:19a:: with SMTP id r26mr36512414edv.44.1618989740204;
        Wed, 21 Apr 2021 00:22:20 -0700 (PDT)
Received: from agape.jhs ([5.171.81.65])
        by smtp.gmail.com with ESMTPSA id l3sm2028913edr.2.2021.04.21.00.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:22:19 -0700 (PDT)
Date: Wed, 21 Apr 2021 09:22:17 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Deepak R Varma <mh12gx2825@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: media: atomisp: use printk with KERN
 facility level
Message-ID: <20210421072216.GB1418@agape.jhs>
References: <cover.1618859059.git.drv@mailo.com>
 <4947abeebc2cecca43137675519a2fb48577d3e5.1618859059.git.drv@mailo.com>
 <20210420083522.GA1411@agape.jhs>
 <20210420171353.GA193332@localhost>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420171353.GA193332@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 20, 2021 at 10:43:53PM +0530, Deepak R Varma wrote:
> On Tue, Apr 20, 2021 at 10:35:23AM +0200, Fabio Aiuto wrote:
> > Hi Deepak,
> > 
> > On Tue, Apr 20, 2021 at 12:46:40AM +0530, Deepak R Varma wrote:
> > > printk() without KERN_<LEVEL> facility is flagged by checkpatch as a
> > > warning. It is better to use pr_info() which comes with an
> > > inbuilt KERN_INFO level.
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > index b572551f1a0d..a0f3c5c32f94 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > > @@ -1020,7 +1020,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > -	printk("%s: before gc0310_write_reg_array %s\n", __func__,
> > > +	pr_info("%s: before gc0310_write_reg_array %s\n", __func__,
> > >  	       gc0310_res[dev->fmt_idx].desc);
> > 
> > in a driver is best recommended to replace a raw printk call
> > with a dev_*() log. Check few lines above here to see
> > how it is done.
> 
> Hello Fabio,
> thank you for the feedback. Should I resubmit this patch with additional
> printk() / pr_info() replacement by dev_*()? OR send in a new patch with
> this change? Just want to make sure I am not including more than one
> change type in the patch.
> 
> deepak.
> 

Hi Deepak,

what I would do is to just resend this patch with replacement by dev_*(),
which is just one change. Then if you want to replace all other
raw printk/pr_*() occurrences is matter of another separate
patch/series.

> > 
> > 
> > >  	ret = startup(sd);
> > >  	if (ret) {
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > 
> > 
> > thank you,
> > 
> > fabio

thank you,

fabio

Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797B19F
	for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 17:17:32 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id u35so10004593qtc.13
        for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=74iO+k+sU+IlzNDs66QrJFNFWlpeGF1yqzPnmcyjvug=;
        b=IPhtJwQmg55AQ5MR3CMDAvg0X/FBkZk0NlrudtKCYsGrUebzd1wvxucMqzhUcA78ZP
         /VMSvU1UhJL4KchU6QDD0kSHiQARx6GEl6z1qiH2T+3rsx2yDAusXMdgeU1DXqhsfkQq
         h7fCGA+QxQyquYRyOtl877z8vWQHlMdGiJBTw0DvL8rZjuupASwiwq8rv/RVBOXiA9FF
         jAGmGYfTuHa4e3oFv863P1r2CUa5TnnJPTgRfd3LFwcsU6Ef+pCeyxGfyklWumRmbTjQ
         gBYv0zqYbrEr+GuRm8JL/qGjJ3tWPgXHmqdCmb6OuzoMSaddrSwijuE4xx45ibfw15ts
         AEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=74iO+k+sU+IlzNDs66QrJFNFWlpeGF1yqzPnmcyjvug=;
        b=TwcG7TZZBu+SBU35sAbuKTL4l72PKDt0hlAlmJpvacLHxGuGbJgmeFew4KKIDz+/hh
         dNRhdl3qoGj/QES4yNPnCTJtUIDtXLxjnjzModKU09qjLUnzPXyGZlCijjOCqkFaceyX
         C2xFR3gpvHTcW/aqXuKQOp5/+pfpxjytiUhQVZlow5nf5N+AYcQBkpXKRiNWHOf2v3Kc
         x7A3aNFZnGHt15qmZ2DjjrCjm7+iCYmDBbhc29EipUGaKDIDSuSQslAHmNz/u4GWh0dR
         lYx62+F+OVmfrGusdOMvCRtCJ2ANCDm2wMPpBL6mxyTdrvOmE0C1n4nMNdvMFGWDOpq8
         gtAQ==
X-Gm-Message-State: AOAM53025P1RN+yairZjNvK9sbd2InCseCkLZFHblvmRgjh88hhYCmQl
	I4zzp7mfNAtnkzzP0Fzcg/U=
X-Google-Smtp-Source: ABdhPJzu5VPLWE4gUydCnutp3VfDrZj4RVAyEI6T/ckAbtcD9w2Uln7AVuEtHBzYknrd7GMoqCL7ig==
X-Received: by 2002:a05:622a:1214:b0:2f3:c1a4:231c with SMTP id y20-20020a05622a121400b002f3c1a4231cmr11635501qtx.72.1653153451677;
        Sat, 21 May 2022 10:17:31 -0700 (PDT)
Received: from Sassy (bras-base-oshwon9563w-grc-26-142-113-132-114.dsl.bell.ca. [142.113.132.114])
        by smtp.gmail.com with ESMTPSA id v13-20020a05622a144d00b002f92b74ba99sm218706qtx.13.2022.05.21.10.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 10:17:31 -0700 (PDT)
Date: Sat, 21 May 2022 13:17:29 -0400
From: Srivathsan Sivakumar <sri.skumar05@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rts5208: spi.c: clean up dynamic debug code
Message-ID: <YokeqRl/N2m9Nui7@Sassy>
References: <Yojg1nXXTIL3G82l@Sassy>
 <YojnC+kQXcxTMrua@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YojnC+kQXcxTMrua@kroah.com>

On Sat, May 21, 2022 at 03:20:11PM +0200, Greg Kroah-Hartman wrote:
> On Sat, May 21, 2022 at 08:53:42AM -0400, Srivathsan Sivakumar wrote:
> > I've condensed the three dev_dbg() lines into one as you requested in the
> > previous patch thread; and sent them all as a singular patch.
> 
> This does not need to be in a changelog text.
> 
> > fix the following checkpatch.pl warning:
> > WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> > 
> > Signed-off-by: Srivathsan Sivakumar <sri.skumar05@gmail.com>
> > 
> > Changes in v2:
> >         - Condense three dev_dbg() code lines into one
> > ---
> 
> The --- line needs to be right below the signed-off-by line as that is
> where git will cut the changelog at.  You don't want the changelog in
> the commit.
> 
> >  drivers/staging/rts5208/spi.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/rts5208/spi.c b/drivers/staging/rts5208/spi.c
> > index f1e9e80044ed..ea736a73e58c 100644
> > --- a/drivers/staging/rts5208/spi.c
> > +++ b/drivers/staging/rts5208/spi.c
> > @@ -460,10 +460,7 @@ int spi_set_parameter(struct scsi_cmnd *srb, struct rtsx_chip *chip)
> >  	spi->clk_div = ((u16)(srb->cmnd[4]) << 8) | srb->cmnd[5];
> >  	spi->write_en = srb->cmnd[6];
> >  
> > -	dev_dbg(rtsx_dev(chip), "%s: ", __func__);
> > -	dev_dbg(rtsx_dev(chip), "spi_clock = %d, ", spi->spi_clock);
> > -	dev_dbg(rtsx_dev(chip), "clk_div = %d, ", spi->clk_div);
> > -	dev_dbg(rtsx_dev(chip), "write_en = %d\n", spi->write_en);
> > +	dev_dbg(rtsx_dev(chip), "spi_clock = %d, clk_div = %d, write_en = %d\n ",                               spi->spi_clock, spi->clk_div, spi->write_en);
> 
> You might want to verify that you really meant to put that many spaces
> in this line :(
> 
> thanks,
> 
> greg k-h

Apologies for the errors, I'll make sure to follow the guidelines more
strictly.

I'll implement your remarks and resend the patch soon.

Thanks, 

Sri

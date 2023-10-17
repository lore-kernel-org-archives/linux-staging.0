Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF743A9A
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB5xSr0H"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5ad5178d1bfso2909804a12.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697552096; x=1698156896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYKaXFgMh27zA77Sv57kQ1nHe4k54A3JXG9co3ghebM=;
        b=UB5xSr0HjhCPQVExMD/Cy+cXRWONjEbO7IYjm/Ky/5q0eillNndlQmoCU4Z/HW7Tt8
         74Vlnf2Z0d01x1z7eTUAqgimqX5t7+jm8HCvFvZRSnPt5lXdAlViVPMFgT1ie76XWGzP
         uWcvw0gnzp8dGXfGuE66NFEzQfJmU+JNnjfXH9m8ZptU+9F27ALnzbxUH0BNjYzYbrhM
         cOWYNsb2JSvXlYA+VT/42NFQIWXVY772/eJUJD/3vwkZWMrr1MQ4PErBQ29mMB3Rq7Np
         V9Dsvvv/vhPGUAvk/uKSJG1W2F/XB7qi1V88nw9Q1dcaHMM3TOPOg1ivnYpaq71Mhekr
         p8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697552096; x=1698156896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYKaXFgMh27zA77Sv57kQ1nHe4k54A3JXG9co3ghebM=;
        b=BS2eg3swrGlcmhJNb+zns8JZe7Ltgjk9V4gxTlbjkAAFg5kySOar3shiKiXxq7zaME
         2xTWxXj0YEbv6tQpxA16ylhSNFwU9PhVlheuwp8pSZtEHpX+c2hf6bFIkLV/NJ5HFxvZ
         XlfzSh6coVfs79poVuv1hg7VEgTNbvY7U6XJ+xa/dX/m71HUYeyyIXqMD/ugSIsESz9h
         pIQx8h3RO/j0/oKQylR3QS/PEDDAPqni1MjFPejgx5THI74j0et8RVZtyOARBupQ+3xM
         DVFinwp695Be6qFjjkMjZ5yo4MQ/QMmDISWHTmRtIpaUqAIKWS/rGauXwRBR+VlzAbYV
         TnDw==
X-Gm-Message-State: AOJu0YxnobJgihfiCFNkRE+EOPT9ohbm0ZA8M+MvkeLNM34zQMa5fg4D
	0Xqm3aIMWlzkUveKDBEV2yI=
X-Google-Smtp-Source: AGHT+IFTh+i5lRJT5UHhn0MJgDRAKM0QS/BrTLXJflKkvMML7uQTuYYeZ0C0+ZeJfYM4S56pLwKeXA==
X-Received: by 2002:a05:6a20:4429:b0:17a:4890:fa31 with SMTP id ce41-20020a056a20442900b0017a4890fa31mr2598983pzb.56.1697552095737;
        Tue, 17 Oct 2023 07:14:55 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001c1f4edfb9csm1592789plb.173.2023.10.17.07.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 07:14:55 -0700 (PDT)
Date: Tue, 17 Oct 2023 07:14:51 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <20231017141451.GB3156@ubuntu>
References: <20231016201154.GA14625@ubuntu>
 <433b9d45-bb21-49eb-8062-c03bcffa90ff@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433b9d45-bb21-49eb-8062-c03bcffa90ff@kadam.mountain>

On Tue, Oct 17, 2023 at 07:02:33AM +0300, Dan Carpenter wrote:
> On Mon, Oct 16, 2023 at 01:11:54PM -0700, Nandha Kumar Singaram wrote:
> > Adhere to linux coding style. Reported by checkpatch.pl:
> > CHECK: Prefer using the BIT macro
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> > ---
> >  drivers/staging/rts5208/rtsx_card.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rts5208/rtsx_card.h b/drivers/staging/rts5208/rtsx_card.h
> > index 39727371cd7a..9d2504fddb13 100644
> > --- a/drivers/staging/rts5208/rtsx_card.h
> > +++ b/drivers/staging/rts5208/rtsx_card.h
> > @@ -338,7 +338,7 @@
> >  #define DMA_DIR_FROM_CARD		0x02
> >  #define DMA_EN				0x01
> >  #define DMA_128				(0 << 4)
> > -#define DMA_256				(1 << 4)
> > +#define DMA_256				BIT(4)
> >  #define DMA_512				(2 << 4)
> 
> No.  :P.  Look at the lines around it.  Now it's the odd duckling.
> 
> >  #define DMA_1024			(3 << 4)
> >  #define DMA_PACK_SIZE_MASK		0x30
> > @@ -542,7 +542,7 @@
> >  
> >  #define BLINK_EN			0x08
> >  #define LED_GPIO0			(0 << 4)
> > -#define LED_GPIO1			(1 << 4)
> > +#define LED_GPIO1			BIT(4)
> >  #define LED_GPIO2			(2 << 4)
> > 
> 
> Same.
> 
> regards,
> dan carpenter
>

Yeah, I understand now. Thanks for the review dan.

Regards,
Nandha Kumar Singaram

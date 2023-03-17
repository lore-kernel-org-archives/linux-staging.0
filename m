Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4098B7F1;
	Fri, 17 Mar 2023 07:14:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id p20so4394872plw.13;
        Fri, 17 Mar 2023 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679037241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vRnYDcnKGtoBZkuiq/lt8z18fHea+PPaGqCtFysWiDM=;
        b=Nu7S65ypJG2PIfGNW0iHhiUGstx6Bvqkj4/u3/WGGd+wT60t6X66xPg1wP3DZfo9pW
         0h5NptbuVJITIdJHK81E9YPL7ZAmmYhrmdsdAs32GwDtfRNqwt13CTTDGfNfbNuj3SPo
         R/TrpXgmbu50h6jZGAKOFDwefacpNgCbEl1LvP2MKcm5iGpFxWQuxvt3k8DZJ3AHXA8h
         bFmVZMWlaxrqI/0XbNAlj5Dz/6XixjSqu8VVw9Aq4aYpgwbkCO0h7usP8DcPulRIjPXL
         3w/pu4McmQ8dZdbZMk6yAw6D/NOlxvsYUI30nvA5wf6mhALvau3IosRdyHtWHgz5vf/s
         EdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679037241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRnYDcnKGtoBZkuiq/lt8z18fHea+PPaGqCtFysWiDM=;
        b=u+ET7E2GWXa7pMSdjW2vBu0ZhFlCI8U92Lj4WQ66uxArgFwW3uOUXwgdmTbvg3ks1x
         uhfsVaE9w3Ep8hkJkA5umu9wjgGhR3xG7oE5eWFdllZU2f5H3u1ItxJYdk/lQERpWZar
         xO9ioabmEfq5cn/uYihxAIcQY4YNiFtUa3+/dNI6k2EXmUlCp7rJ4h2DnNIOpf1kaQYg
         Z53mo5k9hq/Vaxn4PYsKQ+Sqj4QBjHi//WTrWOtogZOnPH/SvU0Xo/AclWnUq23E+hGd
         7bRl2P/kd9TZfeycP/0/sLsjjU6RaW0ZG0k7SA9qBA1NDu+HPSTQ/17vFiqC++4QsWxT
         EkUg==
X-Gm-Message-State: AO0yUKVYuDp6J9thvggaBIvFe9k1x/AggU6XtAPCyTGwBEufaYfzOzkw
	LHJtq1OdFo/MWQ04YdOWojg=
X-Google-Smtp-Source: AK7set/bVwRCYhq47jmjk2ofdd77sALIsCyt/iRjdk71zK5ugzcRKSKf5IKBF9BprY4TafrIYOiQ2g==
X-Received: by 2002:a05:6a20:7351:b0:b8:a0e1:2739 with SMTP id v17-20020a056a20735100b000b8a0e12739mr7859667pzc.3.1679037241480;
        Fri, 17 Mar 2023 00:14:01 -0700 (PDT)
Received: from sumitra.com ([14.139.226.12])
        by smtp.gmail.com with ESMTPSA id p18-20020a62ab12000000b005a8f1d76d46sm864281pff.13.2023.03.17.00.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 00:14:00 -0700 (PDT)
Date: Fri, 17 Mar 2023 00:13:52 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: drv@mailo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] Staging: octeon: Fix line ending with '('
Message-ID: <20230317071352.GA83845@sumitra.com>
References: <20230317052455.GA83442@sumitra.com>
 <alpine.DEB.2.22.394.2303170700270.3105@hadrien>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2303170700270.3105@hadrien>

On Fri, Mar 17, 2023 at 07:03:08AM +0100, Julia Lawall wrote:
> 
> 
> On Thu, 16 Mar 2023, Sumitra Sharma wrote:
> 
> > Since the coding style limited the code to 80 columns per line which caused
> > splitting the function header into two lines resulted in the first line
> > ending with a '('. This caused the checkpatch error.
> 
> The first sentence is still not really grammatical.  Something like:
> 
> The coding style used to limit lines to 80 characters, which led to
> splitting this function header into multiple lines, and ending thie first
> line with a (.
> 
> For checkpatch, is it an error or a warning?
>

HI julia, 

Yes, you are correct, I did the mistake its not the error but a check. 

How about this...

###
The coding style used to limit lines to 80 characters, which led to splitting 
this function header into multiple lines and ending the first line with a '('. 
This split causes a check reported by the checkpatch.

Place the function parameters immediately after '(' in a single line to
align the function header.
###


Thank you for your reviews.

Regards, 
Sumitra

> julia
> 
> >
> > Place the function parameters immediately after '(' in a single
> > line to align the function header.
> >
> > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > ---
> > v2: Change patch subject and description
> >
> > v3: Change patch description, noted by Deepak R Varma
> > <drv@mailo.com>
> >
> > v4: Correct grammartical mistakes, noted by Julia Lawall
> > <julia.lawall@inria.fr>
> >
> >
> >
> >  drivers/staging/octeon/octeon-stubs.h | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> > index 7a02e59e283f..3e7b92cd2e35 100644
> > --- a/drivers/staging/octeon/octeon-stubs.h
> > +++ b/drivers/staging/octeon/octeon-stubs.h
> > @@ -1372,9 +1372,7 @@ static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
> >  						  int32_t value)
> >  { }
> >
> > -static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(
> > -	int interface,
> > -	int port)
> > +static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interface, int port)
> >  {
> >  	union cvmx_gmxx_rxx_rx_inbnd r;
> >
> > --
> > 2.25.1
> >
> >
> >

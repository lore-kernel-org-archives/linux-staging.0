Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB818D527
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 15:21:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h9so16784128wrt.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Nov 2022 07:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmMmv/oTSzrJmF1VX/DLHOeAhM5SZu/ZlDvV6Xk6vkU=;
        b=ojHMw/lKyqAMPjzaeD2oKHAQt0LI1sHBJgjP9hYFbHg/PX7CsLE2pY1fkbwLKxkHt3
         9wM/8gypUEIA7538MY1FEhuxZMAFaBR+bHLSqNql7NrbDZzOK6BI5lbnFUKUkRrT9uq5
         kArB09CRgtqg7JwIwymRuxWtLIWc4+OYdZpdvStRlYKL7cJ9BdIwzbP3dy3PpWcu1lRY
         fgYamakDOuDTsfelTot5+IB9ZnQpQ3Kmy2w6sxXO6d3VqVPlZ2srcSiTFrica8XfUaUS
         Rb2yDeKfgM2+E1SmLjCAp84MhQBSW5jPRhs6IryWHCHmCi1Ahx6edtcxoCMFX1z+Lbj4
         QcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmMmv/oTSzrJmF1VX/DLHOeAhM5SZu/ZlDvV6Xk6vkU=;
        b=pOlf6cotno5TwGNzqtnU3P3E2BjMguIgUEe5q+qT8eOZekbnS7SUtYc8puYcdYUv+a
         eHwaqlodlZ3e0HxyfFluQu6yRVaAi/MVtXqCiNbzPYK/080Ec9u8batHTYEGO4CM8M/M
         Mzzj+ncM+fuyNWThIbSCT9pj1X1C53VMVGhYNYkwj45LUMNkSPakPV1p11u2nhs33Mm7
         WFE12TwfSIx7aHtJlvyUQF+UDNrbr9Wgc5IjzV1ig21U1zd+aF17q2Be39QCwt1BErWj
         JITNyF+ve+WKJtJ+a4i8q0URaTgC1tzmIXIEMpwj3s+U5vyD10ekEnJr4dIbW8oPIfXL
         nIDw==
X-Gm-Message-State: ACrzQf0yp6UdomSXHok8KcU0z1OG5ktgUYundRuzmrHFOzNRTqkNAIYR
	f+f91lUd/752yco1IJm/kAQ=
X-Google-Smtp-Source: AMsMyM4hrXqGUG3Vmvld987T1WNtFXrKcXMKwXX+IQWKjrA0z6Y8rKFuw+/f/w0lDPc2ScNQ/JzxWg==
X-Received: by 2002:adf:b30d:0:b0:23a:43b7:aeb7 with SMTP id j13-20020adfb30d000000b0023a43b7aeb7mr11965840wrd.192.1667834511015;
        Mon, 07 Nov 2022 07:21:51 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c4f9300b003c5571c27a1sm11377181wmq.32.2022.11.07.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:21:50 -0800 (PST)
Date: Mon, 7 Nov 2022 18:21:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: video: use min_t() for comparison and
 assignment
Message-ID: <Y2kiixRDxjxSwFp+@kadam>
References: <Y2iHl5CuqyR2vEc8@qemulion>
 <Y2kGG3zuvvDLZKWq@kadam>
 <Y2kf40kSbFWkWkLl@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2kf40kSbFWkWkLl@qemulion>

On Mon, Nov 07, 2022 at 08:40:27PM +0530, Deepak R Varma wrote:
> On Mon, Nov 07, 2022 at 04:20:27PM +0300, Dan Carpenter wrote:
> > On Mon, Nov 07, 2022 at 09:50:39AM +0530, Deepak R Varma wrote:
> > > Simplify code by using min_t helper macro for logical evaluation
> > > and value assignment. Use the _t variant of min macro since the
> > > variable types are not same.
> > > This issue is identified by coccicheck using the minmax.cocci file.
> > >
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > >
> > > Changes in v2:
> > >    1. Revise patch description. No functional change.
> > >
> > >  drivers/staging/most/video/video.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> > > index ffa97ef21ea5..d5cc7eea3b52 100644
> > > --- a/drivers/staging/most/video/video.c
> > > +++ b/drivers/staging/most/video/video.c
> > > @@ -173,7 +173,7 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
> > >  	while (count > 0 && data_ready(mdev)) {
> > >  		struct mbo *const mbo = get_top_mbo(mdev);
> > >  		int const rem = mbo->processed_length - fh->offs;
> > > -		int const cnt = rem < count ? rem : count;
> > > +		int const cnt = min_t(int, rem, count);
> >
> > TL;DR use size_t instead of int.
> 
> Hi Dan,
> Thank you for reviewing the patch. Please see my queries inline.
> 
> >
> > Using "int" here is wrong.  size_t is unsigned long meaning that it has
> > 64 bits to use to represent positive values.  (Let's ignore 32 bit
> > arches).  You have chopped it down to say that it now has 31 bits for
> > positives and if BIT(31) is set then treat it as negative.  Everything
> > which is larger than INT_MAX will be broken.
> 
> I did worry about the truncation int might cause to the size_t variable,
> however, as the result is being assigned to an int, I decided to go for int to
> be the typecast for min_t.

Let's ignore that other layers prevent "count" from being greater than
INT_MAX.  mbo->processed_length is a u16.  Also if "fh->offs" is more
than mbo->processed_length that's a separate bug and we are already
screwed.

So that means rem is a relatively small number.  A small number can
easily fit in "int cnt".  So we are eating a big pie ("count") but we
are taking small bites ("cnt").  Everything works fine.

But if we chop the pie in half or treat it as negative pie then the
math breaks.

> 
> Also, won't size_t will force the int rem to be treated as unsigned value which
> will impact the comparison when rem indeed is negative. If rem will never be
> -ve, my worry will be void.

Is "-ve" the TikTok way of abbreviating negative?  Am I old?

The small bites are always positive.  But if we are eating negative
pie then we take negative size bites.  min_t() should almost always use
unsigned types.  Everything else is a headache.  I have often wondered
why people do it but I think it's because of the 80 character rule and
the word "int" is shorter than "unsigned long".

regards,
dan carpenter


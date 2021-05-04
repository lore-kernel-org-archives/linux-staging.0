Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E571
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 13:58:06 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id g14so10544065edy.6
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fwhQbFqmk3lGr4XFNKHkxvHEa1774F/8rEnc43My0lw=;
        b=l4alpUtcZ2FPG8XNALaolgcUfpOQZtD6nyB1KmQEaTc4SIXWb/EXgEBzgRUUlX3QAO
         ZrOhjBky2CATDeUlFVZ2uNk3cb2UZisZoPjwfk5rDo6GgATaNxptToO1eRuDWe9r21T2
         DoDTAcaGGB40o2wQm/3C8NABH3QcuhApN+IWyYGHrND6zQ/Z7ZfNgzbdqAoScpkIWftt
         gZhARdZm6Wfh38UQC4wRvreBypxOByMtwExtk2khgt6Kx0YYl3e2EFlCR+PDHz3gQKuv
         wjovykxIiiikT2RmT8vofSV1VX0fmq1X0+lQBT8ovX/tMXgjO1RGPo10SaTqBq8G2qou
         LwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fwhQbFqmk3lGr4XFNKHkxvHEa1774F/8rEnc43My0lw=;
        b=buZhRchWOpzD104M3gIdSatBXsuDSGv+jrJp+u8mIh0IfP9wh1vLFleYp7EqAEXpPp
         Kf8jqKDBKidMLfEOOkhEiTaAxqjsBoDYqlchMLuCznkY31MA2hrjtZb7Q5LXVSHgQJ3q
         HjhHt0/kMw796byjKUIOKVleDp2HuxKOXcS3yTT4dT6vQ8kXUV8H3EM5OxQ3rCxPci7E
         w7rev4BGLe3uI8VdGuLuCC5UpfMxp4MZqCBCvdFbdPSWS4vuSeSXcrTMrbWUkXeZa+pe
         mT+RuoqFWEHmE/nS7OnvoC5NpQqkEsMHyoh+zis8F/7VYQBOd8Y7kVamexQ2a/LhbEPd
         Rh7w==
X-Gm-Message-State: AOAM531y+yw8evShf8ES9gFtE/31EUsPGw9B2o8+iRle8Dq7QgViLemi
	kEQ32zl2zzyuArWUDQaI/uE=
X-Google-Smtp-Source: ABdhPJzDY9W+pKJT4QETRtmsV5JxC4T8dAUIRGMiY5p1BbNjiE0ZEEwQLwk8djcvP9ZKkzRUxqqqNw==
X-Received: by 2002:a50:fe03:: with SMTP id f3mr25813980edt.92.1620136684873;
        Tue, 04 May 2021 06:58:04 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id d18sm1462220eja.71.2021.05.04.06.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:58:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: outreachy-kernel@googlegroups.com, David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparmaintainer@unisys.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v7] staging: unisys: visorhba: Convert module from IDR to XArray
Date: Tue, 04 May 2021 15:58:02 +0200
Message-ID: <3550993.e1xmc6yJDa@linux.local>
In-Reply-To: <20210504134216.GG1847222@casper.infradead.org>
References: <20210504133253.32269-1-fmdefrancesco@gmail.com> <20210504134216.GG1847222@casper.infradead.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, May 4, 2021 3:42:16 PM CEST Matthew Wilcox wrote:
> On Tue, May 04, 2021 at 03:32:53PM +0200, Fabio M. De Francesco wrote:
> > Changes from v6; Added a call to xa_destroy() that I had forgotten.
> 
> What?  No!  Go back and re-read what I wrote about this previously.
>
I remember that explanation you gave me some days ago for not using it. But I 
was mislead by a comment ("Do we not have to call xa_destroy()?") by Dan and 
your "Correct" soon after the above comment. So I thought that I had 
misunderstand and the put back that call to xa_destroy(). I lost something in 
following the flow of the reviews, I suppose.
> 
> > +static int setup_scsitaskmgmt_handles(struct xarray *xa, struct uiscmdrsp 
*cmdrsp,
> > 
> >  				       wait_queue_head_t *event, 
int *result)
> >  
> >  {
> > 
> > -	/* specify the event that has to be triggered when this */
> > -	/* cmd is complete */
> > -	cmdrsp->scsitaskmgmt.notify_handle =
> > -		simple_idr_get(idrtable, event, lock);
> > -	cmdrsp->scsitaskmgmt.notifyresult_handle =
> > -		simple_idr_get(idrtable, result, lock);
> > +	int ret;
> > +	u32 id;
> > +
> > +	/* specify the event that has to be triggered when this cmd is 
complete */
> > +	ret = xa_alloc_irq(xa, &id, event, xa_limit_32b, GFP_KERNEL);
> > +	if (ret)
> > +		return ret;
> > +	else
> > +		cmdrsp->scsitaskmgmt.notify_handle = id;
> 
> This 'else' is actively confusing.
>
Unnecessary and redundant, yes.
> 
> > +	ret = xa_alloc_irq(xa, &id, result, xa_limit_32b, GFP_KERNEL);
> > +	if (ret) {
> > +		xa_erase_irq(xa, cmdrsp->scsitaskmgmt.notify_handle);
> > +		return ret;
> > +	} else
> > +		cmdrsp->scsitaskmgmt.notifyresult_handle = id;
> 
> Ditto.
>
Redundant, again.

Thanks,

Fabio





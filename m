Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3537B;
	Sat, 11 Mar 2023 17:31:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so5341918wmi.3;
        Sat, 11 Mar 2023 09:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678555896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZIJBRNDRL8HZvT697SFUbM2Eibrf8gkSu7pHfkfmkE=;
        b=B7DKn1liTn6wJaaCvi/8wFSDUGKfv+hzlvsKEHKGodQa8NRAohVRRe0cWaafeqAjzv
         xyUPMCBCpOKPdFndoKneWamVeY7UxTtHs4m4uKkzMagBf/NjzW0HpXf9TIBv95QAMRkM
         d2hMRGo5Co0Pjv2rUll7h010nb0EyuUPxohM5G2sPxhrjaOdp07+aTNVE8CYqquLmU6f
         jzthzbcPhhlWIycQ3/uKOG5C0Qlyzs4Ut/24+9vu2uDJDC7DBocfOsb5xcz9+1F834Ea
         ghZ1Oae18NNTXLxJdHFzp7XgrphSbKuWT9TcgmxXxd+X67/po2TxjxfJhFejW90JAwaJ
         v0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678555896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZIJBRNDRL8HZvT697SFUbM2Eibrf8gkSu7pHfkfmkE=;
        b=0UqA38/HvMGlYb2etEFYDSz6zPJvfCZpYZsi2keIFdLfaIDHaFcFqEvFztZAypxs4M
         11KjzX2G8wOkDx0BkgXtM6SJwe4YFOVlJpWb+SJNZHJwbJ3u4FfWVfoyVJiFEbo+fRY7
         W+yh+w++oaUzJfrFItJ0GsrWxYHsiftG/N02tg7Ku4kGx2+zxurz/2AH7VZOUCwRqYuL
         V8CYBYzU71PaptAwSk+kmdAMszmjIKC151Htr6zaaIfuAtnzfPTURrZ7W32pGR4VFSZO
         AQ2xXO1yq689OWDoQpHvId/C8Up4HeXF6f0ChMl6XbFICdJg2N+2JExu7Z93f6ZyEYcf
         L5iQ==
X-Gm-Message-State: AO0yUKXBamzYZ/0iV/XIhjLdSbYVTq7SAeD4/uVRqxFNji0vwbWrOE+z
	r16MGTk8BwOW+SUzzGXtY/LVCwTxJaXdvt1H
X-Google-Smtp-Source: AK7set8AEI4G00E78uxadPBqecqF59b6nejd6JlyaM6SA9R+1ru2UD7dyei97ETUVkpvdYKDarT3xg==
X-Received: by 2002:a05:600c:538b:b0:3eb:2b88:5af2 with SMTP id hg11-20020a05600c538b00b003eb2b885af2mr6180515wmb.20.1678555896582;
        Sat, 11 Mar 2023 09:31:36 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c024400b003e91b9a92c9sm3386837wmj.24.2023.03.11.09.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 09:31:36 -0800 (PST)
Date: Sat, 11 Mar 2023 22:31:33 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: axis-fifo: remove tabs to align arguments
Message-ID: <ZAy69T5sYZiyL4TJ@khadija-virtual-machine>
References: <ZAxsyX8n7G92nlJh@khadija-virtual-machine>
 <ZAxzfiOoW0SfW5qD@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAxzfiOoW0SfW5qD@kroah.com>

On Sat, Mar 11, 2023 at 01:26:38PM +0100, Greg Kroah-Hartman wrote:
> On Sat, Mar 11, 2023 at 04:58:01PM +0500, Khadija Kamran wrote:
> > In file drivers/staging/axis-fifo/axis-fifo.c, in line 386 and 529, the
> > last argument is indented as if it were an argument of the second
> > argument. Remove tabs to align the arguments.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> > Changes in v3:
> >  - Do not align the line 530 since it is not part of the last argument.
> > 
> >  drivers/staging/axis-fifo/axis-fifo.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> > index dfd2b357f484..b119cec25a60 100644
> > --- a/drivers/staging/axis-fifo/axis-fifo.c
> > +++ b/drivers/staging/axis-fifo/axis-fifo.c
> > @@ -384,9 +384,9 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
> >  		mutex_lock(&fifo->read_lock);
> >  		ret = wait_event_interruptible_timeout(fifo->read_queue,
> >  			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
> > -				 (read_timeout >= 0) ?
> > -				  msecs_to_jiffies(read_timeout) :
> > -				  MAX_SCHEDULE_TIMEOUT);
> > +			(read_timeout >= 0) ?
> > +			msecs_to_jiffies(read_timeout) :
> > +			MAX_SCHEDULE_TIMEOUT);
> 
> People have been trying to "polish" this mess for a long time, and I
> think it's better to step back and see what is really needed here.
> 
> There is a module parameter, read_timeout, that can only be set at
> loading time.  As it can only be modified once, why are we doing an if
> statement each and every time it is read from?
> 
> Instead, in the module probe function, how about doing something like:
> 	if (read_timeout >= 0)
> 		read_timeout = msecs_to_jiffies(read_timeout);
> 	else
> 		read_timeout = MAX_SCHEDULE_TIMEOUT;
>


Hi Greg! 
Thank you for the reply. Before sending the patch I just wanted to
confirm if I have understood this right. Should I write the above
mentioned code before the wait_event_interruptible_timeout() call, and
pass read_timeout as the last argument to wait_event_interruptible()?
And same for write_timeout.


> and then only ever use "read_timeout" here in the
> wait_event_interruptiable() call?  That should simplify this much more
> overall, and hopefully allow us to just get rid of the module parameter
> eventually as that's not how drivers should be working at all anymore.
> 
> Same goes for write_timeout.
> 
> Overall the code should be much simpler and easier to understand, which
> is the end goal here.
> 
> Can you try doing that instead?
> 
> thanks,
> 
> greg k-h

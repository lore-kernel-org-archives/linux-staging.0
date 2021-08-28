Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92072
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 18:01:52 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u14so21109870ejf.13
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 11:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LweYKg4Vk4QsavD9uxUeq5d8BOyJSCHKCTz9RcXLWNY=;
        b=mTAz6GdNb39rq4+nA4PfTHwRcMdwB+MzD4NwMqI4K3iK9MPokEzr0CgxX4EBTw8A32
         hM04g71VA64zpQzn89RwpsrbK/QZ49BtvCF0oeeb91QCtw5RoqhnzAHB0fLW6q3cHwdT
         vK08G0OFd+giCb8JwcCcF4A+hBxxwaUSTLVwfz/svMLWCs2zNrLF+c3X/gFxloGkxua5
         oRG0oPYI1wLA3YVXuc1imEmO/M0gsyDxHCZwnkO8zYaWztUJOup/5qUGqy25lZyMvPN9
         i0geUJF3Gn25PGkX6pCuO26WkBU7xLOIznSfLNQpwXttOUKwl0hYeOqFOSdFBTUmkmO8
         qavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LweYKg4Vk4QsavD9uxUeq5d8BOyJSCHKCTz9RcXLWNY=;
        b=ogVYx4oi7eetVX83G25o+/QTnw/cmSQB+jhoovW91Fl9oaPHxW0rwMZRrdBVj0u8Gk
         xLTRr7bpPrbo8icYsCpxDok49MSiXyWG4fzx3QI66q3wX3fCfB1u2f55ZEG8sSQR+zQ5
         vHY9Ei2VTMZSRKYB/5YzWmNFyzXYesA4WY95AP/E103hax7c/vVCY+cYWurM1nmlazli
         b7/OPhSj502yCo8xegKDQom4ytByX+s+TYJVOpDE3FRQQV0Wk9N4CRVYFo0+xCimoEIK
         L11RKPhUn3V0riGsB+XR3GWnTuNSrSYKHoKukUCOHj1pVkg2D0ENh/VSJcgfIUSDjYqN
         zWcQ==
X-Gm-Message-State: AOAM532d4en2dNXErNeKegy5UFX7nRPi+PYBUVzlJkuWhnUQssmLn2oN
	BjjlS9STEcCSy6G+9uOoZxECLtorL6g=
X-Google-Smtp-Source: ABdhPJy8xBvbl8O2QZvyScAuLRfWQxlC5B5EVOXgKFFWJbAHGsDVGQ8TFN2tFMABHMbaApM3GR5LSg==
X-Received: by 2002:a17:906:4943:: with SMTP id f3mr16244434ejt.102.1630173711020;
        Sat, 28 Aug 2021 11:01:51 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id x11sm327862edq.58.2021.08.28.11.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:01:50 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: Re: [greybus-dev] [PATCH v3] staging: greybus: Convert uart.c from IDR to XArray
Date: Sat, 28 Aug 2021 20:01:48 +0200
Message-ID: <3554184.2JXonMZcNW@localhost.localdomain>
In-Reply-To: <dc2d0dda-0a04-8b45-d83e-f7c54baa357b@linaro.org>
References: <20210816195000.736-1-fmdefrancesco@gmail.com> <dc2d0dda-0a04-8b45-d83e-f7c54baa357b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Saturday, August 28, 2021 5:43:49 PM CEST Alex Elder wrote:
> On 8/16/21 2:50 PM, Fabio M. De Francesco wrote:
> > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > is more memory-efficient, parallelisable, and cache friendly. It takes
> > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > deprecated because XArray has a better (cleaner and more consistent) API.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> I have one more comment, below.  Generally, I don't think it is
> important to make this change, but I think it's fine to switch
> to the newer XArray interface.  The result is a little simpler.

I agree that the result of using XArray is a little simpler and readable. As far as 
performance is regarded (memory-efficiency, cache friendliness, parallelization
improvements) I have to take for true the words of Matthew W.. Some time ago
I did a similar conversion for staging/unisys/visorhba after discussing with him 
on IRC; he confirmed that the driver would have got several benefits. This is why
I decided to do this work on staging/greybus too.

I cannot affirm the same for IDA to XArray conversions, since IDA are relatively
lighter and efficient than IDR. Unfortunately, I cannot profile such conversions
in order to prove/disprove they *really* gain on execution time and/or memory 
footprint.
> >  
> > []
> >
> >  static int gb_uart_receive_data_handler(struct gb_operation *op)
> >  {
> > @@ -341,8 +341,8 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
> >  {
> >  	struct gb_tty *gb_tty;
> >  
> > -	mutex_lock(&table_lock);
> > -	gb_tty = idr_find(&tty_minors, minor);
> > +	xa_lock(&tty_minors);
> 
> I'm basically new to using the XArray interface, but I
> don't think you really need the xa_lock()/xa_unlock()
> calls here.  You are not relying on reference counting
> to control when the allocated minor device numbers are
> freed, so I'm pretty sure you can simply call xa_load()
> to look up the gb_tty for the given minor device.

I haven't yet had time to understand how driver works. However,
I can attempt a response mostly due to logic than to a real knowledge
of how drivers work...

(1) I see that alloc_minor is called at "probe" (that I suppose it means
the the kernel "feels" that a new device has been added and so it should 
initialize it somehow and make it ready to operate properly - I hope
I'm not too far from the truth :)).

(2) I see that xa_alloc() finds an *unused* identifier and, if it succeeds, 
that identifier is used as the "minor". So, we have one minor per device
and that the same minor cannot be re-assigned to other devices. It also
should mean that there's no need for reference counting because that
"minor" is not shared.

(3) If the logic above is sound, we have a 1:1 correspondence between
minors and devices (max 16 gb_tty's) and therefore we don't need to lock 
tty_minors because concurrent code passes different minors to xa_load() 
which always returns different gb_tty's.

If the above argument is wrong I think I should read a book on device 
drivers for the first time. I have Greg's but I haven't yet opened it for
reading :) 

Thanks,

Fabio

> But please don't only take my word for it; investigate
> it for yourself, and if needed ask others about it so
> you're confident it's correct.  There is no harm in
> taking the lock, but if it's not needed, it would be
> nice to avoid it.
> 
> If you conclude the locks are necessary, just say so,
> and explain why, and I'll probably just accept it.
> Otherwise, please explain why you are sure they are
> not needed when you send version 4.  Thank you.
> 
> 					-Alex
> 
> 
> > +	gb_tty = xa_load(&tty_minors, minor);
> >  	if (gb_tty) {
> >  		mutex_lock(&gb_tty->mutex);
> >  		if (gb_tty->disconnected) {
> > @@ -353,19 +353,19 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
> >  			mutex_unlock(&gb_tty->mutex);
> >  		}
> >  	}
> > -	mutex_unlock(&table_lock);
> > +	xa_unlock(&tty_minors);
> >  	return gb_tty;
> >  }




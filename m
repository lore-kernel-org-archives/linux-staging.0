Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6FC3FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 19:05:57 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ho42so6244921ejc.9
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 12:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SfjhQuNvnVfgeiqsfJ0/2nWkaueeq4WUPQeFXDKbLt8=;
        b=a5SI7FF1Plx5V39ChRXMpRHycTd6yTWhxSdsVgQjWIJG/p45ZQZpoZ91mYpWFXJMsu
         +MKHwZR9vs/NqUc8oNL8jteuyzvG8f7jCNHELsXxgXPdAgG0bO2esW+2Wy2TlGTQGxfZ
         wJLNtSojZql9iTsPd1o8bYMYpTBtIXE+SzEMABZQ1H59Pnc27jYNIcIqNR+9ZyewVzWk
         L23SEmCgSU4RDJ/+Gvz1GSQzPtl5KBJym2DMXz1q2Hal5AP119zKAqGYZ1pqekZ/I0Px
         +Z0zf+b2YW4Kzu46HOawowjdoPDQGCQ7qRKQtHXaRSiMrvnG31d4mbosA5ip7TatxcFo
         Fxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SfjhQuNvnVfgeiqsfJ0/2nWkaueeq4WUPQeFXDKbLt8=;
        b=Ib7zICAyv/RNpPMgq0sbJqwpNu9T806mdAf6B1/KGECl2/EsZaeyQLsEotHzR8Ww2C
         Cll9f+guTOi3vNrd3I8AIsOLjDcZxZW3yXswvAAN7NhwJuNEuU4tPJ4FJ/27SJEKRjiU
         O6CyyrhHza9sFGNACtQMEZm/XhxjmENecCbQEBMeZkoSWUru4dhVlSHmxrMef06a+qRG
         DOS8jMYU8M3PbJP2kGkglmLR6bR/E0tye5OPZ2sw24oxUph95lmcD75rzvunKTHtw6fV
         D+cB7vthWQWO7RLiijIJbRVALNgUSG2d2dg5gCFZfbJsVHU7im+bYkilfcOE590hq8sP
         m/LA==
X-Gm-Message-State: AOAM531cLUvTfXg/ltXusHJ1U8whIxS0PYg6sa7OHB0LlPRwHLjXXLfS
	uQb2htsDmjwYZgl6OyIAWnE=
X-Google-Smtp-Source: ABdhPJxfMGyvGG8cMqbcN7yNNhqzxf8B9qvYyJ/SxMtDL3d6wv6Gg4Rshz8r6BxPkXt6VjsPIZxXPQ==
X-Received: by 2002:a17:906:850a:: with SMTP id i10mr11215892ejx.256.1631300756211;
        Fri, 10 Sep 2021 12:05:56 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id w5sm2926680ejz.25.2021.09.10.12.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 12:05:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] staging: r8188eu: Shorten calls chain of rtw_read8/16/32()
Date: Fri, 10 Sep 2021 21:05:54 +0200
Message-ID: <2762638.ITW8iCUxI0@localhost.localdomain>
In-Reply-To: <9324065.O9NRuxeco7@localhost.localdomain>
References: <20210904220048.12822-1-fmdefrancesco@gmail.com> <YTYgnrvwxNt4+CvR@kroah.com> <9324065.O9NRuxeco7@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, September 10, 2021 5:19:58 PM CEST Fabio M. De Francesco wrote:
> On Monday, September 6, 2021 4:07:26 PM CEST Greg Kroah-Hartman wrote:
> > On Sun, Sep 05, 2021 at 12:00:47AM +0200, Fabio M. De Francesco wrote:
> > > Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
> > > For this purpose unify the three usb_read8/16/32 into the new
> > > usb_read(); make the latter parameterizable with 'size'; embed most of
> > > the code of usbctrl_vendorreq() into usb_read() and use in it the new
> > > usb_control_msg_recv() API of USB Core.
> > > 
> > > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
> > > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > >
> > > [...]
> > > 
> > > +	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
> > > +		status = usb_control_msg_recv(udev, 0, 
> REALTEK_USB_VENQT_CMD_REQ,
> > > +					      
> REALTEK_USB_VENQT_READ, value,
> > > +					      
> REALTEK_USB_VENQT_CMD_IDX, io_buf,
> > > +					      size, 
> RTW_USB_CONTROL_MSG_TIMEOUT,
> > > +					      GFP_KERNEL);
> > > +		if (!status) {   /*  Success this control transfer. */
> > 
> > Comments go on the next line.
> > 
> > > +			rtw_reset_continual_urb_error(dvobjpriv);
> > > +			memcpy(data, io_buf, size);
> > > +		} else { /*  error cases */
> > 
> > Again, next line for the comment.
> > 
> > > +			DBG_88E("reg 0x%x, usb %s %u fail, status:
> %d vendorreq_times:%d\n",
> > > +				value, "read", size, status, 
> vendorreq_times);
> > 
> > These should be removed eventually...
> > 
> > > +
> > > +			if (status == (-ESHUTDOWN) || status == -
> ENODEV) {
> > > +				adapt->bSurpriseRemoved = true;
> > 
> > Odd, but ok...
> 
> I'm not so sure that it is OK. Please correct me if I'm wrong...
> 
> The calls chain from usb_control_msg_recv() seems to be the following:
> 
> usb_control_msg_recv/send()
>         -> usb_control_msg()
>                 -> usb_internal_control_msg()
>                         -> usb_start_wait_urb()
>                                 -> usb_submit_urb()
> 
> Each of the above functions could fail for different reasons and if so they 
> return the errors up to the first caller into "status". I can find no lines 
> of code where the above-mentioned functions set and return -ESHUTDOWN.
> 
> Unless I'm missing something obvious, "status" is a non-shared variable. 
The 
> variables that are assigned with errors in all five of the above-mentioned 
> functions are also local (non shared) variables.
> 
> To summarize: how could "status" be assigned -ESHUTDOWN? Is any point in 
the 
> chain that value assigned by a concurrent thread to a shared variable and 
> then returned up to the caller (i.e., usb_control_msg_recv())?
> 
> Since the code has this "if (status == (-ESHUTDOWN) || ...)" it expects 
that 
> sometimes it could be 'true', so I'm 100% sure that I can't see where my 
> argument is not valid... :(

Sorry, please disregard my previous message.

I found that, somewhere about a couple of function deeper in the chain,  the 
-ESHUTDOWN error code can indeed be returned. I had to read again and again 
every line of the chain until I saw that.

Fabio

> Can someone please help me to understand this topic?
> 
> Thanks,
> 
> Fabio
> 
> 
> 
> > 
> > > [...]
> 
> 
> 
> 





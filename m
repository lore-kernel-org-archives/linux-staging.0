Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FD73FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 15:20:02 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id h9so4984423ejs.4
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 08:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y3tC4nDyVOsSkA0uvt6jkAqJXxoQ4QhFC8D3n1gWmeM=;
        b=ccMPMMdig5pYc+7VPBZnQ4mnFUWGTG7mZaFdqBT9Xd6nDf6cpl7WE75bCXUPBZPGl4
         wWgELNQlT/zOxFOIxv5i4T2mpvIQZm6wDUJf0NJf5kJvx4y/oj7kb23opd02XH/VIooU
         uqsLsbZnGehK1pQ/JnitY5m67RA0XQitRLSe5hdehUKQTCmucvHmWf3iOxJlddJZ5dkf
         H+lAQ3uH+BtVf6bXYPmXCzAl5sI5VGTQ1cvJA1tFP8QAhYg743NLQ2UQ6Psu8LxrRxL5
         G8CC4lnp2IVuKEr6F9jLiJ2i7VQygXG0al0ZVwSR+KfkVQDpWZDUGUzALiAFcEg5khgt
         dNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y3tC4nDyVOsSkA0uvt6jkAqJXxoQ4QhFC8D3n1gWmeM=;
        b=BQHoZ+vz/bOZgSdFk750O9N3yUnMIvq54KBr020dwgZrTou2Yx9wpyHRv/RgeTgGoW
         BLfmuenz/MvscZbmbWZxb7oq59sAYQang+Inc9W448z4vr0VJBXwdgGDvcrNzoCEE9TO
         QkSIxtq3aygFIHmbYwOTPdnLOxUmZOQcYP94ko7A3hGcs6+XhEfs0ryKGt9nbouK3ybm
         YlBh0E9CtdEhH3+hXJZ42N5jJluqWsZuTJsyScjaGFR5ZagnZO/+GLYOn2rGIMyn8UtW
         gjenIuFNHohyHpE1Q8vPc3HrdFv/ihjqrf60y+dBUYRNYyuPdYeCojGIOYDpzJAU+flP
         uA4A==
X-Gm-Message-State: AOAM5306OWdbiFsQM/u7A9kiAlMTdAD1V/xiRncuURxT8q/Rtn8fyeYu
	7wglKc/pZNCHMonpZpXbZwLPgcQNw3s=
X-Google-Smtp-Source: ABdhPJz3kLbFrvosjlIym0GPjZG0FUPBwnXlHAOjGj9fbcmUnBGPHja0GDTZOaYuCjD+t5cWBIhSXg==
X-Received: by 2002:a17:907:c10:: with SMTP id ga16mr10343714ejc.174.1631287200402;
        Fri, 10 Sep 2021 08:20:00 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id j5sm2602039ejb.96.2021.09.10.08.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 08:19:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] staging: r8188eu: Shorten calls chain of rtw_read8/16/32()
Date: Fri, 10 Sep 2021 17:19:58 +0200
Message-ID: <9324065.O9NRuxeco7@localhost.localdomain>
In-Reply-To: <YTYgnrvwxNt4+CvR@kroah.com>
References: <20210904220048.12822-1-fmdefrancesco@gmail.com> <20210904220048.12822-3-fmdefrancesco@gmail.com> <YTYgnrvwxNt4+CvR@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, September 6, 2021 4:07:26 PM CEST Greg Kroah-Hartman wrote:
> On Sun, Sep 05, 2021 at 12:00:47AM +0200, Fabio M. De Francesco wrote:
> > Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
> > For this purpose unify the three usb_read8/16/32 into the new
> > usb_read(); make the latter parameterizable with 'size'; embed most of
> > the code of usbctrl_vendorreq() into usb_read() and use in it the new
> > usb_control_msg_recv() API of USB Core.
> > 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >
> > [...]
> > 
> > +	while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
> > +		status = usb_control_msg_recv(udev, 0, 
REALTEK_USB_VENQT_CMD_REQ,
> > +					      
REALTEK_USB_VENQT_READ, value,
> > +					      
REALTEK_USB_VENQT_CMD_IDX, io_buf,
> > +					      size, 
RTW_USB_CONTROL_MSG_TIMEOUT,
> > +					      GFP_KERNEL);
> > +		if (!status) {   /*  Success this control transfer. */
> 
> Comments go on the next line.
> 
> > +			rtw_reset_continual_urb_error(dvobjpriv);
> > +			memcpy(data, io_buf, size);
> > +		} else { /*  error cases */
> 
> Again, next line for the comment.
> 
> > +			DBG_88E("reg 0x%x, usb %s %u fail, status:
%d vendorreq_times:%d\n",
> > +				value, "read", size, status, 
vendorreq_times);
> 
> These should be removed eventually...
> 
> > +
> > +			if (status == (-ESHUTDOWN) || status == -
ENODEV) {
> > +				adapt->bSurpriseRemoved = true;
> 
> Odd, but ok...

I'm not so sure that it is OK. Please correct me if I'm wrong...

The calls chain from usb_control_msg_recv() seems to be the following:

usb_control_msg_recv/send()
        -> usb_control_msg()
                -> usb_internal_control_msg()
                        -> usb_start_wait_urb()
                                -> usb_submit_urb()

Each of the above functions could fail for different reasons and if so they 
return the errors up to the first caller into "status". I can find no lines 
of code where the above-mentioned functions set and return -ESHUTDOWN.

Unless I'm missing something obvious, "status" is a non-shared variable. The 
variables that are assigned with errors in all five of the above-mentioned 
functions are also local (non shared) variables.

To summarize: how could "status" be assigned -ESHUTDOWN? Is any point in the 
chain that value assigned by a concurrent thread to a shared variable and 
then returned up to the caller (i.e., usb_control_msg_recv())?

Since the code has this "if (status == (-ESHUTDOWN) || ...)" it expects that 
sometimes it could be 'true', so I'm 100% sure that I can't see where my 
argument is not valid... :(

Can someone please help me to understand this topic?

Thanks,

Fabio



> 
> > [...]




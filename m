Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9493FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:03:10 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r19so22133943eds.13
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZkd/qClZ6EIptZd3qcKV9Zn8Vt63Fe539Wcquo0PfM=;
        b=n7ZRUsbxJUMYDi99aBmk8yA8tUhzKJa3AFfHOLZkcnaWhJbb0mup3a6KYzkE8GpIuK
         COfH2QMVTodnElA0LDrBfA3WSh3Bu3yCJLifvupGGMCWzTwj26QF/1o6X8o+hWAA1y23
         DgNkAeQ4a/tp9A8xiefaVZiWxeBPN/jnBU581lt0yyetk2KFmuAr9ZvGlQU3PVjh94NW
         AjB75Rf0RJ/ATuFUr3hdDTK5y1en02dyG2wZqLEMK3TFD78mY5i62SAyAi3tU7xiYXz8
         n/fME/BwDlSgYNUO/vG2DXIGPuiCFl8/Sb4f/Ln2NXM+RR8BF90pnihEkpumeY6qqQWB
         5cIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZkd/qClZ6EIptZd3qcKV9Zn8Vt63Fe539Wcquo0PfM=;
        b=cwyE8hsModMKDTU/lwP/agGrgB/ci/MfqDoEBPIxS9e4l+Kxga4B0mrwuu8iyigjR7
         eENchOkrgEt7ZgpX3RAt99PVIinYTR2qnYbPUjRsGH1V55qC0a5UP/lzkpC14EGBGLif
         CNRKUVhLWAybb5S4/NDfnhPloMEr8ksiKx7HVaj54UI23/w40AIhyYdxLPF9Aungns8O
         hjIGPVCon3TFFrPFpbo9/KRdnhgZbqbiOA7r70sHWG1vo+JzTXnMBBvcfV07YM1ZB7E1
         wlcGLMmrh9uPsC85u7ZaKv2b6YRuXWFVx+e9TB9XNqoKDK6cUZ+bCEBzFidQ6BzipQY0
         gPeQ==
X-Gm-Message-State: AOAM530ADwM/W2mCDD9jtmz42hqmG1bil72uQB9gsIYNYND70tiPwWt/
	xwRWsrI5sKjf8kwmIMKlogo=
X-Google-Smtp-Source: ABdhPJxqRq5lliJLYxKFa5TyZvRfhEtTb28dH3hNAyfOOYo9yZb9QQCX4tXX+wnjKnFPcc1osiSNcQ==
X-Received: by 2002:a05:6402:b64:: with SMTP id cb4mr32602209edb.49.1629648189323;
        Sun, 22 Aug 2021 09:03:09 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id ec49sm7435021edb.54.2021.08.22.09.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 09:03:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, straube.linux@gmail.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH RFC 0/3] staging: r8188eu: avoid uninit value bugs
Date: Sun, 22 Aug 2021 18:03:07 +0200
Message-ID: <23968040.bvS6LFdsLj@localhost.localdomain>
In-Reply-To: <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
References: <cover.1629479152.git.paskripkin@gmail.com> <2244219.zNr1yEsLHP@localhost.localdomain> <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Sunday, August 22, 2021 3:31:31 PM CEST Pavel Skripkin wrote:
> On 8/22/21 4:21 PM, Fabio M. De Francesco wrote:
> > On Sunday, August 22, 2021 2:39:34 PM CEST Greg KH wrote:
> >> On Sun, Aug 22, 2021 at 03:10:56PM +0300, Pavel Skripkin wrote:
> >> > On 8/22/21 1:59 PM, Fabio M. De Francesco wrote:
> >> > > On Sunday, August 22, 2021 12:09:29 PM CEST Pavel Skripkin wrote:
> > [...]
> >> > > So, it's up to the callers to test if (!_rtw_read*()) and then act
> >> > > accordingly. If they get 0 they should know how to handle the errors.
> >> > 
> >> > Yes, but _rtw_read*() == 0 indicates 2 states:
> >> > 	1. Error on transfer side
> >> > 	2. Actual register value is 0
> >> 
> >> That's not a good design, it should be fixed.  Note there is the new
> >> usb_control_msg_recv() function which should probably be used instead
> >> here, to prevent this problem from happening.
> > 
> > I think that no functions should return 0 for signaling FAILURE. If I'm not
> > wrong, the kernel quite always prefers to return 0 on SUCCESS and <0 on
> > FAILURE. Why don't you just fix this?
> > 
> That's what I've done in v2. All rtw_read* family will have following 
> prototype in v2:
> 
> int __must_check _rtw_read8(struct adapter *adapter, u32 addr, u8 *data);
> 
> Was it your idea, or you were talking about different approach?
> 
> With regards,
> Pavel Skripkin

Pavel,

Yes, it is correct.

However, after that I had time to look at the calls chain and understand what 
each function does and then I saw that my initial proposal should be made
along with another one...

The calls chain is:

(1)        _rtw_read8()  <--- (returns the data read from next function in chain) 
                                            (no errors returned, see possible fix in next function)
(2)                usb_read8() <--- (returns the data read from next function in chain) 
                                                 (_data_may_be_unitialised_, no errors returned)
		  (possible fix: from "u8 data"; to "char data = -1;")
(3)                           usbctrl_vendorreq() <---- (returns data read from next function in chain)
		                            (data is always a valid pointer saved to third argument)
		                            (if it fails, the third argument is unchanged because it
		                            still has the address of the "data" argument given by the caller)
(4)	                usb_control_msg() <---- (it always returns how many bytes read or valid error codes)
		                                  (it _never_ returns 0: either positive or negative values)
		
I have not yet looked at the usb_control_msg_recv() which Greg talked about.

To summarize: in function (2) "u8 data" should become "char data = -1;".

Regards,

Fabio

P.S.: I was about to send this message while I see that you sent v2. Since I've already have
this response to your question I send it and soon after I'm going to read your v2 patches. 
 





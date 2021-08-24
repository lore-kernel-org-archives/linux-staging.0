Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4BE3FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 14:55:21 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id d11so44852859eja.8
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mXDyxGT/kpxC6uWA72Z+qj3+klh2d+94KRyCB7cfVnc=;
        b=CB8iXaouudRzPCxddZVYxkn/FvS8q9eYgYUuFNmXzTk/2WxfLMuXobRiD5djRoIJMq
         lBdv1SMLqHPtzDiMns9sa4Wr++zBE/lu9753gblKhOADbdyIJ/HCM2AWGnt3qTGd3VPF
         u3KeqbsRq4f2B0RWy604Lcz6dEzfOy88dk//pjG630eREywEkcRsJNeNXFPIMbiog2hW
         H+xFzFtE6aMBCc2+J15+laOyfFyRLpSMzxEh2Xqul6s7njMfcYYJs+T8HpI/6c6+ZDXt
         NGOhyMurT+pc9ru/tcvwMc+tZ611csXfgb6YlTTfplsbcb/gMUjz0EAiGdYhkHUCarMW
         xUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mXDyxGT/kpxC6uWA72Z+qj3+klh2d+94KRyCB7cfVnc=;
        b=tFaTLMZdxuvbJm0U/qUOtnWGb9cygulkM2GE4Gd8jU2qTCclE9eAl/eZNbbX1W7Igi
         AIvPKEgXpH2h1+niHGVA6KmJjQfTQdTgHY0TT5pfz1S1wIJaTVhQjruyUER2Eb5ZBUER
         3r9NZVvtqCG3oE/FefIXw0DoAnsAfla+zDNiqXrgfTYp9Nfu6I12N8oR+g4St21nScnE
         qceBEpggzCFzpDpmIF9sk1i3FX9C+9KLq3GwGqH9Z8IciFvw2yh5eqWmetftJ78cW4Re
         h35zORdWnG0xS0kvZWq+7dDEvcu6AVPGltPQOTaAkepzthPhpe3cTF357gm3pCREydfq
         WfhQ==
X-Gm-Message-State: AOAM530ARtChQJ1cn8vFnu/o5nEKAwMt1GE/m2odQClHVVPmYs2mY4h7
	k0nX1wJEpqFzqseMfdwYr/M=
X-Google-Smtp-Source: ABdhPJx2Lyew0IkZKTfJqVKpv+GkyxmSSM83q0wdPZ5yizZ9oXTkXKUuFSet9cbV1aNL/jI2UNzSOQ==
X-Received: by 2002:a17:906:1901:: with SMTP id a1mr41214311eje.129.1629816919719;
        Tue, 24 Aug 2021 07:55:19 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id f26sm6947341eds.90.2021.08.24.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 07:55:18 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 16:55:17 +0200
Message-ID: <6176148.qlhjVQ1gkj@localhost.localdomain>
In-Reply-To: <99d69811-deff-d346-634e-20e9fdead7c8@gmail.com>
References: <20210823223751.25104-1-fmdefrancesco@gmail.com> <6601006.JhxPbakEoc@localhost.localdomain> <99d69811-deff-d346-634e-20e9fdead7c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 2:09:10 PM CEST Pavel Skripkin wrote:
> On 8/24/21 3:01 PM, Fabio M. De Francesco wrote:
> > On Tuesday, August 24, 2021 1:07:46 PM CEST Pavel Skripkin wrote:
> >> 
> >> Btw, not related to your patch, but I start think, that this check:
> >> 
> >> 
> >> 	if (!pIo_buf) {
> >> 		DBG_88E("[%s] pIo_buf == NULL\n", __func__);
> >> 		status = -ENOMEM;
> >> 		goto release_mutex;
> >> 	}
> >> 
> >> Should be wrapped as
> >> 
> >> 	if (WARN_ON(unlikely(!pIo_buf)) {
> >> 		...
> >> 	}
> >> 
> >> Since usb_vendor_req_buf is initialized in ->probe() and I can't see 
> >> possible calltrace, which can cause zeroing this pointer.
> > 
> > I see that usb_vendor_req_buf is initialized in rtw_init_intf_priv(). It depends on a
> > kzalloc() success on allocating memory. Obviously it could fail to allocate. If it fails,
> > rtw_init_intf_priv() returns _FAIL to its caller(s) (whichever they are - I didn't go too
> > deep in understanding the possible calls chains).
> > 
> 
> Call chain is the most interesting part here :)
>
>      rtw_drv_init()		<-- probe()
>        usb_dvobj_init()
> 	rtw_init_intf_priv()
> 
> If kzalloc fails, then whole ->probe() routine fails, i.e device will be 
> disconnected.

I guess that if probe fails and then the device get disconnected it's not a
big problem, in the sense that nothing of very bad could happen.

> There is no read() calls before rtw_init_intf_priv(), so 
> if kzalloc() call was successful, there is no way how usb_vendor_req_buf 
> can be NULL, since read() can happen only in case of successfully 
> connected device.

Yes, though I have very little knowledge of how drivers work, it make sense 
to me too that read(s) can happen only in case of successful connection.

> Anyway, it can be NULL in case of out-of-bound write or smth else,

This is really something I don't know.

> but 
> there is no explicit usb_alloc_vendor_req_buf = NULL in this driver.
> We should complain about completely wrong driver behavior, IMO :)
> 
> Does it make sense?

I'm not sure, whether or not we now have an answer to your question 
about the necessity to use WARN_ON... I think it's up to your judgement,
because I cannot help on this topic :(

Regards,

Fabio

> With regards,
> Pavel Skripkin
> 





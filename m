Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28E23FC6
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 00:20:32 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i6so28887832edu.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QKdBZxDFHndwOQG1Un1Lk4xYZnYyIdDtym0pAYP0928=;
        b=K/LBXXmvkKXexztWTE3wz9eJvBMeLh8/L0naG1NpnJC2CdcbfDAaTfFl6uNf6VKtfl
         VKilNQa4EFp3TrvSScnX2NNwJ52zJiqL9gd12ZZ26/fzeG2Oyweylx+JQB4SPdvmxodl
         PhLXGAtolSmny6upEWqno2H/JeTtMv397OpIubI+2ui+fIlY2FwqhQikr2CXRzObegNR
         ZaiiidXK2DMmpc243PgT33Haz5OHGSI3EC0STMWQHTheupQ4aFotCl+x461bQNIgLyjd
         FDl9xUwWMlKJ6dNQ8UCxXg7TTZwb+L8BBnAaEogj+FszMuoWZwub0VtMGeTTLtOw7xPf
         mMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QKdBZxDFHndwOQG1Un1Lk4xYZnYyIdDtym0pAYP0928=;
        b=APl+dBLTZF29K+gQlzzT2D0UcEUAWdhyWvCFhKH3R7HtOGf8oDiSwiTSIgZxCGsGVV
         +gyWlVupznMRkJYGnb8TmGlPaz7N5jAz7RaWVeD02SfWpNVJ3dlK3zoove8OL83F9/T3
         Z0bjJmKGUzLlB4BR1gRLR/+R0+vmo3y3zS759MS4rOyYe4xoUgN2PMMuN5/38AhNjjCk
         1CcaO2FPP5xP/X3zsvo8YezzHyoLJZ+eMmb+PKXw80UtlQxvxKqIwoOCoKZlVtCIrABg
         thvbipfgPRVnsJNTZ+U4pgton7PxFmshvJZuiE/yL7F/b8XqN6ChFGGSStMspY04AREQ
         3dcw==
X-Gm-Message-State: AOAM530zcrR/GqzaRSLIcHMiZWFAaImKlc4fBj3Z94dZY/0Fwov1PZIC
	UCWKgpVPN7kgh1UCPk68IH0=
X-Google-Smtp-Source: ABdhPJz01PB6DdPLd7d/mkqNO2gsfep56Mq8yBVumeVZDPPPQY/KUosqJYvMEeihpBzZDQv7TNr+JA==
X-Received: by 2002:a05:6402:318c:: with SMTP id di12mr8068153edb.55.1629764431113;
        Mon, 23 Aug 2021 17:20:31 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id o3sm8175697eju.123.2021.08.23.17.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 17:20:30 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH RFC] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 02:20:29 +0200
Message-ID: <1935919.xT9xXRIY7p@localhost.localdomain>
In-Reply-To: <7ce23fb2-3c8b-352e-1f2e-421ac7c64200@gmail.com>
References: <20210822230235.10953-1-fmdefrancesco@gmail.com> <8275282.m2tVFbhrJk@localhost.localdomain> <7ce23fb2-3c8b-352e-1f2e-421ac7c64200@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, August 23, 2021 1:05:17 PM CEST Pavel Skripkin wrote:
> On 8/23/21 1:47 PM, Fabio M. De Francesco wrote:
> >
> > [...]
> >
> >> I think, we can pass REALTEK_USB_VENQT_{READ,WRITE} directly as 
> >> requesttype argument and get rid of u8 reqtype. + we can define these 
> >> macros:
> >> 
> >> #define
> >> usbctrl_vendor_read(...)   usbctrl_vendorreq(...,REALTEK_USB_VENQT_READ)
> >> 
> >> #define
> >> usbctrl_vendor_write()    usbctrl_vendorreq(...,REALTEK_USB_VENQT_WRITE)
> >> 
> >> This will make code more nice, IMO  :)
> > 
> > Dear Pavel,
> > 
> > I agree in full: nicer and cleaner :)
> > 
> > I'll do that, but please notice that I will also need to change the code of the three
> > usb_read*() for calling usbctrl_vendor_read(). Furthermore, "else res = 0;" becomes
> > unnecessary. Please take these changes into account when you'll send them again
> > as "regular" patches.

I have reconsidered the tip above and, while I appreciate your suggestion, I think it's 
not so necessary to use the macros only to get rid of "u8 reqtype".  I finally got rid of 
that variable by passing the request types explicitly to usb_control_msg_recv/send().

> It depends on which patch will go in first.
> 
> There are a lot of upcoming clean ups, so I am waiting for merging my 
> series with random clean ups :) A lot of fun...

A lot of fun... Sure? :)
 
> I biggest hope is that my series will go in before camel-case clean ups, 
> because rewriting this for the 3rd time will kill my mind...

 In this case, I wouldn't want to be in your place :)
> 
> With regards,
> Pavel Skripkin

Thanks again very much for your review,

Fabio





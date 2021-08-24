Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8370972
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 08:53:14 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id mf2so24233683ejb.9
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KchTKU3OTyx4fIEVz6kFgXk9gVOceFXcIF7F4XX2QJA=;
        b=Az7/YPEWAQmJ/pH1jQ4FfIN/YG+FL19RVNpRvIddo4L61nVXKgSNgF4uzp82HaX2UE
         rO9iXKRh8n0Ex2q9OamfciJNS2047kSDCkExR9u6fiu+3GcbRBvfY8Sg6V6P1BclJgRT
         jDeRTTYPnqw4wNicRUFrWpju4PXLBTk/mS4WyqRkcCGs/4vVcpVibjxjWc1WkJl2ufaY
         Xnu+57sVcHR7ZL5p/7LxZbdKcR33NOt1mfg8RUVZg6bDctGbE+sQaoJCtKMZlIoKIpAF
         5LoUTnBszNXDXPA/faQMcPOO8tL7EvvAHt4PvDkLwevKXgrGaIIsPNPZEGYe4neayxp7
         3eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KchTKU3OTyx4fIEVz6kFgXk9gVOceFXcIF7F4XX2QJA=;
        b=jIzFc7CdtjqHZ6HAKxr9z72wCwjhT89Y6k+l18GDuenfsnmF+kUSqsOrBBLVwNfFPg
         y5IGdfCUEdp5oKI+BEnOKNMXPMTLTUTyNFyaOTR1H/SnGwgNYa5eXf7ab0R+6/CEV1I5
         upJx1VggQC5X8vEXno4lfDwoYzsDYtmvBFPox1l7e6SKOS4Yq6uc5oy+E3XPluEgoyaV
         mC2Pi3KUj078oy7CqS+IyXTO8+QlSwIMCZhQru5wnGF2307QPe3mTo2+uPRptYoKFgRh
         Vfi01I92Irg8AxiIgmYShvvd8FUw6KvUi8YvFLz4kPAE4m9YorrXGFv1QYTYfYH3DUfM
         U3bg==
X-Gm-Message-State: AOAM533LyaXTtiCOJ64RsMljVujR5/MU3wmF1KjF3mJEWrlKrXERCPKb
	dhm/yM1vtYc5zY/1WvNrpIs=
X-Google-Smtp-Source: ABdhPJwq3eWorCB9QGeZKXl53/047RtAFkG9EOLac4I5mz7r1CQUdKcRtgyS9j8sMWeB/1gw/MYjbw==
X-Received: by 2002:a17:906:498b:: with SMTP id p11mr40761873eju.295.1629795192909;
        Tue, 24 Aug 2021 01:53:12 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id br16sm8819806ejb.34.2021.08.24.01.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 01:53:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 10:53:11 +0200
Message-ID: <3198276.4iybWabFxt@localhost.localdomain>
In-Reply-To: <68eebfaf-50a3-a7ec-12ba-cde33c74c9ce@gmail.com>
References: <20210823223751.25104-1-fmdefrancesco@gmail.com> <20210823223751.25104-2-fmdefrancesco@gmail.com> <68eebfaf-50a3-a7ec-12ba-cde33c74c9ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 10:13:46 AM CEST Pavel Skripkin wrote:
> On 8/24/21 1:37 AM, Fabio M. De Francesco wrote:
> > Replace usb_control_msg() with the new usb_control_msg_recv() and
> > usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
> > 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> > Thanks to Pavel Skripkin <paskripkin@gmail.com> for his review of the
> > RFC patch.
> >   
> > drivers/staging/r8188eu/hal/usb_ops_linux.c | 25 ++++++++++-----------
> > 1 file changed, 12 insertions(+), 13 deletions(-)
> > 
> > [...]
> >
> Hi, Fabio!
> 
> Christophe is right about semantic part. 

Hi Pavel,

I haven't yet read Christophe's message (but I'm going to do it ASAP). 
I hope he found out what is wrong with the code, what made Phil's tests
fail.

> Also,
> 
> if (!status) {
> 
> } else {
> 	if (status < 0) {		<-
> 					  |
> 	} else {			  |
> 					  |
> 	}				<-
> }					
> 
> Extra if-else is not needed, since status can be 0 and < 0, there is no 
> 3rd state, like it was before.

Correct, thanks!

Now I read the following from the documentation of the new API...

"Return: If successful, 0 is returned, Otherwise, a negative error number."

I'll remove that status < 0 check and whatever else is no more necessary.
Thanks, again :)

Regards,

Fabio

> With regards,
> Pavel Skripkin
> 





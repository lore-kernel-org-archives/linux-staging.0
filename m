Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3E2F80
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 20:51:22 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so7358510wmq.2
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GG0lmyh6wk8QWw6LsQd7vh3tXFz+o5qSuD/MyeyDIVI=;
        b=cXpsfFM4hWRlTVShaYr1/6xaxfRxXsJWwDlck3RTswYvi5wld6wZTbV6hUWOlWE69G
         KKxnBai/yawcnJTPoJGwmxJzIzT/KGeG2ROc3j/JbQ1dEe3FF5z38CpwPgjgesaKocKX
         FBlVFEdwzRSNGXeCcgI0WtwxhcEq9javE04c1ZJ/2galZbz+FDOJ8N2f8csMKEAmhbVJ
         +eaM4ZE3bBkSdIH5U3bJWqXrhJj+NE4vfU0bPyNprZjUOvFq0ESLyN5QG84AMekIsHhD
         11MBqe2nd1P44c2kORSlMhVNVFJ6kYGc+PNZkB6KjXWRtydulilCcH5wjlWyR/fc6roH
         2MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GG0lmyh6wk8QWw6LsQd7vh3tXFz+o5qSuD/MyeyDIVI=;
        b=htrg2nCkDswU8YVdjVe1QdabjVhNJg7o/H7TcIpLc5QbkINQ820xTTczySlO3tWBlj
         i36h1MlsFE3CKiSKRgkztDc+CC4vtc2TQSub4ie4aVOu0PwNaS9FRePP4C06TBeJkk8G
         rUgNyK98ffQ4dZH/sb4DQujC839FDO4M/Qd4/I7PeRqJiEY16lcye9qDpY3GEjNC4Rco
         lxCyFBBUVlHO94Vq752kv5RXdt057gugSvqNljyueW2iN/Hk2fhezoWJEUneFS0yoMI/
         RgH1JwSx7rsE4VV+xkw5zyMNvObXMEcrdZaFO0ezEfcmtiFo2yaqskbeJhu0tUQX1giM
         yr+w==
X-Gm-Message-State: AOAM533KEv2yNsxUKxmg/zoXapUwN2k+9KkLAhVdpbILfX/LyARC8Bg+
	1/Abt5J+iMjsPnRfagQaBW9TKg==
X-Google-Smtp-Source: ABdhPJxaSeJdGoB68Lkd7mIqFOqozmYqQ7Mq5x5+9H6QP/UmQjjDEmEO7yjsDtHZN5NMpoUZ5R+CRg==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr195460wmq.9.1621975880940;
        Tue, 25 May 2021 13:51:20 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id g78sm4580140wme.27.2021.05.25.13.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 13:51:19 -0700 (PDT)
Date: Tue, 25 May 2021 21:51:17 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: remove ASSERT and ODM_RT_ASSERT
 macros
Message-ID: <YK1jRYWpGjENtruM@equinox>
References: <20210524224532.1230-1-phil@philpotter.co.uk>
 <YKyc3AM51xODwW0Q@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKyc3AM51xODwW0Q@kroah.com>

On Tue, May 25, 2021 at 08:44:44AM +0200, Greg KH wrote:
> On Mon, May 24, 2021 at 11:45:32PM +0100, Phillip Potter wrote:
> > Remove the ASSERT and ODM_RT_ASSERT macros from include/odm_debug.h
> > as they are unnecessary.
> > 
> > ASSERT does nothing, compiling to a single empty statement.
> > ODM_RT_ASSERT is used in only one place, in the ODM_RAStateCheck
> > function with hal/odm.c - it seems to have been intended as an
> > assertion of some kind, but given it is always called with false
> > here, there is little point in it not just being a pr_info() call.
> > 
> > Also, the lines relating to the file, function and line number are
> > not needed as the pr_info() with the function name and error message
> > is sufficient should anyone wish to track down this error at a source
> > level, within what is currently a relatively small function.
> > 
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >  drivers/staging/rtl8188eu/hal/odm.c           |  2 +-
> >  drivers/staging/rtl8188eu/include/odm_debug.h | 13 -------------
> >  2 files changed, 1 insertion(+), 14 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8188eu/hal/odm.c b/drivers/staging/rtl8188eu/hal/odm.c
> > index 4d659a812aed..b800d0c6dff5 100644
> > --- a/drivers/staging/rtl8188eu/hal/odm.c
> > +++ b/drivers/staging/rtl8188eu/hal/odm.c
> > @@ -824,7 +824,7 @@ bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI, bool bForceUpdate
> >  		LowRSSIThreshForRA += GoUpGap;
> >  		break;
> >  	default:
> > -		ODM_RT_ASSERT(pDM_Odm, false, ("wrong rssi level setting %d !", *pRATRState));
> > +		pr_info("%s(): wrong rssi level setting %d!\n", __func__, *pRATRState);
> 
> I know you're just copying what the existing code does, but this really
> should just be a dev_err() call instead.  It's not "info", and as this
> is a driver, dev_*() should be called instead.
> 
> So I'll take this one, but for future cleanups, consider changing the
> pr_*() calls to the correct ones.
> 
> thanks,
> 
> greg k-h

Dear Greg,

Thank you for this, I will make sure to bear this in mind for the
future.

Regards,
Phil

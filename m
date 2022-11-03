Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A908632
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 22:53:22 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id cl5so4799461wrb.9
        for <linux-staging@lists.linux.dev>; Thu, 03 Nov 2022 15:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpymApQ/w0i/4b+duMBXwk9yF4wFkwiZQOVywjEl5EY=;
        b=Yz5arVOgLN/4EIANWAvsm9sPRtw9dSm21ZTK/n9Qq46rOQMA2DscMHmudwfjjj4HrB
         tlNtMcu1XsOcH510kQjRnRB3Exytf0wmTReyLrtsDOdQRrW23TP+1V0x9MAz2MsAwaNE
         sTf0hXs5LC2EXor12SN3524NMaDvNDKSRF+pIJXqrJG8IrXIjAPxeIQYUoSUyHqC6Eo6
         PJgjwClPS3SxYanCKTI3UfoiMRX1uUnLy3qFVQcAg2E4W1KCthxXrMspoQOKJn+Bc07e
         bzHYUhsL81fyzBYCegYScFitRfrY1U12U+6HQTTX1ApAM6AMw0hTA3HPF2k1IEIO3WJf
         HiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpymApQ/w0i/4b+duMBXwk9yF4wFkwiZQOVywjEl5EY=;
        b=3SsF2V4whTlWXYCQnvRkGoCjXE+6IK7K5H2mB+1bgrOPn37gSf0YI+nUJ2DAL54C61
         /ZEz1fN4F6ueOXDZ1/+SMSybUf76mDm8PszXqcrGv3QGIahfpPDzTnQVHiYLv0TSI8Ux
         ByUvrtLGwwxW7W9V/sRYb4xFksOCK9gGvwwU2ESRO5uYOcNzjuxYZKa5AFXxMOOKKMU4
         qS3Ka0Jyfy+ef2OAZnTEM5dXBm0tY4LVTgUtoZAz/jtwwdnkbGtMMN0ADTwMI9UveVid
         RCkDOmH6aH7ZFoIDHuScdhB2Y94jnllHn9/rJXKfjTUxvImpxDwQR9JflzaJasfZWZ0K
         p5pQ==
X-Gm-Message-State: ACrzQf0IWujiVd697BXaEPg1cZyEy/Jnqpur4yeFok7aR0zp642oUlte
	6gacwBsu5xojotKynbYYZtwKRA==
X-Google-Smtp-Source: AMsMyM4YLGMCR6xmDnW/H8HSEPBe1zFihP04pXwQw6nP/o3Og35VUBJ+zAQ2/6povO8vyosj2AM01A==
X-Received: by 2002:a05:6000:c3:b0:236:a261:a2a5 with SMTP id q3-20020a05600000c300b00236a261a2a5mr20707077wrx.137.1667516000368;
        Thu, 03 Nov 2022 15:53:20 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id e11-20020a05600c218b00b003a6125562e1sm1026200wme.46.2022.11.03.15.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 15:53:19 -0700 (PDT)
Date: Thu, 3 Nov 2022 22:53:18 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	paskripkin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: change return type of
 rtw_set_802_11_disassociate to void
Message-ID: <Y2RGXkUEYrBMBCk/@equinox>
References: <20221102233637.6648-1-phil@philpotter.co.uk>
 <2e065cba-8094-3900-67e6-3a647bec3a7c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e065cba-8094-3900-67e6-3a647bec3a7c@gmail.com>

On Thu, Nov 03, 2022 at 06:37:38AM +0100, Michael Straube wrote:
> Hi Phillip,
> 
> On 11/3/22 00:36, Phillip Potter wrote:
> > Change return type of rtw_set_802_11_disassociate to void. This function
> > always returns 'true' no matter what, so there is no need to return a
> > value, and no need to check for it in the two call sites within
> > rtw_wx_set_mlme.
> > 
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >   drivers/staging/r8188eu/core/rtw_ioctl_set.c    | 4 +---
> >   drivers/staging/r8188eu/include/rtw_ioctl_set.h | 2 +-
> >   drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 6 ++----
> >   3 files changed, 4 insertions(+), 8 deletions(-)
> > 
> 
> <snip>
> 
> > --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > @@ -1020,12 +1020,10 @@ static int rtw_wx_set_mlme(struct net_device *dev,
> >   	switch (mlme->cmd) {
> >   	case IW_MLME_DEAUTH:
> > -		if (!rtw_set_802_11_disassociate(padapter))
> > -			ret = -1;
> > +		rtw_set_802_11_disassociate(padapter);
> >   		break;
> >   	case IW_MLME_DISASSOC:
> > -		if (!rtw_set_802_11_disassociate(padapter))
> > -			ret = -1;
> > +		rtw_set_802_11_disassociate(padapter);
> >   		break;
> >   	default:
> >   		return -EOPNOTSUPP;
> 
> You could also remove the ret variable and return 0 directly, since ret
> is not changed anymore in the function.
> 
> regards,
> Michael

Hi Michael,

Thanks for the review, and you're absolutely right. I will publish a V2
shortly.

Regards,
Phil

Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249DA72
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 19:45:42 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id w20so4210736pge.13
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=POiC7h/F8qpkmD5ylKPAvYAOcZ8fi4a52UGHvA+ZtQ4=;
        b=TeJuSOXojjbA1rVQyoZwAOnynby0MYLM2ZDasr1NI4HtlJ0bAOOggGnpJkFpmAidHM
         BNmz4OwVy5fQbJBJ3VBLTcUNUdNg+RtN8KrvMoKILiN/Qa5AJAvd0ejQBKL2n5YQARxM
         zAocbM+Ji7OLgNvuVRKqJsONC9x5DGCDy5eXIE8JeY96PqdvcZjdUsGGtNkIE0+926QF
         5UH7J6Icn6E3WPSfvn6LlmVvg1+Uj5OfK5hIVXQILATxLKsHv5yEZk8nfHme7AGBb5tK
         lqw4T4ae9B307cVNcykwyeGQE88RVwL674HBbl0A/261/FYpWsoiFlKcFq1g2x8mEF+/
         ZXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=POiC7h/F8qpkmD5ylKPAvYAOcZ8fi4a52UGHvA+ZtQ4=;
        b=t60cKOAx6p26NX80e33/Szn9QMtDBXO2wFy4LzgZAfeLxc7EFYBALlxZaNd6FbmnTL
         KWJa3MRjcfZLJKRAgda9nNRJA672Zbk7va/+288dJ/uMRN6voICmE52XRPJ4gklUx3bs
         /PPErooay6gWGSEgYbBNFYLNKJAab8L1nvUqftnO6sqm/sJNbPziVNU8pDWUHHkzJVip
         9h+MLPmVVuRGNczdTOlV43S8qkugKjWsRWtu9kWedoWIuJwiC0mjc38hBHdsALSHU6QS
         Q7Urrhgtzhu8kp8W1DF5MFIU3K9DTA0tfqUjj8/E+daWFOyO7+uxtfspI0JKVMgXeMie
         vyvw==
X-Gm-Message-State: AOAM5317H6Rf+hhAyWL0kWXZq7yBZK2kDm4KeJrN9rRKsC/i3U4q6A2Q
	jt2av8VMTuRgsPFZ1tp928M=
X-Google-Smtp-Source: ABdhPJzvWZFCer3sa4EycqmukaIrqOzHyO/TpDSj7iuOddThtjgV7E5pj7tkfJu+kXwrYC8GLg9ryw==
X-Received: by 2002:a05:6a00:24cd:b029:27c:bbd5:1660 with SMTP id d13-20020a056a0024cdb029027cbbd51660mr296433pfv.40.1619552741431;
        Tue, 27 Apr 2021 12:45:41 -0700 (PDT)
Received: from user ([2001:4490:4409:fe15:9fd0:fa2c:4efc:28b5])
        by smtp.gmail.com with ESMTPSA id n11sm3392269pff.96.2021.04.27.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 12:45:40 -0700 (PDT)
Date: Wed, 28 Apr 2021 01:15:33 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	hello@bryanbrattlof.com, hdegoede@redhat.com,
	saurav.girepunje@google.com, john.oldman@polehill.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: remove multiple return
Message-ID: <20210427194533.GC11046@user>
References: <20210418173233.GA59153@user>
 <20210420110609.GD1981@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420110609.GD1981@kadam>

On Tue, Apr 20, 2021 at 02:06:09PM +0300, Dan Carpenter wrote:
> On Sun, Apr 18, 2021 at 11:02:33PM +0530, Saurav Girepunje wrote:
> > on sdio_intf.c rtw_sdio_suspend call we have multiple
> > return which can replace by goto exit. As in all the places
> > return value is 0.
> > 
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@google.com>
> > ---
> >  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> > index a9a9631dd23c..3e566cf97f6e 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> > @@ -445,14 +445,17 @@ static int rtw_sdio_suspend(struct device *dev)
> >  	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
> >  
> >  	if (padapter->bDriverStopped)
> > -		return 0;
> > +		goto exit;
> >  
> >  	if (pwrpriv->bInSuspend) {
> >  		pdbgpriv->dbg_suspend_error_cnt++;
> > -		return 0;
> > +		goto exit;
> >  	}
> >  
> > -	return rtw_suspend_common(padapter);
> > +	rtw_suspend_common(padapter);
> 
> Also it's weird that your previous patch made rtw_suspend_common()
> return zero unconditionally.  But now we're modifying the only caller to
> not check the return.  Just make rtw_suspend_common() void and change
> this to:
> 
> 	rtw_suspend_common(padapter);
> 
> 	return 0;
> 
> regards,
> dan carpenter
>

Sure, rtw_suspend_common always return 0. It should be void.
I will merge and resend the patch.

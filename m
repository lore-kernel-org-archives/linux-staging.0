Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46F870
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 07:59:34 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id 20so1976049pll.7
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=svFmgmywrBOMRGGlXJDvnuvLp7x0h0E/u68wx4on/6k=;
        b=HSlcPoLBn0yTP0kYKoy3Ps5iQr1AJfbcwNMXQnTtzS6a2KgFCAa9zRbKsmDJQFC9ir
         A21UeT5y9Z3SAmUiWgbZ0BTdCUG5SHhcBkXJdR48qfYIDiJcLh6AxgGNR8o9HTRLPxjI
         mS/H4qeHlS5csGYt+ZRSIUcowhPVhmZQklrrN4NXwZIcuBAe2U99/4GMv+yEOxCpK9pf
         16UbW83pB66v6HS0azMVa+uAHnnQOoA96bCXUI3BGQFpvCqh1XRrRqvoudtsNTgUGV4j
         CFUpl8UHyJct0j83FwBlc1WyWJb0NBlvv2ZC5BNIXYGKTrndubVeEihg9KVrsOZsoP+W
         RJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=svFmgmywrBOMRGGlXJDvnuvLp7x0h0E/u68wx4on/6k=;
        b=UfNvdORR54joqWafa6WWYNsaJozkqkRZx5PHagxRfAUh9oedPn/kTYF2UyKq78ZJcF
         usezBhuWB8FAQlg5ExL3woJjcLpQyw52uKLAnRZ0+geS9SUdIb15PzOoc92a+14cS+ZP
         KucDPWQ01Dh/T1kZ5kG5Mizp40QVrrL6NeB9Kc8M2PXxv5bdn1DvhP/UVSKSE/cWFUY2
         Qv4udYsl2GStiX5VNOLSzcvo2DqR8k4NqhVKEVBhUoXh3ThvQAZDfjt7u2yR/UsJMekg
         UBUt6x3xoiDPFteZWYGnaZZlwFfJUIx1eR0HEbfrV21cgJKHa37GvMG6gllNMk5cGzM9
         Gdvw==
X-Gm-Message-State: AOAM531WpyN/xXj8Bu90ChVmD+EUs60a2qgrg7IHVCtoz7RC26OkFTue
	fRYOUdBk7vMGvyhHJdwFHCM=
X-Google-Smtp-Source: ABdhPJz4cR5w/rz/oKhQvGSzKl3dKZkqi1YoUzQg5ELymkfZCJHuda8msGfnpmOsBe6pVXXiuW/zww==
X-Received: by 2002:a17:90a:9409:: with SMTP id r9mr27108514pjo.157.1618214373993;
        Mon, 12 Apr 2021 00:59:33 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id s195sm9035338pfc.211.2021.04.12.00.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 00:59:33 -0700 (PDT)
Date: Mon, 12 Apr 2021 13:29:18 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [PATCH] staging: rtl8188eu: replaced msleep() by usleep_range()
Message-ID: <YHP91sDmPJIqG95G@kali>
References: <YHPkbTPPra2isn5e@kali>
 <YHPmVtAGH7WWGfjJ@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHPmVtAGH7WWGfjJ@kroah.com>

On Mon, Apr 12, 2021 at 08:19:02AM +0200, Greg KH wrote:
> On Mon, Apr 12, 2021 at 11:40:53AM +0530, Mitali Borkar wrote:
> > Fixed the warning:-msleep < 20ms can sleep for up to 20ms by replacing
> > msleep(unsigned long msecs) by usleep_range(unsigned long min, unsigned long max)
> > in usecs as msleep(1ms~20ms) can sleep for upto 20 ms.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> > index 50d3c3631be0..6afbb5bf8118 100644
> > --- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> > +++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
> > @@ -5396,7 +5396,7 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
> >  			return H2C_SUCCESS;
> >  
> >  		if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
> > -			msleep(10);/*  10ms, ATIM(HIQ) Windows */
> > +			usleep_range(10000 , 20000);/*  10ms, ATIM(HIQ) Windows */
> 
> How do you know you can sleep for 20000 here?
>

When i ran checkpatch.pl it warned that msleep<20 ms can sleep for 20ms.
I checked Documentation, it stated that msleep(1ms~20ms) will often
sleep longer, ~20ms for any value given in between 1~20ms. 

That's why I took 20msec/20000usec as max sleep value. 


> And given that you just changed how the sleep works, are you sure the
> functionality is the same now?

I am still learning, I am not sure about this.
> 
> Only change this type of warning if you have the hardware and can test
> the change properly.
> 
> thanks,
> 
> greg k-h

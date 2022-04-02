Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF01366;
	Sat,  2 Apr 2022 10:13:27 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id h4so5642000edr.3;
        Sat, 02 Apr 2022 03:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nq7rsHg8A3iBgRJPmTpgXY1OAM+6fX6NYBzTSzTX1C4=;
        b=CTwZbdYvrj4KAu0xHRfcJUQGyWJaqzAOfCiguc/crzFxDm2B7eKW5F2KudW+/zpD4h
         ENeIVrF38WevKHfBGdtUAtVLwHbjAlNvHiGllWuMkg3t7SNnyktQ/wfYmk2Iu57V7Hqh
         p1RVlMCOrWp/kou0x5bp8xAazC2aiox4Gyb15wS0KL8ReMTgj6mC3siHhSbTWB9u6vzp
         iodgdPSC0x7qOoFuAM5Ls52XjBLpHTZY3glwRBtFswt9TBj6rrawGSKbATE5IroqfN7H
         GFNKHu9mUNTqTUtf1m6EnqQJGKTFY/iOp4Y73YsDUmiIBparj1N4WCQpByskqMRv4snO
         me7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nq7rsHg8A3iBgRJPmTpgXY1OAM+6fX6NYBzTSzTX1C4=;
        b=ndyf85c0O5vY2pwVUWwYqljCTd00FtqxU9hE7tF1HcC0XqUjo8t9+kMA9YN4s7eQGg
         u+Y2P+Qis1/p27XdhyEKqS76kYSqqECndu7MPX1ykGt1D6OT2fO7fuLCMKwkJU6qtWuC
         LPk2kDMZZi7b/7TSqauYy9WmQ3y8Qihhe215PW76JiJhRK+GCHxW+s8L2CjanLVqrklx
         92MPhcE1wXqsMPYh7a8a6O2H5Q1kFDX3KHaUohH8BH1+FatCZ92sOoisD55VniI1Cqn6
         sNHYHwL14NQE10xFGKwED9pR9lS6Ptp4BylkexhWmHf2Kn8uH6J0vwi8HPZhx2n44FOO
         TzLg==
X-Gm-Message-State: AOAM533hmMmKg8JWy1zayppL6io/LwnRMk1WYoaTTK5I8SouJSG3Go7F
	Ahmmh637iX54/y5elwQAEgo=
X-Google-Smtp-Source: ABdhPJzqJkyefi7J2cWzB2Ryqz9jNoMNznjyESx9VUbicGy3kNqEj5pQvaHy6jaGftlqgmnLWXAdjg==
X-Received: by 2002:a05:6402:13d6:b0:419:2eab:d21 with SMTP id a22-20020a05640213d600b004192eab0d21mr24687793edx.78.1648894405231;
        Sat, 02 Apr 2022 03:13:25 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id gq12-20020a170906e24c00b006e067c93e1bsm1929807ejb.39.2022.04.02.03.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 03:13:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: Remove goto to no-op exit label
Date: Sat, 02 Apr 2022 12:13:20 +0200
Message-ID: <1724388.VLH7GnMWUR@leap>
In-Reply-To: <YkdjhGtMwnbJcz+P@iweiny-desk3>
References: <20220401183513.26222-1-fmdefrancesco@gmail.com> <YkdjhGtMwnbJcz+P@iweiny-desk3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On venerd? 1 aprile 2022 22:41:40 CEST Ira Weiny wrote:
> On Fri, Apr 01, 2022 at 08:35:13PM +0200, Fabio M. De Francesco wrote:
> > In function rtw_free_netdev() there are two "goto" jumps to a no-op exit
> > label called "RETURN". Remove the label and return in line.
> 
> Thanks for the patch!  However, A good commit message lists the why and what of
> a change.  I don't see a why for this commit?

Yes I forgot the "why" :(
I'll rework the commit message for v2.

> 
> FWIW (For what it's worth) I know of a couple of good reasons for this change
> but you should get in the habit of putting that in the commit message.  Even
> for obvious things like this.
> 
> Anyway, I think this patch can stand on it's own with an updated commit
> message.  However, see below...
> 
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/r8188eu/os_dep/osdep_service.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
> > index 7a6fcc96081a..d680bfba7f5d 100644
> > --- a/drivers/staging/r8188eu/os_dep/osdep_service.c
> > +++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
> > @@ -117,18 +117,15 @@ void rtw_free_netdev(struct net_device *netdev)
> >  	struct rtw_netdev_priv_indicator *pnpi;
> >  
> >  	if (!netdev)
> > -		goto RETURN;
> > +		return;

Actually this function doesn't need to test for a valid "netdev". There are only
two callers of this function (they are in os_dep/usb_intf.c) and they already test
the pointer soon before calling rtw_free_netdev().

Therefore, I'll remove the test for a valid "netdev" and (obviously) the code has
no more need to return at that point in function.

> >  
> >  	pnpi = netdev_priv(netdev);
> >  
> >  	if (!pnpi->priv)
> > -		goto RETURN;
> > +		return;

I cannot see how pnpi->priv might ever be NULL. Pavel Skripkin made me notice
that "in rtw_alloc_etherdev() (I can confirm this information because now I've 
just read the code), if pnpi->priv allocation fails, then netdev will
be just freed.". If "netdev" is already free, this function is never called.

Therefore, I'll remove this test too.

> This does not look right.  If netdev is not NULL why does this function skip
> free_netdev()?

After the two removals I've talked about above, the code will always call 
vfree(pnpi->priv) and then free_netdev(netdev).

Therefore, the code won't anymore skip free_netdev() and the bug is avoided.

> 
> Fabio could you follow up with Larry and/or Phillip and see why the code does
> this?  To me it looks like a potential bug.
> 
> Thanks!
> Ira
> 
> >  
> >  	vfree(pnpi->priv);
> >  	free_netdev(netdev);
> > -
> > -RETURN:
> > -	return;
> >  }
> >  
> >  int rtw_change_ifname(struct adapter *padapter, const char *ifname)
> > -- 
> > 2.34.1
> > 
> 

This is how I think to rework rtw_free_netdev():

void rtw_free_netdev(struct net_device *netdev)
{
        struct rtw_netdev_priv_indicator *pnpi = netdev_priv(netdev);

        vfree(pnpi->priv);
        free_netdev(netdev);
}

Am I missing something?

@Greg: please discard this patch; I'll send another that has the purpose
to rework rtw_free_netdev() as I showed above for the purpose to avoid 
redundant tests and avoid the potential skipping of free_netdev() (as Ira 
has correctly noted, currently we have a bug).

Thanks,

Fabio



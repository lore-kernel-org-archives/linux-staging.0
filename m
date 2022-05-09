Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10B5184A
	for <linux-staging@lists.linux.dev>; Mon,  9 May 2022 04:03:52 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r192so6799564pgr.6
        for <linux-staging@lists.linux.dev>; Sun, 08 May 2022 21:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9A+y9PDcYTV+3BDPkG669L0FMzhgV70cq1ARje3fkgs=;
        b=ksd9ARsI3qJYy0rsMGtM+GlMmr6fF4WTlfAo6BkfpqSWODocWLfDIFGQiHWfXDNesa
         x0Zvb581p38O6K010tGvMk2/fiWue0HtffDLgW3baH/AuRHleUYeQ1kRII8vMhNkQh6i
         Q6w5E0+PaeEimsqXdEr/bHv2Arctt7hWlzCSkuKrR4DfBmlFRS7/x1PqaIQRXhjKzeNK
         qFn7jinXxKyOEqdz9SmsCfHtfQxWfgnlgV0Ueyyk/j/w+JHpdj9+04lRPNRDrHtjsxyJ
         DhCRVcvAM/zDk/oNBvlxYuyGov9n9eBKmxCHVTu4PL6I8L3uF9GTDGaMOtDOyIgtRocC
         gPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9A+y9PDcYTV+3BDPkG669L0FMzhgV70cq1ARje3fkgs=;
        b=G3kISoP2nYbia4znHK4xoAeOb3Hhw5X3X6WIkwDkphP8KKTxBpBV4rheMsZEX94815
         WTjwq5/Lb8enfITUA3Z2WwqBa8juZNXXhgn8gguJCxAUhPDoDICb+uRk632IZWopqYer
         MebrY8pUFl4hMNZmLcEN/9fJbstQvn1QPmc5Xzhs6+Zn1EsZETVxD7FLyurDIBLZv7HW
         ieghOhn0ov/Nj9HwqA3is2OFDmNGcox65PqgjR89I534y3m7ve8cYXSsa8YOnh8QUpJ6
         cFYF3taYeUfTgDK1RJYHxVZ1MGenxvUIeh26fZA6C+oyk+HDArNhYYPn86DZgyh6bW5B
         O/VQ==
X-Gm-Message-State: AOAM5324VFJStopPkmiEgKTEMa62KF3Tagfd1BIxn6DRx10ADLeyJXaS
	M385O6lbXILnF+cP24Dwfn0=
X-Google-Smtp-Source: ABdhPJxPSgTLOZ7OBkDAcwGVk/u+rQl6cEGFHuruWNSl7RVobicSRPu349vCetXpJ+IaSuxHOtBW9Q==
X-Received: by 2002:aa7:8888:0:b0:50f:2e7a:76b7 with SMTP id z8-20020aa78888000000b0050f2e7a76b7mr14301355pfe.48.1652069032230;
        Sun, 08 May 2022 21:03:52 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id w12-20020a17090aea0c00b001d9e3b0e10fsm11289877pjy.16.2022.05.08.21.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 21:03:51 -0700 (PDT)
Date: Mon, 9 May 2022 12:03:48 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: rtl8712: fix uninit-value in
 r871xu_drv_init()
Message-ID: <20220509040348.57f3nbudn2izodqw@ppc.localdomain>
References: <cover.1651760402.git.wanngchenng@gmail.com>
 <14c3886173dfa4597f0704547c414cfdbcd11d16.1651760402.git.wanngchenng@gmail.com>
 <46b89616-5ec7-fb04-f561-2647efd968c4@gmail.com>
 <20220506113320.gc6zryhm7uqnbva5@ppc.localdomain>
 <a5483e41-b5f7-d86b-21b9-2a9c3e602855@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5483e41-b5f7-d86b-21b9-2a9c3e602855@gmail.com>

On 22/05/06 03:02PM, Pavel Skripkin wrote:
> Hi Wang,
> 
> On 5/6/22 14:33, Wang Cheng wrote:
> > On 22/05/06 10:41AM, Pavel Skripkin wrote:
> > > Hi Wang,
> > > 
> > > On 5/6/22 06:16, Wang Cheng wrote:
> > > 
> > > [snip]
> > > 
> > > > > Reported-and-tested-by:
> > > syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com
> > > > Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
> > > > ---
> > > >   drivers/staging/rtl8712/usb_intf.c | 6 +++---
> > > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > diff --git a/drivers/staging/rtl8712/usb_intf.c
> > > b/drivers/staging/rtl8712/usb_intf.c
> > > > index ee4c61f85a07..50dcd3ecb685 100644
> > > > --- a/drivers/staging/rtl8712/usb_intf.c
> > > > +++ b/drivers/staging/rtl8712/usb_intf.c
> > > > @@ -538,13 +538,13 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
> > > >   		} else {
> > > >   			AutoloadFail = false;
> > > >   		}
> > > > -		if (((mac[0] == 0xff) && (mac[1] == 0xff) &&
> > > > +		if ((!AutoloadFail) ||
> > > > +		    ((mac[0] == 0xff) && (mac[1] == 0xff) &&
> > > >   		     (mac[2] == 0xff) && (mac[3] == 0xff) &&
> > > >   		     (mac[4] == 0xff) && (mac[5] == 0xff)) ||
> > > >   		    ((mac[0] == 0x00) && (mac[1] == 0x00) &&
> > > >   		     (mac[2] == 0x00) && (mac[3] == 0x00) &&
> > > > -		     (mac[4] == 0x00) && (mac[5] == 0x00)) ||
> > > > -		     (!AutoloadFail)) {
> > > > +		     (mac[4] == 0x00) && (mac[5] == 0x00))) {
> > > 
> > > 
> > > That looks ugly. I mean mac checks. Can we, please, use sane kernel API like
> > > is_valid_ether_addr()?
> > 
> > Good idea! But will is_valid_ether_addr() check a larger range?
> > The comment of is_valid_ether_addr()(include/linux/etherdevice.h) says:
> >    Check that the Ethernet address (MAC) is not 00:00:00:00:00:00, is not
> >    a *multicast address*, and is not FF:FF:FF:FF:FF:FF.
> > 
> 
> I am not good an expert at networking stuff, but can multicast mac address
> be valid for purpose of Wi-Fi adapter? IIUC it's can't, but as I said
> before, I am not an expert

Me neither. :P I found some reference here:
https://en.wikipedia.org/wiki/Multicast_address#Ethernet

And in the implementation of
is_multicast_ether_addr()(include/linux/etherdevice.h), it checks one
bit of mac address to determine a multicast or not.

Probably some other kernel API could help.

thanks,
- w


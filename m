Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744CB807
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 11:57:06 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id p6so6827119pjm.1
        for <linux-staging@lists.linux.dev>; Fri, 06 May 2022 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QFEKTm3c/3DmlDrhE1ib/HKhjnKpS26QMeK/Vh3TqOw=;
        b=neOpOS03v4zvqDco6290dPcCpeZ9nA6siiN5SvxDBv5EiCUzLEtayElhYJCeQ5rECW
         KlxzIgqOfg0cX2+C1cvlsdsscKP0lGkA+heOh9pISozYz6ayM7+vksRIxrRfJXkEuOta
         CL1j/o4fx1+HMi1EPGxGt+dNyEoB+G76tgmdxBHgWOKKUY0fAF6xa/MJjtpyAdB/T6l5
         w69T3lUXTqPnxw9VIWUruTyCgZ88+7GVkBEkGE62SQgBQIEmiwz7MiLlMQl5i8mCjQDU
         X/J8apuU+M9Bytrz78ayolSq4DFPaB8x3/HSTWW8rg3n+1qcynVtk6NneqSUecZ55l9c
         a0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QFEKTm3c/3DmlDrhE1ib/HKhjnKpS26QMeK/Vh3TqOw=;
        b=RRk7R+Uns9ZKUAz+9jAT8NaWEKJMaDtj2w5rR6qvIU5Rl/x8TciYnAzNctaDayObW6
         dLSAtDdgEtoILUZMWd9mLTfvDHLbrTEh3awsKu0IYk+zsYYm9udhjYywR92H/Kp+KXYb
         yRd2bUdEDOHoPqJUNfaHEAPV9j12ZbIINFBGqi6xAk17Vtmwd4aRCKFUr4iYax9hkg6z
         Q3AiV65CPs7FRt5k74xCDwtO5P0lkjiOipNSK1/u44s604gHfXUykC6/pEtDwSzXvTF7
         JCflZi6jypxxrZ7KzVBT+hW5U9DCVMe48mpU2MHHdNyv6Gy7y2zhCl8AX2WmKMKlzt28
         eMQQ==
X-Gm-Message-State: AOAM533LBF5Bkj4Rurb4H8BcCY5Gm8Aulll6GA+ixgWtAhO6W0WHzEs0
	4WydauifIM7SLz24ruVRBNo=
X-Google-Smtp-Source: ABdhPJyGYYGy+SoZMbeVzpvs2C3ES+/XktW1UbrWBLIjcJukzKKs5gzS9+Jn1MTsJ+bz7GsypNhEdw==
X-Received: by 2002:a17:902:7888:b0:15e:be95:516b with SMTP id q8-20020a170902788800b0015ebe95516bmr3239742pll.104.1651838225813;
        Fri, 06 May 2022 04:57:05 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id y15-20020a170902b48f00b0015e8d4eb211sm1516274plr.91.2022.05.06.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 04:57:05 -0700 (PDT)
Date: Fri, 6 May 2022 19:56:57 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: rtl8712: fix uninit-value in
 r871xu_drv_init()
Message-ID: <20220506115657.vmowparwv5pcq2yy@ppc.localdomain>
References: <cover.1651760402.git.wanngchenng@gmail.com>
 <14c3886173dfa4597f0704547c414cfdbcd11d16.1651760402.git.wanngchenng@gmail.com>
 <46b89616-5ec7-fb04-f561-2647efd968c4@gmail.com>
 <20220506113320.gc6zryhm7uqnbva5@ppc.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506113320.gc6zryhm7uqnbva5@ppc.localdomain>

On 22/05/06 07:33PM, Wang Cheng wrote:
> On 22/05/06 10:41AM, Pavel Skripkin wrote:
> > Hi Wang,
> > 
> > On 5/6/22 06:16, Wang Cheng wrote:
> > 
> > [snip]
> > 
> > > 
> > > Reported-and-tested-by: syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com
> > > Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
> > > ---
> > >   drivers/staging/rtl8712/usb_intf.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
> > > index ee4c61f85a07..50dcd3ecb685 100644
> > > --- a/drivers/staging/rtl8712/usb_intf.c
> > > +++ b/drivers/staging/rtl8712/usb_intf.c
> > > @@ -538,13 +538,13 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
> > >   		} else {
> > >   			AutoloadFail = false;
> > >   		}
> > > -		if (((mac[0] == 0xff) && (mac[1] == 0xff) &&
> > > +		if ((!AutoloadFail) ||
> > > +		    ((mac[0] == 0xff) && (mac[1] == 0xff) &&
> > >   		     (mac[2] == 0xff) && (mac[3] == 0xff) &&
> > >   		     (mac[4] == 0xff) && (mac[5] == 0xff)) ||
> > >   		    ((mac[0] == 0x00) && (mac[1] == 0x00) &&
> > >   		     (mac[2] == 0x00) && (mac[3] == 0x00) &&
> > > -		     (mac[4] == 0x00) && (mac[5] == 0x00)) ||
> > > -		     (!AutoloadFail)) {
> > > +		     (mac[4] == 0x00) && (mac[5] == 0x00))) {
> > 
> > 
> > That looks ugly. I mean mac checks. Can we, please, use sane kernel API like
> > is_valid_ether_addr()?
> 
> Good idea! But will is_valid_ether_addr() check a larger range?
> The comment of is_valid_ether_addr()(include/linux/etherdevice.h) says:
>   Check that the Ethernet address (MAC) is not 00:00:00:00:00:00, is not
>   a *multicast address*, and is not FF:FF:FF:FF:FF:FF.

is_zero_ether_addr() in etherdevice.h could check the all zero mac address.

thanks,
- w

> 
> 
> > 
> > 
> > >   			mac[0] = 0x00;
> > >   			mac[1] = 0xe0;
> > >   			mac[2] = 0x4c;
> > 
> > 
> > 
> > 
> > With regards,
> > Pavel Skripkin

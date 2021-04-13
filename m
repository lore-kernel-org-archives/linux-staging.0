Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAD471
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 19:16:31 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id m3so20705093edv.5
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 12:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9xf1wLVtPu9Zk3yz9b1zQKjHk/P+wvnd7XhLJ0yC6es=;
        b=Zncs0TN23yrSzTaPvrBFChlUVx1HjcJPLR8NChBb/jDZZGOg6t8OvJHrAGm6kjU8sq
         LnHYPcra4duY9H7Fqog6T3H5eXgfgiGQMueiJb3eCLf+h+p1o5ew5SNEajtDrvoSjAyF
         Gh1DUqQH+2wA/MqDRlhwqLHp07IyuQiEH/mTwryu/8nMMVdxm75zlvA4KhlGuVmqt66p
         Od0pWQ3iSASaJOwW9U4pMBvv1ekq9iF33ZNtTgZIxxURBr7+tB173sTo/s0azKFgiDQP
         OVETxPCMvxZ+it0F78Z/zve45xO+2NZxTPUgCm67pKF1VmQvmSOcp8tSFkk5+Np1b1sl
         tqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9xf1wLVtPu9Zk3yz9b1zQKjHk/P+wvnd7XhLJ0yC6es=;
        b=QXp9q5WKbFWiwLIBPptGlvv86BKafJkGt8V6RpZ4QAJcfIVzI+4/xO7LgLBiETnUfk
         mW1bgmMsVQvtLYb1T5zecvr27qr+mrwea2SFrXcgYCECvNHNlep6JMYbc8g2vw/j3ERm
         61RBQjJr/005b/Cy3/VXyQRzgTr98e/Khrn6zq93bWHUbveYt0Clrp6Qry4d87W0eReM
         uUcCimtmGEhmJIo5tQ2QdNZklRgPWa5fRMYOZAb6wDnGCj2wI7NHUDEGH5ryOVQj3gmw
         r5rgDog/403EV6kaFuO8bTFiG22haBHEr9IptnO6Yc1Y3k7x9oPuVQO0hJ45AWjWyioG
         npxw==
X-Gm-Message-State: AOAM53073PDtOCqtl2b0keGhGTcqmMPYXKEfUYjl00bFVRPMPTkeG6pi
	lHuKtoFY9tlXinBKgA31+MM=
X-Google-Smtp-Source: ABdhPJzFianhSC5sr+o9dmwZ2I5EawsgZ6v7nPiWWQ1ArVnHrZXADp+4WY2HR88736DXrY7pdbDaFg==
X-Received: by 2002:a05:6402:5203:: with SMTP id s3mr37095202edd.79.1618341389914;
        Tue, 13 Apr 2021 12:16:29 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id n13sm4856475ejx.27.2021.04.13.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:16:29 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, outreachy-kernel@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] :staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Tue, 13 Apr 2021 21:16:28 +0200
Message-ID: <2400087.QbMOWSuNhY@linux.local>
In-Reply-To: <alpine.DEB.2.22.394.2104132056470.14108@hadrien>
References: <20210413155908.8691-1-fmdefrancesco@gmail.com> <4666345.5ezhEZ0rgB@linux.local> <alpine.DEB.2.22.394.2104132056470.14108@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Tuesday, April 13, 2021 8:57:20 PM CEST Julia Lawall wrote:
> On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > On Tuesday, April 13, 2021 8:20:50 PM CEST Dan Carpenter wrote:
> > > On Tue, Apr 13, 2021 at 06:47:06PM +0200, Fabio M. De Francesco 
wrote:
> > > > On Tuesday, April 13, 2021 6:27:17 PM CEST Julia Lawall wrote:
> > > > > On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > > > > > On Tuesday, April 13, 2021 6:04:16 PM CEST Julia Lawall wrote:
> > > > > > > On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > > > > > > > Removed the led_blink_hdl() function (declaration,
> > > > > > > > definition,
> > > > > > > > and
> > > > > > > > caller code) because it's useless. It only seems to check
> > > > > > > > whether
> > > > > > > > or
> > > > > > > > not a given pointer is NULL. There are other (simpler)
> > > > > > > > means
> > > > > > > > for
> > > > > > > > that
> > > > > > > > purpose.
> > > > > > > > 
> > > > > > > > Signed-off-by: Fabio M. De Francesco
> > > > > > > > <fmdefrancesco@gmail.com>
> > > > > > > > ---
> > > > > > > > 
> > > > > > > >  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 1 -
> > > > > > > >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9
> > > > > > > >  ---------
> > > > > > > >  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
> > > > > > > >  3 files changed, 11 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > > > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > > > > > > > 0297fbad7bce..4c44dfd21514 100644
> > > > > > > > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > > > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > > > @@ -150,7 +150,6 @@ static struct cmd_hdl wlancmds[] = {
> > > > > > > > 
> > > > > > > >  	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
> > > > > > > >  	GEN_MLME_EXT_HANDLER(sizeof(struct 
SetChannelPlan_param),
> > > > > > > >  	set_chplan_hdl) /*59*/>
> > > > > > > > 
> > > > > > > > -	GEN_MLME_EXT_HANDLER(sizeof(struct 
LedBlink_param),
> > > > > > 
> > > > > > led_blink_hdl)
> > > > > > 
> > > > > > > > /*60*/
> > > > > > > 
> > > > > > > This is worrisome.  Doyou fully understand the impact of
> > > > > > > this?
> > > > > > > If
> > > > > > > not,
> > > > > > > the change is probably not a good idea.
> > > > > > 
> > > > > > This is that macro definition:
> > > > > > 
> > > > > > #define GEN_MLME_EXT_HANDLER(size, cmd) {size, cmd},
> > > > > > 
> > > > > > struct C2HEvent_Header {
> > > > > > 
> > > > > > #ifdef __LITTLE_ENDIAN
> > > > > > 
> > > > > >         unsigned int len:16;
> > > > > >         unsigned int ID:8;
> > > > > >         unsigned int seq:8;
> > > > > > 
> > > > > > #else
> > > > > > 
> > > > > >         unsigned int seq:8;
> > > > > >         unsigned int ID:8;
> > > > > >         unsigned int len:16;
> > > > > > 
> > > > > > #endif
> > > > > > 
> > > > > >         unsigned int rsvd;
> > > > > > 
> > > > > > };
> > > > > > 
> > > > > > It's a bit convoluted with regard to my experience. Probably I
> > > > > > don't
> > > > > > understand it fully, but it seems to me to not having effects
> > > > > > to
> > > > > > the
> > > > > > code where I removed its use within core/rtw_cmd.c.
> > > > > > 
> > > > > > What am I missing?
> > > > > 
> > > > > It seems that the function is being put into an array.  Probably
> > > > > someone
> > > > > expects to find it there.  Probably you have shifted all of the
> > > > > functions that come afterwards back one slot so that they are all
> > > > > in
> > > > > the wrong places.
> > > > > 
> > > > > julia
> > > > 
> > > > Thanks for your explanation. Obviously this implies that the
> > > > function
> > > > cannot be removed, unless one fill the slot that is deleted by to
> > > > not
> > > > calling this macro at the right moment.
> > > > 
> > > > I also suppose that providing a function pointer with a NULL value
> > > > wouldn't work either.
> > > 
> > > It would work.  That array is full of NULL function pointers.
> > 
> > Interesting, thanks.
> > 
> > I'm going to remove that function and replace its name in the macro
> > with a NULL function pointer.
> > 
> > I couldn't believe it would work when I wrote about that.
> 
> Have you checked that a value of NULL in that place is going to have the
> same effect as the function?
>
No, I have not, but perhaps is not relevant.

I want to give to the macro the name of an empty function that I define in 
the same header where there the prototype of led_blink_hdl() is defined 
now: something like "u8 empty_function { return 0; }"

Can it work
What do you think about it?

Fabio
> 
> julia





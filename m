Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824C771
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 18:30:44 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id bx20so19395532edb.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=99F53NVNWQBwxX1Mzz0xGwNtjs0DyLQjl7oHgfB7e+8=;
        b=Wva5nn9YWOZ7JK0xjBRFO6MIIoiOkmo+5WiqG5rmc9rc4vuYeRPW/Zi5S0Jd/ZbB4H
         uJ7XuXAoEtyvXMcHKFksOg+wGCBRrzeCAP9o1RMaC9cH28dCOFgGHtyZM1IAABNhxtOm
         Pd0GOz26XFK7UmEhGEbPqbtNlDALmhVnJEm6ZFBVmYlRKbbuhzefr360TMbaRzR74aMx
         ue/I84hF+zVXSL6Fdiq6HSK8QPt65kcCgPUE3Q/RIlaf9v0qpDxIgjuM7fDAAQpHl29I
         XqlBqrARrqOAZ1RL3gWe1rhvQZtgCTL8XrmeRgMLu7yz+YXhdmvt4EZxHmgoQs+gbu8y
         d8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=99F53NVNWQBwxX1Mzz0xGwNtjs0DyLQjl7oHgfB7e+8=;
        b=VlEWtQrezT8qQNkjfQN5esh7vX3PBBvAHmkihAHU0RGq500yYPYKdbfXVu+ksvPMFx
         lLK0rjydK4doZ4S3RdjYj9G9EDr6+6ma9IP1kO1q+vwQVAr4CUGTGPrzjrl1nw6GFwX0
         nfYNQIKxFT3+T7x1KA+i4Rgc6yw15I1/86BZqAvC2l9JaRh8TM9Rjeegv0pWIFpZMQkS
         X91ErJNg/49FmPdrYiarmQUYcQV89WWbPVcICChUwZHfjxbYKjxJiLZ0WWHsWquoihfs
         cFi5mx58o7WhG1IuB+BYeiouZSy9daRMs1MfiqMqpd/KYgFLY05O2wQmuMgs0mkGE4p0
         Odcw==
X-Gm-Message-State: AOAM533t5NqdvuEgzh7UfTlKvsGjBTmF7zPWyho2LH5Mla1BEQ4a+UTR
	qSI7kYvNGa8vLfUL3dKJg9o=
X-Google-Smtp-Source: ABdhPJy47WwQ5xWba4QPGSm3CH7izt0aWMyUyHG1rPlziXO6exjus11KkmyZgF6Yym7Y1NIcbJ0EQA==
X-Received: by 2002:aa7:db9a:: with SMTP id u26mr35975916edt.292.1618338642983;
        Tue, 13 Apr 2021 11:30:42 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id i5sm374101edv.68.2021.04.13.11.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 11:30:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy-kernel@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] :staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Tue, 13 Apr 2021 20:30:41 +0200
Message-ID: <4666345.5ezhEZ0rgB@linux.local>
In-Reply-To: <20210413182050.GJ6021@kadam>
References: <20210413155908.8691-1-fmdefrancesco@gmail.com> <3381109.TaO10cqo9c@linux.local> <20210413182050.GJ6021@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, April 13, 2021 8:20:50 PM CEST Dan Carpenter wrote:
> On Tue, Apr 13, 2021 at 06:47:06PM +0200, Fabio M. De Francesco wrote:
> > On Tuesday, April 13, 2021 6:27:17 PM CEST Julia Lawall wrote:
> > > On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > > > On Tuesday, April 13, 2021 6:04:16 PM CEST Julia Lawall wrote:
> > > > > On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > > > > > Removed the led_blink_hdl() function (declaration, definition,
> > > > > > and
> > > > > > caller code) because it's useless. It only seems to check
> > > > > > whether
> > > > > > or
> > > > > > not a given pointer is NULL. There are other (simpler) means
> > > > > > for
> > > > > > that
> > > > > > purpose.
> > > > > > 
> > > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > > > ---
> > > > > > 
> > > > > >  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 1 -
> > > > > >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
> > > > > >  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
> > > > > >  3 files changed, 11 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > > > > > 0297fbad7bce..4c44dfd21514 100644
> > > > > > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > @@ -150,7 +150,6 @@ static struct cmd_hdl wlancmds[] = {
> > > > > > 
> > > > > >  	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
> > > > > >  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param),
> > > > > >  	set_chplan_hdl) /*59*/>
> > > > > > 
> > > > > > -	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param),
> > > > 
> > > > led_blink_hdl)
> > > > 
> > > > > > /*60*/
> > > > > 
> > > > > This is worrisome.  Doyou fully understand the impact of this? 
> > > > > If
> > > > > not,
> > > > > the change is probably not a good idea.
> > > > 
> > > > This is that macro definition:
> > > > 
> > > > #define GEN_MLME_EXT_HANDLER(size, cmd) {size, cmd},
> > > > 
> > > > struct C2HEvent_Header {
> > > > 
> > > > #ifdef __LITTLE_ENDIAN
> > > > 
> > > >         unsigned int len:16;
> > > >         unsigned int ID:8;
> > > >         unsigned int seq:8;
> > > > 
> > > > #else
> > > > 
> > > >         unsigned int seq:8;
> > > >         unsigned int ID:8;
> > > >         unsigned int len:16;
> > > > 
> > > > #endif
> > > > 
> > > >         unsigned int rsvd;
> > > > 
> > > > };
> > > > 
> > > > It's a bit convoluted with regard to my experience. Probably I
> > > > don't
> > > > understand it fully, but it seems to me to not having effects to
> > > > the
> > > > code where I removed its use within core/rtw_cmd.c.
> > > > 
> > > > What am I missing?
> > > 
> > > It seems that the function is being put into an array.  Probably
> > > someone
> > > expects to find it there.  Probably you have shifted all of the
> > > functions that come afterwards back one slot so that they are all in
> > > the wrong places.
> > > 
> > > julia
> > 
> > Thanks for your explanation. Obviously this implies that the function
> > cannot be removed, unless one fill the slot that is deleted by to not
> > calling this macro at the right moment.
> > 
> > I also suppose that providing a function pointer with a NULL value
> > wouldn't work either.
> 
> It would work.  That array is full of NULL function pointers.
> 
Interesting, thanks.

I'm going to remove that function and replace its name in the macro with a 
NULL function pointer.

I couldn't believe it would work when I wrote about that.

Thanks a lot,

Fabio
>
> regards,
> dan carpenter




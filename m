Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE1772
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 16:47:09 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id mh2so5464967ejb.8
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 09:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PPrRY59PSM3yh1tKzKnDdwXXNAeLcHdKyiHLS4Gj0hA=;
        b=PWc+O58bUAq/kMKopVybp8PnVvTQooI+TmUFcMtKNxZToh6H59xzyXWGeWkVeN6dOQ
         4ZXH8yBZsuEiv/KzeLynhpQouNAN0t4LHnPMpsW5fcTPSPi9r0ybW+jcPx8pftEqM/6v
         FWpO/yxes1F9i9ZNMcPJVyJXl/4vCASSa8LinvIXP2cl9J+pWueBjZjblMhS5OCG807k
         G914OIPOC/U8+BdFOTYm8BvSSGsLxQ/QGMvGcxrALARS3cwxHN2Vsg+wmOetdDMNFlKf
         HqYDX6KOlw1RAyVZMiava4gZFPB2OW6tgPXOI6f33e/TFbItHYpIllphVTMZfO/oZryf
         +/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPrRY59PSM3yh1tKzKnDdwXXNAeLcHdKyiHLS4Gj0hA=;
        b=dPODyoTH3Pt3f7TQ3fRDBJmANKYALmA2Kz/gooil80BdaHxOvVTuyUSTEAnw/RDdgC
         XBsGAMDWV6Bg6lNz0gUuJOo5UD38huS0TCmEMeyoOEb/kKxLspHv3DyJK3+tVQL7PuV5
         CoRi4RYIQsKvm/7MpJlIJdr0hVlxNTlOswH4uBnFl5RAaP74o5LTBv5WkG9VNn+deZs3
         RKZqDlpOX9xpjxOtVVS7iA09rdVm3zjnsuosSwiDQSMsdDOw2yytAL5aVExkbUohW1P6
         hdTFFkwFL4qqZr08csZFgE3aIpXA+wr6ARDE7fAVd4F+eRaAGB7ZLnaCYYRYBpu4AjeR
         eXTA==
X-Gm-Message-State: AOAM532UPzbaoVH/VFzRS5CkNOCknXJ4Lz6mL9PkzHsiZHh7m2PDhs+g
	h4XQrLCzciMMzj2W5f1KHXc=
X-Google-Smtp-Source: ABdhPJz0gemxtEUhkyNn+0UOr/2CuNn6V/jLhexji8Boak1pkWkg0uu9NyPIsR+dKLLzEGf9b7Bqow==
X-Received: by 2002:a17:906:29cf:: with SMTP id y15mr8381481eje.500.1618332427687;
        Tue, 13 Apr 2021 09:47:07 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id j6sm9549653edw.73.2021.04.13.09.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:47:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy-kernel@googlegroups.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] :staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Tue, 13 Apr 2021 18:47:06 +0200
Message-ID: <3381109.TaO10cqo9c@linux.local>
In-Reply-To: <alpine.DEB.2.22.394.2104131826160.8430@hadrien>
References: <20210413155908.8691-1-fmdefrancesco@gmail.com> <1843649.8FsqevVC75@linux.local> <alpine.DEB.2.22.394.2104131826160.8430@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Tuesday, April 13, 2021 6:27:17 PM CEST Julia Lawall wrote:
> On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > On Tuesday, April 13, 2021 6:04:16 PM CEST Julia Lawall wrote:
> > > On Tue, 13 Apr 2021, Fabio M. De Francesco wrote:
> > > > Removed the led_blink_hdl() function (declaration, definition, and
> > > > caller code) because it's useless. It only seems to check whether
> > > > or
> > > > not a given pointer is NULL. There are other (simpler) means for
> > > > that
> > > > purpose.
> > > > 
> > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > ---
> > > > 
> > > >  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 1 -
> > > >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
> > > >  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
> > > >  3 files changed, 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > > > 0297fbad7bce..4c44dfd21514 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > @@ -150,7 +150,6 @@ static struct cmd_hdl wlancmds[] = {
> > > > 
> > > >  	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
> > > >  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param),
> > > >  	set_chplan_hdl) /*59*/>
> > > > 
> > > > -	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param),
> > 
> > led_blink_hdl)
> > 
> > > > /*60*/
> > > 
> > > This is worrisome.  Doyou fully understand the impact of this?  If
> > > not,
> > > the change is probably not a good idea.
> > 
> > This is that macro definition:
> > 
> > #define GEN_MLME_EXT_HANDLER(size, cmd) {size, cmd},
> > 
> > struct C2HEvent_Header {
> > 
> > #ifdef __LITTLE_ENDIAN
> > 
> >         unsigned int len:16;
> >         unsigned int ID:8;
> >         unsigned int seq:8;
> > 
> > #else
> > 
> >         unsigned int seq:8;
> >         unsigned int ID:8;
> >         unsigned int len:16;
> > 
> > #endif
> > 
> >         unsigned int rsvd;
> > 
> > };
> > 
> > It's a bit convoluted with regard to my experience. Probably I don't
> > understand it fully, but it seems to me to not having effects to the
> > code where I removed its use within core/rtw_cmd.c.
> > 
> > What am I missing?
> 
> It seems that the function is being put into an array.  Probably someone
> expects to find it there.  Probably you have shifted all of the functions
> that come afterwards back one slot so that they are all in the wrong
> places.
> 
> julia
>
Thanks for your explanation. Obviously this implies that the function 
cannot be removed, unless one fill the slot that is deleted by to not 
calling this macro at the right moment. 

I also suppose that providing a function pointer with a NULL value wouldn't 
work either.

OK, h2c_msg_hdl() cannot be deleted.

Thanks,

Fabio
  





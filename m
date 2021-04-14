Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C06D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:25:01 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id ba6so24877686edb.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FJgpVpnm59KDS8nnKfjN27Nq3KwrEWqv8OFg6Lc4YJw=;
        b=ZgcjIvGgXnZrjotUEbeEHSlhNMutTh2BNSvbuTopkKY8r7G3Yc2o5Aka5ZSzThp/Ic
         x+KYKBnWmRQgpkx6N3PTTF+5fqK7UEpyUuFFQkRgHUx22cZZ8DdcnpeR5npwtJm0f8zo
         9lBMt7QXIIjBL0PeTVxF2t9Xmz3ezKEToR4goabJzF7WoLQjC+t3CDTu6z6J7/LIxrVe
         d/S386LaiOGR2lTV9mSe9AKkqXoonXf6V5KtdLEQmAd4NdNP6umneNMyhqdaNWYY+i7h
         GGBSMpL7fVh54Eby4hfzf0qbfZD98fzLLzsu6IgfpDIPhMK5TaDlexwJdD69mq68yxkW
         rSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FJgpVpnm59KDS8nnKfjN27Nq3KwrEWqv8OFg6Lc4YJw=;
        b=ZR5Gjcgbp/Pt3DEUPwH8Nqa1MGJG7B9lza9vN0x7kIu3FjXeGNOQ7maspgUdyUucAv
         mVjUHFQeDckt9coVfa9+SQ7kD9UlYWliRs2YFiNB5B5At5YTudlALoiiSZTtnaT4yTG5
         r8wV0sjgYQFDpkeQ6/9DesJVkQLw4dN2eG09Vem9HV8OOdA57/EkLUMIcHx0wjft1H9D
         jBoekOo2Zq7fvU03mdkP4ZfwZmEYUfKU5SLyb0XVvvT3270UJsndMW7+umH01+ae7S+U
         AIBoZPglix/2SDASlF3dKl3ImgJBtYwRRR/Y+14BVhRJYOw5W/Xd4WDVIDP0+8Bwbdj9
         2ZTQ==
X-Gm-Message-State: AOAM533tRfIALaVUbQMHk9iuZduRvLAeZbzDlV3JZt4JDhifI/MwRU5Z
	070UUn4yCSA34x2NbOFmiBQ=
X-Google-Smtp-Source: ABdhPJwcfsVDj6JXMsjkgrz5PpPpYcJgWaqp6S9WoNZZ8u39YQ8ObqA+XYrUrTunr3VGUCINwL/zeA==
X-Received: by 2002:a50:c004:: with SMTP id r4mr253319edb.192.1618424699994;
        Wed, 14 Apr 2021 11:24:59 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id ws15sm186274ejb.38.2021.04.14.11.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:24:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Wed, 14 Apr 2021 20:24:58 +0200
Message-ID: <3820176.uhjs84E3K9@linux.local>
In-Reply-To: <7427098.3VjF5iJQtU@linux.local>
References: <20210414162614.14867-1-fmdefrancesco@gmail.com> <YHcs70RdhaBBZv0i@kroah.com> <7427098.3VjF5iJQtU@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, April 14, 2021 8:05:59 PM CEST Fabio M. De Francesco wrote:
> On Wednesday, April 14, 2021 7:57:03 PM CEST Greg Kroah-Hartman wrote:
> > On Wed, Apr 14, 2021 at 08:48:09PM +0300, Dan Carpenter wrote:
> > > On Wed, Apr 14, 2021 at 07:00:41PM +0200, Greg Kroah-Hartman wrote:
> > > > On Wed, Apr 14, 2021 at 06:26:14PM +0200, Fabio M. De Francesco
> 
> wrote:
> > > > > Removed useless led_blink_hdl() prototype and definition. In
> > > > > wlancmds[]
> > > > > the slot #60 is now set to NULL using the macro
> > > > > GEN_MLME_EXT_HANDLER. This change has not unwanted side effects
> > > > > because the code in rtw_cmd.c checks if the function pointer is
> > > > > valid before using it.
> > > > > 
> > > > > Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > > > > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > > ---
> > > > > 
> > > > > Changes since v1: Corrected a bad solution to this issue that
> > > > > made
> > > > > use of an unnecessary dummy function.
> > > > > 
> > > > >  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
> > > > >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
> > > > >  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
> > > > >  3 files changed, 1 insertion(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > > > > 0297fbad7bce..f82dbd4f4c3d 100644
> > > > > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > @@ -150,7 +150,7 @@ static struct cmd_hdl wlancmds[] = {
> > > > > 
> > > > >  	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
> > > > >  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param),
> > > > >  	set_chplan_hdl) /*59*/> > >
> > > > > 
> > > > > -	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param),
> > > > > led_blink_hdl) /*60*/ +	GEN_MLME_EXT_HANDLER(0, NULL) /
*60*/
> > > > 
> > > > Better, but you really do not need to keep this here, right? 
> > > > Remove
> > > > the
> > > > "led blink command" entirely, you didn't do that here.
> > > 
> > > No, this is right.  We have to put a NULL function pointer in the
> > > array
> > > or the indexing will be off.  But Fabio is correct that the struct
> > > type should be removed.
> > 
> > The indexing can be off, just remove the other place where the
> > "command"
> > is in the index and all is good as rebuilding will fix it.  These are
> > not external "values" we have to keep stable.
> > 
> > This has been done for other drivers exactly like this, there are loads
> > of "odd" commands in there that should not be.
> > 
> > thanks,
> > 
> > greg k-h
> 
> I'm not sure if this task is so close related to deserve a v3 or if I
> should make a new v1 patch with a different "Subject".
> 
> Thanks,
> 
> Fabio
I'll make a v3 series, submitting this patch again (as 1/2) and adding the 
above-mentioned changes in another one (as 2/2).

Fabio



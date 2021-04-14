Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90316D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:06:02 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u21so32785401ejo.13
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T7wAnr/gJYaABznT6fzPw36DcxU7yZSqfUQF8WwNLo8=;
        b=EwzB6QAacn/mbirKbhS1czQH4EG6r34NUMNKPmtniN48MdVyipYWQfnfs/3K4GkqtK
         wgzAdqi7/47/LHooFNvulal0JLYFNFcUyzi3cE9uxslaLg4GRneHlWejzcSFA/8uOgKf
         7BJv3WTxITqE2KjvG+CI+L+2ICa48LiHJ6WQRazeL+FIzMvScWMUw/ROioTt0uV+lJhN
         e+TYdFpGl6MAc4OUO6hr0rMkMgwj9w0mY5qY3U4mKkNMMDL+AuTxvDBgp+QCoV1uAw6M
         4oT/kq7j76zZA0MMdFMVtP/DHYzNmW8Rpdgs8sqKQ287hEO+Z9tGTlk2NVFPVYM76xAF
         bojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T7wAnr/gJYaABznT6fzPw36DcxU7yZSqfUQF8WwNLo8=;
        b=qz0oHg1rJGbOwWGUhpjx2jqVNwje6h4HvD8EsaFXUpeL/rTEcXzxhFOHhkDwmcMT2r
         G06n5WBgceN/UC5Qn0F/mjYrVZVKy1MroXY+KEurQrig0p9VyX5mPPgUy5QWvQzYyf/z
         uaBLoKDm4+sLdrbCMsSDr1TqNrejl/g34pbGNskGhBS+8hOPaheVa/0aFP0+GpsRxJtK
         jBOZ+TaYXi/PoGUQwmD9XvCIH4RlcFRdvIrP0LtMhrDCK5zJtW6r25rlRfxosoh0V/Hw
         mYobOiJpnYksHa9UysdlQDLh4e1wT2WNoXnUkAw74oHXLpL2mh51vJgEML1cSf/nENXY
         PcKA==
X-Gm-Message-State: AOAM533J+KpkvArEuZoR9h8xWNYqyBN8oT8BD2OH27ZGEADwDNWm7jZn
	Ymz/rT+JquTKI2vkHNK2IOg=
X-Google-Smtp-Source: ABdhPJz7jRQXrsM9+YGvwXMSpxqKfK538x0frrzj4SwPexIDJ2Bnn6nczDa6RNYuyvPUlz/G8u394w==
X-Received: by 2002:a17:906:f759:: with SMTP id jp25mr140120ejb.228.1618423561145;
        Wed, 14 Apr 2021 11:06:01 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id t1sm254377eds.53.2021.04.14.11.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:06:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [Outreachy kernel] [PATCH v2] staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Wed, 14 Apr 2021 20:05:59 +0200
Message-ID: <7427098.3VjF5iJQtU@linux.local>
In-Reply-To: <YHcs70RdhaBBZv0i@kroah.com>
References: <20210414162614.14867-1-fmdefrancesco@gmail.com> <20210414174809.GX6021@kadam> <YHcs70RdhaBBZv0i@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, April 14, 2021 7:57:03 PM CEST Greg Kroah-Hartman wrote:
> On Wed, Apr 14, 2021 at 08:48:09PM +0300, Dan Carpenter wrote:
> > On Wed, Apr 14, 2021 at 07:00:41PM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Apr 14, 2021 at 06:26:14PM +0200, Fabio M. De Francesco 
wrote:
> > > > Removed useless led_blink_hdl() prototype and definition. In
> > > > wlancmds[]
> > > > the slot #60 is now set to NULL using the macro
> > > > GEN_MLME_EXT_HANDLER. This change has not unwanted side effects
> > > > because the code in rtw_cmd.c checks if the function pointer is
> > > > valid before using it.
> > > > 
> > > > Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > > > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > ---
> > > > 
> > > > Changes since v1: Corrected a bad solution to this issue that made
> > > > use of an unnecessary dummy function.
> > > > 
> > > >  drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
> > > >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 ---------
> > > >  drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
> > > >  3 files changed, 1 insertion(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > > > 0297fbad7bce..f82dbd4f4c3d 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > @@ -150,7 +150,7 @@ static struct cmd_hdl wlancmds[] = {
> > > > 
> > > >  	GEN_MLME_EXT_HANDLER(0, h2c_msg_hdl) /*58*/
> > > >  	GEN_MLME_EXT_HANDLER(sizeof(struct SetChannelPlan_param),
> > > >  	set_chplan_hdl) /*59*/> > > 
> > > > -	GEN_MLME_EXT_HANDLER(sizeof(struct LedBlink_param),
> > > > led_blink_hdl) /*60*/ +	GEN_MLME_EXT_HANDLER(0, NULL) /*60*/
> > > 
> > > Better, but you really do not need to keep this here, right?  Remove
> > > the
> > > "led blink command" entirely, you didn't do that here.
> > 
> > No, this is right.  We have to put a NULL function pointer in the array
> > or the indexing will be off.  But Fabio is correct that the struct
> > type should be removed.
> 
> The indexing can be off, just remove the other place where the "command"
> is in the index and all is good as rebuilding will fix it.  These are
> not external "values" we have to keep stable.
> 
> This has been done for other drivers exactly like this, there are loads
> of "odd" commands in there that should not be.
> 
> thanks,
> 
> greg k-h
I'm not sure if this task is so close related to deserve a v3 or if I 
should make a new v1 patch with a different "Subject".

Thanks,

Fabio





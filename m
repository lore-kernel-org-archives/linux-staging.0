Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC83C72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 10:30:22 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id f8so11527962edd.11
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x3r2FyLHyY3w2SLbIC95IxoZj7WakC/+ymJzKCDyFVo=;
        b=IF/DORTrw1iddbeufjNoavKZSL4pP53ubatlXQ7IGCwxjq3FE64a3JJPA1huLYvKwT
         WXTOA7cdsQA9Q4TVFQz7zRkZsxWrvjTAWzbmMfdLym7n1xYQ1nJOjDRXPipEHXQab3nL
         jsbR6UD5CndtKfZe9TYJfaaAMNFz5EDly5AMUmixX2P3ohFjyQ3gV8ZWO8DjCEY/EQrV
         B0w+xTTxz9aCgddXvwQQXPocbf++gL1nn9ZtzXx/FnmNFFLEA0DSoPIZTig+8h51G1+F
         HCwpdmNYza7efmpRLAkCTg+cKRCNPxWb1LAKfCwp1RSsHpQ7g+fHAXB3OpjyJhEFEGaI
         X5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x3r2FyLHyY3w2SLbIC95IxoZj7WakC/+ymJzKCDyFVo=;
        b=nyB78WMO4bV3PY7kPRxTBp+0PE8TNyByA7I/dO3cJWMCf1Kg7rxbtocJDMPRdOEvR3
         qpsbyWzU9TLuhBNpNpWoQ6n5vbP2y4QzKu9d/Zk4tTxodpco+z2/I6sHOgtGzUtOrjeS
         PKV0r02fxs0IwmDORrmx840zw3C9vpqy5c/Uz6dP3k3qgoJT8QZy+3L9g38YvuNB7jJO
         kwBAt5hygl9y76wpYA/BNMK8fO082lztkMjRaAN8UkojC1fLwcDyaBwGSV9jWK4a0Upa
         vw0a4hiX7hNG4Du58fssH3ZpCJEWg8+sF/B9pxCo1Z0JdnFDnkTZGZRhyMT4rneq/P59
         mYbg==
X-Gm-Message-State: AOAM530FoJXfJKZcEqvvQA1UKask2b1svQec539F47IDWqC1C/nGTCZD
	ldEEUatKkR8rrjQ/wqWwEvOqe17x1ndbwrWw
X-Google-Smtp-Source: ABdhPJxoIfJKouP2d4+1Rsnw5/pBAJEIPg7uLRuGFyUMaBpdSseXfXnhEBJwgq+OhEXoEO6qSNyS6A==
X-Received: by 2002:aa7:dcc7:: with SMTP id w7mr24482602edu.255.1618137021184;
        Sun, 11 Apr 2021 03:30:21 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id ay3sm4499894edb.2.2021.04.11.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 03:30:20 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v3 4/4] staging: rtl8723bs: core: Change a controlling expression
Date: Sun, 11 Apr 2021 12:30:19 +0200
Message-ID: <4476737.Uq5WOKsIPT@localhost.localdomain>
In-Reply-To: <alpine.DEB.2.22.394.2104111209230.2854@hadrien>
References: <20210411082908.31876-1-fmdefrancesco@gmail.com> <3322597.vpUxb0oOqP@localhost.localdomain> <alpine.DEB.2.22.394.2104111209230.2854@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Sunday, April 11, 2021 12:10:17 PM CEST Julia Lawall wrote:
> On Sun, 11 Apr 2021, Fabio M. De Francesco wrote:
> > On Sunday, April 11, 2021 11:51:32 AM CEST Julia Lawall wrote:
> > > On Sun, 11 Apr 2021, Fabio M. De Francesco wrote:
> > > > On Sunday, April 11, 2021 11:26:41 AM CEST Julia Lawall wrote:
> > > > > On Sun, 11 Apr 2021, Fabio M. De Francesco wrote:
> > > > > > Change a controlling expression within an 'if' statement: don't
> > > > > > compare
> > > > > > with 'true'.
> > > > > > 
> > > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > > > ---
> > > > > > 
> > > > > > Changes from v2: Rewrite subject in patch 0/4; remove a patch
> > > > > > from
> > > > > > the
> > > > > > series because it had already been applied (rtl8723bs: core:
> > > > > > Remove
> > > > > > an
> > > > > > unused variable). Changes from v1: Fix a typo in subject of
> > > > > > patch
> > > > > > 1/5,
> > > > > > add patch 5/5.>
> > > > > > 
> > > > > >  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > > > > > 32079e0f71d5..600366cb1aeb 100644
> > > > > > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > > > @@ -1507,7 +1507,7 @@ static void
> > > > > > rtw_lps_change_dtim_hdl(struct
> > > > > > adapter *padapter, u8 dtim)>
> > > > > > 
> > > > > >  	if (pwrpriv->dtim != dtim)
> > > > > >  	
> > > > > >  		pwrpriv->dtim = dtim;
> > > > > > 
> > > > > > -	if ((pwrpriv->fw_current_in_ps_mode == true) && (pwrpriv-
> > > > >
> > > > >pwr_mode >
> > > > >
> > > > > > PS_MODE_ACTIVE)) { +	if ((pwrpriv->fw_current_in_ps_mode) 
&&
> > > > > > (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
> > > > > 
> > > > > The parentheses in the left argument of && can be dropped as
> > > > > well.
> > > > 
> > > > What about the parentheses of the right argument? I'm not sure:
> > > > does
> > > > '>'
> > > > have precedence over '&&'? Doesn't it?
> > > 
> > > On the right they are not actually needed either:
> > So, I remembered well :)
> > 
> > > https://en.cppreference.com/w/c/language/operator_precedence
> > 
> > Very nice table. Thanks for the link.
> > 
> > > But you could look around in the code and see what people typically
> > > do.
> > > Perhaps one might find the parentheses more clear when there is a
> > > binary
> > > operator.  But when there is no binary operator, they could be more
> > > confusing than useful.
> > 
> > When I look around in the code I see a lot of unnecessary parentheses.
> > What people typically do is not always the right thing. I prefer to
> > remove parentheses where they are redundant.
> 
> Not sure I was clear.  This driver seems to be very enthusiastic about
> parentheses.  But perhaps check in other more mature parts of the
> kernel.
>
Sorry, I thought you were specifically referring to that file.

I've run "grep" in ./kernel/locking and others mature parts of Linux. 
You're right: experienced authors use parentheses when there are binary 
operators. Therefore, I'll leave that right hand argument as is within 
parentheses.

Thanks again,

Fabio
> 
> julia
> 
> > Thanks for your kind help,
> > 
> > Fabio
> > 
> > > julia
> > > 
> > > > Thanks,
> > > > 
> > > > Fabio
> > > > 
> > > > > julia
> > > > > 
> > > > > >  		u8 ps_mode = pwrpriv->pwr_mode;
> > > > > >  		
> > > > > >  		rtw_hal_set_hwreg(padapter, 
HW_VAR_H2C_FW_PWRMODE,
> > > > 
> > > > (u8
> > > > 
> > > > > >  		*)(&ps_mode));
> > > > > > 
> > > > > > --
> > > > > > 2.31.1
> > > > > > 
> > > > > > --
> > > > > > You received this message because you are subscribed to the
> > > > > > Google
> > > > > > Groups "outreachy-kernel" group. To unsubscribe from this group
> > > > > > and
> > > > > > stop receiving emails from it, send an email to
> > > > > > outreachy-kernel+unsubscribe@googlegroups.com. To view this
> > > > > > discussion
> > > > > > on the web visit
> > > > > > https://groups.google.com/d/msgid/outreachy-kernel/202104110829
> > > > > > 08.3
> > > > > > 187
> > > > > > 6-5-fmdefrancesco%40gmail.com.





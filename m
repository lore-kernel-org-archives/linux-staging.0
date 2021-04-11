Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138071
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 10:08:59 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id s15so11499122edd.4
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 03:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPjVxr4EIDFwGpM/pEVhF+9F+zdLzGbV3PZiyToJD2U=;
        b=WqbuNhCh0fY6MMNk9U5CNX9k65sqsEs+LaBSID9sUmImFN8fUkN4bI5MY2AAH1A2u2
         ueulFAAqg0B0kWJcXJfEthNPdYyJ8JLNHMyjprdho/N5pC//PJfTuptbq5JoLk2QeTfH
         7yaQoryxNUsOor4UD16UVLy+Cv9hDYcAjR5Vr5qH+5+c7d38S/QDOhgE/MfwblulCTDb
         BQIz1E+OfGpNzOl72UEPOANnkPrIIVg0bTAcb46TwYkCtbPVIbZjFeljcamFO5vubB7v
         4/Yfw3+f/eAI7lkvrhYHC5ZBmd2cCt2HJrXiKdVew2bTLVA1toDjVRIj5ydf3cKNLPF2
         e4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPjVxr4EIDFwGpM/pEVhF+9F+zdLzGbV3PZiyToJD2U=;
        b=lhpUDHMuZW9ZokRpnw/Ho31xgcGWZ1pqOlkUmh4XTxqVFgXaeXx5gpQKPJUs/1jRNG
         7afUqDaUBktWaucmti2Tiw0QteaYshn/Y4lmqC1l+OMx36VcUv/V6JaisQXfwzeTeRWk
         R0zL8RzDHluxil+/IUC0nIjzuPDgtn+X47YQJKaYfZ6INrFHazydRBj3O24B2U2wH1kH
         /F+n/Jy0/7imhZl2qbd0zVpQZRxiv4Ot5dZe225DDpJwgWBSLRXc4vY70d85v53jOyhv
         wNvZnYT5ryVmL6LvPhSTTbehiDDU/sjKTt0FxW8IvzaxJpfNdMkCIijF9MqClVorCbsA
         u+JA==
X-Gm-Message-State: AOAM532wPCagTcyyzCbSZy6OV7yfhoFCvBbrknBPNU0OzeNIwtH8vi3O
	xvGELe+1WZaPIZ8adi/ddO0=
X-Google-Smtp-Source: ABdhPJz97lHWbkc06MstpRcgdrd0lXAVxZ9yz5NPRWF5SBnk5w0id0Q5CdD1zxojPzVZUCxTAk58CA==
X-Received: by 2002:aa7:cb90:: with SMTP id r16mr25432046edt.139.1618135738097;
        Sun, 11 Apr 2021 03:08:58 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id r17sm4479772edt.70.2021.04.11.03.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 03:08:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Julia Lawall <julia.lawall@inria.fr>, Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v3 4/4] staging: rtl8723bs: core: Change a controlling expression
Date: Sun, 11 Apr 2021 12:08:56 +0200
Message-ID: <3322597.vpUxb0oOqP@localhost.localdomain>
In-Reply-To: <alpine.DEB.2.22.394.2104111150010.2854@hadrien>
References: <20210411082908.31876-1-fmdefrancesco@gmail.com> <2796632.fryDJISotm@localhost.localdomain> <alpine.DEB.2.22.394.2104111150010.2854@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Sunday, April 11, 2021 11:51:32 AM CEST Julia Lawall wrote:
> On Sun, 11 Apr 2021, Fabio M. De Francesco wrote:
> > On Sunday, April 11, 2021 11:26:41 AM CEST Julia Lawall wrote:
> > > On Sun, 11 Apr 2021, Fabio M. De Francesco wrote:
> > > > Change a controlling expression within an 'if' statement: don't
> > > > compare
> > > > with 'true'.
> > > > 
> > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > ---
> > > > 
> > > > Changes from v2: Rewrite subject in patch 0/4; remove a patch from
> > > > the
> > > > series because it had already been applied (rtl8723bs: core: Remove
> > > > an
> > > > unused variable). Changes from v1: Fix a typo in subject of patch
> > > > 1/5,
> > > > add patch 5/5.>
> > > > 
> > > >  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > > > 32079e0f71d5..600366cb1aeb 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > > > @@ -1507,7 +1507,7 @@ static void rtw_lps_change_dtim_hdl(struct
> > > > adapter *padapter, u8 dtim)>
> > > > 
> > > >  	if (pwrpriv->dtim != dtim)
> > > >  	
> > > >  		pwrpriv->dtim = dtim;
> > > > 
> > > > -	if ((pwrpriv->fw_current_in_ps_mode == true) && (pwrpriv-
> > >
> > >pwr_mode >
> > >
> > > > PS_MODE_ACTIVE)) { +	if ((pwrpriv->fw_current_in_ps_mode) &&
> > > > (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
> > > 
> > > The parentheses in the left argument of && can be dropped as well.
> > 
> > What about the parentheses of the right argument? I'm not sure: does
> > '>'
> > have precedence over '&&'? Doesn't it?
> 
> On the right they are not actually needed either:
>
So, I remembered well :)
> 
> https://en.cppreference.com/w/c/language/operator_precedence
> 
Very nice table. Thanks for the link.
>
> But you could look around in the code and see what people typically do.
> Perhaps one might find the parentheses more clear when there is a binary
> operator.  But when there is no binary operator, they could be more
> confusing than useful.
>
When I look around in the code I see a lot of unnecessary parentheses. 
What people typically do is not always the right thing. I prefer to remove 
parentheses where they are redundant.

Thanks for your kind help,

Fabio
>
> julia
> 
> > Thanks,
> > 
> > Fabio
> > 
> > > julia
> > > 
> > > >  		u8 ps_mode = pwrpriv->pwr_mode;
> > > >  		
> > > >  		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE,
> > 
> > (u8
> > 
> > > >  		*)(&ps_mode));
> > > > 
> > > > --
> > > > 2.31.1
> > > > 
> > > > --
> > > > You received this message because you are subscribed to the Google
> > > > Groups "outreachy-kernel" group. To unsubscribe from this group and
> > > > stop receiving emails from it, send an email to
> > > > outreachy-kernel+unsubscribe@googlegroups.com. To view this
> > > > discussion
> > > > on the web visit
> > > > https://groups.google.com/d/msgid/outreachy-kernel/20210411082908.3
> > > > 187
> > > > 6-5-fmdefrancesco%40gmail.com.





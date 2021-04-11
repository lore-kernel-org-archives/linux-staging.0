Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD471
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 09:47:17 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id hq27so15333676ejc.9
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XozUfb+e6qIS1vLWDOC/iivsBt2km9C9PhK3hcJC5xs=;
        b=KvOXvRRngaPQLi1Wz6ip5Jc8rllLF5JlsreEs3+v7nMaU5leW6KWcbStR988uW2GmT
         KUs5Cpe19ZPUxZEnXdbYu4LclbHf0YNPT2QCAYW4GAzG8ZDU8ypx9dRTVqXVN0SD2fC3
         OYuZiMgIZTt/xma4C5XcW3IGa0QzG5YioJATc971N4LKg+5vlwjz9VidukGDRGVnQ+N2
         NksxzXV5Knx5oyfc5PHEI4WbCOfW1xn7Eu3ODnaW/NqpPKLNWJC/7VHK2I5LTu78Uwqt
         0RR3ZFujbta/hYWBPjNQA5AutlSRfmOaGlHkv/IMkJg6pq9ZV4i3cKC9zv9Za0TSZbUP
         m90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XozUfb+e6qIS1vLWDOC/iivsBt2km9C9PhK3hcJC5xs=;
        b=B1JFgIXBtorEdnZfUgMmCAcwmgzZO57z9Z3cjSOF27/wVSCBcMnJH0hXs8mpPqtqw1
         DFjXF3krVDZw8qdFdibHJeQU2jCUPAnSv3V94tde49mD9cATU5iNAvqqBkOBzEUsA9vp
         mymCvFe1ris6NzFlVjI4vhYwwCfyVADyN7v3w64PM+v8RjDHjeFKRZNeW0yZo7zD9ozO
         LF6P2Lz0HnhVD5vnQ2Nhf5d7slMeWNa8O0KIFlKEslAcks1IL43KfOi8O2PBhVhorhke
         V23RlqBzG0IKe/nBvt/ndG00dHIpbbdy/PXg6efcLOxlLjMj7pYuUMHKOuxayLkZDOxn
         Yhpw==
X-Gm-Message-State: AOAM531pCvBEs5mlJ7fTG9MEArMSitnssxZaXtZVryvUFnAwD4osMu3M
	AaKLnqRnTxd3ajusyeab8ek=
X-Google-Smtp-Source: ABdhPJzxZsDnB2LWupjebkZy0TBiTrvjEYgK0OszcrcofKiF3wDjGlP9n010S5BYHaS7VDBwTfApsg==
X-Received: by 2002:a17:906:5052:: with SMTP id e18mr17901882ejk.112.1618134436229;
        Sun, 11 Apr 2021 02:47:16 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id by25sm3817951ejc.49.2021.04.11.02.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 02:47:15 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v3 4/4] staging: rtl8723bs: core: Change a controlling expression
Date: Sun, 11 Apr 2021 11:47:14 +0200
Message-ID: <2796632.fryDJISotm@localhost.localdomain>
In-Reply-To: <alpine.DEB.2.22.394.2104111125310.2854@hadrien>
References: <20210411082908.31876-1-fmdefrancesco@gmail.com> <20210411082908.31876-5-fmdefrancesco@gmail.com> <alpine.DEB.2.22.394.2104111125310.2854@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="US-ASCII"

On Sunday, April 11, 2021 11:26:41 AM CEST Julia Lawall wrote:
> On Sun, 11 Apr 2021, Fabio M. De Francesco wrote:
> > Change a controlling expression within an 'if' statement: don't compare
> > with 'true'.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> > Changes from v2: Rewrite subject in patch 0/4; remove a patch from the
> > series because it had already been applied (rtl8723bs: core: Remove an
> > unused variable). Changes from v1: Fix a typo in subject of patch 1/5,
> > add patch 5/5.> 
> >  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > b/drivers/staging/rtl8723bs/core/rtw_cmd.c index
> > 32079e0f71d5..600366cb1aeb 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> > @@ -1507,7 +1507,7 @@ static void rtw_lps_change_dtim_hdl(struct
> > adapter *padapter, u8 dtim)> 
> >  	if (pwrpriv->dtim != dtim)
> >  	
> >  		pwrpriv->dtim = dtim;
> > 
> > -	if ((pwrpriv->fw_current_in_ps_mode == true) && (pwrpriv-
>pwr_mode >
> > PS_MODE_ACTIVE)) { +	if ((pwrpriv->fw_current_in_ps_mode) &&
> > (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
> The parentheses in the left argument of && can be dropped as well.
>
What about the parentheses of the right argument? I'm not sure: does '>' 
have precedence over '&&'? Doesn't it?

Thanks,

Fabio
> 
> julia
> 
> >  		u8 ps_mode = pwrpriv->pwr_mode;
> >  		
> >  		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, 
(u8
> >  		*)(&ps_mode));
> > 
> > --
> > 2.31.1
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group. To unsubscribe from this group and
> > stop receiving emails from it, send an email to
> > outreachy-kernel+unsubscribe@googlegroups.com. To view this discussion
> > on the web visit
> > https://groups.google.com/d/msgid/outreachy-kernel/20210411082908.3187
> > 6-5-fmdefrancesco%40gmail.com.





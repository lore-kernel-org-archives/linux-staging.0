Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4F072
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 10:58:09 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id e14so12498928ejz.11
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 03:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ROe54EUBS6P//owdgw5fvBq4o0Vbjcf9ONg8ZiEC+os=;
        b=QGIDmy/MbbCxMi8OtpIcLiJBG46rpIFqpY1JqEwRByZcGputTvmqvObU6M5TmJbu6D
         V1/K5QxzbfTggCV5bjIucPNFkTsc6lNpLyjgVDqKlw3jfk1Tc5eoGD9XU+Qy0gONAA6D
         6MKvdfhFsubvfFIaubsyrYzXaPYxhbOBwuvf480odfET7yBoy8c0BwYNPlwh1zHCi3TJ
         N1zFBJb3UDJ/xccJ9wyC6Z8G8VcmZbOLLqjJs9/X5glX/D2Kq49b3FnAmSSWEFlHyVQa
         VJBjZ+Nmznnw5IYe4U9D/j8xa7e7c8m8iY8LvGICTuiqy+CBwibAY2uN2Egr5dDBWGKV
         Nhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ROe54EUBS6P//owdgw5fvBq4o0Vbjcf9ONg8ZiEC+os=;
        b=LfQGvpvB3N34BE6aITpN0rXcQyzOjE8I4HgS7KnP9tNKcOCLK7XXBhI/Fnw5tjmOr7
         475xQbl/4eKRFjxWgj94CuA9HoB2y8Jawp5CVsFjcmph7NMz2c2kuMNb0564q1+/D8i0
         kLpXEN/1ZIqE3Pg20Rv0zLNuap1R+67S3gAjXbkeK2VgA4Ai8PvJxANB53RECd9oc6wz
         SCisbIp7I82QahRsUHmK/xCyFMEoMi5nK80L/977OjHYE+mfQ6w1hYYmguSlMKHp3NoJ
         Ehn2TVvO8bBrSj2SRjTiihpmoBUdpJjWM8SwFUzgTO7rVTgku0NADHI05kGeGlCUZx40
         3lgw==
X-Gm-Message-State: AOAM531lBtt4xglfh99qlZtiOgu0NvooVDBQ5s9SSlhm0yFh0qixcZJh
	wJjrDALYkoxEFByZWGn0nx8=
X-Google-Smtp-Source: ABdhPJz7WUiuebRlYYbcJ6ejaylOkB54xBZStfv/5/1khTv4TouHiBHWucJ/sXH+rRAeorYVGxFgvA==
X-Received: by 2002:a17:906:6b05:: with SMTP id q5mr1279198ejr.460.1618052288237;
        Sat, 10 Apr 2021 03:58:08 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id dj8sm2908869edb.86.2021.04.10.03.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 03:58:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, julia.lawall@inria.fr
Subject: Re: [Outreachy kernel] [PATCH 4/4] staging: rtl8723bs: Change the type and use of a variable
Date: Sat, 10 Apr 2021 12:58:06 +0200
Message-ID: <4547533.LBOHeWh67L@localhost.localdomain>
In-Reply-To: <YHF+f48MM6xEEv9R@kroah.com>
References: <20210410092232.15155-1-fmdefrancesco@gmail.com> <24152421.bNubvhIgUM@localhost.localdomain> <YHF+f48MM6xEEv9R@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, April 10, 2021 12:31:27 PM CEST Greg KH wrote:
> On Sat, Apr 10, 2021 at 11:56:48AM +0200, Fabio M. De Francesco wrote:
> > On Saturday, April 10, 2021 11:31:16 AM CEST Greg KH wrote:
> > > On Sat, Apr 10, 2021 at 11:22:32AM +0200, Fabio M. De Francesco 
wrote:
> > > > Change the type of fw_current_in_ps_mode from u8 to bool, because
> > > > it is used everywhere as a bool and, accordingly, it should be
> > > > declared as a bool. Shorten the controlling
> > > > expression of an 'if' statement.
> > > > 
> > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > ---
> > > > 
> > > >  drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
> > > >  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
> > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c
> > > > b/drivers/staging/rtl8723bs/hal/hal_intf.c index
> > > > 96fe172ced8d..8dc4dd8c6d4c 100644
> > > > --- a/drivers/staging/rtl8723bs/hal/hal_intf.c
> > > > +++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
> > > > @@ -348,7 +348,7 @@ void rtw_hal_dm_watchdog(struct adapter
> > > > *padapter)
> > > > 
> > > >  void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
> > > >  {
> > > > 
> > > > -	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode == 
true)
> > 
> > {
> > 
> > > > +	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
> > > > 
> > > >  		if (padapter->HalFunc.hal_dm_watchdog_in_lps)
> > > >  		
> > > >  			padapter-
> > >
> > >HalFunc.hal_dm_watchdog_in_lps(padapter); /* this
> > >
> > > >  			function caller is in interrupt context
> > 
> > */>
> > 
> > > >  	}
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> > > > b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h index
> > > > 0a48f1653be5..0767dbb84199 100644
> > > > --- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> > > > +++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
> > > > @@ -203,7 +203,7 @@ struct pwrctrl_priv {
> > > > 
> > > >  	u8 LpsIdleCount;
> > > >  	u8 power_mgnt;
> > > >  	u8 org_power_mgnt;
> > > > 
> > > > -	u8 fw_current_in_ps_mode;
> > > > +	bool fw_current_in_ps_mode;
> > > > 
> > > >  	unsigned long	DelayLPSLastTimeStamp;
> > > >  	s32		pnp_current_pwr_state;
> > > >  	u8 pnp_bstop_trx;
> > > 
> > > If this is only checked, how can it ever be true?  Who ever sets this
> > > value?
> > 
> > You're right. It is not set, therefore the "if" control expression
> > cannot ever be "true".
> > 
> > Can I delete this statement in a new patch? Or you prefer I send the
> > whole series again with this change in patch 4/4?
> 
> Just delete the variable from the structure entirely and when it is
> used.
>
I've read the code of the function whom that 'if' statement belongs to. 
This function takes a pointer whose name is 'padapter' and this is has 
global scope. I think that since fw_current_in_ps_mode is dereferenced by 
the function adapter_to_pwrctl(padapter) it can and is indeed initialized 
and modified in some other files of the driver.

That's why I'll leave the if statement as is now. If I am wrong there's 
time to change it later in a future patch.

Thanks for your kind review,

Fabio
>
> 
> thanks,
> 
> greg k-h





Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EDA70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:57:03 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id m3so9113447edv.5
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fDz3jvFOwEc4wUnq/2xbNrKI18OHCzs173xEX28V0No=;
        b=n9juL8nY9gtyrFUHl8AS1kpInNH6B86eiKl34oAZg0sZCb4wHZzrwnXJoDXGziJ1Db
         szYD4zY6bXgb0M0MWmCwo4b14h1wO5vNMAIAryFxDb5ZVZJJhCrOPDX0tXz//g6b6001
         H1jbg4fuZ9mdBLSuzA995ZQJL9sYUBT1g/7n7+W3e6Qpen/c063j8vmrdaVuoLH54vR3
         SLU80W38bsAg71MGPUKQdoxHfIrRNFg0cFd20WljCqQpoFLgQo/S/l/dQmgIHLvTwHXG
         4COg+t5Fy3ClyxhwBVOnR+YO0+dtH+SBN+EooKwZGBuJcjG82/XY0gzkbLsujU1KLr54
         X2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fDz3jvFOwEc4wUnq/2xbNrKI18OHCzs173xEX28V0No=;
        b=NDJGKSWYX2MnXinZR/8i4tKqOYo5wtFpJrDC1Al1KzPlX3dCmxQskoTadhoPXA/HED
         ijj9Y7v0TuMOiOlPI0m7qeQVHK4lV8JLao0SJ7meGhlnqP7TJJcMfEvSEYp3TSUACvHT
         Y9Zf7CDUK3d/9vAR0e7DnvSQPlCLuqIlENW343ki8GRfXwZFAlp8fL7yz05gSpy9IRtX
         ZrUguVrJULh8FBGE13q3qnI564zNRhCfnu34D/s3RsjoYicov/GbpEQXjMZnmOZKW7TK
         BOsexLn6Ox4WjMU+qyPU7bu5/YOqbNjuB2B+ooCLItUxvADvkQdgpJRw6D9/QlxE6kAV
         GT5w==
X-Gm-Message-State: AOAM532N/X9RHvTa/iJGkZl3ve+N7eJID+TAL7c8eRfGzzWPue2Cg0zS
	gykDXtdxrDYrHK/R5WIzqkg=
X-Google-Smtp-Source: ABdhPJwT0iXEVb/nTfcFvPgwg9YHCbHDcmSAfIYIR8OFR5s9iznlhxDvGpw8wJWcGuVZl5b4PeGg/w==
X-Received: by 2002:a50:bb05:: with SMTP id y5mr18490755ede.384.1618041422174;
        Sat, 10 Apr 2021 00:57:02 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id x24sm2708176edr.36.2021.04.10.00.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 00:57:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [Patch 0/3]
Date: Sat, 10 Apr 2021 09:57:00 +0200
Message-ID: <2101069.1PIH1tPmJ7@localhost.localdomain>
In-Reply-To: <YHFT2S31kFy72DMv@kroah.com>
References: <6552860.D8CPca6BT0@localhost.localdomain> <YHFT2S31kFy72DMv@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, April 10, 2021 9:29:29 AM CEST Greg KH wrote:
> On Fri, Apr 09, 2021 at 06:29:59PM +0200, Fabio M. De Francesco wrote:
> > This patch series removes camelcases, changes the type and use of a
> > variable, and correct misspelled words.
> > 
> > Patch 1/3: staging: rtl8723bs: Remove camelcase in several files
> > 
> > drivers/staging/rtl8723bs/core/rtw_cmd.c       |  2 +-
> > drivers/staging/rtl8723bs/core/rtw_mlme.c      |  2 +-
> > drivers/staging/rtl8723bs/core/rtw_pwrctrl.c   | 18 +++++++++---------
> > drivers/staging/rtl8723bs/hal/hal_intf.c       |  2 +-
> > drivers/staging/rtl8723bs/hal/rtl8723b_dm.c    |  6 +++---
> > .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  2 +-
> > drivers/staging/rtl8723bs/hal/sdio_ops.c       | 14 +++++++-------
> > .../staging/rtl8723bs/include/rtw_pwrctrl.h    |  2 +-
> > 8 files changed, 24 insertions(+), 24 deletions(-)
> > 
> > Patch 2/3: staging: rtl8723bs: Change the type and use of a variable
> > 
> > drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
> > 
> >  drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > Patch 3/3: staging: rtl8723bs: include: Fix misspelled words in
> > comments
> > 
> > .../rtl8723bs/include/Hal8192CPhyReg.h        |  8 ++---
> > 
> >  .../staging/rtl8723bs/include/basic_types.h   |  2 +-
> >  drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
> >  drivers/staging/rtl8723bs/include/hal_com.h   |  2 +-
> >  .../staging/rtl8723bs/include/hal_com_reg.h   | 34 +++++++++----------
> >  drivers/staging/rtl8723bs/include/hal_data.h  |  2 +-
> >  .../staging/rtl8723bs/include/hal_pwr_seq.h   |  2 +-
> >  drivers/staging/rtl8723bs/include/rtw_cmd.h   |  6 ++--
> >  drivers/staging/rtl8723bs/include/rtw_mlme.h  | 18 +++++-----
> >  .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
> >  drivers/staging/rtl8723bs/include/rtw_mp.h    |  2 +-
> >  .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  2 +-
> >  drivers/staging/rtl8723bs/include/rtw_recv.h  |  4 +--
> >  drivers/staging/rtl8723bs/include/rtw_xmit.h  |  2 +-
> >  drivers/staging/rtl8723bs/include/sta_info.h  |  2 +-
> >  drivers/staging/rtl8723bs/include/wifi.h      |  2 +-
> >  16 files changed, 46 insertions(+), 46 deletions(-)
> > 
> > Fabio M. De Francesco
> 
> I have no idea how you created this patch series, but I do not think it
> worked well :(
> 
> Please use our standard tools, that do this all for you automatically,
>
Apart from the fact that I forgot to save the subject, I didn't know that 
there are standard tools for doing Patch 0/N. Therefore I thought to make  
an email message that contained the information about the patch series.

I was wrong, sorry. I have to research this topic in the git manual or 
somewhere else.

Thanks,

Fabio
>
> and send them out in a series of emails that have a proper subject line
> (look at what you used here...) and are properly "threaded".
> 
> thanks,
> 
> greg k-h





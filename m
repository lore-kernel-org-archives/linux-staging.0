Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE78D259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 22:25:47 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id mj7-20020a17090b3687b029014d162a65b6so1050517pjb.2
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F/7g2yV6C0TwPD0bZdc4Di1ysJWXNJ5iWAZlkKHzvSA=;
        b=nL1c30ebIdWauZnz3Lpr2bZvGu96omS5WWVM+2LqIZG9rDqd27Ib5sNh6Ddc23E81u
         9VqfUx7Amwv1TGw16o5cAG1wuOY0j1C0xcmiYAqduOSPegj1ke/PJWOYHYMueygFZXog
         MJ0iC8dyi3RSlRLtOSRJc5iO4mH8iXC1aeDWsafr+2bQnYaV/rKQZ0lO+acaEBE0hTYK
         /3A9FrwOmn0bmN3Wno2l3Saev8ArzwzU7ApaAbTsRbIO2mL7stLhEdQwI4c+0zHlqK0j
         Vd+9szex07PUeKZNSi7bk7E4BrQxMC5KYRO5IhcaI3th+dpVLkHnft324AGn15atPtJg
         o30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F/7g2yV6C0TwPD0bZdc4Di1ysJWXNJ5iWAZlkKHzvSA=;
        b=FvynLVITdjSV6FjnaA+62VnBmr2I37zIlhjOZ9hTg+ZdFTDM/E0ZJLHKp90iT0dsnD
         cBR3ePNOHQqnjNIX2mBPluoABbca3yBNEV8DEW6x9tuPVRnUiKClZblK/wZmhUKf6eyM
         rOnlTOiYeAjnrz6gOt+M1SQDChYrnZHmUtR/JOcGZnChH90W5mZe6RT26x3faVUCLhxn
         ZS6WYQjb26u4P/QjtVH3bkztXGzYXXf1XRjQdOgHCwFx1AxXqC1QCJNvUue/COspJI1p
         bbXFqoN/Lev0aClo0aUuyBW5r1ng/tLlmdGmagH1SGvUwMjKSGLyAmGWcYB401gwPHdb
         wjcQ==
X-Gm-Message-State: AOAM531TbEbdvgLbKGycjieClnlpn9gU21/3gDT3Mdb/jbEKgMlB8crN
	6i5Tyx0iJb6B4R2q0CWKRbM=
X-Google-Smtp-Source: ABdhPJztRI1GKQ6cBjL7nuv43wzB8EfdESuPd2pfW2tM0FExBRveKn68qybiF6350Z5puzNTFR4GrQ==
X-Received: by 2002:a17:90b:3615:: with SMTP id ml21mr23515091pjb.72.1617575147253;
        Sun, 04 Apr 2021 15:25:47 -0700 (PDT)
Received: from djbComp (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id bx2sm2327191pjb.32.2021.04.04.15.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 15:25:47 -0700 (PDT)
Date: Sun, 4 Apr 2021 15:25:45 -0700
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, straube.linux@gmail.com,
	unixbhaskar@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] staging: rtl8188eu: replace goto with direct return
Message-ID: <20210404222545.GA7267@djbComp>
References: <20210404054008.23525-1-deborahbrouwer3563@gmail.com>
 <YGmM4FTVZ/FIQ7lj@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGmM4FTVZ/FIQ7lj@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Sun, Apr 04, 2021 at 11:54:40AM +0200, Greg KH wrote:
> On Sat, Apr 03, 2021 at 10:40:08PM -0700, Deborah Brouwer wrote:
> > To conform with Linux kernel coding style, replace goto statement that
> > does no cleanup with a direct return.  To preserve meaning, copy comments
> > from the original goto statement to the return statement.  Identified by
> > the checkpatch warning: WARNING: void function return statements are not
> > generally useful.
> > 
> > Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> > ---
> >  drivers/staging/rtl8188eu/hal/rtl8188e_dm.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c b/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> > index 391c59490718..d21f21857c20 100644
> > --- a/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> > +++ b/drivers/staging/rtl8188eu/hal/rtl8188e_dm.c
> > @@ -139,7 +139,9 @@ void rtw_hal_dm_watchdog(struct adapter *Adapter)
> >  	hw_init_completed = Adapter->hw_init_completed;
> >  
> >  	if (!hw_init_completed)
> > -		goto skip_dm;
> > +		/*  Check GPIO to determine current RF on/off and Pbc status. */
> > +		/*  Check Hardware Radio ON/OFF or not */
> > +		return;
> 
> It does not make sense to have the comments in two places here.  The
> original code is just fine, there's nothing wrong with the goto
> statement here.
> 
> thanks,
> 
> greg k-h

Ok, thanks for this feedback.

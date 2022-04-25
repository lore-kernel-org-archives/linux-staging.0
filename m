Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7DD7C
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 00:37:37 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id a11so2132388pff.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 17:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6WAtvklsUKA06wcIGSL+bg7XAfQhE1gnb2a05Si+7ow=;
        b=PYixxGcobOKST4trI3fsX1WFc0saiM1FlayMiR602AaecPGGhIOBsDHe16GslXv90e
         nyp2/IQXFVRyE1hbcVEo5D8bDFEtSY2YIjb5ITGqEWmhYIRLQUfE8jLK7H8Jy5gcgjAw
         1VwacoE8WQjbzaAuEFjmt+zWQOl0QCKYyKTLYDaF8FTkLWr8xcEQnEAl7z+7PDCRfX9r
         tnPsA+6zLvPuqGRygLlrI2jwno6A2xxBV80JFsjcWK1ruHdrcoYNTZorih+GP+UrolMV
         vIbjSLm9sf2a1B8oSoIXowchZQt3Etz3izbYteO4SzbeBRSbBKy5OsJe9Z4Yo8eLf4Bt
         1d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6WAtvklsUKA06wcIGSL+bg7XAfQhE1gnb2a05Si+7ow=;
        b=Sxvx28kgfCbAvdr4Xd1e9NdLdeQjlzB5zkSG2vqQ8gMwY2pRm0JFYDHRzqp/KiIWX4
         bfRDqSit7fgP/IYrJV6FGhTwZN6Q4COQIZwQ1aKqn7Ks9gYMhvJhzbC48FGyCbHqDoaX
         Fsk+Am4pdEqv302Y9se08NARIrI52EgaMuli+qnwil02sSYVeHXStAvYaOMkDaTcUjm4
         /j2jOsSCUwWhIhn7jCuDwXhqtHxJHTs5IkuIomHzZqg8Ho0CkGDKvs1aRyBrJkwZSgbC
         VS8dZ5IhsIqVcIAoO0nvhBSCYh2s8Tpz+Jdr6K9hRaRonq40wDAMrILr60yIDHEv/rlO
         X1wA==
X-Gm-Message-State: AOAM533EgF8JrJvUkSvmWDPRGyzdiTGlF/C125Us9tNtUols/WJm8kxv
	gfZBr3FF7VAo6V7c8aREqss=
X-Google-Smtp-Source: ABdhPJzg4uTWT2VuhM5YxjZ1Teo1lBnOgjKQUGUsl4L9lLreTWuTMqAsFXXPXiX8QBW7v+VLlY38cw==
X-Received: by 2002:a05:6a00:e0b:b0:4fa:a167:5b35 with SMTP id bq11-20020a056a000e0b00b004faa1675b35mr16267283pfb.69.1650847057156;
        Sun, 24 Apr 2022 17:37:37 -0700 (PDT)
Received: from ArchDesktop ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id b23-20020a17090ae39700b001cd4989ff61sm8856969pjz.40.2022.04.24.17.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 17:37:36 -0700 (PDT)
Date: Mon, 25 Apr 2022 08:37:33 +0800
From: Solomon Tan <wjsota@gmail.com>
To: straube.linux@gmail.com, paskripkin@gmail.com
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] staging: r8188eu: KASAN: slab-out-of-bounds in
 rtw_cmd_thread
Message-ID: <YmXtTeEGVDPrx9d7@ArchDesktop>
References: <67e2d10b-7f0f-9c5a-ce31-376b83ffba9e@gmail.com>
 <YmU+cqEZfrGz5XsT@ArchDesktop>
 <c2296090-2e9b-fafb-35da-e01b025b53b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2296090-2e9b-fafb-35da-e01b025b53b7@gmail.com>

> > > It looks like
> > > commit 0afaa121813e ("staging: r8188eu: use in-kernel ieee channel")
> > > intoduced a. See KASAN output below.
> > > 
> > > That commit replaced the use of struct rtw_ieee80211_channel with struct
> > > ieee80211_channel.
> > > 
> > > There are several calls to memcpy that used sizeof(struct
> > > rtw_ieee80211_channel)
> > > and now use sizeof(struct ieee80211_channel) but the sizes of these two
> > > structures are not equal.
> > > 
> 
> drivers/staging/r8188eu/core/rtw_cmd.c:276: memcpy() call.
> 
> As Michael said the sizes of structures do not mach and the memcpy writes
> below allocated buffer.
> 
Thanks Pavel.

Hi Michael, I could not find the cause of this issue, and I am afraid I
might break even more stuff if I attempt to fix it, so I have submitted
a new patch to revert my changes. Sorry for the inconvenience.

Cheers,
Solomon

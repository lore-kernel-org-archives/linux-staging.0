Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8D173
	for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 09:00:45 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ec55so27568327edb.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RnsSk0IgGqobCFjh6CXIgOm+uV9hEt1QtilnTcttZyE=;
        b=an9esNH1MdcspqVlJT2+7qtVubv9TwaxW5wbCpdg28PCMLm8odmj/YPDk22ynQgcIK
         zCsjj7iLHt4FOSiVvux7xroXdvCETk2lKDvQ25cSx/AE//3D1ewYmi9ZjLX/PluWyzM+
         fKaTvYk33nKY9VMosPwoHUGmH30PLJWSJxouh3I//Q9gSLCe4i8opSufnZJT3UW5tDw7
         NY/CYJhQ8YUfnltpOCgRKH0i3tCjVsFInvgu0GdfGbEM9XaeBRNZrJ5n//18CdabzcSN
         pukTiCBHwppEqLBYpCsniyn7WNoBvWrJ6gzuaq5h6JXRXIo68X2ls0j9ZbnZxJqaazzy
         jH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RnsSk0IgGqobCFjh6CXIgOm+uV9hEt1QtilnTcttZyE=;
        b=QE/hIsujCU71Xm8J2qlWKy3GQ0+yVdg/wOjMVFLnYTumTU7g+osG/As/O1fU0q/reX
         R+NnJxdt4qhXmKGszmeq7hfTnGaMcMed57JrT6lV73LrHH1AjUMpVlTti1PMKDDNoLeg
         yCmFbP3q9YoH4G9uk2Ed5mocV+Ur6tfrsbSRFUmTzkMjFDO+IRl0Un6mWt9nbPdUxNB+
         x0dr1jRiTvKCdqiGOFE3fOgYLDhzrzclUek9QBaUrHJy3EAuy/TXpW/IA1Dv7vPkTqtE
         mpGox10/FeZ8Oj+pzZvDSI9ZxoqRkcZuElgvB6vXubx2hO6rr+Km0DFllixHkTOaPfJT
         OdKA==
X-Gm-Message-State: AOAM531LM5gazx/6T8Nhx/rDraGB+wheTgFQ6AbHQPPHCdgQr24nyCp8
	d0ugsDkcKFBoklRocyhBj5s=
X-Google-Smtp-Source: ABdhPJzrYR3/S9DPB/a902Ci6IaMGVy82Zg4kfZ+HF8RAaQnDa7mfhGmUwRv2rCU6jScDnoj6lzROg==
X-Received: by 2002:aa7:c4d1:: with SMTP id p17mr38992996edr.2.1626771643950;
        Tue, 20 Jul 2021 02:00:43 -0700 (PDT)
Received: from agape.jhs ([5.171.80.77])
        by smtp.gmail.com with ESMTPSA id f18sm6963472ejx.23.2021.07.20.02.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 02:00:43 -0700 (PDT)
Date: Tue, 20 Jul 2021 11:00:36 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
Message-ID: <20210720090035.GB1406@agape.jhs>
References: <20210719224601.255364-1-phil@philpotter.co.uk>
 <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bc43fb0-2dab-190b-c480-9e77cff863d4@lwfinger.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi all,

On Mon, Jul 19, 2021 at 06:46:16PM -0500, Larry Finger wrote:
> On 7/19/21 5:46 PM, Phillip Potter wrote:
> > Move all C source files from the core subdirectory to the root
> > folder of the driver, and adjust Makefile accordingly. The ultmate
> > goal is to remove hal layer and fold its functionalty into the main
> > sources. At this point, the distinction between hal and core will be
> > meaningless, so this is the first step towards simplifying the file
> > layout.
> > 
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >   drivers/staging/rtl8188eu/Makefile            | 34 +++++++++----------
> >   drivers/staging/rtl8188eu/{core => }/rtw_ap.c |  0
> >   .../staging/rtl8188eu/{core => }/rtw_cmd.c    |  0
> >   .../staging/rtl8188eu/{core => }/rtw_efuse.c  |  0
> >   .../rtl8188eu/{core => }/rtw_ieee80211.c      |  0
> >   .../rtl8188eu/{core => }/rtw_ioctl_set.c      |  0
> >   .../staging/rtl8188eu/{core => }/rtw_iol.c    |  0
 > 
> 
> I think this is just source churning. The current setup with include. core.
> hal and os_dep subdirectories are not opressive.
> 
> Larry
> 
> 

maybe the information we will need one day is:

will the core/-os_dep/-hal/-include/-directory-structure be
welcomed in mainline wireless subsystem, when an rtl* driver
will be perfectly tuned?

At the moment I can't see such a directory organization
in any of the realtek wireless driver.

Sure there's time for that ;),

Thank you,

fabio



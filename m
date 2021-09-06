Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A553FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 13:36:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id n39so2911805wms.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BAhGQaiUNFMd0cF59B0SMEJVdU2tWj7S2/LF/UKcv6g=;
        b=RYSOiZFCjTkL418WGcVP8CEyv+CIL2CdD4Mr508ZMphamikcEWmCQYwh2rSgJSpjIj
         R7adpHoBEoteB8/pbIsVPFHdfwKjhMAEQ8Zpi/YujLxueK6V4bjolnfkAZ1KnlyMZez6
         A0r4Cs6ZxfawdLnGEnPiY1iRnYAkxaIQJceBww/0hDtoj8PxdMAXVK1qOz/VO5b/zzbQ
         CqGWUqebJtpfryjTuDyFV7TfNsN6KW9hIyWluZ5qM1rJV/XDF0+LeC6SvnRl224EEW8T
         HL6BXgWe0j32pQZ/DlegkQa6ym5eozBwadSbkxve+gfZ45jinlFvgqEipB+Eb8PycuDV
         WOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BAhGQaiUNFMd0cF59B0SMEJVdU2tWj7S2/LF/UKcv6g=;
        b=d1tWOiyVMHG59t9iON2qZBa984gBl3wpYzCeH7U+26/5fn1rHtUPVTSD9pYVBVxZYL
         gsc0ovOa2W9PSYomZ0hc/FNTTFEfEmddO9W91l5fY1rfl2f5YLsGpjxNrr4guqZqzBD2
         vWhLem6R3jVWTgjv6mDQxzyUi5H8j+838prHwVD24eG0PXL99Xxzm/acYRr6tRprxKJW
         MQwWibafRd9FtcE3oK93FiW0UlIoMGEdIjtqXHJpFmo0iTUh5KS81QqLYHd5m5qoawxa
         J0O8b++/uNMWCpk/XjWgxQw8LryrJCD8hYTKOhJ/qAGTWgFW1d60QAbscFMd3X7iiShn
         s+xA==
X-Gm-Message-State: AOAM5305/ogetkOY8AZzSNc0wIRDkhYl7jZe8YtyqupjD1TZPA6hU+nl
	ru401AMuWy4KK10RoGD/GnEkFA==
X-Google-Smtp-Source: ABdhPJxhQ8DPhLD12SafiRBRfu4OijkIySpx5v+sXRBz4eKpz4sMYsbNfXMKlBllmBy+mdlAHXWmwQ==
X-Received: by 2002:a05:600c:3502:: with SMTP id h2mr11686505wmq.182.1630935409867;
        Mon, 06 Sep 2021 06:36:49 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id q195sm7559994wme.37.2021.09.06.06.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 06:36:49 -0700 (PDT)
Date: Mon, 6 Sep 2021 15:36:43 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mchehab@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 4/8] staging: media: zoran: add debugfs
Message-ID: <YTYZaxjiKzVurMEF@Red>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <20210903191540.3052775-5-clabbe@baylibre.com>
 <YTMJvI1C1OmBgdeI@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YTMJvI1C1OmBgdeI@kroah.com>

Le Sat, Sep 04, 2021 at 07:53:00AM +0200, Greg KH a écrit :
> On Fri, Sep 03, 2021 at 07:15:36PM +0000, Corentin Labbe wrote:
> > Add debugfs for displaying zoran debug and stats information.
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> >  drivers/staging/media/zoran/Kconfig      | 10 ++++++
> >  drivers/staging/media/zoran/zoran.h      |  5 +++
> >  drivers/staging/media/zoran/zoran_card.c | 39 ++++++++++++++++++++++++
> >  3 files changed, 54 insertions(+)
> > 
> > +#ifdef CONFIG_VIDEO_ZORAN_DEBUG
> > +	struct dentry *dbgfs_dir;
> > +	struct dentry *dbgfs_file;
> 
> No need for these, the file is never referenced and the directory can be
> looked up when you want to remove it.
> 
> > +#endif
[...]
> > +#ifdef CONFIG_VIDEO_ZORAN_DEBUG
> > +	zr->dbgfs_dir = debugfs_create_dir(ZR_DEVNAME(zr), NULL);
> > +	zr->dbgfs_file = debugfs_create_file("debug", 0444,
> > +					      zr->dbgfs_dir, zr,
> > +					      &zoran_debugfs_fops);
> > +#endif
> 
> Wait, when are you removing the files when the device is removed?
> 
> That needs to be fixed no matter what before this patch is accepted.
> 

Hello

Sorry to have forgotten this.
I will fix this.

Thanks
Regards

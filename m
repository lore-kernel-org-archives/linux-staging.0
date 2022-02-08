Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DD2F23
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 14:04:56 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id c192so12253772wma.4
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 06:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=B6FmlZTmcDzUzTnzs/ZnYmE51lyCgX2/CWAYd99P97c=;
        b=NRaKMb4NCaHsBJXQvwGqtTS8m1aISo9EPi17EJah39Y03g7CaTHKQott64gc4dVFLo
         Uhdo9cAUaQPQ0mKLYZByUdJh3JLOVDpX7kQzE7v3+1tAY07cyMvHU22MVI4QEiRD51AZ
         tVcbf8e3BnqOM6P7zL5YaFtDr+YDwBLbWzPds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=B6FmlZTmcDzUzTnzs/ZnYmE51lyCgX2/CWAYd99P97c=;
        b=iNqFPZs2l9+5XhKZqsuVI1zAINquzU0rEmlxawAYphacoVgXRRYgI8haLLbfu+JoLK
         ruBgejZ6aq+rEOBMg7xNP2b7Azc3fACYhkfqB/PH8v7EPpOymSM/hyl+9rzhZUsjYhb+
         mPqlQhjJWvR4LQnVR0e9+9JZqs04DOl/oUthJEADQ48YlnOIr1/MPpPqd5QSaKIrxsUk
         e+h1gLnn777osk/QQaTsfj7FpkZZ3HvuKaSyPW1coKdS73/ydg+04YQdWFecKcgVP52E
         FalTeyrTouQ+N30NWg7ULE8Nqufb/uqCJgstI/Kejc+SCiJPQKAAWQQ8dFVqzSlzjlTz
         qMiA==
X-Gm-Message-State: AOAM530z0bzVp26jisVFHKnmW+rhPtv0NXDmT3gaYQN967I8zK/77UPt
	EGAY/YA6+lC1fHdKtKAf18a2kQ==
X-Google-Smtp-Source: ABdhPJy7VKPSMId+XZSUl+UPzsq7hk9qGy4vC8m7UEqCLa/LPu+gRsdppXdPV+QZ5sHxKub1DOQDkQ==
X-Received: by 2002:a05:600c:1506:: with SMTP id b6mr1299950wmg.30.1644329094673;
        Tue, 08 Feb 2022 06:04:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z17sm2262017wml.38.2022.02.08.06.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 06:04:54 -0800 (PST)
Date: Tue, 8 Feb 2022 15:04:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	Daniel Vetter <daniel.vetter@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
	Matthew Wilcox <willy@infradead.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Xiyu Yang <xiyuyang19@fudan.edu.cn>, Zheyu Ma <zheyuma97@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 21/21] fbdev: Make registered_fb[] private to fbmem.c
Message-ID: <YgJ4g2BEaeUELmvF@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	Daniel Vetter <daniel.vetter@intel.com>,
	Helge Deller <deller@gmx.de>, Matthew Wilcox <willy@infradead.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Xiyu Yang <xiyuyang19@fudan.edu.cn>, Zheyu Ma <zheyuma97@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-22-daniel.vetter@ffwll.ch>
 <CAMuHMdUm76tT6u+i=A50ffh=k8hX5kgoMqH=t_wfHqH95nVOPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUm76tT6u+i=A50ffh=k8hX5kgoMqH=t_wfHqH95nVOPA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 

On Fri, Feb 04, 2022 at 09:30:56AM +0100, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> Thanks for your patch!
> 
> On Tue, Feb 1, 2022 at 9:50 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > Well except when the olpc dcon fbdev driver is enabled, that thing
> > digs around in there in rather unfixable ways.
> 
> Can't the actual frame buffer driver (which one?) used on olpc export
> a pointer to its fb_info?

Yeah that might be the right thing to do, I'll add that as a stagin TODO
in the next iteration.

> 
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -48,10 +48,14 @@
> >  static DEFINE_MUTEX(registration_lock);
> >
> >  struct fb_info *registered_fb[FB_MAX] __read_mostly;
> > -EXPORT_SYMBOL(registered_fb);
> > -
> >  int num_registered_fb __read_mostly;
> > +#if IS_ENABLED(CONFIG_OLPC_DCON)
> 
> CONFIG_FB_OLPC_DCON (everywhere), cfr. the build failure reported
> by the robot.

Yeah realized that too and fixed it locally.

Cheers, Daniel

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

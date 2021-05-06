Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAF771
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 17:15:02 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id l2so6414293wrm.9
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 10:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eyeq7edVwNja9tWgkLIcplpibdOE0K8mu+BGnA3YRIk=;
        b=pqNzx4ZUKXcSSwxox5HXd8A0IyPOcASEDZo9nXoqRQl5zxgXRlQm+M1h6rDJN0SnS8
         WZOS0M05vpVegePmJq/Sm2VxVAxh+4Dp8ezbIvJtJhMOvXEPe+UEQKG5yBHYsPB2viCh
         WFWEy2blmHjCqRcgOHOLnmNBAh8gCWeM5N1HYFxP8o/HwXfxUFjqrKB2XGqUa6tyNIZ6
         MVSAmvphk+n+W4ZgcC7upz88Dup5VjnXeJ992dh7UomCK1ZZerP7I1GquEAfRxPmwfUd
         mIOq03XQI2YeNW0+SvdaTGonOSLTP6+oWEbe6oO7/SPSNO7nhf8DyhYnp7MwNPXkJjGU
         l5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eyeq7edVwNja9tWgkLIcplpibdOE0K8mu+BGnA3YRIk=;
        b=cEvW0D4KlRheD+jo9tboQz+SbS5aWAwYZGI0ILIHG3fl2ky0MuR582e7+FTDMFukb2
         dAbFrdrc7/vaj4b5+6bUuYpTeEBxQeKEoyIqthEnVpFXoMEBdtm2uPB3+wPcrhnOcg8L
         8ZH7BX8zjNWoBR8ZvFuP6IxxDUQf8CsTVjb+ZWqcDdOfYPrzcPbqh9+8RdA8/bmOZEb0
         vWWYpZxqh/RaHzfQ/3R1THN8HwgYbxgL00QjXtQgrjUij5E9R4jSnYP28dgAKljJK4wF
         gED5CHmmpPjwF93ELS2Rn4JWMgDudHYaDe3Wmz96Alf+/lKzPoUQnAlNsPClZIS3ICi2
         ZXnA==
X-Gm-Message-State: AOAM532rvlodtUGXTqVkC8/rAOON+d5uibq1AFvoBkMM0EcKJdNdcXIo
	8Fl8XfjF33AUthXG+zVqWF8zQzdPV92Bjw==
X-Google-Smtp-Source: ABdhPJxOYdlVjjxQM0kaIKg3Aptr/aNxRL6e6EwEhCuGmwWDaWWmcQqYPnu07+heSVTSTRA2yqadwg==
X-Received: by 2002:a5d:4ccc:: with SMTP id c12mr6879065wrt.268.1620321300540;
        Thu, 06 May 2021 10:15:00 -0700 (PDT)
Received: from agape.jhs ([5.171.81.67])
        by smtp.gmail.com with ESMTPSA id l21sm10428421wme.10.2021.05.06.10.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 10:15:00 -0700 (PDT)
Date: Thu, 6 May 2021 19:14:57 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] staging: fieldbus: anybus: Refuse registering
 drivers without .probe()
Message-ID: <20210506171456.GA8507@agape.jhs>
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210505202923.198607-2-u.kleine-koenig@pengutronix.de>
 <CAGngYiViy_o2Wzdn0axWeR1FSijH+5d7yLDTkAL+mQnEMkuJBQ@mail.gmail.com>
 <20210506084955.GC1432@agape.jhs>
 <CAGngYiUyOWai8QRUAhsnABSJxyUzs5Mqf_pXgmTzkBL8EiBL3g@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiUyOWai8QRUAhsnABSJxyUzs5Mqf_pXgmTzkBL8EiBL3g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 06, 2021 at 09:54:06AM -0400, Sven Van Asbroeck wrote:
> Hi Fabio,
> 
> On Thu, May 6, 2021 at 4:49 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
> >
> > I'm trying to make my way in linux kernel device driver development and
> > hopefully find a job soon. If the task 'moving fieldbus out of staging' will
> > give me opportunity to play with real hardware, and so gain more experience,
> > we can talk about it.
> 
> Thank you so much for the offer, I really appreciate it !
> 
> The fieldbus subsystem sits in staging mainly because it's in use by
> only a single company. Greg KH was absolutely right to insist that
> this had to go into staging: a subsystem is different from a simple
> driver, and can only thrive if it's actively used by a wide community.
> You can see this in the subsystem's TODO:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/fieldbus/TODO?h=v5.12

for this TODO, one should identify first target people who
could be interested in Fieldbus.

> 
> In short, this cannot be taken out of staging by "pure technical
> work". Except if you had a fieldbus client device on your hands, and
> you wanted to talk to it through this subsystem.

no I don't, these seems to be industrial devices and I don't
know how could I bring home such stuff.

> 
> Sven

thank you for your answer Sven,

fabio

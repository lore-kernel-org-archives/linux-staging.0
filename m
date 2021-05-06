Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB670
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 08:50:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g65so2914174wmg.2
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=yHgkB3CxNPsRARZ4GfSJNGd1yg6kcLfx2QY9UrNxJL4=;
        b=NC71hLfjMu3tSTloWtEiG4CocO7dVdL1+9sLIghUi58HBBhJBJY21yzYyXCKsZCVTz
         gHt97omPpti2YnvysUQBR6uIbqUtr26Di4WTN5HtbmRrREhybBe6V4dmOHlBZw/PJJYk
         T1IjYf+PLQV6MPJcLcWASUyXxJtHBAJq/g3oMY/KJBm4FSbfficfdYbP6Ov70ie0d9TS
         KShSQEtsinyLcz5n4mgPojHYadzEBW0zuTMV5VZO9oi99FjozlOHUyVx4MHVbJrIqwjs
         rdyTBenPQ40MYAs5yybjixuq2RFMrQjvvyHw70ffbDt9REEM92Wj/fOpvXfHYqRdXuIi
         eVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yHgkB3CxNPsRARZ4GfSJNGd1yg6kcLfx2QY9UrNxJL4=;
        b=eNWigsTxx+RwQwN00CnFiS6H8u/p2TZqbms/K7M7/95RBYSYiBGjuwo04t76ROOYTf
         Xpkr+4AvoHtntfLX9AIEGnrGvckzFz2hCKMrMyQg1hjvbpMWKA2DjDrbSyp91nSfAA8h
         bhRtukVUEsUR6Evt2lBW82DttSzTW8OrdX/aMWuR2oGNREOzKJHKJAst7Nj+W79snxhl
         6OpWUT9wRUo/5dpR5IspDE94c59FBGyAKHus1r/aSXSz/4rI4VkK4HGvqhKruqbN6o15
         I9rxgk7T/lCH72KzpdyAS+VrbZN+Qb6N2xORgW7QlD631BDRz5QSv69R26/Htf+Rlbj1
         M1YQ==
X-Gm-Message-State: AOAM530a1yZGrn10Dyu+0q6lmQuz4d+vLwypGigo4jUNLzSPHBm1OWd6
	Flvn381sBGaLUiXqwzJMNlM=
X-Google-Smtp-Source: ABdhPJyXrDoIfUjQ+7seLsavkX/sli4ZgGTt1RWNiR+UyjW1bfw7N+kx2IJ5dTkmidaNvomVDGSBnQ==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr13855236wmc.88.1620290999561;
        Thu, 06 May 2021 01:49:59 -0700 (PDT)
Received: from agape.jhs ([5.171.72.109])
        by smtp.gmail.com with ESMTPSA id y17sm3459750wrw.90.2021.05.06.01.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 01:49:59 -0700 (PDT)
Date: Thu, 6 May 2021 10:49:56 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] staging: fieldbus: anybus: Refuse registering
 drivers without .probe()
Message-ID: <20210506084955.GC1432@agape.jhs>
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210505202923.198607-2-u.kleine-koenig@pengutronix.de>
 <CAGngYiViy_o2Wzdn0axWeR1FSijH+5d7yLDTkAL+mQnEMkuJBQ@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGngYiViy_o2Wzdn0axWeR1FSijH+5d7yLDTkAL+mQnEMkuJBQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 05, 2021 at 05:04:55PM -0400, Sven Van Asbroeck wrote:
> On Wed, May 5, 2021 at 4:29 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > A driver without .probe() callback could never bind to a device because
> > anybus_bus_probe() returned an error for such a driver. So refuse to
> > register such a useless driver.
> >
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Looks good to me. For the series:
> Reviewed-by: Sven Van Asbroeck <TheSven73@gmail.com>
> 
> Uwe, I'm glad you're submitting patches for fieldbus. Hope you find it
> useful. This code is in staging mainly because only a single
> company/developer is using it. So if you are actively using this, or
> planning to use it, we can work towards taking this out of staging, if
> you like.
> 
> Sven
> 

Hi Sven,

I'm trying to make my way in linux kernel device driver development and
hopefully find a job soon. If the task 'moving fieldbus out of staging' will
give me opportunity to play with real hardware, and so gain more experience,
we can talk about it.

thank you,

fabio

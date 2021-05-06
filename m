Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DC572
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 13:54:18 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d11so5715169wrw.8
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XIqwVJLyJAPqBu0pPr4qOQhf3AvN1zMlHE2Y9MoBlRI=;
        b=JG6HYjQVTrHQnD1b9dAbdqtSBD62/ksy/1CplyOo0g3d6ixqy4QsAh7/dlwniySwOf
         P6nrMZqhcXJmY90E1Rg+ygtFmSR9ELgcE3yeTlQpoNRuc8zCxTeWbwVCae4K78lrmkRk
         uk/+gZi5ws8Xfnu4YdANF4o1WGNgJegOnFYcbTlYJlOGUWtwkG3mVq1PR53azk77OAW5
         tRP39HwOBs7o9Rut/fSWbDKxO/FFF95XYnLhwbCkXJycRwgSRCF8/JMg172TzoLLekPa
         KTbcx2lgEfo6GYhp40upvf9MLpDal4DD23op9ayET1coUWh8ExK3AQztYlXQns6boXRR
         XEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XIqwVJLyJAPqBu0pPr4qOQhf3AvN1zMlHE2Y9MoBlRI=;
        b=j54TZuXngX98J6MAsnFVLl5GkclvNs7QcYFWft7G8cdoSJVvVwEeakHhBdocpBZS1+
         PZNlwKKJ+2JjJBilL8bb+wow0JHzsjlK493HIheaH5YSScncAjE+7bMlVFRQ4v+ptpx+
         6zRxhwYL8uU5Jtg+KKavpoAqVWRVsMvcsZ0QC5vMi/Y4sSdhSk2a4qSZ4dxKiJeqyoI3
         LutDGAbrfMddILN90M3CbJuv9PjzLOJKqzeI114cP5nBZPLkV/J4otfm6X3+49SN/O5Z
         tV4c9/YoXBUc+eNstXnEVMgK4JAHeLLxd2agsFYsCZjBT29rBuDifvfuu66GsZoDvhF6
         t39w==
X-Gm-Message-State: AOAM531pxsKr56+GfHOKoqS5DEDEm7haLXTeL0LwK8b8bmjmgY4kfTSb
	TzfMQLiHooEAtOGlgtSam1S4B1A8//Nbv+W+dbk=
X-Google-Smtp-Source: ABdhPJxxQzaJIIS5YYwHe7R/ozRsmzuVo3uXytUMh+uLR/qboQZYYlQZQbdGPRk+KijYMPLuiiqZnYkN73QdtLIKXbw=
X-Received: by 2002:a5d:4bd2:: with SMTP id l18mr5327882wrt.197.1620309256868;
 Thu, 06 May 2021 06:54:16 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210505202923.198607-2-u.kleine-koenig@pengutronix.de> <CAGngYiViy_o2Wzdn0axWeR1FSijH+5d7yLDTkAL+mQnEMkuJBQ@mail.gmail.com>
 <20210506084955.GC1432@agape.jhs>
In-Reply-To: <20210506084955.GC1432@agape.jhs>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Thu, 6 May 2021 09:54:06 -0400
Message-ID: <CAGngYiUyOWai8QRUAhsnABSJxyUzs5Mqf_pXgmTzkBL8EiBL3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: fieldbus: anybus: Refuse registering drivers
 without .probe()
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Fabio,

On Thu, May 6, 2021 at 4:49 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
>
> I'm trying to make my way in linux kernel device driver development and
> hopefully find a job soon. If the task 'moving fieldbus out of staging' will
> give me opportunity to play with real hardware, and so gain more experience,
> we can talk about it.

Thank you so much for the offer, I really appreciate it !

The fieldbus subsystem sits in staging mainly because it's in use by
only a single company. Greg KH was absolutely right to insist that
this had to go into staging: a subsystem is different from a simple
driver, and can only thrive if it's actively used by a wide community.
You can see this in the subsystem's TODO:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/fieldbus/TODO?h=v5.12

In short, this cannot be taken out of staging by "pure technical
work". Except if you had a fieldbus client device on your hands, and
you wanted to talk to it through this subsystem.

Sven

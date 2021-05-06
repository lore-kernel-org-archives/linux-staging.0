Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312172
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 13:38:33 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n205so3417148wmf.1
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1azokgu1E2f3XMcUWuE6su+CxVlJTo2QBHYnp0NX4L8=;
        b=arp2mAuRWP9EhK0EPjRIi0zPj1B0dw9+VdC4vUocnOuTjyIgdhNJcPo4Ow6C3M4H1O
         NnanS0WJxlcmb4cH6cPRf5Lo/5LL2n2q2/X5e21yPtNYASXSn6RpmvZUHv/hIvBCDY+L
         b0n1ZiaHGLXLGRIL+RIsMqzbXICvD6ocohMuux/AODAkZ1laJj4ssAN+xFxlYd0f/9+9
         pyMelwHamzg6H46xzF+YGqEseeSLCzMwVuxQdvSORNPP//+35jADskeEw2AqC0Yl4Jcr
         6jiAwS/1gvbxVO5/HmWCK+gSs4AoxrHfN0/lUh5wpFZiQzpKR8J/kKQ2GkDJicZx7Mv/
         NIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1azokgu1E2f3XMcUWuE6su+CxVlJTo2QBHYnp0NX4L8=;
        b=gfUskO7rK5vPHOgfLlTJi6UIQtB5MnTMAm7mumJpdzW2MRMPfZFgGJ1kicwEGF3fZe
         pPE1CYNqU1BivIdzYYyDG8uEB+tS2tQPJKYDfr8h6cMIvKWgHtbwHy5c8jzknBacpvxp
         hxGgWigYuYp1YhFVK+WrJtNkWWfy5OYgcWPddXEBaC1c+YVSstKZC4BnJzPiYyOmJWJu
         eY3otyvJthyKlDq/tzbJbjdni96Gp2ShLFaviT+67d3O8X2r05sMYjF38AT73sj2iunO
         Won14Liuw4OTXHhOEEfuEwXilt7OYtAe96uT35kUCtNxM1XVH7HutQrNT/+8YILrbXq7
         oP+w==
X-Gm-Message-State: AOAM531edkML6R3JkInfwkg1qTs+t5EY7LHjByV8T7lsZsVvtJa+93xW
	yO8ZCToVSRB5ZPUTRuQtkrgyw40oyykOcqqt4Vo=
X-Google-Smtp-Source: ABdhPJw0yoCovr6WPliJdhtbIGwGoB83+KMAqyBuHO7y2qLuzryprJaOml5RtNWjeFstza33bwUQDA29Prw/OvRfsI4=
X-Received: by 2002:a05:600c:4b88:: with SMTP id e8mr4009446wmp.74.1620308312049;
 Thu, 06 May 2021 06:38:32 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210505202923.198607-2-u.kleine-koenig@pengutronix.de> <CAGngYiViy_o2Wzdn0axWeR1FSijH+5d7yLDTkAL+mQnEMkuJBQ@mail.gmail.com>
 <20210506061714.chy3xeybpquxg7q6@pengutronix.de>
In-Reply-To: <20210506061714.chy3xeybpquxg7q6@pengutronix.de>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Thu, 6 May 2021 09:38:20 -0400
Message-ID: <CAGngYiUgrFwANZoxN0+PncyQvCKCbWb_aEF2uXNwDAn-kLsh5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: fieldbus: anybus: Refuse registering drivers
 without .probe()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Thu, May 6, 2021 at 2:17 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> So sorry, I have no motivation to support getting this out of staging.

No worries, this subsystem would only be useful to you, if you were
running Linux on a Fieldbus client device. That is still quite niche -
on mainline.

>
> BTW: I just noticed there are occurences of anybuss and anybus in the
> driver. Is only one of them right?

There are various "flavours" of Anybus. One of them is Anybus-S, which
is the one implemented here. Support could be added for the other
flavours, but there is no use case right now. The reason why I went
with "anybuss_xxx" instead of "anybus_s_xxx" was purely visual. Code
such as this:

> void anybus_s_client_driver_unregister(struct anybuss_client_driver *drv)

looked really bad to me. Perhaps in hindsight, "anybus_s_xxx" would
have been the better choice, because quite a few people have
questioned the double-S. But hindsight is 20/20, and there is no good
incentive to change it now, except if Anybus-S suddenly became more
popular. Which is unlikely, it's now purely a legacy bus.

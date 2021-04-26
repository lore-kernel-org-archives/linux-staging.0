Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E51371
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 18:19:09 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id a25so51948899ljm.11
        for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fj9vMd+buFku6gAKT/mPMkFnjXdzojSDejPQup/S60=;
        b=Q01kOhUGWWIKHSVb/Zmh7lArlQYPc2ZrxW136Xdk0xLgCmuKsigWhmNvvDMqT65qWy
         e9ITGeuPpHw69XYPQQcDHkqr06DiQicWPqFFYOIzn5mTzjm2rCYlRZxNsv4X9Bj9Flc3
         EdcMBIO6JHLIZbaK906r4a/KKC399U9peqTfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fj9vMd+buFku6gAKT/mPMkFnjXdzojSDejPQup/S60=;
        b=DayhocmidMXmdaxmzmyplMRECb09CemybE1f28zMb9aNejXiA1FftRsdatswSZo+xg
         3UHO0oaMSRaE6A/4awXg1zubg0P7dMve53ZEYDi/NxUv9bq6m/7D27MnMas23lz28yM7
         7yFcXCJu10MgKl6l6GMLfqQkZNs2sYZzFaqnHngXsHA+DHv/4iUizVGC8vPiLRSwh/5W
         PBicAiRlqSzRBUYGOanX3qfzWeMM9XB5K2edVQDuNRQ5dz0I32SBRGNoeRjHqePyWKmZ
         Z/jHCtEdKImgfYCYkcnHMcevsJlgosZDgiI9rjsDryB3YIasdyq7KQx+SvgvxAOJiwEV
         bOoA==
X-Gm-Message-State: AOAM531ZJ3FYouhNj+Bwsz6jtAKByhrrfLSnDfh0VoHW6rhg7ujxN4g4
	Zif8Zw3/I2RTcjmYzmPZ61T92FjlTEbNbiCL
X-Google-Smtp-Source: ABdhPJyDKNnTietczJjGlfx4Rn9pU9EeJz6UnoPCkpdzCcR9bqXt/iAuhu1Xz7FrP5XQolwlcVDrgw==
X-Received: by 2002:a05:651c:612:: with SMTP id k18mr13973513lje.445.1619461147100;
        Mon, 26 Apr 2021 11:19:07 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 200sm83522ljj.11.2021.04.26.11.19.06
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 11:19:06 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id z13so8678401lft.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 11:19:06 -0700 (PDT)
X-Received: by 2002:a05:6512:a90:: with SMTP id m16mr13314098lfu.201.1619461146259;
 Mon, 26 Apr 2021 11:19:06 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YIa2ErYuJyCfSkS+@kroah.com> <20210427002648.22459fa7@elm.ozlabs.ibm.com>
 <YIbYI2825E4Z2b/3@kroah.com>
In-Reply-To: <YIbYI2825E4Z2b/3@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Apr 2021 11:18:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgWLrNQeV20DiCnJVQpfKFkbtC+8=rAqt-wyBFMrHToEw@mail.gmail.com>
Message-ID: <CAHk-=wgWLrNQeV20DiCnJVQpfKFkbtC+8=rAqt-wyBFMrHToEw@mail.gmail.com>
Subject: Re: [GIT PULL] Staging/IIO driver updates for 5.13-rc1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@rothwell.id.au>, Andrew Morton <akpm@linux-foundation.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, devel@linuxdriverproject.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, 
	ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 26, 2021 at 8:11 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Yeah, merge issues with other trees are hard to resolve in the single
> tree here, not much I can just yet, have to wait for them to hit Linus's
> tree.

It's generally a good idea to mention these things if you know about
them, just in case the other tree had come in in the meantime and I
had merged it first.

That didn't happen this time, and I do generally catch these things
anyway as long as they at least trigger problems for my usual x86-64
allmodconfig builds (but not everything does trigger that).

              Linus

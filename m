Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C8E2FBF
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 21:00:08 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso12992951otn.3
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OJ4xddo6HAByAS2Mf+0gozS0xDegLbhMxvUwK7ZPGQE=;
        b=VivXWrAmQJS1ZtwNhQsFioYbvNDe5wUeAf96SQhqtUXt61nrqGgtVHUJBXvbRofAYS
         Tgj/M+3x2YsYiKgLn8ToP5/3MYBnUwqk6dTbEb7ALDluGGq08B1OJZyJHDCEM3qLu3wz
         s7W4F7zUgDygZrRx3sv7dC9lKdlgJmXG8b6RL8FVTx42zALLeMadOFvAmU0UyAaCPdJI
         CpxyhsKzMOeTEnlF074GU8J/mMSudCNA6wpM8PJ6O/yC05Jfd5IfxErSqfuON5Ev1276
         esJqQzRxcsh9zbqWNiDCZebD4ExckjEN+9xmcMwx2/2zTzSGY9nGC1JxQ0kpPVVY+cSY
         0IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OJ4xddo6HAByAS2Mf+0gozS0xDegLbhMxvUwK7ZPGQE=;
        b=qUHi32zt1PdcivlaKWjDAezTqpFuZUpv/zN9XtfoepbGQIHVQQZu7Hco2hlYbx+P+5
         9Vxa55+cNfIJW3Od9wJXCk62KvpdAz0FFbRA1Pv5HkOrdevnUGgbrj5jY3ZscTA+Rl26
         wgtPqskrG1gb/3LR5NLdK7MO+SaCAH9TKPU1pO3wCdmMFoNCtt28gnNoC8mI7bykPWx3
         QEiGob2AO5fXQabSBBNx0s6r7uXh2p8TI2s0uDEhUwWKm4DBcaA5UV7SsZpwXUNgwwE2
         G2lU4+AuHSEwNeLVaXDx2mx5Yxg0fb0Owrmwcx+iJ3Khnt/Ya/NPaRSlZ8jB+kujrWj3
         8vGw==
X-Gm-Message-State: AOAM530lz5fd0qTSkhXxVU840C2mq9isgxd6wZRZlmeykY8lS8ospThT
	4ubnYVGcGp0INPc1LGlB00cSY1Jaznx18kzfyBM=
X-Google-Smtp-Source: ABdhPJywbnkY5hJthZVCokPPffVXR6mbseppLvL9bW9/9/nIywzZCsiRbwYwYyLwRkfgNDP4Zo8QzYqvHBxXU4qaxBM=
X-Received: by 2002:a9d:5a9b:: with SMTP id w27mr1177123oth.362.1621458007340;
 Wed, 19 May 2021 14:00:07 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1619841953.git.lucas.p.stankus@gmail.com> <20210502185002.4c2faead@jic23-huawei>
In-Reply-To: <20210502185002.4c2faead@jic23-huawei>
From: Lucas Stankus <lucas.p.stankus@gmail.com>
Date: Wed, 19 May 2021 17:59:31 -0300
Message-ID: <CACKVXZCxKpBwzmy4L+TEmbO5nYUVMEjZd7SZ3+1KTOaz3hp89A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] staging: iio: cdc: ad7746: add dt properties for
 capacitive channel setup
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio <linux-iio@vger.kernel.org>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, May 2, 2021 at 2:49 PM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat, 1 May 2021 09:32:03 -0300
> Lucas Stankus <lucas.p.stankus@gmail.com> wrote:
>
> > This patch series aims to replace the platform_struct for the ad7746 driver
> > in favor of device tree bindings, creating the dt-binding documentation in
> > the process.
> >
> > Since the header file was only used to define the struct and the excitation
> > level values, it was possible to remove the file entirely.
> >
> > Changelog v2 -> v3:
> > - Add application reference note for the inverted EXCX dt bindings
> > - Replace macro with lookup table for setting the capacitive channel
> >   excitation voltage
> >
> > Lucas Stankus (2):
> >   dt-bindings: staging: iio: cdc: ad7746: add binding documentation for
> >     AD7746
> >   staging: iio: cdc: ad7746: use dt for capacitive channel setup.
>
> Looks good to me.  Thanks!
>
> Will leave time for Rob or anyone else to take a look etc before applying.
>
> If I seem to have lost it then feel free to give me a poke in a few weeks
> (it's happened a few times in the past :(
>
> Thanks,
>
> Jonathan
> >
> >  .../bindings/iio/cdc/adi,ad7746.yaml          | 77 +++++++++++++++++++
> >  drivers/staging/iio/cdc/ad7746.c              | 54 ++++++++-----
> >  drivers/staging/iio/cdc/ad7746.h              | 28 -------
> >  3 files changed, 110 insertions(+), 49 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
> >  delete mode 100644 drivers/staging/iio/cdc/ad7746.h
> >
>

Hey Jonathan,

It has been a week or so without any more feedback, so I'm just a pinging here
to know if this can be applied.

Thanks,
Lucas

Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A142572
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 13:23:14 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n205so3389136wmf.1
        for <linux-staging@lists.linux.dev>; Thu, 06 May 2021 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sE/3Gk0ImEZnOcv5o1sNBSH+VUtXIB4kzq0UQD4cJMA=;
        b=PK3gs0nIIIXlLF+HyXI0WvLE2erZ7TjYT/faMU2Z9wWvtkqyObPBxNKSbrxagJ5HXX
         6hDyY/l8b67XjbPkOZ55lgJUgU4Dna6Cs0oGoaCIYXOeK2qLz5PEE0WmquncuBeA6wsh
         PGNB+OiNnFxdEPtdlZWt2eM1CPg7OhyEkgY/4mbYp3FrwQigKJM1ErtNm/G8IgStVTtn
         MPl0BkLh3yClEKWWBPlbr3S7yuNGQG26Oyw6gDXrvVjQiPm3lfGbBQOZLKIup4lGImA3
         C47UhtWmip371Xfrg7giG2lgYwC8ryNSYHRsKeecPUqZ2KrOrcWuRSMT+YhRP8yIBNYq
         FcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sE/3Gk0ImEZnOcv5o1sNBSH+VUtXIB4kzq0UQD4cJMA=;
        b=rim2XDwm+gkkWzDT/LqUzeRHxVm5xOMUANEYm/+DkHIth4fH6RqKtvhz5Nd7RlbvXe
         +CHW9RX0tbb2LPbkSQNw+sJnPKrBnSVWJD2fgwkI4bTsHX9APCyuvq8nU0ZkeAoeAOrq
         NetKjUgYfvsapr5UVFGSqNeSSngq3i5k2z+zbTds+arc6La9TVwwtXtT5Tt8yNQPLZYf
         fHS0kBsUqiCbh8zmIE1xBiHwvfB+z0HUlDZ2KIkUEKGLpo+/e2+CA7B6Be/MuV8Prk2/
         eEdy1K7Nc85247gDM32MAVa6Yq90qhva6Y5eaC2sYHX6yedqAX37MGaBeFGTm+HkBSeg
         KS3w==
X-Gm-Message-State: AOAM5335W6JHFkCKM2P9yBUPZPMnqOPCqg4Lm6rPi4mnPuJ0dQnq9Egy
	RzyiQI5gGcLJpsqB+wlTskiTjNtihRaTvnhX5DI=
X-Google-Smtp-Source: ABdhPJx3YLePxY0kjWx+mMzzZqxwt7TSODlUTZJGvnfYeBOnn1Tm09Er7tZHgIjLYM0cUuD/uxn0RWtrIMqDauWYtxQ=
X-Received: by 2002:a05:600c:4a19:: with SMTP id c25mr3936310wmp.94.1620307392972;
 Thu, 06 May 2021 06:23:12 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
 <20210506064843.GA1432@agape.jhs> <20210506075213.uytlw6txmgstapam@pengutronix.de>
In-Reply-To: <20210506075213.uytlw6txmgstapam@pengutronix.de>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Thu, 6 May 2021 09:23:01 -0400
Message-ID: <CAGngYiVtL755V3cDAvtmy4KKJnDKi1dQ5hbAcopmgxN+NWqxrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: fieldbus: anybus: Make remove callback
 return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev, 
	Sascha Hauer <kernel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 3:52 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Will resend with Sven's Reviewed-by and
> s/vio_driver/anybuss_client_driver/

Greg KH has already taken care of it in his tree, so we're good to go.
Thanks Greg!
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?=
h=3Dstaging-testing&id=3D239db3ea2f37b75168ca5d0577a848e263669b89

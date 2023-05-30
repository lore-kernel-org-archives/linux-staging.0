Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C0817AC6
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 11:59:36 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6260bb94363so21186036d6.0
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685447975; x=1688039975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvO3o41wpE7tIuz+7/RXzUDRymm5mGnkid1kFHuadJE=;
        b=cHOZ30EAG3gJjjLD83nNTuruiaWLYedXYd8HJfj7x6S3xLBv4qZv3tA4eGuWTXlC7o
         aTQaN8OqouSROdf54ehfhNO2ySKkTUFdP+n4xVJtRi+VpSaOBsftNK2ayik4Vjzq7D/H
         2/A9f0fT5Ol//2yyon6Dj0TFC2IV1frSAvl37pxC5gf2Enj1i51QEauOIaClB5IRZtzp
         haDafk01ekEvw/3SxykUX++2zZG/GImvCtVSznC/yQLyRXrK00VA5IsPkD8c1ZtAU04I
         LHN3OVO5kyS1Je6F/liYr6R0/+xXCi4BjJ791SMCm4gxJHikedXDnt1tqwDo04Rudc2m
         htHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685447975; x=1688039975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvO3o41wpE7tIuz+7/RXzUDRymm5mGnkid1kFHuadJE=;
        b=hxjJZNoqG2ewJ0Aa7y9LEYsycba+Gd0LTfSW3hsp8g7wxMru4LTsU2XKoGFzlcXM4A
         evph53nBhs3Ma7ndJHj6kbdMeFd7uwjBJ1eBC/VlFx4EzBZJVdIDtzwMlM5qm1QHtmos
         CblRnzj0rRvA+9xt+nJ5x+ClxM2hpOZhyP7qupduQBj1SMEEeHGrmnqd+paWNaJYvari
         /ZAd/IDkaVb+RpV2MqLNfPjkEgSqCWugO7N9VytkHD9Z7t7D3AMP+v5BZHD8dX999+i1
         WM+R7pgsXQEqAZyjPxPgWnIy5IVRjR2u+a8+6l1Qr0C+rdewz7mGZldQl7HV5gjs9ZMv
         eQpw==
X-Gm-Message-State: AC+VfDyatCrg2NF9dLhcPJbS64rN3EtNPpjs7qbM4zJ5HZGpFKWNTeMa
	moZVKg0qrlyAadLOtzMrD7sLuepAanKaocYhV3Y=
X-Google-Smtp-Source: ACHHUZ7tJCKsJWv8pQBfp9Iu4AIhSNsoEXZ+nAYEusqljIifxLZWK34KK1ldKNy4eNamGzT8wJdnKSyCk5R/OR/lXSU=
X-Received: by 2002:a05:6214:2305:b0:5dd:5c8d:866f with SMTP id
 gc5-20020a056214230500b005dd5c8d866fmr10857874qvb.23.1685447974993; Tue, 30
 May 2023 04:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-15-hdegoede@redhat.com>
 <CAHp75VeCfTjw_Lu5SUx6u-O7QtFe2QXvCy2wZLSajJi6WDFiwQ@mail.gmail.com>
In-Reply-To: <CAHp75VeCfTjw_Lu5SUx6u-O7QtFe2QXvCy2wZLSajJi6WDFiwQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 May 2023 14:58:59 +0300
Message-ID: <CAHp75VdsCQ3g+OtfUdUgQ-3eor66Y=6Qpg5S=bn923Zt+B46XQ@mail.gmail.com>
Subject: Re: [PATCH 14/21] media: atomisp: Refactor atomisp_try_fmt() / atomisp_set_fmt()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 12:05=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:

A couple of additional comments (based on the branch contents).

...

> > 2. atomisp_set_fmt() starts with basically an atomisp_try_fmt() call,
> >    except that the only atomisp_try_fmt() caller: atomisp_try_fmt_cap()
> >    adds the sensor padding itself rather then letting atomisp_try_fmt()

than

> >    do this (duplication).

...

>   bytes =3D DIV_ROUND_UP(br_fmt->depth * width, BITS_PER_BYTE);

It's actually NIH BITS_TO_BYTES() from bitops.h.




--
With Best Regards,
Andy Shevchenko

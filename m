Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B702B7470
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 18:12:06 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id ek18so143298223edb.6
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 11:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680718325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/h1wnReky+bpZGjcFPhU9qtus+mzxkSsVtUudoN3sc=;
        b=ld6nhqbtnNBbW/gl2D2X3/XLxvqYs1PR4u0y/LI/wtDAvdiJcCVg+HDwMiXagHcmhp
         1CaGnCCD/kT7jcIlZ4m9PP8acOISXuxApjtTy0bz3ZBDslS9W+slwoUn96vpZIYIGC+V
         hzAQbVubWciBmlUxvUUyCMfU49c6L/44iA4gbzi1BbRSZJMH5U79qh9QLUyAQQiRJjST
         uObSa6XcMwZQMrOlXrutJzbNyNKEAkbH90ain0uSIKkYrTxJQqjSBabMUQpLuSQugB2d
         Ofof39mWuZO6ISqLGIuNNJpzKdTwMkXeRQusIkjooRrit9/3VempAh9GzqL56VXatNkV
         UrYA==
X-Gm-Message-State: AAQBX9fUjnEA9viVeS902fU+O+6xrGWCWB560ZnupKdZxs9ucwdK3nor
	8VU6wN2OjIeYcpXdPesLxRUEjiZ6hXjJYvST3vY=
X-Google-Smtp-Source: AKy350a4/1UgQtuZi96LdxsX2CgTr+CU3hxhJSZ5/OXGn3TAfH7X6v13QHnOxtyoiPa1CwRyJPG+X/O/1zQCiXxYReY=
X-Received: by 2002:a17:906:6d55:b0:947:c623:2c84 with SMTP id
 a21-20020a1709066d5500b00947c6232c84mr2032299ejt.2.1680718324772; Wed, 05 Apr
 2023 11:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
 <20230329-acpi-header-cleanup-v1-5-8dc5cd3c610e@kernel.org>
 <CAJZ5v0h8pEq4Tx-Q=VPT-XR73NRk=_XQg6vgr-wA-CFesuuSLg@mail.gmail.com> <CAL_JsqKVg_1T2SkMRryDFyYho1Kz+ppNkqozPdyyX_t4EFBJpg@mail.gmail.com>
In-Reply-To: <CAL_JsqKVg_1T2SkMRryDFyYho1Kz+ppNkqozPdyyX_t4EFBJpg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 5 Apr 2023 20:11:53 +0200
Message-ID: <CAJZ5v0gjJsEe4hUgTcCUXghKkWd+0ChPfDndPavioj2XMC_gMQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ACPI: Replace irqdomain.h include with struct declarations
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Marc Zyngier <maz@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 5, 2023 at 6:48=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Apr 5, 2023 at 9:59=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
> >
> > Hi Rob,
> >
> > On Wed, Mar 29, 2023 at 11:21=E2=80=AFPM Rob Herring <robh@kernel.org> =
wrote:
> > >
> > > linux/acpi.h includes irqdomain.h which includes of.h. Break the incl=
ude
> > > chain by replacing the irqdomain include with forward declarations fo=
r
> > > struct irq_domain and irq_domain_ops which is sufficient for acpi.h.
> > >
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  include/linux/acpi.h | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > > index efff750f326d..169c17c0b0dc 100644
> > > --- a/include/linux/acpi.h
> > > +++ b/include/linux/acpi.h
> > > @@ -10,12 +10,14 @@
> > >
> > >  #include <linux/errno.h>
> > >  #include <linux/ioport.h>      /* for struct resource */
> > > -#include <linux/irqdomain.h>
> > >  #include <linux/resource_ext.h>
> > >  #include <linux/device.h>
> > >  #include <linux/property.h>
> > >  #include <linux/uuid.h>
> > >
> > > +struct irq_domain;
> > > +struct irq_domain_ops;
> > > +
> > >  #ifndef _LINUX
> > >  #define _LINUX
> > >  #endif
> > >
> > > --
> >
> > This causes build issues in linux-next, so I've dropped the series.  I
> > will be happy to pick it up again when the build issues are addressed,
> > though.
>
> Is it just the one in pata_macio.c or are there others you are aware of?

I'm aware of a few:

https://lore.kernel.org/lkml/20230403201801.02839c9a@canb.auug.org.au/
https://lore.kernel.org/lkml/20230403112514.47ff91bb@canb.auug.org.au/
https://lore.kernel.org/lkml/20230403111605.7658ec62@canb.auug.org.au/
https://lore.kernel.org/lkml/20230403110650.6b13cb71@canb.auug.org.au/

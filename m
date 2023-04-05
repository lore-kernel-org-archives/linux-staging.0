Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9E29A9
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 14:59:44 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id er13so100814024edb.9
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 07:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680706782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIwPFSHZcZTOVeokZaz942Rb6z1/6U2kl/cQF2ZCigE=;
        b=jAJJFJI2lCwBERlQaFSHggtXVOqyU9Oe+T031T5zvzeqKNHqNzscW5ewgThcFwIWdC
         lQVid0zJIEMADpj9P74f4xm9umzCPCX3ccI6T7cj+sx4YlvAYyAzXLR/KMVVreIDJZwV
         wbwvmMu7FFW4mp3CwckXrLlGQ8dhi9TDNSSMh5KGWR1CS9MWL0xvsZ5QBXgLXNxqM4C9
         wpcbwTmVyVkUai40fWyH4bltiIbFIyZMt1qtaCU1DXbSlWpg6lY+2gNNJ8WSvlVO4epg
         u6y2Twpx3BV0xsurexbuqI63Tq9MZCdUrw6+xoy5BoW1+WOSGuO6KoYxsc25rHywA5J8
         seUg==
X-Gm-Message-State: AAQBX9f6CScrEMr8sIcTQGRBDT7zOAMcfWm5f0+gr6Ztb0BRLOrmGqXc
	5uizRXQlDaTVBj6Yu8k0MM4jhE9On+zY/CW74iDTHl+O
X-Google-Smtp-Source: AKy350a4pvA7bHYbF3tn7kupoBqb+rMIx2cjRVXOEUqiuhWhUrNUA75BhjkFXftrDZzlVLFANv2u1dboAZf4nW2MZkk=
X-Received: by 2002:a17:907:3f92:b0:934:b5d6:14d0 with SMTP id
 hr18-20020a1709073f9200b00934b5d614d0mr1986841ejc.2.1680706782565; Wed, 05
 Apr 2023 07:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org> <20230329-acpi-header-cleanup-v1-5-8dc5cd3c610e@kernel.org>
In-Reply-To: <20230329-acpi-header-cleanup-v1-5-8dc5cd3c610e@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 5 Apr 2023 16:59:31 +0200
Message-ID: <CAJZ5v0h8pEq4Tx-Q=VPT-XR73NRk=_XQg6vgr-wA-CFesuuSLg@mail.gmail.com>
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

Hi Rob,

On Wed, Mar 29, 2023 at 11:21=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> linux/acpi.h includes irqdomain.h which includes of.h. Break the include
> chain by replacing the irqdomain include with forward declarations for
> struct irq_domain and irq_domain_ops which is sufficient for acpi.h.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  include/linux/acpi.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index efff750f326d..169c17c0b0dc 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -10,12 +10,14 @@
>
>  #include <linux/errno.h>
>  #include <linux/ioport.h>      /* for struct resource */
> -#include <linux/irqdomain.h>
>  #include <linux/resource_ext.h>
>  #include <linux/device.h>
>  #include <linux/property.h>
>  #include <linux/uuid.h>
>
> +struct irq_domain;
> +struct irq_domain_ops;
> +
>  #ifndef _LINUX
>  #define _LINUX
>  #endif
>
> --

This causes build issues in linux-next, so I've dropped the series.  I
will be happy to pick it up again when the build issues are addressed,
though.

Thanks!

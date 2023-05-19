Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A4B8C16
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 12:15:03 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-61b79b93ac5so12819186d6.0
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684498503; x=1687090503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2IceP6TBaorojmb3OLd1xKvhV9Rb8hlr8sj8sPNsHc=;
        b=RqoBi8SM1eIodvyRba3RuzJbgPK46w3eUt8y4J2pgwztxdmNC7IDmoBBHlejf4iKNt
         dXszuTOzw+3esHIbF1H9fSk0NJEMbsgYVCSNY0lNmyLQhTyp8fHIdjqQKsAZIIflNkYi
         2RWHYBMUxbPOgh/kh3VIBtayGZpfTntLHb8tEXRFUlZCcrb3/gRbFjk+uc+dyE2UsKMu
         ZtjkyNuJziw+akBrL0Vv+WPTOGuExJ+uCxHmW/asKZwrnsyF6FKC42xaLjdn5UHpqNtg
         /hOIea5s9U/4WB3n8SMG9wQ3v5pVv7jVl6s1itCunx0KCdsvRuBupTnsYSR7b+j43Oqe
         PvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684498503; x=1687090503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2IceP6TBaorojmb3OLd1xKvhV9Rb8hlr8sj8sPNsHc=;
        b=B2Z2kQQWgrbtzUreZA9ToxNT9GrVSpxLxFQXoYfVjziNK5W3zsjy0qtT0+D0ZwBr3T
         NfxTa+NgpNx1ijJMSSrFRye0AEoBnQ8SuS3nTJolG0UPUKz6N4TYiNBpRn6x7oH+Zy6+
         U2CeLuWEX7pIgaH3oJZqMgLhpEDOP02KEXNs5axfMUheygKH9aqq9RtD+tmv6lQNI6+0
         OPzzeZJNu1PhGoA66xzmN3WgjrThtxW/d14PxKGygNHH5t89M6DoCCdDz2KYisxrp86A
         Oo6eB2lzJuf5M3eDADOISDLqKLfbK9BNWvWBFm6FBwL32idVAqKP82pZLGJ/luSJf5EL
         PPLQ==
X-Gm-Message-State: AC+VfDzIlag2nZwHuqzRwHnbEMqmZxNl6ESnJMD3pWO84w8oyhSUck/c
	cc338UtN+cK2WUv/xweI6ktAE0OybYxZK2I2dWc=
X-Google-Smtp-Source: ACHHUZ7X+V3qRkzF3v6IiI9y24bJwlmmJmtybjdFg7jJryPE4oKpP1ndU7IbFO35B2t9+IKALkqUTxOyLPzgxfdAEME=
X-Received: by 2002:a05:6214:4014:b0:623:686e:e426 with SMTP id
 kd20-20020a056214401400b00623686ee426mr3098304qvb.4.1684498502781; Fri, 19
 May 2023 05:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 May 2023 15:14:26 +0300
Message-ID: <CAHp75VcKLxNU0gGbzEtgzg7xs+4NrsdiP3NA9Lg8FAMRc1K4hQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 + gc0310 sensor driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Now that the atomisp driver supports v4l2-async sensor driver registratio=
n
> (I'll post this as a separate series), there is no longer a need to have
> atomisp specific sensor drivers and after cleanup atomisp sensor drivers
> can now be moved to drivers/media/i2c as regular v4l2 sensor drivers!
>
> There is one small bit of ugliness involved though. On atomisp hw
> the sensor drivers need to do some work to get GPIO mappings from ACPI,
> requiring 1 line per sensor driver to call an ACPI specific sensor driver
> helper. The commit msg of patch 1/9 explains why:
>
> """
> On x86/ACPI platforms the GPIO resources do not provide information
> about which GPIO resource maps to which connection-id. So e.g.
> gpiod_get(devg, "reset") does not work.
>
> On devices with an Intel IPU3 or newer ISP there is a special ACPI
> INT3472 device describing the GPIOs and instantiating of the i2c_client
> for a sensor is deferred until the INT3472 driver has been bound based
> on the sensor ACPI device having a _DEP on the INT3472 ACPI device.
>
> This allows the INT3472 driver to add the necessary GPIO lookups
> without needing any special ACPI handling in the sensor driver.
>
> Unfortunately this does not work on devices with an atomisp2 ISP,
> there the _DSM describing the GPIOs is part of the sensor ACPI device
> itself, rather then being part of a separate ACPI device.
>
> IOW there is no separate firmware-node to which we can bind to register
> the GPIO lookups (and also no way to defer creating the sensor i2c_client=
).
>
> This unfortunately means that all sensor drivers which may be used on
> BYT or CHT hw need some code to deal with ACPI integration.
>
> This patch adds a new v4l2_acpi_parse_sensor_gpios() helper function
> for this, which does all the necessary work. This minimizes the
> (unavoidable) change to sensor drivers for ACPI integration to just
> adding a single line calling this void function to probe().
>
> There also is a no-op stub provided for non ACPI platforms so that
> no #ifdef-s are necessary in the driver.
> """
>
> This series adds the v4l2_acpi_parse_sensor_gpios() helper and
> then after some small cleanups moves the atomisp-gc0310 sensor
> driver (which now is a generic v4l2 sensor driver) to
> drivers/media/i2c.
>
> Since this touches drivers/media the intention is for this
> series to go upstream through the normal drivers/media process
> rather then through my media-atomisp branch.
>
> Note to v4l2-core maintainers: if you are ok with this series
> and would prefer for me to send it upstream through my
> media-atomisp branch, then I can do that too.

For the non-commented or in case you address comments my way
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Regards,
>
> Hans
>
>
> Hans de Goede (9):
>   media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper function
>   media: atomisp: Switch to v4l2_acpi_parse_sensor_gpios()
>   media: atomisp: gc0310: Turn into standard v4l2 sensor driver
>   media: atomisp: gc0310: Drop XXGC0310 ACPI hardware-id
>   media: atomisp: gc0310: Fix double free in gc0310_remove()
>   media: atomisp: gc0310: Cleanup includes
>   media: atomisp: gc0310: Remove gc0310_s_config() function
>   media: atomisp: gc0310: Remove gc0310.h
>   media: Move gc0310 sensor drivers to drivers/media/i2c/
>
>  Documentation/driver-api/media/v4l2-acpi.rst  |   5 +
>  Documentation/driver-api/media/v4l2-core.rst  |   1 +
>  drivers/media/i2c/Kconfig                     |  10 +
>  drivers/media/i2c/Makefile                    |   1 +
>  .../atomisp-gc0310.c =3D> media/i2c/gc0310.c}   | 296 ++++++++++++++---
>  drivers/media/v4l2-core/Makefile              |   1 +
>  drivers/media/v4l2-core/v4l2-acpi.c           | 227 +++++++++++++
>  drivers/staging/media/atomisp/i2c/Kconfig     |   8 -
>  drivers/staging/media/atomisp/i2c/Makefile    |   1 -
>  .../media/atomisp/i2c/atomisp-ov2680.c        |   5 +-
>  drivers/staging/media/atomisp/i2c/gc0310.h    | 309 ------------------
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 240 --------------
>  include/media/v4l2-acpi.h                     |  37 +++
>  13 files changed, 540 insertions(+), 601 deletions(-)
>  create mode 100644 Documentation/driver-api/media/v4l2-acpi.rst
>  rename drivers/{staging/media/atomisp/i2c/atomisp-gc0310.c =3D> media/i2=
c/gc0310.c} (64%)
>  create mode 100644 drivers/media/v4l2-core/v4l2-acpi.c
>  delete mode 100644 drivers/staging/media/atomisp/i2c/gc0310.h
>  create mode 100644 include/media/v4l2-acpi.h
>
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko

Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1BA53AA
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 19:14:07 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id cn12so23082872qtb.8
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 12:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680462846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5v9GlX1T7ZM1sBgeii4HjL7yxvfpgxFNmJU4LIcBn7I=;
        b=a3FGW9JxiJPGrj08W/SVrKDz3RYlqTwwM3J6EODEiFEWXgguVJmFMNB92g54bszws9
         LADuqy+ddIWoJt0m8n2tRNkwYBv69gx4s2LPtEmzEgPQ0rBDDgygPG7tuZ5YPkGdOfq6
         MkvreOPfi7rS6yz+9+7U8M4NwDVA8U4E7ana4AkhZQaXiRiNL0YeyDhaF4IIyVzuD3vt
         H2Pg6s7l7G9/5/XWP67lgBVRCTBcLddrJqtZooI/huStcC0hoKu6UzfmY3JwfPAsjJqX
         RqLedHdnZEL7qNr5chNYV5PP8GhuGRdaclhrMSleeYjWtmfhsXqD9Dj/V4JLdhqrXkgZ
         eMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680462846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5v9GlX1T7ZM1sBgeii4HjL7yxvfpgxFNmJU4LIcBn7I=;
        b=LLGsUH71oL3MaQwS5qIVjNkA95iaRQ7kzG7WPJP1j+IY5izUQKGN2fSxy7PCOmngL/
         V9PQpitts3VM7KEYaC9oGUJZl/ljnovU/VGjEVjnqPAzcQc0s/XHn8KUmkPrU3llk4DX
         eY+li7DLtY2L1wqRFT4vKMg/oAHpt0MFjZb1a7i2GpNnd9qNTc70of0EZUAEJwXLOQlF
         L9MQE4OnhMVrZeVVoK6+FMGeRaKmqDVHgq7XpWv4XWKQ+oQq3VZopQu/n0wcvERjzg4U
         a0i14MFiJsDjvUJdUuIrE9IvgIbs2+XmpfwINp86cDZ+ReEL+OuEqtNA+7vNItd58pl3
         11lw==
X-Gm-Message-State: AO0yUKUoS1b6JPo6lopgQA0xTBSsFxAZG5orFTIQB9sJPpGpuBQZ+FwL
	NSZmLvVUZip+wWLDc65giMVZI72mVaQZosC46jU=
X-Google-Smtp-Source: AK7set/J3ZuetDvEIfnxajUZIDdEnzej4WLxI7Z3rJ4otOxkOG/elIxSZuspm9fmQuwZHIGd7EhXdJXkBzkYhx+GzMg=
X-Received: by 2002:a05:622a:199a:b0:3e2:efb6:9d9e with SMTP id
 u26-20020a05622a199a00b003e2efb69d9emr11632222qtc.0.1680462846534; Sun, 02
 Apr 2023 12:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 2 Apr 2023 21:13:30 +0200
Message-ID: <CAHp75Vd8kcr0YCU7_oCSc8YqW5ZarP4RpQLexGV10A-auZi=Fg@mail.gmail.com>
Subject: Re: [PATCH 00/28] media: atomisp: Further sensor rework + exotic
 features removal
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi All,
>
> Here is another set of atomisp patches from yours truely.
>
> This basically consists of 2 parts:
>
> 1.  Further sensor driver modernization to work towards using standard
>     v4l2 sensor drivers instead of atomisp specific copies
> 1a. For some sensors some GPIOs have different polarity depending on
>     which board they are on and the order in which GPIOs are listed in
>     in the ACPI resources also is not consistent between boards.
>     Fixing this without relying on per board DMI quirks requires parsing
>     the results of a special Intel ACPI _DSM. Add a new
>     v4l2_get_acpi_sensor_info() helper for this
> 1b. Convert the gc0310 driver to use ACPI runtime pm instead of relying
>     on the direct PMIC poking from atomisp_gmin_platform
>
> 2.  Further work on removing various exotic features, specifically
>     prep work + remove support for streaming from 2 sensors at once,
>     as discussed here:
>     https://lore.kernel.org/linux-media/5309d845-063b-6dd9-529d-0f8265429=
0f2@redhat.com/

Traditionally, for the non-commented ones:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

For the rest depending on the severity of the comment. Feel free to
add my tag where it makes sense in your opinion (no discussion
required).


> Regards,
>
> Hans
>
>
> Hans de Goede (28):
>   media: atomisp: Add v4l2_get_acpi_sensor_info() helper
>   media: atomisp: ov2680: Use v4l2_get_acpi_sensor_info() for the GPIO
>     lookups
>   media: atomisp: ov2680: Error handling fixes
>   media: atomisp: gc0310: Remove some unused structure definitions
>   media: atomisp: gc0310: Remove GC0310_TOK_*
>   media: atomisp: gc0310: Simplify gc0310_write_reg_array()
>   media: atomisp: gc0310: Remove enum gc0310_tok_type
>   media: atomisp: gc0310: Replace custom reg access functions with smbus
>     helpers
>   media: atomisp: gc0310: Remove non working flip-controls
>   media: atomisp: gc0310: Remove read-only exposure control
>   media: atomisp: gc0310: Drop custom ATOMISP_IOC_S_EXPOSURE support
>   media: atomisp: gc0310: Add exposure and gain controls
>   media: atomisp: gc0310: Add error_unlock label to s_stream()
>   media: atomisp: gc0310: Modernize and simply set_fmt(), get_fmt(),
>     etc.
>   media: atomisp: gc0310: Delay power-on till streaming is started
>   media: atomisp: gc0310: Add runtime-pm support
>   media: atomisp: gc0310: Use devm_kzalloc() for data struct
>   media: atomisp: gc0310: Switch over to ACPI powermanagement
>   media: atomisp: Remove duplicate atomisp_[start|stop]_streaming
>     prototypes
>   media: atomisp: Remove continuous mode related code from
>     atomisp_set_fmt()
>   media: atomisp: Remove custom V4L2_CID_FMT_AUTO control
>   media: atomisp: Remove snr_mbus_fmt local var from atomisp_try_fmt()
>   media: atomisp: Remove unused ATOM_ISP_MAX_WIDTH_TMP and
>     ATOM_ISP_MAX_HEIGHT_TMP
>   media: atomisp: Remove atomisp_try_fmt() call from atomisp_set_fmt()
>   media: atomisp: Drop support for streaming from 2 sensors at once
>   media: atomisp: Remove struct atomisp_sub_device index field
>   media: atomisp: gmin_platform: Make DMI quirks take precedence over
>     the _DSM table
>   media: atomisp: gmin_platform: Add Lenovo Ideapad Miix 310 gmin_vars
>
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 999 ++++--------------
>  .../media/atomisp/i2c/atomisp-ov2680.c        |  33 +-
>  drivers/staging/media/atomisp/i2c/gc0310.h    | 416 +++-----
>  drivers/staging/media/atomisp/i2c/ov2680.h    |   1 -
>  .../media/atomisp/include/linux/atomisp.h     |   2 -
>  .../atomisp/include/linux/atomisp_platform.h  |   2 +
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 356 ++-----
>  .../media/atomisp/pci/atomisp_compat.h        |   4 +-
>  .../media/atomisp/pci/atomisp_compat_css20.c  |  89 +-
>  .../staging/media/atomisp/pci/atomisp_fops.c  |   9 +-
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 289 ++++-
>  .../media/atomisp/pci/atomisp_internal.h      |  20 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  64 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   3 -
>  .../media/atomisp/pci/atomisp_subdev.c        | 111 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |   6 -
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  36 +-
>  17 files changed, 844 insertions(+), 1596 deletions(-)
>
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko

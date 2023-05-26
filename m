Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0176A2CA9
	for <linux-staging@lists.linux.dev>; Fri, 26 May 2023 21:24:19 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-75affe9d7feso164954185a.0
        for <linux-staging@lists.linux.dev>; Fri, 26 May 2023 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685136259; x=1687728259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LhDocfihllz36C8kpXLnxq8knDMrabwWcvhfX5ATgc=;
        b=s0jnCppG+/OmCYznpI+0bfq6rMZppSaEqlcef1pDcsf/7vRgezG/nzPEm63oB2r4jT
         cj7yKwEabioBA2r2IYMOXCBkTEbhOug9vKcPqWem0+WSGjxNC7gLzHJHo2JenY+b1XjS
         oBkF2XW0vpDg/tDOQ5/FpKgXwa+Rx9hxcC2EoGXugSWBstVmCXdgGexrXI1aVSR0lKEY
         BcMg5NUZjSvFYsoL25KwoUiwDFQPTzcwxBpwHwq3BKLd8DbIQmtK1lBN80EEKYkFAH0u
         N+JOoTUQdcQ5xLpnLcYIOQhquUtcBSLrzZO7nUXZ9olNpaRu+xLnfjSTFXXPv2bW2W4u
         uRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685136259; x=1687728259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LhDocfihllz36C8kpXLnxq8knDMrabwWcvhfX5ATgc=;
        b=S9JcCIQFqRXBfNG4oISLn7tHQOmgnxqIQtOrP3guRhci04ms3FPQUcTwVnWuVIRKJN
         s/GtpOqARrIWAuU8tGMlTRolLmgeO0tb/EqvS9fxKhyW8FWZK9LMuf4TiogOnBt8CXI+
         ftUiRuyGKinHOPn7LZXKBoh28X0HImn6vrqSHFKT0MJ36BrtLAf2BXOcNOYzH1QuCwXp
         rK9vB4d8cVRls00FRLVIabbPpXGoHGFugvGuTbeKl4TH8xLW9NcMPppfP2Iz2cALayFc
         ULX+edzaIFZPIsFNCEIUrh1FJRvro2x0QDXcVdXsBCRt1sfX3Ou5kzIjY7Pse9odh+Yw
         SRtg==
X-Gm-Message-State: AC+VfDx880EpbPIRURQoqNdHkWv3yPvTBtHw4/Q9V2MrSdQ6qG7PZpnE
	9Bzq4+9XYGASG86oWq1Pa6eWrvtESzgR7ln6Pjh5eOO9
X-Google-Smtp-Source: ACHHUZ4Hd751FpkNiG5f78V0ksaTU31xwpqRWM6Ac3WfwdTZCdyuBBMf6OoKpfIsMd5NFm8/5xkqbO8eirZ2i+6s0B8=
X-Received: by 2002:a05:620a:6888:b0:75b:23a0:de90 with SMTP id
 rv8-20020a05620a688800b0075b23a0de90mr831751qkn.14.1685136258842; Fri, 26 May
 2023 14:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230525190100.130010-1-hdegoede@redhat.com>
In-Reply-To: <20230525190100.130010-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 May 2023 00:23:42 +0300
Message-ID: <CAHp75VcSF0VDmsqQQR56PY=CUZ57czZcXgcjKScNDehvJTx-dA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] media: atomisp: Add support for v4l2-async sensor registration
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 10:01=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi All,
>
> Here is a new version of my v4l2-async sensor registration support
> for atomisp. I have merged all the prep / cleanup patches which Andy
> already gave his Reviewed-by for in my media-atomisp branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=3D=
media-atomisp
>
> This v2 series applies on top of that branch!
>
> This v2 series is the remainder (and core part) of
> my previous 2 related patch-series:
>
> https://lore.kernel.org/linux-media/20230518153733.195306-1-hdegoede@redh=
at.com/
> https://lore.kernel.org/linux-media/20230518153214.194976-1-hdegoede@redh=
at.com/
>
> The big change in this v2 is making atomisp_csi2_bridge_init() also
> add the ACPI GPIO mappings to the sensors it finds / it is adding
> fwnode graph endpoints for. Combined with making sensor drivers
> check there is a fwnode graph endpoint (and return -EPROBE_DEFER if not)
> before trying to get GPIOs so that the mappings are in place before
> getting the GPIOs.
>
> Thank you Sakari for suggesting this nice solution.

Indeed, it looks nicer!

So far I looked into this series and for non-commented ones:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Patch 1    Adds the v4l2-async sensor registration support
> Patch 2-3  Convert the ov2680 and gc0310 drivers to this
> Patch 4    Removes some now dead code
> Patch 5    Moves the now fully standard / no custom atomisp API
>            gc0310 sensor driver to drivers/media/i2c
>
> Patches 1-4 only touch atomisp code and build on top of previous
> work so I plan to merge these through my media-atomisp branch.
>
> Patch 5 also depends on all the others, so it should also
> get merged through my media-atomisp branch. Sakari may I have
> your Ack for this ?  Alternatively we could delay the move to
> the next kernel cycle and then it could be merged directly
> into some other linux-media branch. Either way works for me.

--=20
With Best Regards,
Andy Shevchenko

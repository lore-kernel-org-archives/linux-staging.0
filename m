Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA36B23C8A
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 16:05:41 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-623802d9bfdso15781616d6.2
        for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 09:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684425941; x=1687017941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWeiCV7wEfeTGLp/uSM3bWYXAWyw81q0ElJZaLg9nlU=;
        b=TQWwyct4L00bt/1hfj0UF22glz3ampuijxEQVTS0qadAZdfYURMiQmjpxiWLf1BPK+
         wI4UnVtrw1uvizncZQws+HO74nvhPuJJPkEYOjMESfZlFb0SWTjbzgk5R2Ls0iHpJLx7
         XjOgTcFiuRScdCT67U6K++kQphBSs1dA1gt/F640y/yXCEmtqSePyoiD2m+LrHnbc8E7
         VsPAkJjDfcTvl86165w905w3ZQV/+2jtl80LYnh6NEmOKfBgFn3vOj7A2ZDlw4aMkq1q
         XpLXLEOs4Cv5So1eE026y3mP4vqYEnRJwgZ/dFd7BpBUeJhCzgOORxxDtlhOvIsdOwRL
         8/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684425941; x=1687017941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWeiCV7wEfeTGLp/uSM3bWYXAWyw81q0ElJZaLg9nlU=;
        b=HABjAGaYE+bC5+WwBbn83hAsEsmRHx+AIKOgnp1vHaRZbmuS8S8HHE6w4DaOJ+eoCI
         3ZE/d3EUyvfII/BsWzbDWSpRzmPUa0R0wA3cVoAkEQJnFfFsRzDTjlXDDhJm+PYowfbO
         0+W9KbBga9yC3aVXczrc6s65aWDV8xq634cAQL5oz8wfH+jo9vjbbcB82HA7kvExGiDZ
         68UbI5aZGnGuCAg5WUDv4l0h8se8ByNYuannjt+bLHinSFGgwX3hLMaZrOhrcQ3J/vH1
         HstSS5pCKnOnTuZRvISID6Tscye6is5duO462NGZWxKXJik3tZuvglPVcqyrusgJBKnG
         j1rg==
X-Gm-Message-State: AC+VfDzz5t5Cpj8BKvU5XWSJuw4JXVID9x91SEduUtoHGcrvQlXvq5Wc
	y8mduOrr7gIkUoKzBjpqKS/Vhs95UhXdILN6kp4=
X-Google-Smtp-Source: ACHHUZ5ioLLCflyMJolHtBFs6X2aRgHcKqvZHALmoKz1hSDGjNnnr71tvJFNfzfCAP7S05091bf6ntHjWUtaqQXglHw=
X-Received: by 2002:ad4:5c6f:0:b0:61b:7e5a:ec00 with SMTP id
 i15-20020ad45c6f000000b0061b7e5aec00mr123705qvh.37.1684425940645; Thu, 18 May
 2023 09:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153733.195306-1-hdegoede@redhat.com> <20230518153733.195306-2-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 May 2023 19:05:04 +0300
Message-ID: <CAHp75VetrLhwSX0=X3shuL8v8B6d2B_N4eOdN26ZRp4e0Mu9-Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] media: atomisp: Drop MRFLD_PORT_NUM define
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 6:37=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The info in the MRFLD_PORT_NUM define is duplicate with
> the ATOMISP_CAMERA_NR_PORTS define. Drop MRFLD_PORT_NUM.

JFYI: Since the long term plan of mine is to eventually do something
useful on Intel MID platforms, I would like to keep the Merrifield
(Tangier) / Moorefield (Annidale) support in this driver. That said,
this patch doesn't do any harm to that, so I'm happy.

...

> -       u8 sensor_lanes[MRFLD_PORT_NUM] =3D { 0 };
> +       u8 sensor_lanes[ATOMISP_CAMERA_NR_PORTS] =3D { 0 };

You may drop 0 as well.

--=20
With Best Regards,
Andy Shevchenko

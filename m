Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8C7C
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 21:57:46 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f6b34d2fdcso18390501cf.1
        for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685397465; x=1687989465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVVQfazhdCrMqCL15DahVev5EouULW2J949cPBl6/k4=;
        b=eBQX+r6wnwWAMCnEZNDyTMza7KMuB+yJlkgepojn5iB+kaXJWUPQvyj35dHywbYCvd
         6n2ItmocM2Eugix1//qIjo/KFSPKTgGw7GEQ6Xtk5SWr4AbELwkOggYfbUYd0oAUmE6Z
         VanFDvPK5VKX0JmLb4v5eMOmJjRMJg8MWEsOIHgfYgh+le4jLJpulukLbvma0gBTQhd7
         1Tj4ByjzgFiRj6CUMfwTZfUa1A+xb/qUyyqK1xhFIUqnF6c3xpc0yNo2t6YojLHhR7yE
         lqQEzq6D41mKg94mjHfzrVp38GRiEPK28LpfyuQefpFNzNJv+bLY69gIMHZ3u8BgeOAe
         4gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685397465; x=1687989465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVVQfazhdCrMqCL15DahVev5EouULW2J949cPBl6/k4=;
        b=Psn96nOzmvASrMPTKA8Ot3ef2zoMfOf5lUenxImDgz5VXQ/Od1cIcA3/9OSHYcOvpz
         VKPxRnZoIllnNz/3QtZ/66AXqjrKt2tzzkVDrVhAy+IyBWQxttqWGRlCP9xC34azKC3B
         juRSKV+KMSewEB99zEu+nK+vgu3NuvYpmScG1VEiCNLbMKtKQC8Jbe+cF6lMQFd8wMAB
         Yp07J6/MC6ggVDTy1wVZKzLopFX3UMmlUmewW//ad2I9mVgWSIa+C0xK8dfZQB1v5T2Q
         JTSfr0wB0FRHU52tSunBuSEL8lWPksudMRrLtGCX98GDwZiDhzL2gUgAOtWoA1Z+nfqD
         DYcA==
X-Gm-Message-State: AC+VfDyG3L0hM8El6/iijsK3Ow1viOmdqMSdXMJOSVNRysaJ8O9Us6b0
	N42wdbquzR7FbDsNH9qwZwrjCKHvNShSXrSrC8U=
X-Google-Smtp-Source: ACHHUZ5hybZMfB0KdkwC7aswhOK1xvRikFUHlKCHf6hUhWEQy4AWwKUgYpiY3DsQtlBXz7RV3qkW7nuolVoZ0SaOQes=
X-Received: by 2002:a05:6214:226a:b0:623:8510:8f8e with SMTP id
 gs10-20020a056214226a00b0062385108f8emr51325qvb.33.1685397465419; Mon, 29 May
 2023 14:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-2-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 May 2023 00:57:09 +0300
Message-ID: <CAHp75Vepr8ffhEH9YQqKi7-Bkr51mtrc1jV33KbBY2GCYjix_w@mail.gmail.com>
Subject: Re: [PATCH 01/21] media: atomisp: Update TODO
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> A lot of work has been done on the atomisp driver lately.
>
> Rewrite the TODO file to drop all the already fixed items:
>
> * Moved to videobuf2 + fixed mmap support
> * Whole bunch of v4l2 API fixes making more apps work
> * v4l2-async sensor probing support
> * pm-runtime support (for some sensor drivers at least)
> * buffer MM code was cleaned up / replaced when moving the videobuf2
>
> And add a new TODO list (retaining some of the old items) split
> into items which absolutely must be fixed before the driver can
> be moved out of staging:
>
> 1. Conflicting hw-ids with regular sensor drivers
> 2. Private userspace API stuff
>
> As well as a list of items which also definitely needs to be fixed
> but which could also be fixed after moving the driver out of staging.

...

> +Required firmware
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> +The atomisp driver requires the following firmware:
>
> +- for BYT: /lib/firmware/shisp_2400b0_v21.bin
> +
> +  With a version of "irci_stable_candrpv_0415_20150423_1753" to check
> +  the version run: "strings shisp_2400b0_v21.bin | head -n1" .
> +
> +  The shisp_2400b0_v21.bin file with this version can be found on
> +  the Android factory images of various X86 Android tablets such as
> +  e.g. the Chuwi Hi8 Pro.
>
>  - for CHT: /lib/firmware/shisp_2401a0_v21.bin
>
> +  With a version of "irci_stable_candrpv_0415_20150521_0458"
> +
> +  This can be found here:
>    https://github.com/intel-aero/meta-intel-aero-base/blob/master/recipes=
-kernel/linux/linux-yocto/shisp_2401a0_v21.bin

Can you add md5/SHA-1/SHA-256 sum(s) for the firmwares?

...

> +1. items which MUST be fixed before the driver can be moved out of stagi=
ng:

Items

...

> +* Remove/disable private ioctls

IOCTLs

...

> +* Without a 3A library the capture behaviour is not very good. To take a=
 good
> +  picture, the exposure/gain needs to be tuned using v4l2-ctl on the sen=
sor
> +  subdev. To fix this support for the atomisp needs to be added to libca=
mera.

this, support

...

> +  This MUST be done before moving the driver out of staging so that we c=
an
> +  still make changes to e.g. the mediactl topology if necessary for
> +  libcamera integration. Since this would be a userspace API break this

break, this

> +  means that at least proof-of-concept libcamera integration needs to be
> +  ready before moving the driver out of staging.

...

> +2. items which SHOULD also be fixed eventually:

Items

--=20
With Best Regards,
Andy Shevchenko

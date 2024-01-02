Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B2C363
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aS2VvSM1"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-67f91d48863so69961676d6.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704156083; x=1704760883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE9wfDZFcK96VbDGyj6SH7W6g2PIOAb48Opms4rfcVQ=;
        b=aS2VvSM11I3tVX3GJ56XWiSs/vh8bTqU3AZUQ0riqkbnsnNU3u3wUN2FeMz4gGTQcX
         Siua7bHakFE9VEIEygTwRrNMy3/fFfo6KpbwyOCCeX19ODU3Owc7vxZyis9PbaPmdoR+
         quoA/bHAxk8p37nwJfoBwDu4njnO97TisLHcErE+zO6dvBIBJHjjoa0rdJq3IC5Em76D
         EgwibbGgBQSnYJ9+1+2WUjNECBfxlUXMR76GGDFHwUHFLBjWDTVsbNkRXdTpZYmiKbDI
         k14rf7pelBPy2936TkB5mbjoVDR/WybVO9k8lxUVSE8qAVaInB0wzWpNrGRoJqeIDJGM
         exDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704156083; x=1704760883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE9wfDZFcK96VbDGyj6SH7W6g2PIOAb48Opms4rfcVQ=;
        b=rQ/rL0YXtO+mY8wWeOkto9fWsDE8LUrZiT55nafUwAQs53TsVeRfhq4ayMLP49HIpI
         3fcPswHs6898jSTmnOv9QL9oo5ow/SK+/4wZ4pi3LW2gFGrlY06SxxnXlAy8Q3DeNfah
         ehOwjIZAJwudi6y5N134FoBmEzoCGCnhdyM3ovdbEzXkFC2+xPF0LQxYwPIqn5fSqv2K
         ++PM5vDzVWd1eAkWzLV3mO8CcZ0FcFL5blIYwWi5OvulZ2COW83cVz2/upOCufWfMbRa
         sJ+tLuBT8fJVm+9HcjlxUjNjwmdKVGBDY6eW++UbAMLS2/p47UssH0IZLINE3pjNoK52
         dIRA==
X-Gm-Message-State: AOJu0Yzdnv7ZWq+0wlf6srIdHxdP8r27DehUGikfqhlzngkMVIo712Gw
	hmwQE1Wo8z7fb93nOGdYbOe7iTDTidk5zeDM0uovwx5GrcU=
X-Google-Smtp-Source: AGHT+IFYAQv2QsPpLeIPqXvnadL4bGFIMoNSQFeOtjtYag+bKimORLPRKkjfJXkS6hVBqUf2BaL6CWZEpJTjLH8Espw=
X-Received: by 2002:a05:6214:20cf:b0:67a:cf80:cf12 with SMTP id
 15-20020a05621420cf00b0067acf80cf12mr28978766qve.0.1704156083305; Mon, 01 Jan
 2024 16:41:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:40:47 +0200
Message-ID: <CAHp75VeqCo6CAjybd8sw=hLDytQLeCDw6ZOjqbZRrve5Mhq4TQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] media: atomisp: NULL pointer deref + missing
 firmware fixes
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi All,
>
> Here is a set of atomisp fixes I have been working on:
>
> - The first commit in this series fixes the driver no longer
>   working due to v4l2_subdev_state handling in media_stage/master
>
> - Gracefully handle missing firmware:
>   - Fix the driver crashing the system when the firmware is missing
>   - Make the driver bind in power-managent-only mode when the firmware
>     is missing so that the ISP is still properly turned off. This
>     requires custom handling, not just standard PCI power-management.
>     This allows the system to properly enter S0i3 with missing ISP
>     firmware, allowing the atomisp driver to be used as a replacement
>     for the pm-only drivers/platform/x86/atomisp/pm.c driver.
>
> I am going to send out a pull-request to Mauro for this almost directly
> after sending these patches to the list, leaving pretty much zero time
> for review. Sorry about that, with the holidays the timing did not work
> out very well.
>
> If review finds any significant issues I'll do a set of follow up
> patches to fix those.

One which would be nice to fixup is based on the sysfs patch.
Another, but not so hurried, is to have cleanup.h management for v4l2 calls=
.

Side note: Since we have many headers to be split from kernel.h
(array_size.h, container_of.h, hex.h, kstrtox.h, sprintf.h) consider
replacing "proxy" headers in the code. Especially when headers in the
driver include kernel.h for peanuts.

--=20
With Best Regards,
Andy Shevchenko

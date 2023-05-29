Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF5928E7
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 20:32:34 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-75afa109e60so216294985a.2
        for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 13:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685392353; x=1687984353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzBFCPUHSEiXweGu4bYXWaNN4cJWRC0KIEXjl92bN10=;
        b=gWFQcylcFGKkYrzUEy/kP8Pru1Zc1aRP1y/MHx3ZaKggHrr3e3Zk1kXllvlU/QoQxx
         QZPQIsb5B3yC3Mg7Zd29ouS/NO+E1cEL27hnBtTHdKsYS30NzcRHl4qCm4RUQNR4IU5S
         2APzLMIXQi8WMt8N2TVjsaEwuJ06hsSckO+h21JDjoXDW2WVF/BALJZ9SO9cNaTschrf
         ySRqWxdcoUwPBR91lNSz76h9Y5NarudBDziCMYdvFE6PTbncFh9lVDDkvdwO+6proPxw
         LIjLMfkBso6N+IMCWTWx+Q5e2spFuUbmiHTSQsBxKK1amEThdhoQZMbCETVD/EaqAAB3
         vOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685392353; x=1687984353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzBFCPUHSEiXweGu4bYXWaNN4cJWRC0KIEXjl92bN10=;
        b=lF/tb5izNBDTjXTuUwwv0PbYu9iHUTNlx9NqMgeRgtwibKGsr1C1snrTFKEX0/Guqr
         eqtGTMDCpQXTd3HUmNQs/ZiYXdUcPQqLmTVH3PP9Aiknl/HbzVlwyIXEvMZ0a2DNyfVK
         VqjRo545t53sHme7ZlxasBmEWjZnRrDKTJCDXWlLAo5EX5mgmNZk6cw5Z2LhSAGTPLv7
         OipnVHIT8e2CW5rV1yf5YN3tezWxPqYDpnq5T+rtrhxdhqYD180JGHQlLT97d6QgXssq
         wu8wLThm8QKLXUj1W9inTxSb+EZNtSTZFFUExbqwL21K/HEr8nHqU9oeksTXApPPfKWu
         2Sig==
X-Gm-Message-State: AC+VfDwAhe9nNLAnO1p1W/hGH7aA7AV4nl1p8YcJP9O64UX60RPKCwi+
	lBjZWtnw/r9OgPY/OHs0SszYp+a2MqNSin1G6M4=
X-Google-Smtp-Source: ACHHUZ6qC0+fe9/rt8LoT+5vJ3gpWQ90o/nV+j2YLFomS2RYbegCcrvMi+Ntu3+sdw1u6OQ+2qtGJJ4Ytys4P1WgWRg=
X-Received: by 2002:ad4:5be9:0:b0:625:d55:eaab with SMTP id
 k9-20020ad45be9000000b006250d55eaabmr11006948qvc.9.1685392353043; Mon, 29 May
 2023 13:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-7-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 May 2023 23:31:57 +0300
Message-ID: <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com>
Subject: Re: [PATCH 06/21] media: atomisp: ov2680: Implement selection support
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
> Implement selection support. Modelled after ov5693 selection support,
> but allow setting sizes smaller then crop-size through set_fmt since

than

> that was already allowed.

...

> +static struct v4l2_rect *
> +__ov2680_get_pad_crop(struct ov2680_dev *sensor, struct v4l2_subdev_stat=
e *state,
> +                     unsigned int pad, enum v4l2_subdev_format_whence wh=
ich)
> +{
> +       switch (which) {
> +       case V4L2_SUBDEV_FORMAT_TRY:
> +               return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
> +               return &sensor->mode.crop;
> +       }
> +
> +       return NULL;

I would move this to default: case.

> +}

--=20
With Best Regards,
Andy Shevchenko

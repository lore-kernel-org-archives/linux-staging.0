Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF716807
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsWfdVqF"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-67f85fe5632so65629886d6.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154660; x=1704759460; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xaDsIrkEP2tnJSzBiagDqi/djXd3aELdCHJtedZTxY=;
        b=AsWfdVqFEpN7XfS8YZP+wzmVUGUUgyJCXHTbzf697G0aKZqWxq/L4VUiydzWfSyDfJ
         KQUa5oTqDHzLOKw7RSU87qZ9W/o0XlkIrU4Qh+eoHiVU/5nXHkPqqeMAzHiroOfRMcFG
         RyToQebGFwxXX2GBXk3QcTSjy7Q9ZuCGZjshW8bQIyAUlZIHM8dtu17Kb+n3FxcJ2S/H
         KN7wddjXJFvCsWhKTGfksKMVHrQjPeeOVtvEKbPQ36tWu+7ciiPedGt7XgqUdB6uJmWG
         kDvGIGsQ0T0cLDF7Fv5f6U7mlfXJ/7kTZfkopEhmToBUFZ/2g3p1UNGTKdQ9RZid4F7M
         MPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154660; x=1704759460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xaDsIrkEP2tnJSzBiagDqi/djXd3aELdCHJtedZTxY=;
        b=I2uv+4WNEyBqCjkAPXe+9972lB8qD57VIWVRzJwlsaudqv85+2PcemVvMj9A207Rp3
         D55SAPhBNSXfMbF5z6qLjKHlPO9m7yA5B7CS22Nql7UCmYQqSM5S6Ils5BryJPhrRyB5
         I3c1/QDYQZJ5RXtGEvzqPh0u4/rNacJ6YwWh8GVA7mTMvnQA09+pJB3id3W6v9BVBqXc
         2ZUMpdlGsaGFRk0vmuATxpWUmxgVcr2/clOpRjS+2wPS6re7Q1mmR6SI2MvggjITkcD+
         bYuGRhN9gokC/IRfLWcVvBwVsZGPT+tQyGSk71hKXjkjNXK1H9aR0YJteHfjNpSy1E3A
         ptcQ==
X-Gm-Message-State: AOJu0YzBNrysGVzPlKaOUpiMu5VWld5jrMjLQIyzepZKtq75G/aI2XcB
	702QW2MPqZpvP8MWhgT8K0XgcoiknfzcMQfzOW8=
X-Google-Smtp-Source: AGHT+IGlhkbzz8kWNvfcZQnQydV3t2TPUuaDz4suxxU7eMpX/QA1x1vmQR9wULszH465HHibTHnArQcJ7blS3bh7E0U=
X-Received: by 2002:a05:6214:1745:b0:680:b174:7db8 with SMTP id
 dc5-20020a056214174500b00680b1747db8mr2662277qvb.23.1704154659803; Mon, 01
 Jan 2024 16:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-3-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:17:03 +0200
Message-ID: <CAHp75VfTzUx6V=sxxCYt+=CEzUgn-TfVvfRLkjcPeuPoMgq3DQ@mail.gmail.com>
Subject: Re: [PATCH 02/15] media: atomisp: Refactor sensor crop + fmt setting
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
> There are 3 code-paths all of 3 which need to do:
>
> 1. Get try or active state
> 2. lock state
> 3. Call atomisp_set_crop()
> 4. Call v4l2_subdev_call(input->camera, pad, set_fmt, state, fmt)
> 5. unlock state
>
> Change atomisp_set_crop into atomisp_set_crop_and_fmt() which does all of
> this and change the 3 code-paths which need this to use the new
> atomisp_set_crop_and_fmt() function.

...

> +       if (sd_state)
> +               v4l2_subdev_lock_state(sd_state);


> +       if (sd_state)
> +               v4l2_subdev_unlock_state(sd_state);

If there is any reason why we need to have no conditional in the
callee, I would prefer to see a helper with a conditional and/or using
specific macro from cleanup.h, so you won't need to repeat all this
every time.

--=20
With Best Regards,
Andy Shevchenko

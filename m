Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43977EEC4
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710405311; cv=none; b=FFcIWT+JcdlxL/chAEx096yxl/UaHfNm05u286Zu2dR40cSp0Vqzie8T4pKN2+7TtJmIT0g15MP2wyIBNdGZv6YKRehjlE6s5tob0hNEjRKY2yUTKRYL5Q8a3/tt2sQpVpkWcdFjcIYbkzNcqJSNcOOzCqsqQgvhbzXZTVknh7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710405311; c=relaxed/simple;
	bh=iJSyQnvWTeQ+IiOTUArzFAvii3jXluVUZO36gwrG8fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOnuNnSsZkpkWOe1EtHG15FkdxHikhBtnBSPITNwS5bZB9wS70y1Q5P0/H5mEZZpgAivT9fpisryLpOCkMzPmmM+gtM0D0fWGYO+1nlPZC5iKhyr6Wi9LX4XKyV+eDyxues4lqSVddD2n0+SNliAIbSVv2nDTPQl8KXPMbVNQL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60cbcd04de9so7456817b3.2
        for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 01:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710405307; x=1711010107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZOxcwDirhcwqixj1qjfT/PStYtmu0hBzxyawzPkVJ0=;
        b=Cw4gy9ksL/mzA6T+ZPYP5ORcCSpbqNivifsHa7zUTf87HTSmZ3hVvI2IxQVDxZA0Si
         id0Fiz14cFx7LrqsJDocus79/1onE9zS+aqLqdscKZmrFHqHEyQsHFJImceqOb7+5xuu
         ai2n4gOvfD+3HQuwCqF0SRK+LSKqZzxTzcurlYuhvXNXLb16nuYF397eJQ7BF532VYI/
         dzOf6dR/pFrobbx16xzsbj9IMevn1d0wwXL+vHBBhomSWLMJAnrRMR/0mEV6t2X9leNm
         S7vrlxhTGwCNXUWKFKX6fNxI8LdX1+EhHvN6xiGx9h8jB3ZdjwAdPhTILCOq3NFAWWlv
         GQww==
X-Forwarded-Encrypted: i=1; AJvYcCWn7xV4ZZ78G9UFef8/QOVDVRonujFIvVQZSfZtUXnmQTdNLSJ9h887CpJKIGGs3o5zo0wcCmrrUnhjb7e6I87i+Nusi6amPufi7zbWIw==
X-Gm-Message-State: AOJu0YyasIwQD/fkBWLeJEYcd1oRL4hrPLOnkvEEv4HsdiCMQLfbw20c
	OvvQN6MeCSLEgu0N2+qimLBrgIGUXPIlS7utxOr0mLy8iZ9AXOSIwmyAD9KSqJY=
X-Google-Smtp-Source: AGHT+IGcvuJY4m3ulwcoCrZs8HMC94Pf2wm2nbuk6mnPk8fGOlMQMrUpNj/cX+t63AizQGJbMnSUuQ==
X-Received: by 2002:a81:7107:0:b0:60a:4d2:3f6d with SMTP id m7-20020a817107000000b0060a04d23f6dmr883838ywc.47.1710405306798;
        Thu, 14 Mar 2024 01:35:06 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id en12-20020a05690c2b8c00b0060a17127a36sm183205ywb.37.2024.03.14.01.35.05
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 01:35:05 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc742543119so605293276.0
        for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 01:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWScRTz7LhQGLK56sxbVT7Af24eAStXRx8BF+8yJd90p6q3tn9hCec6rRCbux5mPtDDXVXw+PK7cjedJU6D1kpvDBEtcqttNzHhshSFmQ==
X-Received: by 2002:a25:aa2d:0:b0:dca:c369:fac8 with SMTP id
 s42-20020a25aa2d000000b00dcac369fac8mr1122089ybi.1.1710405305661; Thu, 14 Mar
 2024 01:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de> <20240313154857.12949-2-tzimmermann@suse.de>
In-Reply-To: <20240313154857.12949-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 09:34:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXE+ZjQjdKz15enO9MJBu=LjmP=06RPMrtWVkzXqvoVXA@mail.gmail.com>
Message-ID: <CAMuHMdXE+ZjQjdKz15enO9MJBu=LjmP=06RPMrtWVkzXqvoVXA@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	deller@gmx.de, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, Robin van der Gracht <robin@protonic.nl>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 4:49=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Replace the use of struct backlight_properties.fb_blank with a
> call to backlight_get_brightness(). The helper implement the same
> logic as the driver's function.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500116631A
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005907; cv=none; b=pF05/PK82cOmqdw/J9acLcUs77KjhIV3pgLTiBPHil8iqVxszYV+00ooAgcyNy6t4AnRm4Gv2TCeskTBJeC9Vsvu1Csn+FCKjnArrcCw3QwprYA3Oyzm95y95KOmUAevQ3+cnTftyZpFB/n4fqtqgTyCKR51667U5D5/rzLFRE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005907; c=relaxed/simple;
	bh=35jDCi1Kj9oN2o02lDIyXMFMWMiUeUYXNfhFHuTbbIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kk1GOsqkdAHeJn3i5ri3g7Ez1PvyiyxfFflkypOiuU0W3SddtHq5MwK5Ilpc7UB6BOa32a//0yZYxJKlABJZXXin52sgpEtNm6plFK/FCpYUjAI5TmCiC+3qlaclz1laPnmxKelnTmMFNVTASOe3xmE0qnI9bMoRK4lfNXd8fxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1a819488e3so199562276.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 01:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005903; x=1725610703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOPsquWW8Uy5MOnXlVH8v3N0MKkHs39P2/JigTaTeY0=;
        b=Zd+hmnfF8AV8zuYRjwrxRA6s4pQutwqv6wQR4QQcMGn/xacxDeBp/QTOFlhxo7if/L
         yjaIRsH8f6JQbIhE7J3Xf5w6ZFQEfHFN55tYRWqUMg4d5rHhRYChTqPcI+kmgbD88qE3
         j72nROj02T56d9Pm3qt0qxj6XgtduwmIVjQV5Ha8XB6xgzpUsGqXEjbH+cVqGuNHkGL/
         SLpKhUNp45lZ7bryk1nu0QFJKPKt7Rn+iGJYjxELOLfj21fbsdFk4EZy9ZuLTyDsxlWc
         3iUupFOJcszpIrhYpjaOa9rWKR5tUcFW+565T0mzpl25obwDGmbqCPWJkhwm0T1MupiI
         Nq4g==
X-Forwarded-Encrypted: i=1; AJvYcCUkLLdKGvSPx7KYvxvFH8LQjBIfuC1u1l25NSSpLe+kRCI9JU/X2K1noze92F7jUsFGkKGJgHeHkxMmvzAC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4s9uw2Y7at+uqP4Hj4m7udTTi7PRaAHaeDxjvcO+Oh2KjxkDR
	1ftWgEeDrZ27ART/UJ+TbmfPT8WQBCzYC3UWsV9EaXtL9QC1ovP8E6C42pug
X-Google-Smtp-Source: AGHT+IEIRl1kvGcGQBf9aj9AIK6bkVKrW/xLgWEE7AkmbWxUM3pfh5s7AgDJc01GOM7gJgZ702GK/Q==
X-Received: by 2002:a05:6902:110b:b0:e16:1ebf:2954 with SMTP id 3f1490d57ef6-e1a7a0179e6mr1619236276.18.1725005903092;
        Fri, 30 Aug 2024 01:18:23 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a62656f3fsm533885276.9.2024.08.30.01.18.21
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:18:22 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6c49c9018ebso14901847b3.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 01:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBT8pFT0boDMnAEjOZY9GdmiMGfg1vPVpSbrc/+qMR1Wtu8hbDn19923aUKGgZYwOfvGuXVbji81pEXQ8a@lists.linux.dev
X-Received: by 2002:a05:690c:418f:b0:6ae:e4b8:6a46 with SMTP id
 00721157ae682-6d4101031c7mr10599987b3.44.1725005901391; Fri, 30 Aug 2024
 01:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se> <20240829165051.2498867-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240829165051.2498867-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 10:18:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVenR81cvQ5BbtKjULCXC3NN+pBCHbE4SVeZUBChvAYgg@mail.gmail.com>
Message-ID: <CAMuHMdVenR81cvQ5BbtKjULCXC3NN+pBCHbE4SVeZUBChvAYgg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: staging: max96712: Move link frequency
 setting to device struct
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Julien Massot <julien.massot@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 6:52=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Prepare for supporting MAX96724 by moving the soon device specific link
> frequency setting into information structure. This struct will be
> extended to carry more differences between the two devices supported.
>
> While at it remove trailing comma in device table, no entries will be
> appended after the sentinel.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v2
> - New in v3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

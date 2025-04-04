Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D156D33997;
	Fri,  4 Apr 2025 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764135; cv=none; b=n9tGAcw7tvgIzbmjP9lrLMmOi55CHL138PgjFJUDVC7pHqc/w5YJxCC39W1XlPzXi4B1bvw4SShAfLnm3mXs1xMpDyLmIrnnmG0enGgF0Sx37AP4nPUlT9eKnHQza4GKAT8ppyGupMcQDzq3RlWZtZeLU+0fLUEQT7IrbDKsg1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764135; c=relaxed/simple;
	bh=xqpAS31ZBEZf1xiiFrun1Td08VTphpaBJc/wf+7M9LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVuUZ+pd/CxCBQodCDE2HkaEj9+RRZep9nlnj5XwbniG5V1BBEgp6WjjQLcd651gTgsRc7k1aS98rwnkozcGSWpwvU3D0xEiVcsLZ5NbASAUI3nKAPunly+i7RY1eWLJebGlyiVNcbjBk0AysZamliEzMKBH+LA4Xq7Q3+cq2l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqYgeF5B; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqYgeF5B"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so3412479a12.1;
        Fri, 04 Apr 2025 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743764132; x=1744368932; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqE+w6GsaVP58HzUCQPmIwumDxQp6utIDBfgrrVwKrQ=;
        b=DqYgeF5BxWU3GLGdpR0jvGFwc48U88QrrVU3XQN64keTS6p2mZuPDWsEDMoV792mHT
         eypAysRY173ikz3M2T5HKOoQCwKZCbY6RcBHOqTVfrGkC1ZXEBViPs3xQ+X7oC9tsALp
         RNnrq5JJX1QI4SlJhF0mg5+WdtIJdtCeY9jQShJo1woDj+p30btvnUjwMTH3PmHDRzp1
         blfawIdp5QGlqlvY7XosX1Ecz63lA/Xo9EmNi3H4UXSav7HloGM0V6KTN1ejVnmpjxWd
         Ej7Dk4XeyWe0TW2Gj6crpWMqmoqFwV3Okw4BaGpeeAcEXhx80ZhKQj6X1JQtZWim4OUV
         ny/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743764132; x=1744368932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqE+w6GsaVP58HzUCQPmIwumDxQp6utIDBfgrrVwKrQ=;
        b=ZUJfcPIWeKpKgVOCJG8tPp9OckNUOMvKVLene1y6ZC+QutcGGXamkr29dM6Y5z3SKj
         dFucZR+vftf10git3jJNkft7nIuShg11AusmxDIK7DMSg0eQsjkSXv7LdT/pOa2Feml/
         hnSy143s/dKwjZr00DNNy9Oy2BCWlDX/G5o4XIYl3ctr/GYUs4SRtbOVQeOnJ3HOlJ1x
         44a6RBu1LySXrZG/t4cDryTkXK0h+5zFz2n7MtUDZZmuNa/v9hkm7N92qNYwv20KOXQl
         bo53MpIUuwFpfTcO9E9fGIP591+8wS+8Lue3SddtqEMsmQBqW/1TTr1Um4UVrG/+yh+E
         9jmg==
X-Forwarded-Encrypted: i=1; AJvYcCXy0+/yWg4bCml7lGssoaFKDQdBVFTyE+RneB0ys6NLwinagvlbpzhkVfHXiJeYSAS4ekXN/ZpOS+rJCqdy@lists.linux.dev
X-Gm-Message-State: AOJu0YymHBOhf0m/DnW1K5Sz8eejGrQnoGpeKzFia4257Rm+pgYgtckt
	CiJE4h8tJWWT2X4mYWhisUUOIy0gYUlBLv+htdGvQ2Cp2RxvJRxMOy6bMhbFuoRrJChahj+G/2d
	zZQGwYwzH1m6AYYXxKJ9cg+fez+U=
X-Gm-Gg: ASbGncuTfA9NVgmkR3+9eBHPjIDUAa7R8gxejx3QSiZ36474gUTy9tzEDLCmGJz+gIh
	K7sp2cv9dUTO2pe8Sox/NOwPvww3MOffL+nU+Wd2EoQkc8EUgDo2yQ2mVkhWa6uMxfwgySjqMOA
	q7WpsV5PtLJ5li5hbM0j0LrG93lm3B
X-Google-Smtp-Source: AGHT+IGNinU4zi/m+31hZicDCxBzNvfcIDFQS56Y1d4Nr7DOmJNAN9EwAxywt5r/kNUc3HaR+BFRb6Jc5r9alOYlVhU=
X-Received: by 2002:a17:906:7955:b0:ac7:9835:995 with SMTP id
 a640c23a62f3a-ac7d181d57cmr304131366b.5.1743764132001; Fri, 04 Apr 2025
 03:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743755621.git.abrahamadekunle50@gmail.com> <6852a0c603010345d646a9d1bba06631ee5c5cbd.1743755621.git.abrahamadekunle50@gmail.com>
In-Reply-To: <6852a0c603010345d646a9d1bba06631ee5c5cbd.1743755621.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Apr 2025 13:54:55 +0300
X-Gm-Features: AQ5f1JqUozPnFgJdIT4pOelHcSqCJ5l6BNg2OqqLHneV3VukMeWc8lpWOwr7854
Message-ID: <CAHp75VfqbO43KgMOuvuF4oGVp9m6UqbYJOtxTZoiiHwnXd13-g@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] staging: rtl8723bs: Prevent duplicate NULL tests
 on a value
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 11:51=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:

...

> While at it, convert '& 0xfff' cases to use modulo operator and
> decimal number to make the upper limit visible and clear what the
> semantic of it is.

I think there is a consensus now that this should be a separate followup ch=
ange.

...

> +                       psta->sta_xmitpriv.txseq_tid[pattrib->priority] &=
=3D 0xFFF;

This also has the same semantic and may be changed in that patch.

--=20
With Best Regards,
Andy Shevchenko

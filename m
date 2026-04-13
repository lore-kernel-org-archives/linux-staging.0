Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBDB3932E1
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065282; cv=pass; b=AwAWGDhi8Kh8AIqXIUuwopvZUwmI1qlrnj6RhCzsXAfCEM9hCKueEAz65WHnHryHQdhfHNzbyTPM6qlgjeJf1xmJ9houZtS7AtWy+Um1uw3tLOfiS7WqlKZ9d4LfHdOZQpR/AR93Ig/OM6DkWw0sJOffsmTvUjJ2jpucNM94/mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065282; c=relaxed/simple;
	bh=DlwMyD4t29/8nrFI8IaWu444cA4PIV5uHY3KyCXXzrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkLtyh99DS/O9pArr+FtNiX0L2ABBU/tm1ReT351PDwK+qL4V5rd4g8W6HSIIVQj06b9GlsUO5AO0m+gEQvhi4k7qy2B3W596hd9tkrhrPfFaXYsOB8fR32BMMG5hSnhCsAUeKzm+onkVLb26fhOdxF4J/4gRni1AkYqnVUYwWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/7iUC2n; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/7iUC2n"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so753022366b.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776065280; cv=none;
        d=google.com; s=arc-20240605;
        b=cOLhBYL3lTC8qfdIkEMHvAw4SBeYYgtXNyBOd7MpEEIxM+VmKJrulKuWsU4Ah6lPgO
         3BCnAjCIA35/10ulo7QeYQc1hNHqHKlUrvtEfxksvymg2PxJGKwnuMYFHq1zIFgu8GAm
         I+90XSPEL41qkE/s4dfqoEOryUOB7IU3QufhRCnjeKY8GKROYK7Z1cIF43QRMIflqCgp
         Zitu33rvJfkeIUKWHaslRASO27Cjrm9f1n8E1TqnK1s5EvNmnjaPiRVWFrx2BImEiyBp
         FLP99MXti2CrlgIJbkIQLp0GIuS2w3DdLgjYMwwWdkaa9buKlDWuh1Zrw9LGXujFvvom
         ZvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=esw3ZYWK8lMWwagwM2py2+1xYSPbr9lpYxI9c74FbXU=;
        fh=wtsnwudMvYTzzabWMClQooo+i200OlqtFwW4TuPkntU=;
        b=aN/2oqIUC7Xyg8tEHPiDjYmk1zMZzotY0jNRMtvf+6wtiHUOpn/OgSbTcAfxt7CEAX
         6y8v9lzqG0UjJY1N5ASb3ejFvri4irHXnJXvMRtkCx7L7gwzZVejkPvbg+lQbT7TAfmE
         8b1xWvIg/Why9d7Re3TstIKZoJTjjOtMZxyPImKnUFF0xeRWDkjgCNFuDgYnfpocoa0R
         lfx6G3mlko39YbAPHACxh0EjJfDlYVO9+7oJewZG8KWXe912DkBbuBWISoH7rU53GTrF
         BcpwoHVnNkTol7DTy9Ih+43WCAjh/zEfh5cKZ0gSSvoFgOJJl8sG2N0cWfS4xGrj0T+O
         /b0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065280; x=1776670080; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esw3ZYWK8lMWwagwM2py2+1xYSPbr9lpYxI9c74FbXU=;
        b=Y/7iUC2nKLXooN4Wb5oje1DUsOs1MSRbKyIQTauh0qoykq6+Cq1/NZr+tGDu5e6sq1
         myVsjystdeIPKbksbj3zb0aHULt+6bSYm6hVwVzY+EAQZyDZNSpaqGdvUXnt4TUwvgwa
         Pp8cvFkmCAKVJzunAIPUqr6YmVImf95vDkqu70W2jzLT2OH5PXty4l5ax/UcgbWfZS6E
         27esrYBs9ESF8e/onSzdGUx9JmfAjY3DW6zUNGOQ6g9daMvxK7vbXCDtl+1BTN6uggXf
         vLqPDGSK3SbRitj1jspToU9EaJuY95gqvjJdAIm2Jn4/b43PQk/RXFFdARB6s6uNJ7Ru
         rUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065280; x=1776670080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=esw3ZYWK8lMWwagwM2py2+1xYSPbr9lpYxI9c74FbXU=;
        b=EYNF7gkjKP+B3JHAGoxsw7xjq/rLI7BEfTbLyleCLYTPs5Gvi5F9ZKEuGZmH3bII0i
         Nd49IUrwF4CqLOQVxW2ArlxQRsmyRtS6q4nma/uI1U6agYoiEjYmeR2zhfOB+ajA9VRa
         HAgti+U4cDsON8S41BtVZtkOVXNSIdicKxbF3RzaqwkQieclP1K9mxVjEbScogdP67FM
         W27viVhxVpiM6yKzXrWxeyjF3vYO3fWlq7em9chPeVQkybMwIuVjmY6Qh9QdCOu0orFB
         Mf1QAXx9nzocpRw6bjK4JmcSL4tHHQ1KWqXW4ZmsR5L8ssHXPt0X2Om7W8/vBw2k71sk
         dJzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZzT84mH84A8za5YN7bg/jS3HQLtEQZ2LJE9v6507XAU9d86CFod2jhWpVKQhT1bcWqNbEVGFmqBkU9M4C@lists.linux.dev
X-Gm-Message-State: AOJu0YyAAf3B/gDZZr9A/WuheJUeuE2vdhf/DO6wGMLLhjYsfeb7HMyC
	2uZBTQvLYJvtao4LVpaWBMfJ2lj6v3FPfjcM0nzgdK9nEfifLxwI52lihCRuvEpqHgyZdSxXkMo
	D5U20DD9qTTFl4jK1Qdhri6/Wc3e0fnA=
X-Gm-Gg: AeBDieu/y+jh1BLDYlldXUDdAduypr+wqLfkd17H6XHuaibZiJ0wdqT/sbtAtpgynXp
	JAL9y+qdAr/DbRNpo/W+xSJHIZs0hYxGX0jHp5JnKXRiXCgdsk9qCHZXuI4nPsK60il4blQVx/J
	v4XaMYy55ER6VluzqVaJcq4W5T6n3RhlcVM9/NsHF7N+7GGbEqdWxL6IP8B7WVWS69oC5eHPYci
	UT854dwrZoAdb5/t8FiubzAL8te8QcCw/BkQhUdJ5pLC8s/GfnWQMSljugibFxq6w5r2C5vsSDz
	WKlzzCpIN5rh8OBI23usQd4PaTaFc+iq7boP4z3KSzgIsCzCbG/74R2Iea+1oIw/pB1XS9lI4Un
	BW7t+JLmmzYo4JNZ5MA==
X-Received: by 2002:a17:907:a807:b0:b9d:6cec:23b9 with SMTP id
 a640c23a62f3a-b9d729c06ecmr660809466b.41.1776065279751; Mon, 13 Apr 2026
 00:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411152220.89174-1-bcmouli2006@gmail.com>
In-Reply-To: <20260411152220.89174-1-bcmouli2006@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:27:23 +0300
X-Gm-Features: AQROBzB4Yfa7E8b9N0W--P-qDaiyqe5XsSiklgo618k0sYtUqoQ1QuzhuPe_kPs
Message-ID: <CAHp75Ve3gDPXOCqhXr=Ue1T8tX9rfh-JJrtOoFa+thcsXq1hOQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: improve TODO comment clarity
To: Chandra Mouli Baskaran <bcmouli2006@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, linux-staging@lists.linux.dev, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 6:26=E2=80=AFPM Chandra Mouli Baskaran
<bcmouli2006@gmail.com> wrote:
>
> From: Chandra Mouli <bcmouli2006@gmail.com>
>
> Clarify the TODO comment in fbtft_ops_damage_range() to
> better describe that the current implementation updates
> the entire displayinstead of only the modified region.

Please, spellcheck the commit messages...

There was an attempt to improve that. Do you have HW to test?


> -       /* TODO: only mark changed area update all for now */
> +       /* TODO: Optimize to update only the modified region instead
> +        * of refreshing the entire display.
> +        */

/*
 * The style of multi-line comment is still wrong. You
 * may use this example.
 */

And also note:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/dri=
vers/staging/fbtft/README?h=3Dstaging-next

--=20
With Best Regards,
Andy Shevchenko

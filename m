Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9462356D2
	for <linux-staging@lists.linux.dev>; Mon,  4 Aug 2025 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754296761; cv=none; b=fbR33YMxVyLin/9s1WPFl0UERF3B/xoc0EsGrDhEarj5LysdcYYYA5IyZsiSeuQFcPlIl0hce203t9aehu34Ke5++ZT6CyqKRrZCaPcLVrjogLf9y5E96x73UF+mg6bTAlX9UJ+YTGEPsTIvIm87IqSAIAWbs+6JRrFB9q9i3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754296761; c=relaxed/simple;
	bh=EHz4gYl+MXa63MLZGZ4F6jLWGqzNooHdpGsq9F5kreE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBjcJPEnq+ZYTwFXd9PMPM4jUsFyPUSeWt/WbqvXJ61QafjCknFQL2fg3Vw+QrEDeMqfDBkBwgXYpIu7i2eemCEXqaWK/y7wGR3Xpu8TnMQIGcMOmh5pGYBMfHEhiS2PRSSc+1guPMxfDYOlqmvpChnLbRKLwQbeeJVwYvdDWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbFmgXQr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbFmgXQr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6156463fae9so8467579a12.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Aug 2025 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754296758; x=1754901558; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGKCjHReLGr28NdlBT5AraZcAhgIg0ACDvvvoNRq+pA=;
        b=nbFmgXQrt0KXkWfXdF2e+kzeP0DaPo8OJTvD61g6BhkZhUEUAbXPqgPpMpJdEkpmFW
         cYuB09mFE1a+8wEQrrQhI8yJMLxyhNNF5wOg+iyoz+to+yX4H6E0rZ4wKbFQZ622lkI0
         38NRWF1sgbZT1OZ9dA3pTv22QEeI5rG/pk0GvMI2FUApEDc8KRGX4P+WfrRCiyz+WP8s
         MsCta1kqL9DN7y62DMVNfd20nLF1gE2dicgihcw593C8OHPXcRIkbhZ97qNAmjtgKz1l
         NzXftM1yLh4H507X6nyASqr92R3BTdHTWZ/09n2ZXAR7mskUypk7UF+3MfBiQ2h1ZHP/
         wG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754296758; x=1754901558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGKCjHReLGr28NdlBT5AraZcAhgIg0ACDvvvoNRq+pA=;
        b=qbdgckDKYRlJjF9a7E5UAa8hbwR9eSh1fUFpRPSXor6MCYBQ35HR7qkxBWly5MEWw8
         ltwerCDtybycZQwQ31oYAmEBdG0NvbFX5e5abHvEg4Ew2pNU2UShrVLnszqxO2XeBmrD
         7qBX853yUXu+dw52ypR8Bwx+J7p85Tvozj7cxC74/WM/IQjkDhpLviABtYeR013cepa6
         9BAUAenmWP3PMAjrRN1EVvVr8czuzpJHJi4//9vuF8ShSQ9H43m6TgsX/ZvQlB3Gvh+j
         sXz5+ytsCD6dfB/n1pQRzx8wK+tUJeU9ld7Yn4dkMuUP9H10bEfwiGOdXE/LKrel21XK
         8Mxw==
X-Forwarded-Encrypted: i=1; AJvYcCWHalLugCmXKr5hOMVkl9pKqcwvaBThn5QxYRtnTSKZrGAH3gJw8bo0HH3vuBSbZ5jZQCvLDBG82BDL9xL6@lists.linux.dev
X-Gm-Message-State: AOJu0YxCyrt+XyNPL1vUEPdbouENnZiYwlbpTyuU9HFvevYklb9a/ejm
	ZXLq/OxhTL3yW8AQPkBGO9aLOtazPfpclPq6gPnoNRh3CmNnKEIit1U1gQvyLlmkqierEk1S1X5
	RYsvBV+87lfV40aTRdiZbwlt9Msw7P1E=
X-Gm-Gg: ASbGncuMvrA4HKA7dgoXSX+kQb6ILtyhj/4/yAfCTGuhluYFWQF+0kdBv4GmSybzELu
	9wwihOOAEzFUmyvHzc0AQZ/Lk6U3aNLtWe7EHDEhB/tfU+tspC4OKIYaSTzHS1/RKom3r4/wiev
	L/8eO+m3/BI4Cli53BNkqIa5ptEh08JK1bKo6DE4kx4OM1FTYP3igAAC6ofKE3izHoY7aYTWOIG
	HCL11uOwA==
X-Google-Smtp-Source: AGHT+IHqNu9xxe4A1iXPyb7D5UgS0l7CBLUl6xWvEFAthLrNLNmDVde2wbGu7vdycSsnlGdJb5e+cZiK3bmwQIya8Wo=
X-Received: by 2002:a17:907:971e:b0:ae3:c777:6e5e with SMTP id
 a640c23a62f3a-af9408a1543mr871037366b.19.1754296757838; Mon, 04 Aug 2025
 01:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804014013.12899-1-15620332615@163.com>
In-Reply-To: <20250804014013.12899-1-15620332615@163.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Aug 2025 10:38:40 +0200
X-Gm-Features: Ac12FXweVgHgWtryg3mBvGWKoo9yTFAsKqkQb3fhb3XWXk4-xkrgkeO1l0vUYs4
Message-ID: <CAHp75VetPvvowC-7e_hDiX0rUDbx1nTwyq84rcMeCmj=rOadAQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix 'no space before tabs' coding
 style issues
To: 15620332615@163.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, samuel.ogbuji@linux.dev, hansg@kernel.org, 
	pkshih@realtek.com, rperis@google.com, andy@kernel.org, 
	vivk.balachandran@gmail.com, dan.carpenter@linaro.org, 
	=?UTF-8?B?5p2O5Y2T54+p?= <lizhuoheng@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 3:40=E2=80=AFAM <15620332615@163.com> wrote:

...

>  /* select the desired network based on the capability of the (i)bss. */
>  /*  check items: (1) security */
> -/*                        (2) network_type */
> -/*                        (3) WMM */
> -/*                        (4) HT */
> +/*                        (2) network_type */
> +/*                        (3) WMM */
> +/*                        (4) HT */
>  /*                      (5) others */

/* Instead just make it a multi-line
 * comment as depicted by this
 * example. Apply the same approach to
 * the rest of the comments you are touching.
 */

And follow Dan's suggestion, it will make this whole cleanup better to
review and maintain.

--=20
With Best Regards,
Andy Shevchenko

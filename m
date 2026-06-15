Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC493BB117
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507554; cv=pass; b=IM//dcqOlIhvTZhJ17dA8upyCEHZAPURrGOauCNxo6sqRvuXgUgKw6zkp76uMqEGEHkmmg7ORzoZH20M7Ambpp9GwlsXjRCHvxqP5PmtWJtcntISm26EeaWdZZCDG8uHZ5F+Ua9abNYZ27Jg6q5mQK3WWi7ZnNsfcCZoE41CKpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507554; c=relaxed/simple;
	bh=FzhraAC351YoE/9WyaNWJaPNFlY7jKFOVa/EdskiQPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNDueaZlTitlfu9UfV44E9xN6H+p4OkpDiEYCz9YySx7ij0+3DpZBDow8x9SM9nDPpP8ShAK5ZxWp6GG/NFa0Bfs4/rrLj17L08GysM1xJg35yxRurZHRUhND5J2p3TiJd/1eYcR+/QUQsnh4Nou/1OMrlmCx80AbYdRZ6n3IJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4H9M/23; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4H9M/23"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bf1cdcfd6deso331055766b.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781507551; cv=none;
        d=google.com; s=arc-20240605;
        b=iPQqi1dSKpIKgh73qdxtpIfwCOjztwLBHo7nCpcxG1XiDMq4IrdGX+djgfvx603e98
         I1ns2SGUEo+eO1mK6K3AMLqM4gQgzDieKD71v4WNwf8MvYX+eG2ADZjarLIyv0pxzxn2
         b5qlRtvVFIg3Hu3HUg6lAPKgVJUcyJe3BFBkvR/pCPfzrN8iu+ZBYaTV6QEJOyg1LhWj
         b0Ai347JBgX+C/q+FhmQiw4y53DieGjN5Juo+v8f8jczlRES1/Z9vA8daWTybbuOoSqW
         knFIb1EwayN8tLP10s5vaZEyG9PbjSN/skQq/XlPu1ipO9Kb7f4W3FsGXesbVcnF6fml
         bokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FzhraAC351YoE/9WyaNWJaPNFlY7jKFOVa/EdskiQPI=;
        fh=WxgVumbD35Vi2S5ImWZSKtmcH4ik3KXATs4L1QWze64=;
        b=Sy+UP/e9YPErKU3Pqv+/YxekZ83Nw++fL+x4KS9ZeEr6H2TweGkNJsmTv83kkEC9O9
         ypFw+U/zELVOXIAnhzoHADJ0j7YClYnsOL/T4HGVAJznu03fC8f0nwEIIG1n55njYhIK
         0xrmwL/BcOj0J4kskXWwo46TFdLExKCIumf+UuZXjMwyZdBmGI+XwoQSUR1IXrFlezQz
         Zpbxf9P/g3W2s8O5niKSVC8sHGMDGnEwBatQ6koTESHc+F/T8eKLVsUkTFTT0f/r6Y3a
         ghWWJ713NdqTzALDItVQT0hPNUkV4IO9NG74cLZQdLyYi/MW6pioaZ4uA7CgxomjlYB3
         epZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507551; x=1782112351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzhraAC351YoE/9WyaNWJaPNFlY7jKFOVa/EdskiQPI=;
        b=P4H9M/23LW+EhYf9o6S2qUkEJ+6GoGVMSadQ9iWb98hufB7QTzqT435o5kmOA1WR2z
         71C5YAY0LDT5pl6LyyK18bwosomUFjUa/FNxeQ5g1WNFr4Fsk8HaXfJ/7Q2imMR5eR1l
         /xwp9GapNO2bObN5hCRhzMdSUl4q8cpC5CfBvKO8zghjQi4f17/9U1FP5khbnZ48XWhD
         PUPC1+2NAbpQmUCfweXlRB/WmswJ62tUxaAgBBwb9jH8oLOCe1C3VsMFxTspQ27B7KSB
         ai3Ka5ES3/XsHf3j4E91169pDekeu6h9aSTKSAijiJoCn3wkEhmND08f/O3JYIv93jjD
         sHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507551; x=1782112351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzhraAC351YoE/9WyaNWJaPNFlY7jKFOVa/EdskiQPI=;
        b=G2VN0i+iez6e1LwFwhCGJpG+tIS170yMhFY8raUIkdJFMxBeFAxRdgv7zZNCwTQKK+
         RgysDD5gk0eDfrKFazjz0X4DCRDGCTRw/wi2uaL1xn2uOxwmJlwoRGYn6OkDr7NzNm8T
         1VckqbIbBQIpf8H4uBPncc8s7l2Ao6vSaG/1y41+XLirPWujXZ+/FhTfYvEZMv9JW5CZ
         GJnnq3LcmrP0s7fSxjg0uD9/1tW+GIrWYUyG1jxNJVpKeeA0YFC3k31y3VtWdvP9DbVh
         ZY7wjYXzjJ6jZhLmNrPlyDPpaE1baJuIr6PRjK+8Fy/U+hP5t9F2+WqpNJicR89+HDjB
         88bg==
X-Forwarded-Encrypted: i=1; AFNElJ86qA5peYE0FQXgYI41x+SRZmhaishlGtRVj2tpnKaGdDFvUvBkthHY21Q3r5ywRWjmM4t9apwkekawttoW@lists.linux.dev
X-Gm-Message-State: AOJu0YyVe7asS+MWHaHzBJ9Cig+foH8KIoELDJT32W9albU7pOipRHPz
	aPTXwA4UjbkWzMs3w6PJf2xKnAnR5n18pi27g0+PjNPfSgMOS84+VaRW3PnBLS17B0Sowrxhmu/
	8HoRx+gXP1LjcynweAGnzxemtsJGPa70=
X-Gm-Gg: Acq92OGhqi9q6PZzSI6XC3McGRHMcUKa8SHfzzfD/4k/L35MQcYRss4Ewci15BsA7+X
	WFdgXIicHYndHv2i2pnEJ0H+4gxyKmNACJckxpB1VZ5NgTAw/Qq6330b5WUiE7UhFib4NO95UYJ
	7+EprfoQ8BsKU1Zf6wToYkiTrq7uHRcKWKWaaFhaw2b4zoH2aH5xaNXFAH/TtFaEaGaj0X2tJAi
	q6bLHsc7yujgtDHQa0q8IVrmLip5jq0N/duseNDC6uk4AcHYIltUkup/4YOftWCd4hbRH9SdQ2v
	xefcvkNI1Qn5FYBxxjGIbknbhFo+VcwBEw6eDrg+ImMnz84O5QEOYOCQV8RzwHKRdCMGsKbeDoF
	TSa5F0jw1PR7kw3+UI0rtOPFNTDRhXzIYS8SGHqVBkY2Dde0F1NEg3kaes8hvANUP+Dhf
X-Received: by 2002:a17:907:1c9f:b0:bee:426:87ec with SMTP id
 a640c23a62f3a-bfe2a21eb9dmr597482466b.23.1781507550955; Mon, 15 Jun 2026
 00:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614201551.20542-1-reeveskeefe@gmail.com>
In-Reply-To: <20260614201551.20542-1-reeveskeefe@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jun 2026 10:11:54 +0300
X-Gm-Features: AVVi8CeSC29eIc4U_npHh4CvhBaUd3ShetIXEBLYi-0z2YrMYKXv9Qbr5BF-IPM
Message-ID: <CAHp75VfkVQ0JJd4+ceniNnij8t-PXsrNOfof4c6NDWf3KW2s=A@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: use %pe for backlight errors
To: Keefe Reeves <reeveskeefe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, abdun.nihaal@gmail.com, 
	error27@gmail.com, chintanlike@gmail.com, namcao@linutronix.de, 
	niejianglei2021@163.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 11:16=E2=80=AFPM Keefe Reeves <reeveskeefe@gmail.co=
m> wrote:
>
> Coccinelle found two places where backlight registration errors are
> printed by passing PTR_ERR() to dev_err().
>
> Use %pe instead so the error pointer can be printed directly. This keeps
> the behavior the same and just makes the error printing cleaner.

Oh, nice! Now
Reviewed-by: Andy Shevchenko <andy@kernel.org>
(for curious ones: you can also see my comment against v1 of this patch).

--=20
With Best Regards,
Andy Shevchenko

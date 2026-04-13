Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DD6386440
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776059972; cv=pass; b=H/GC1chhrylP4FbacwkgjHn4qDdAcDhH3Qj/I4a3MN6rgmS4Az8UULPuVd8AWfqPzg8uMTXu0WNkumt01RTu5CJShXUiQwiMf7Eo7Wh+waJThexPCgMXiuqeJKYDRUv9WMIwRWIvHfEeVoN4WVprtn+GlMyX2CiXat4cHKAwZLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776059972; c=relaxed/simple;
	bh=qNEpgoGKCBmpBW7B8Pk3rg81p9M1LG8cQpxkmfpgVi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlzM8ahw2I7uE3oTNNLCj9oaV5sQz3fcIHqUhL8rmA9hn9cyT8queAn7vBI2mr7Yk1izeZm9/lmN97HLb0ebHw5vbagIqT+w0dbULWc/4+8FTVT2wPW0R8pUbJLGg51J4NScPMykpSWMYtJcJJF+zcAMcZ14byYHdZfYyj//H8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sztqyyJg; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sztqyyJg"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9b1df1a6b3so451973166b.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 22:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776059969; cv=none;
        d=google.com; s=arc-20240605;
        b=IfAT0Uq71ABmnP1YPkyr9h9kpGVQpUjc2n9TGaqc/ckJ7w3IuNJYqXWcG/cDgKhXfI
         MbGYuryOQ3QZbZXHub7BdFAJSYJU/e4ee5m9l6F7iVcGs6iPqHMqrT97pfHeIOdbwDQR
         yculsDufX2EShWu7bZbT3ybakKqXACf75OWeBUNKGo9IqjTvwm5H296rmQT4wq9pYWWX
         iyvC9AqA9+6RTB4GxR3igCsIGNjxQMBnX71EbU1WotKKcTOCilYaYmjMbtT2RTpMTTyA
         91q3HycO/N7tTtMO3wHFr1VXVgLqfFpcJ7hLl/bdcAeOje5zO3gcAqLx/0jqqPua/Bh1
         hJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qNEpgoGKCBmpBW7B8Pk3rg81p9M1LG8cQpxkmfpgVi0=;
        fh=WaZCuvPpZapbZmpob7zjD4uciGZkgEgk0rc2JDZ0WsQ=;
        b=YnokTgHhFZ3DcBbJd5A0UWgWx70feokWxUzAXVaeDg3Lx6+Kkkk16UWfw6fvqfi498
         Se0RX+W8Ff/2wLoV+jnL809RTZzEt+ksuQs1dxA2R4yygZnBA0/OE9l9Ip0sfsHRKkkY
         eS8wyzN/vSQnhwWw0YziMoU21sFpwFxE8G5yBEBSGQfazWFbNQpglrdUavAoic7JuVHZ
         hEhrDH6vCigwbNpBYre7rwZzVIjH8BZ6niqcbFNk6EzUvswwWQ/JTToWIR0QCQZOGVtD
         z5y7GS07qq9hnl2zSnGOXPzKyxkUiMwAyLklO90O+N2BIcmMQAjs2A78ekZdxFB7ghL+
         wxbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776059969; x=1776664769; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNEpgoGKCBmpBW7B8Pk3rg81p9M1LG8cQpxkmfpgVi0=;
        b=sztqyyJg598YbbJFGxCJWMIjrA2c8b5U/McLI9PO+w19Ve1F1j3RLZw5Ms314creBC
         krcNRNkY9LQQYDFSnDNWNQfIdeWd++9GMX2abVmW5QPJ/12UoSCLBLwAHTGYyMW5BNKR
         r3S6FBAJcDbPPnnHelIEft2l3sMWJJyVWIYdr9WEUdFmA+sFo1Bw1V17w/FT/xDXvYsM
         /N+MIKCy6s1GWpVfPJCVlnPDNcEh/JUQ7z/tKL2NnuCEQqBBVcedBbriIjLJRH72v2Sd
         uonk5CMC/vGh0nwEL76DgMZiLtD+rWhCA3tdV5oeLxytOC3Xdxn+qcu+G+gRr6TFdN3d
         8R8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776059969; x=1776664769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qNEpgoGKCBmpBW7B8Pk3rg81p9M1LG8cQpxkmfpgVi0=;
        b=Ybis7EHc63/Xn1DIY9UBlToh1+0gTgsd7jKW6RO91GfpVI8RYUVqhAqzvZd7OrEvXM
         LxVCSsa4qbfDGqYN8/L6qh2fKW/8FtQge9TKkxkVc2/ZnYLgwSiM3/1RLf3FdlIiYWZX
         PKSxNHOkfxm8FmMm5ANNZFKdqNWHOB5ot209mL5SlBx+Nc4bcfb2fIhAKPm0kkUMLGUp
         KXexcsRzP4izzDbbYpmhWg/usxh92xMrC4DpDWrWe+GnezjiKuMSIcNGvhI3xUcej1Eu
         cXfqmRDzgLN9qHzwBFIghv+IwvRQ0gy3eheC/kaC7GkvpJ2Ar5UwSjJUa56qLLVOHQ+9
         PpEw==
X-Forwarded-Encrypted: i=1; AFNElJ+WnOJjPEANi0kBZwvSnq7o31ysSbNP8N3MvnXNAPP2UFf0/ZXwsc7oX7w45pgx75VLnnDrkU7uxW+1Lqrz@lists.linux.dev
X-Gm-Message-State: AOJu0YxVle6QiIxHogU6QI7lXP4LCDLjhkDh84u58YzOPDHaZVXLu0nt
	DmcSwkqKjGTwt5zakULt1bRKLip7kQBTSczb9LdLP2iQO2DraVhd1dEdKd9hYTalWKfNK0cLTz2
	SjokoNl+oip/owQpNhhTI2mKSluDv890=
X-Gm-Gg: AeBDieuOCKTIzvikXzeK0xIbdinNHjOoYW5DtLsgJjymtzsR+v9dz66+16vomSMsf1v
	V8cqLW2Hw7tfeyJIJCNCnjIX4p3xsJ0IY2/1mpYr0nkkloEdbHgBkS6fzdfsc86P131BfAzu60s
	3tzp0ws/NvEdt0LGM7Sx+hQla56cWTKI4BE9907O6NM3J5XIk/Hm51Wnw/hXWUTgXfU6kE/NrHq
	G4MV6eAsYiZVEXBb5oLm2qQ0a8LXBTF3WXUewD5jVRbG0GQZJDAFqH8E92/etUOcfsCSpXjgoJt
	QqTc7nrNsWU9t+PSphAuCvWck7Cz+UIEVLXJecgzTydaGJ+p4GioYLZj9J6ipeK2eJyqttbS68y
	eSknFlsA=
X-Received: by 2002:a17:907:788:b0:b9d:3af6:bd6c with SMTP id
 a640c23a62f3a-b9d729694cemr651556866b.25.1776059968313; Sun, 12 Apr 2026
 22:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412173317.3329-1-mzndmzn@gmail.com> <20260412173317.3329-2-mzndmzn@gmail.com>
In-Reply-To: <20260412173317.3329-2-mzndmzn@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 08:58:50 +0300
X-Gm-Features: AQROBzA8j3VszXwFcoXm3tMq33VS0vxR7xxrNxJqDXOQmJwlb3mUiGiFtaQEOGM
Message-ID: <CAHp75VcdWMvvM-oKTqRACSXSUiVsEh1Ep_82MsJxfbrG4thUdA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: fbtft: replace empty macro args with identity converter
To: Baker <mzndmzn@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 8:33=E2=80=AFPM Baker <mzndmzn@gmail.com> wrote:
>
> The define_fbtft_write_reg macro calls 'modifier' as a function.
> Passing an empty token as modifier is undefined behavior in C for
> fixed-arity macros. Introduce fbtft_no_conv() as an identity
> function to replace the empty args in the no-conversion cases.

This trick is used in the kernel (usually for u8). If you really want
to improve, use _Generic() instead.

--=20
With Best Regards,
Andy Shevchenko

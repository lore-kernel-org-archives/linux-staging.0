Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2FF3AB47A
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571531; cv=pass; b=U9LVsKmSLXiHUJ5fA6UdorNdAlhbAMgd/oqoRhik3TxZBwreDddHkULoNYb0Zv8UfFmgupoyz/rfGVkeKhs8fdig3fP4jIOUMCmwVL0nQ36Oqao2ZYq2k+JCUhurCYbF7G4Fr20Z9OeA4s96pa9LuLxwKX0G+kMRK7qRUeXdWLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571531; c=relaxed/simple;
	bh=m/fEhPlmCHnFc5IcQj7KnWeRuvZDxbUo1KvQrDQOiYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NP1QGXokQJ1JIAR5RYtsnvIrqJlpDgGgOGspD1b1wBuwoX3xOua3f015i8CdLg+6LVfiz+AmCB5ZllFmkEbyUSxRhz3bJ/FXZn/XZkHiNJKwBdKw55CY56BC9c6/URfIZA4AdA3hn411QGNaSpX/N3ISNGWjpB3lxdBQXi3y6t8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bi4gISoR; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bi4gISoR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15cd3fd760so1173306366b.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 11:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784571528; cv=none;
        d=google.com; s=arc-20260327;
        b=h8a5qsPbQrbewDOwEB0+uXcQrIX9unGbKiTjbo+j1uW5B90sFcT0YAromvwrQ/3jId
         3DpXEFTMYPlUU3nK75BY+q0VJ9SzkdWnwq1Z4JrALTmMNT6Dw0jAJIXIqbrTtt65dKGE
         eu3tlmW53DH6L7hVdDVi4nz4eiX55I3vvj1gQiFTdp2WyvrhtcHMompqvUQBc6YWF1Q1
         mswyL/tyj5K1QlZCta9NkcXuErf/AkLzXLQJjHe9qZJI1usdy/DVwU/bTcLNDzcZLLmy
         NnVmVz3KFfpvl/F7UUnY4Q9HNtEHqCPoTMiLgN7XZR2fIiOB+Xz0XXHW+xSRkEZDl7zV
         U0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m/fEhPlmCHnFc5IcQj7KnWeRuvZDxbUo1KvQrDQOiYs=;
        fh=Z/zli/FFzR3Gvj+p8iu5H5tzPrBzjfbFV2o4OUl9V5o=;
        b=T3N5jCKgiX52kDsaFMpLu1Hlj/90iHCu3F5qIXJX6Fo0Wx/kr1IAtBYCQr+UCcNjOa
         uMneaNCyQj0RPi/TzjeJ5KjXbI6mrvoDsDkbU6vMof0oimuArUDJ5TeGHJ5ARRNPrrVs
         jowxsLyPNz/sMdyF9e75HpZpPforjrJxbgjRPq8ekEmYOWvVdLNXydDn1pofT26zg/Tr
         YTs2muzfAQdv+nU9ibDvLjJUyHLQr/4IBcHu7q/Ni1TchABTqz9meAuI8x04t/uAf1wP
         6QGDyZ12Nscmz+/rzCZ6WQJ44bFKys+9LXMH4wU+pd+NvJ6DwXjbX9OPRBiPzg4EEb7F
         qg0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784571528; x=1785176328; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m/fEhPlmCHnFc5IcQj7KnWeRuvZDxbUo1KvQrDQOiYs=;
        b=bi4gISoR/GBrkiuB8ud8xp37vjVOuuhe9Qg8vrN5/GlS1mD0JH/Jm0/EMhRJ1pU19G
         NeS+IGnz5Wo6Z62vkmxvamM5OsutcJhiqzzANdNFn3HjaJy1uT25haBgrcLXhxwmkt0z
         mlFjJoj5fpyiKHYxONmoayaVYGGCQlm8nFfUhldZM4dgy2s+i3JBv331oHf+OHC8LWNR
         Wt4APfLCDOKMjW30IAU1M9yEzcaHY+wYsfmdebAiuqaH3rook1KeETLdFadSmvxA838n
         n+jITP37x5kzEn1i+GF5Zv36jXUB8AMlkLjqR9WM81i5cubg95lP0V0DaGqs4FpBTqly
         Lz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571528; x=1785176328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/fEhPlmCHnFc5IcQj7KnWeRuvZDxbUo1KvQrDQOiYs=;
        b=oJ6uVn+NFmBxKsOY+DmcC3LPm6ADOwnn/N173fL8X37exHKTbHOZ3DpprAaYqXrwTX
         f9BatR0tw8xOjOuY5RA3qAnCk6gULxiJvr6lz0IchCcFHJgPLr1+hQyChKq2xQFI+KhZ
         zJyIPUtayJBj9m/7KfmDbB+JQVYsWP4pVs+AgAFfzSrG+NFfEzO73B2YdOwTeidP5H5h
         l4Zi/JJogQ+y8BHZarBduWidoELLZcfm5dxd9L7KrvqANK/1JapYRW+nF/01B5CBLV79
         +mxVovB/Vr8xd3ORKHb0tg2nGqxI0NWxjlZaNkKPAa/0+nYCx1eoEE42OE1opQAFJTOl
         XDUg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2YcEaMwpfRA+6a+cRd9goPAAioXBTaHgVIPXdDdVi35AnFifjxvclBh/HzYMhfANGsj8Ja+3+HJ2XqmQS@lists.linux.dev
X-Gm-Message-State: AOJu0Yyppo5Zn13HTG9BMRxZrutu0/Rry70BKbKaMQBv/OmiiQKgBsbS
	BmSWgujY83nf0tCQi3pxRnXNhzFIgaSfZkWXwUhjN3WYa9327slCDWlXKWfm+18Zk5p0BRnM9c5
	N5EI/N7ShjBSHpJj2HuQ1sPwAczACy14=
X-Gm-Gg: AfdE7cmwqwe7zYsCAl+Yag4VPG7NOhT9GFynMHdttAy6ORxCNntjimAHgvRk3FUEvmH
	truvu9lCcgfc/zq894zsnH5O6mpe3aEQzdDnmo1pXQVScIsvnqtfqOsaEDs3LzCRwnAEiOPxIU3
	i8VLzNgO6JT2331zXkTrP4t+5IXvggWpP83FnxvX2znfaOOM4g8XvaZEpa3YVPNZixffq0sE7xe
	nc1AwFXal36r9kZaZu3jQ6ilEm29wUUlOQuv4JqeGj/QnveFTaQ2Z9DLmI8bSVE8PlMMMHztpAU
	s9aSYWVRpsGOh96FlvceA8K7e84JgmAwVTobPcObQmtUf0sOHbyVD5wy/JpCl28Gzm8im+tw9MT
	QSk37xNysyyI7mWvlOaTfOsT+hA+uI2uH+wpYdjvQT3DEcrs=
X-Received: by 2002:a17:907:e90:b0:c16:209f:d48e with SMTP id
 a640c23a62f3a-c16b477c680mr647988866b.30.1784571527740; Mon, 20 Jul 2026
 11:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720134324.239391-1-panchuang@vivo.com> <20260720134324.239391-3-panchuang@vivo.com>
In-Reply-To: <20260720134324.239391-3-panchuang@vivo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Jul 2026 21:18:11 +0300
X-Gm-Features: AUfX_mwTy2WT6DYuON66_1rgaXEdx6DQ_MN_MwvGATimw2bJv2PLyRfTTwQNNyM
Message-ID: <CAHp75Vfu7tuGsH0MS12dwSn0uAWJsfuJtTWzG=TztU08i6oQfg@mail.gmail.com>
Subject: Re: [PATCH 2/7] staging: fbtft: Remove redundant dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:FBTFT Framebuffer drivers" <dri-devel@lists.freedesktop.org>, 
	"open list:FBTFT Framebuffer drivers" <linux-fbdev@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 4:44=E2=80=AFPM Pan Chuang <panchuang@vivo.com> wro=
te:
>
> Since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"=
),
> devm_request_irq() automatically logs detailed error messages on
> failure. Remove the now-redundant driver-specific dev_err_probe() calls.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

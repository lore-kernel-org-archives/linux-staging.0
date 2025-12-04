Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8042FBDE3
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764875350; cv=none; b=WJN+mfs91gYsh3itQhEvZrblmjlVrRvkNZuQh5m9NrerScS40yjO5e908E5VXXGWkukVAZe/Bm78gblwdm278GQRhux8MbtyfLBu+qE9a7CLfikq7rJE6vgwFYjivkDFV0Oc2ZfTRFy24mBeDNQGJzgPsrlS+d+jCRcWXl0hfOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764875350; c=relaxed/simple;
	bh=oIiCE2xi/Erk35MxEw0TBeShsC29RnTxb3mcE85UQQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7p569eOZFzZIzhMgRPwqzIhHqp0pL33UeUBjvL8cF2yI2xvgOQcyG7SIIH72D8/4ZIE4YHgnDHW7D3aQsknhBoXEfAA6zLr1M0rp5KghcERvSt6gCsZbj+N1cp6GibwZQiefvzr8Pd96J2J3W1QB2VQF74ljDkOCyuoX6g1EIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg1W0B+A; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg1W0B+A"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b73b24f1784so252852566b.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 11:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764875347; x=1765480147; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIiCE2xi/Erk35MxEw0TBeShsC29RnTxb3mcE85UQQw=;
        b=Vg1W0B+A7/CBz9swIfwwr6ya+YvuoD0yGLCs0tLn4ZF2mIb2RWu3w0/vQrRVRGyUbw
         rdxlwBwfToBxc4j4SPEwDq+hLTDeIJ4rSphvTQ8ew3K0iKpWmhxNbq9cd8wtxZl56aA1
         y+SghhkzAKCzxK5QQbRzaJ2IUyKoXQe7p+wwZ7IS/xRavD5F7MiATJBJiYiQOP407och
         Zl8ZadjvaSZQfx5+RUturHHlXk2+ZbvoSyX7zpLBcOEHgGMkVm8OtBzQBiWg5Amaz/HR
         zS5GUBWX9zcIZjH5IwmgTTrVltpA+T8drg2FLE4rOpdzzSvQ+m7sRkwnXTVm0hPMncHU
         uIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764875347; x=1765480147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oIiCE2xi/Erk35MxEw0TBeShsC29RnTxb3mcE85UQQw=;
        b=f/Mo5U8K4Bk/V3cfLTJjgit2+Mfzo/oS6O7kXJjUOnm6OyUS0NHa3PeM2LnLWknqSR
         +ogTY1DVOBdallzKxCGFLooRWR+2rcpoQWApICsdb4QulUAKObE/OlwLTGZsSSZPTqq6
         Zd1OzPpVsz+GFmngALMTTj/LCNEH72Qos4Vjiaq4DZn8SAR31gX1dDXhK1yR97otI+eM
         7MtWWT9HK1RE3anLCBLUWpWDw7pBPaX3SCN4KdE0zAhb4dpufa+6ghw5gawjaV88dPHN
         pL2djJP69C2NGQFHXDNNOxNbsDLZdVIK2uLrnsNAS8auZsuz+AVqNDu+i8A1n37esFNt
         0e2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfV8+VzjtZ/BYI4weX7FYmKHM8ym4HK+2+ZxW7eprD76+Gdp4kYAhMHBHEj6KDoqwEGTwuKn2k9rEDhSqf@lists.linux.dev
X-Gm-Message-State: AOJu0YwRRAOLSY7qfacLhvvwOOpv1Qegi8jbQ5NJr1KGs3g3beDHL5zV
	isvPe5C0ezqHL1KlSpmLESGvPbSlB13cbgweXb3uh9+GggB+GTbig3l7Z6nKLF+7S9snO/cwNUx
	NtEGq+lz9bpLx1gOiLWZdkws0B199GgY=
X-Gm-Gg: ASbGncv5ovGLjxhhpPiVckXQBiBoCToftcqD/jpFMHq26o2KsFTtfFCSOMciq9yemBT
	aW+O0lxq3QiXRvmgAca/EeRBFbL+zH6NwOqKH/dhUGBXHcfyA6DHEJN6KHKLeFnUmHHsRxDKaws
	wFB8HXEPzHckQhK/dK7SmYpilCVjB3SBUnKTOGR+Zioro3d3VZJI2pkrV7+SJ1BI4kF1uSObODc
	d2UaJ0vDZqKNNfkB7ofW7wK/FaJOeipsgSgz9N20MQ7l3rNAh6N9jiHxfzlOv5vqDY6wyMRv6P1
	DfaRUWQY6XgsRY0vILjhVbOPL1lsURqhs4+A2pbmSiPXK7hBjc+utN2WT1qav09AuL4HH9A=
X-Google-Smtp-Source: AGHT+IFif6PPSQ3bdYZyl60xBVHS+YHQUdU3U18xVfPP7wuBbgXOWw5TN+8NrQFPhWC+NkdiecPTcbm2zzCbaphULTI=
X-Received: by 2002:a17:907:9444:b0:b76:afa4:933f with SMTP id
 a640c23a62f3a-b79eb620ca7mr439360766b.22.1764875346485; Thu, 04 Dec 2025
 11:09:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251204185434.4542-1-tomasborquez13@gmail.com>
In-Reply-To: <20251204185434.4542-1-tomasborquez13@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Dec 2025 21:08:29 +0200
X-Gm-Features: AWmQ_blbaURTYD3UjoGkmi8lxQ2B7F4TGEx836s04tzX7VJ_RhPksJC95T8Yj4I
Message-ID: <CAHp75Vd-qJwBAg-LuCa-iyDoHm5Tar46AV3tOYpR4dS9bZ6Grw@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: ad9832: remove platform_data support
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 8:55=E2=80=AFPM Tomas Borquez <tomasborquez13@gmail.=
com> wrote:
>
> Remove legacy platform_data support as there are no in tree users and
> this approach belongs to a long gone era. The policy decision on what
> to output is a userspace problem, not something that should be provided
> from firmware.
>
> The driver now initializes the device to a safe state (SLEEP|RESET|CLR)
> outputting nothing. Userspace can configure the desired frequencies and
> phases via the existing sysfs attributes once the device is ready to be
> used.
>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
> ---
> Original discussion:
> https://lore.kernel.org/linux-iio/20250628161040.3d21e2c4@jic23-huawei/

This can be made as Link:

...
Original discussion started here [1].

Link: ... [1]
Suggested-by: ...
SoB: ...

...

Code wise I like and support this change, thanks!

--=20
With Best Regards,
Andy Shevchenko

Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA15713AD20
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 07:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733817146; cv=none; b=cbG8oSwHoeGp7ejfpSKsHclZzORu5a1MPuy7CCBWjNAlrV1ZGkjlCJCFJpZT79XLKEhhfDrmReROPaou3zOR5RJoRd55wCJ7fosisCAfe6Izo4JVWKXg+PYeY5nOLB1hukBaDcJud3y+zOPgZ0F+EfcmvRSMhfe3NcTwhAbwHfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733817146; c=relaxed/simple;
	bh=fb9XBheC5AF6NuNLIs6+iRITBsPUYizJNiY0NNOZSbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xw0Nt5fqVZnQGixfwTShJXyRIsTkgS1/kFGXHUo/1XXnOaxdNPA8Fw6WtieemOZv/hEqav5qVumZ40Kyh263K+SlGzEYrHmhN8Yg3TA+7QaEaDQ+pwBG2grB0i9jfgM5BfVUufpQIdRlfLQBuLqHYsstXl6XWIBX3pRMKuzaYK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c4cd95885so716768241.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 23:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733817142; x=1734421942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zd5kJW4NoChkFf/vXmMTY/HBELzUe+qzSNYi9IJ5t8E=;
        b=sIk9MGTggy6G7UG5I2jlnwwOMfWV6mKts8kAwcvKXckMqQHuazrW3S+3Xu0rgXQHgW
         2FLMdoj3UxgPtK+F9ERFAPOdlaAbw3z93MARKqNU5m7AvhlQ9rf9vOGgu1lum5pbSYaO
         bTXX9x69GrRZOsF6WPq04UKa2s4+iQRDBj3VQ8ZzdSw//LYOxAxmBpeIlmq2HnT6V3wS
         g7RIQO7R6P5wlJl1daw3ydzWmAtkkdlMKHlap2sEHbo5GDb4DSrrOzs5RgGE/U3Y3Ccv
         dIIN2nfIOzLWaHYOu5q8TqRala8SVt6Vm/9gv6gPY7Q1khm1L+dxFrX14x6XKLkoF3Y9
         2sAw==
X-Forwarded-Encrypted: i=1; AJvYcCWmnI1soXfSldPDPAcLpqUSUqzxTMvWQ6DsbujfRQVgouNjpM64gXY6WdxQ1iC3NFBRZcK8g2tIbhSP01m/@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg7JP61u71zlJjn3nJXONiqZ94sDXi1JE3R4VUt1I18EV3P7b/
	OPVodham5uuQODniYQX67nW+eqMjprqlC7s89h0mH71VvDXDaLRI/Sj2MLFtidg=
X-Gm-Gg: ASbGncsThiotYMdBFypUuchdoLnN9NeI9GLgECGKVRwBoSXec/ZmoKTz6TPQq853+q6
	CzQvFjCLXyRBNfkk9ci9fOJ84/d2AUDbTM+8beuR2B+nZX2oMb0CnIaaArxeCjKMqDJEaaknr4Q
	gtY4QzheW0FCHZi5G35WsR2IQ9jmbsJlcjaqNbveMaW/UeDM89ZgQ5cQQBj3S7a7i0HMk79UqUa
	mioPkqEoYpSFmILrCKGvGH8bHRfwkIQlWtuE9YSQK5Hgzja5ZR7TaYgGv+xjTGkwcerIb0EX+lC
	eGUfglZQvFRkXUa0tk2i
X-Google-Smtp-Source: AGHT+IGu1PkMN8EJPw38/NArfx6goWoZLC9/kaCfxb8Uxqpuzka9J7akcJiVAHWdrxwZinq87qqSpw==
X-Received: by 2002:a67:cf88:0:b0:4b1:1a10:d02a with SMTP id ada2fe7eead31-4b11a10d5d7mr1536949137.13.1733817141668;
        Mon, 09 Dec 2024 23:52:21 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85ca76b8277sm204504241.4.2024.12.09.23.52.20
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 23:52:20 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5187f0b893dso460125e0c.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 23:52:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNAMpVf+k1xC6EGLeqzRc4DJtGJ+Z4a8nKhkOf0I8jm23Bjcl7zVZ83TIKuWfh7gziqsxs5uWtujIG4f9K@lists.linux.dev
X-Received: by 2002:a05:6122:3806:b0:518:859e:87ab with SMTP id
 71dfb90a1353d-51888540275mr4084739e0c.9.1733817140651; Mon, 09 Dec 2024
 23:52:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241204162128.25617-1-dpenkler@gmail.com> <CAMuHMdVUnr4iAZmuy8Z3S+sCYN4P26RdpPwXevwiJrh+KN025Q@mail.gmail.com>
 <ddc720b2-8bb4-4a07-8280-dadeb2de5b26@roeck-us.net>
In-Reply-To: <ddc720b2-8bb4-4a07-8280-dadeb2de5b26@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 08:52:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUb-tpmTiKV5BFopCWoY96D_HYNG60Kv+wVRKnDFF+COA@mail.gmail.com>
Message-ID: <CAMuHMdUb-tpmTiKV5BFopCWoY96D_HYNG60Kv+wVRKnDFF+COA@mail.gmail.com>
Subject: Re: [PATCH v5] staging: gpib: Fix i386 build issue
To: Guenter Roeck <linux@roeck-us.net>
Cc: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

On Mon, Dec 9, 2024 at 5:18=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
> The underlying problem is that the code uses a pointer to store the physi=
cal
> address. That doesn't work if sizeof(pointer) < sizeof(physical address),
> which affects systems with X86_PAE enabled. I have not seen the problem
> anywhere else.

I could reproduce the build issue on ARM, with CONFIG_ARM_LPAE=3Dy,
which is not enabled by allmodconfig.

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

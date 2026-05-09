Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FD0288B1
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 07:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778311506; cv=pass; b=VNSSVVM8V88X4ItkTZrTwkX3PITBXWagIMUcsY8nRTiJKzZbhk0o/gFtIhMmxWNGGQY22oUgu2U8UQ+ztRZmST1z9Nx084U7KpFynzd2IHtNyeKa4I5a4NI0yBoZNZKkGFaLUgXW5pBOm2KqULfgJsen92fIKy/qXZaYY/uhGSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778311506; c=relaxed/simple;
	bh=3IlHdIKrxoF2X0/gAC7sJMPSLQvrfJIIpzD5NQSukIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ej8jtORj3qSpIrYlHkSxP47XGTXmzDXLfDhqWX/UYdeuS63P5SDIcC/BuxlRpsc60d7EXmjRoOIDcHb2xiAkmLZTsEitMzdoVxwq18SNEREyfQXp9CeESJNrYbEEX3QCOJrByFNqiQOnfVQ2RWYzRFzTX1cPxAW1mXRDt5t8fW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8RiGshL; arc=pass smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8RiGshL"
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-5a746f9c092so4572951e87.1
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 00:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778311503; cv=none;
        d=google.com; s=arc-20240605;
        b=giHJBJsN0krAmpnkjdIrRFzKL6Q4Vc/FYTAHyajAujFBpwerRU4jMGyo59ZOTPnmyW
         +3O9RCFumPWKb6QGd5sJym7UC+HSPtuWBNrEjeAvweXJ3yMdZC/XKSw3vl15KAmScv3P
         jvjns6uX82vsHAM2gMb17rqGNiMnkuqIN4MHUu+kfg0si5yDsh9sN0ycaY0q/dwAJl5e
         tYSU+COW9LXQ0fiJuT4ApoCZIYIM/0eP+8iKs+UqR4VoOLHFtxKrRoICYw3Gx1q2b2aV
         nDxN/gZ860PPBhhx2hQ12i3EL7v+8WeCvo81UgqrkXlGrsEpLNrN9RQBibjdSWoQaz3w
         wCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj5G1zpXz8URXkLKbWZSkB6rGldzCniXuy/i0RUhoEY=;
        fh=6+smLIjSPgvr/iEYLBBhGEz1Uop3n8tQGmjd1/xA4yM=;
        b=P5WUya3asqKsJlzx+WXQd1NQ5AQoJKMCyuHc9teUSXVsHzAy5TlHjyyB5/QmQUx+zK
         M8PwO1Ld9ChbvgoYvU9rgkxIEgojBGjfx+V0CBes/nOFHJ7XIKboQOC4HVgRmgDTTq6z
         yRV66ztVSf7NpNZ57r8G9p26/ZGn7JGcM/af05913qTa7ywdgoLEcNK3k8lzwqHxmxKa
         hAmPAl2+TQkafkXUlMBMkl/kQzJNHNKo9T86WxXqL4NdjoUGCawmqvRHr5TKvYsXnhhg
         GoxXfNWhVKEHb5sMT6S3GTzUUiNrrbIgOMOqeXvOo76Lr16fsh1vw1+vDHA6U9YsD/tx
         Ga5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778311503; x=1778916303; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj5G1zpXz8URXkLKbWZSkB6rGldzCniXuy/i0RUhoEY=;
        b=s8RiGshL8/WOUlhA1BISHLKQyiDtpD1A8Xhakw8/wpjp5MveL5VecWpoV9ZLBrvc3o
         8HRsWlnagrIX/ziZbp8FvJ8ewrh3EINaImpHfYioLulLx6scoB/S2Jy+JH32C2WtGfGT
         pyTwQ/KRPcO03boa9Zg0c6xjoXMgCvWcyFhL8jpTzJmZtgdAzhJqC1/Sg46iPzRv7kxV
         PWWThSlBRFGtkxFCIeMbsSPj0YDxQ1DuQXreojS1BxLeiWcsh3bF1gT/tvseUD8hyX/o
         qxmV3+By1gBKFF4q27e5iTf4PP/EmtQrz+todNbexFeIvKlzKNq1by7LPgR3K2gJFl3B
         wSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778311503; x=1778916303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj5G1zpXz8URXkLKbWZSkB6rGldzCniXuy/i0RUhoEY=;
        b=lGw9MI3fQIidUpczwJq+hZTBzjZ/dnXsyW3haoG9zmB1svrO9DqnLJLoqaTK8xoVs5
         UQwkRcfimq34NuZFB7WxRjVYzJW7bDcNz6mFbjn1CH4onjS4KVg+r3WB9qSB6FvfqbsG
         SYcGr7u6hbZWD253OXh7aTtIM4j8ab3IBd7bt5/WPKxReqoAOwl5Vr7CBe042fXgO/e8
         N8I+0jSvihnFjeSciuBewRqMvEVblXHg+Tuxcb9S/6P61w+++MHEuRTmUM0lesqMp4ML
         /ldShwcOaorSmOmy9QZgPaRbvEr4xpwx6stpF9uiSksrwV5Zm+S5BwMsqgHfq9FShvC4
         mAQg==
X-Forwarded-Encrypted: i=1; AFNElJ9LuaNaz3mq5t7GJRUEtqzYvuQ3hWxya2+STN8+1NBCFvFG5ddFdAdo3JtA6GARbKTdlsg1h6qZE6orWRZW@lists.linux.dev
X-Gm-Message-State: AOJu0YwPyni3uy7B7B0n/D1NYEJ1znXSXAOlb2G/A5WjTApV4EfZ2xd/
	9j2B01L/Jwx0ECB8a7rv5xQ+EHRJYJlcCD+wRYvjZEqf5f6RIhO0WE1D7Bi2HyEFjSPh/UUShyG
	+hYsiJ/lZZlLqc0JlWW3B4u6MtQagDPM=
X-Gm-Gg: Acq92OF2hb8Q48xLR+Tp0jVZvQhYRsRQAqiwUpIknj8Q6BO/a57XFDzgB/Qcx8WiTG+
	oK5ccoSdJzLgx/K1ZHgJ20x6ltahnU/ucl+0HoafkBD2tYGCbDqA0EqucyDo1SbaLjhjZTz8K93
	cZQ8gLus4V7+yfqmIj0e2499YPNhkN6u46ypq14tD+yaq/JfFS8Dpl7P4Lvjbds5PzFhKafbEq+
	50wNWu+cwRUEX+1UT36KTSQNlj/bcPEtBqlY9bhmUJdLJ1SAJjBCrUR/VeLbM6YZTt8nsiXqHI3
	aiXlAsJUqXsKSt8PBeRJQjBKPwMhA1r15mn9uwXdYw==
X-Received: by 2002:a05:6512:3c97:b0:5a4:505:f63c with SMTP id
 2adb3069b0e04-5a899b9fa9bmr3363525e87.11.1778311502972; Sat, 09 May 2026
 00:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509020646.82778-1-dennylin0707@gmail.com> <af7a0OV-3GLH490W@ashevche-desk.local>
In-Reply-To: <af7a0OV-3GLH490W@ashevche-desk.local>
From: Denny Lin <dennylin0707@gmail.com>
Date: Sat, 9 May 2026 00:24:51 -0700
X-Gm-Features: AVHnY4KdRrbbReAhl_lX5vMSOUZ9tiMyenRCgloh353F-edhYhGfKBnVv-HGyFI
Message-ID: <CAGEkeHeS1uYyC95yba2o9Ahs3GhPFubjC_i6gj9Kp6M8WG0F=A@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: ad7816: propagate SPI error codes
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thanks for pointing this out.

You're right that this changes the userspace-visible error codes and
can be considered an ABI change. I don't think this is worth the risk,
so I'll drop this change.

Thanks,
Hungyu

On Fri, May 8, 2026 at 11:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sat, May 09, 2026 at 02:06:46AM +0000, Hungyu Lin wrote:
> > The driver currently returns -EIO for SPI read/write failures,
> > which hides the actual error code returned by the SPI subsystem.
> >
> > Return the original error code instead to allow better diagnostics
> > and error handling by callers.
>
> ...
>
> > static ssize_t ad7816_show_value(struct device *dev,
>
> >       ret =3D ad7816_spi_read(chip, &data);
> >       if (ret)
> > -             return -EIO;
> > +             return ret;
>
> At least this is an ABI change and should have been mentioned in the comm=
it
> message and justified.
>
> Yes, error code is an ABI and infamous case is already known when similar
> change badly broke user space.
>
> https://lkml.org/lkml/2012/12/23/75
>
> ...
>
> > static inline ssize_t ad7816_set_oti(struct device *dev,
>
> >       ret =3D ad7816_spi_write(chip, data);
> >       if (ret)
> > -             return -EIO;
> > +             return ret;
>
> Haven't checked this one, though.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

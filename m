Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5987202F8F;
	Tue, 22 Apr 2025 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339187; cv=none; b=j/SkYOhygfMTpuXVWzC9nVWjCL6XgayegIpt34PiimjLb16G2M4f032ligtTkb7F4yI/nwJ2j9/rb0SINYjCMTutU0qHuFFQ5wnTMb5nZhmx1Q6thyFWv7LRPYul0oE6uoGUjkRU/b7wRiPtOzoqDMJNuimNo3cUzt8OtRnTS/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339187; c=relaxed/simple;
	bh=rAuJs8Us15DzSe1EQoberk3uqEajJCM7zxnOl8M2oFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbj2AYNI1L/+iqPV0QfQqZVEP6KVdPwfeyEPfQmND6hxWcPMXtZu9dgQEbnjqhvsRQUfYlRGiPyAGEuC0hh2IKHDr0LRlMtecoYvUZxVHRBuKmynADeA2F3bAzMrVN5IcxfZ39cUgRAAQP3+3Ze323sOmeGcnffYBkIcCwUzx6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdIMAAAB; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdIMAAAB"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476af5479feso58109291cf.2;
        Tue, 22 Apr 2025 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745339184; x=1745943984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tyJ37WkX8bjUBji2qqv/BJikIEPwtC8Nr6ME5ibd/o=;
        b=WdIMAAABuJSoIi6+dmEEs+T/qUbNPHX0jHrOyWOPzkzcRqqEk3whDXkvu3lsGkMgQ8
         4bK5l4FElApAl8kAWN4MNnilQKIsxgf75S88fBS/D4HoobzIN7QBh9GWKvvP8Uo0E0zT
         8l53qzPCzlE0qIV0JgohiwcSus3LoTXqTzqsmJ056mmlw+4Jj4phom33KMiiQG3Qaoc6
         oy5vDzWmCFjPEyREPbNEA9IeXTGqcWvHn4PfUNZEMlyhDgTP8fmL7AiAl51IEVRtezwf
         d5RxlwJ4X6ubUZBFNsifPuJlKtKpHXinTeETj5vwenLBLSCxl+HeKjqmjIP/sYNH6prg
         nfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339184; x=1745943984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tyJ37WkX8bjUBji2qqv/BJikIEPwtC8Nr6ME5ibd/o=;
        b=ZGvhHPu9ksTws2w2Pa6lwfJspTeSy5N6+qvC7BOtrH8z9KxwomgIZD27jT+F26RHbh
         y8w1HoVMSdsas4JVlNCX3FXHssZQN0JWYPFhv9vBmBoAYmzAftmXWBrD76K2tmwvBjhU
         vhKOUDQDrvD0RAmtNgsdYiY/VlPJSYhMwR1V0pclRZYBfPTtMyu/DRy4FLGPx4O+6gCQ
         EfFwRwHcXoYvNVtIdzZ3SY4RarJ9/aRjok6jDE4WAfJZGAHoxcQ0zAbh+y1UC0zRC1Pz
         7B9DH5z+IpWjJt6nuVQi1wBvCpn4kZDjZX4/ts7b0ybTuWHhY/z+5vM/vJaSyjAL+/qc
         VbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1KU3KV680N0zV9d7bViAGfUbNtF5RiSaIYDpmU/AO3n5C5xBwRrp8lEHkOGbOE7CX2ieQjz+CLSDzpO9dJY7EGQqOSg==@lists.linux.dev, AJvYcCXBPPpahnAMR9x9Lsw5K42LChvkLEF1NOPdhxZxAzqDkt2XamKUhUOLm4hygORjm580u/0ux1QnxBqbkCvGxA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv7JvhJNj0EOVzGCFPxWsz8esrzuLhqi6BQL86478NFBEywYUN
	gokPFDfZt+Yq0BeIRnCSZuCgn9+8zK0xb+U+R3i9tmiwf+z/qfqnmivMjyQu5VZLPs/j+xAQd/5
	apfILwWGHu1nvpdX2ea/Zrin/+oY=
X-Gm-Gg: ASbGncu4ipY20q31SD2osfX87OvMdJGI6lUzHUgVyngm59LWzmr0q32gVasfnxvUnB7
	QW5Nxiqe/1yJugCEGtO3wEf17gBQQlVYMg4Qg8ABk+dnUQZx2wYx3/lxP2xiVFTQ18wxGClCo32
	8w20GFbYpALF9B58OHhOoAK1RPtQxA7ZXI0l+EBgDNU/oB0nBMoIGq+w==
X-Google-Smtp-Source: AGHT+IEcYJ2/oybFGdU8VnxKA+y7blqNHbRLI/eEP0I5SpkFftBpU9T+C03FKxVVwvOENJgew8ZjEwrqtZtsjxC928M=
X-Received: by 2002:a05:622a:1343:b0:477:41fa:1120 with SMTP id
 d75a77b69052e-47aec3cc4a9mr274674531cf.12.1745339184595; Tue, 22 Apr 2025
 09:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420174725.887242-1-gshahrouzi@gmail.com> <20250420174725.887242-4-gshahrouzi@gmail.com>
 <e712ec88-d925-4a73-8df4-ca3387a903fd@stanley.mountain>
In-Reply-To: <e712ec88-d925-4a73-8df4-ca3387a903fd@stanley.mountain>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 22 Apr 2025 12:25:00 -0400
X-Gm-Features: ATxdqUEgvV_UQ6WqnrgikuXDxV3a_f2utlusbalE5VqAeZ7omZi6Cs0ce_HnGRc
Message-ID: <CAKUZ0zLjUOz1Gg129Dj01Vsa-jokTePggv=CAFOf=qzhE_Fezw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] staging: iio: ad9832: Add minor improvements to ad9832_write_powerdown
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 6:08=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sun, Apr 20, 2025 at 01:47:25PM -0400, Gabriel Shahrouzi wrote:
> > Minimize size of type that needs to be used by replacing unsigned long
> > with bool. Avoid redundancy by checking if cached power state is the
> > same as the one requested.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >  drivers/staging/iio/frequency/ad9832.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/i=
io/frequency/ad9832.c
> > index a8fc20379efed..2ab6026d56b5c 100644
> > --- a/drivers/staging/iio/frequency/ad9832.c
> > +++ b/drivers/staging/iio/frequency/ad9832.c
> > @@ -173,13 +173,19 @@ static ssize_t ad9832_write_powerdown(struct devi=
ce *dev, struct device_attribut
> >       struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> >       struct ad9832_state *st =3D iio_priv(indio_dev);
> >       int ret;
> > -     unsigned long val;
> > +     bool val;
> > +     bool cur;
> >
> > -     ret =3D kstrtoul(buf, 10, &val);
> > +     ret =3D kstrtobool(buf, &val);
> >       if (ret)
> > -             goto error_ret;
> > +             return ret;
>
> Fold this whole thing into patch 2.  Don't write something and then fix
> it in the next patch.
Ah, I forgot to respond to this part =E2=80=94 makes sense. I was initially
trying to mirror the original author=E2=80=99s style and build on top of it=
,
but I see now that all the changes should be folded into a single
patch.
>
> >
> >       mutex_lock(&st->lock);
> > +
> > +     cur =3D !!(st->ctrl_src & AD9832_SLEEP);
> > +     if (val =3D=3D cur)
> > +             goto unlock;
> > +
> >       if (val)
> >               st->ctrl_src |=3D AD9832_SLEEP;
> >       else
> > @@ -189,10 +195,10 @@ static ssize_t ad9832_write_powerdown(struct devi=
ce *dev, struct device_attribut
> >       st->data =3D cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
> >                               st->ctrl_src);
> >       ret =3D spi_sync(st->spi, &st->msg);
> > -     mutex_unlock(&st->lock);
> >
> > -error_ret:
> > -     return ret ? ret : len;
> > +unlock:
> > +     mutex_unlock(&st->lock);
> > +     return len;
>
> This should still be:
>
>         return ret ? ret : len;
>
> regards,
> dan carpenter
>

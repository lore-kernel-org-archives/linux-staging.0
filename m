Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62515FD16
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433852; cv=none; b=DWVdGHjvLX2g06UeyX+rqYHyvWnZ+zWH+ia0J1hHL/PvzF8pMR/pwBdJoLmwKBR59pKrjtxwKZu5JxgnyJes3BWSD8o6gfwSe3JTCO+XSjKmNvXKEdCjn14OzyJBorhXNnj8/XY4Qz4TbHmfxM2J+CZMsGX4YdSOrYjfK9Hn0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433852; c=relaxed/simple;
	bh=fz4ehh1bQZ2voJetS6zPYXn8bzrKSGjb88ZmDK5++9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=se7Tm24EirUZvrAsLm6zv5oiomuxCyhPXaAFB21Z9ya2PaEeMR238j872BSIMn9hv6cGxhaPr59nLZ7HDl4B/GZZSRM26WGyKw3aqAF0cR+EAIATbPzMiC4Pr1ehaJzjaYKpX2pc2VMi3eSukUN8k1gJNw20UQFM1EYgvF2O+9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eflv73fJ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eflv73fJ"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f77be8ffecso22574711fa.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727433849; x=1728038649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty2QooaMm3MgyPtlbZ33W8k1ZyXnxkvNjudQ7UqFkNM=;
        b=Eflv73fJndRjIBH/zce+Rn09q5jUYbJe4MfRJqe88JPxGSEz8qd+50tgPGd5zddfjH
         8wpnk+4cG7+3aBk2GUrXk9IhTfgQbQ2XExyYzbWEIcIp2tLF22gFSoPU6upYyqe26zYS
         aYao0LzeNKO233TwsSy1TJBkrxLw7DZMfJkE9GS2re5vRnbnNv3RyPep/LNl5stbtS/U
         6FOeGVhe3bVqRiTlK95Y5nApdukpef5lqE/w7aQZJbnPcC6r0mhQ4sN3rWa52wqSOHwR
         VIUa+LXKK0QxWtbfJVW92v1QgaLeN66h3mtqAulhp2vllL14Ej3SHlDNpnwBbQ9tXdy8
         7JZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433849; x=1728038649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ty2QooaMm3MgyPtlbZ33W8k1ZyXnxkvNjudQ7UqFkNM=;
        b=saTUijeAXWSid2bYud/OSqFULITW7o6ap2/gEuBqn501f3u/qfFM572vgmClTfa1w4
         D/mDh4HnYzdH9qIR/WV35bw67CACExO+QPUhUEfHFJ/xfmo0lUuPJKFaNkV6w8RzcjUQ
         xNM7tuQn5CBFUIgxVAoT4SrhJeKbyVH8k+wP0JcaB1VwRrRWpFtkOjwQmDHMPQ+9u/Vi
         ylF2c8Mm7Z5foIaW2aK1WmCg09/X/wDmyMkgfaEedO5OMVORrb3+jhkJ3RIyekUm7JwH
         GJ1M+6RoC28b8mojPyF5XIVHjnv2pTER7TbQvhqtGBcSmniaJrySzuhrNdyRMudOBQKI
         7vig==
X-Forwarded-Encrypted: i=1; AJvYcCX0P9xXRewezgQ6VBGKDLe3u5wAV81qDBk/Eg7CMpXGLEoPVrGIWWF1AE4bQ3cb428RjL+DkovUgKIiS4om@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu4M+24HokE5/10k4G8r2Q4CWom9JR2oVuHZaZT8UdeHCGJMEb
	QrMx9d95rOtVcNjciSDlePLQ0ehj5poDcCAsBnvWCrSHWdMKHpJW8332lHVYO1eOZ/bEvI9YcpJ
	jFLT6jlFgew4aPCyKsr0yJDwMsrI=
X-Google-Smtp-Source: AGHT+IFVnUKDhHiI5ExDkrPLHRaGwU3uwx4kd6LA7qpPwEJIJZck9E7xMesSOCKsp0IAit02EvrDjtJRWN14zBw0Y9o=
X-Received: by 2002:a05:651c:b12:b0:2f7:500c:2212 with SMTP id
 38308e7fff4ca-2f9d3e47a58mr18319481fa.10.1727433848583; Fri, 27 Sep 2024
 03:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
 <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org> <CAHp75VeGAzU1BT5bE0BrVj4MR=TR2KEzjwhoFUnN5Q=fUanJZg@mail.gmail.com>
 <CANiDSCvF4g7H77Tuy=YUfCG5xYxcb8R8oTsvCjSt65zPAsepog@mail.gmail.com>
In-Reply-To: <CANiDSCvF4g7H77Tuy=YUfCG5xYxcb8R8oTsvCjSt65zPAsepog@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Sep 2024 13:43:31 +0300
Message-ID: <CAHp75Vcqpn3Jtwo6V27rHvC9=a50-kwFqMx+axySxsCpYagJaw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:16=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
> On Fri, 27 Sept 2024 at 12:10, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Sep 27, 2024 at 1:02=E2=80=AFPM Ricardo Ribalda <ribalda@chromi=
um.org> wrote:

...

> > >         if (i =3D=3D 10)
> > >                 phy_err(phy, "Failed to power %s complexio\n",
> > > -                       enable ? "up" : "down");
> > > +                       str_up_down(enable);
> >
> > You never tested this, do not bother to send untested material, please!
>
> Do you mean tested in real hardware or compile test it?

Obviously both as one can't be done without the other.

--=20
With Best Regards,
Andy Shevchenko

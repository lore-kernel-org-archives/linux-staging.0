Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8F41DBB3A;
	Sat,  5 Apr 2025 11:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743851902; cv=none; b=AfbqnQqTth25i8DZYU2uAnUyQZXIu5odFung5Y9Fcsq4rfMiPOlq8vEJhkPRa0J4vA+UUV8f7wBRZNceJP7cB7xcn0MzZcW8yFQFKUEzspFDmV+eoOB4RTFmKqIj/4oRjHMOXLLMPMzDY8LPZiWQ0LtMprqUa6zpNHxJVqQiEGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743851902; c=relaxed/simple;
	bh=l+pRa8nsaudSPMcT2LvHvsD9/xV2J6NZobi5KXfSLJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iH+R1LOWxdGp4eGkMTSF0If9BlfkNYwszt6hxbO2W6zavku6D1k4wyg7sQHoeV6WfBKm/RJ3fdV4/0njRxQE2ZwUjO415YPHIkmoLdBGZ1PE7adfybslayWmA8gfd4WlrKJmDf6s3OhHyIS8K0Z8cvDJ6i08wT5mlauszt18ULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGTL7SmN; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGTL7SmN"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-520847ad493so2706413e0c.1;
        Sat, 05 Apr 2025 04:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743851900; x=1744456700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECCsJUXC0AyUHsAqS2sdMrX8IQ65yLLdsylphrjlU5M=;
        b=OGTL7SmNq6eqdMuUgNz95NnQX/iTGsBEzQXw31xdyZvJ4Wmzwnavlee0eKwDYJDSN3
         7+BAtIn32gTrLulljbmp3kpb2wV72+bklRmnJjtXJY+hnGxff0c35Bh6keoaYrIvyvLm
         +muCMH0XloeU+LZubCK81W/apO95d4WI5FRPN1yAgIwkJfy+5XQzIsLExtM0KQkTTF9x
         F1j+Liz+ImC87lE6k8hzMmHOEzh8w3j5IFZMUZtj83VQi+Wmfm2iPqsPrH//4kUe7tWa
         5WnPthHYqdykVhhARsRcGmwpp9cQ0nnIqBpKtFTAyGt4vSzJW4FR5a3CLXz5PIhhfL9G
         lpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743851900; x=1744456700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECCsJUXC0AyUHsAqS2sdMrX8IQ65yLLdsylphrjlU5M=;
        b=xCrgDRqFQJ1qgrRE+VtJ0t5n0JeuovHU2xYu/VWGXfd3MJnuL5zrCiB+/0xw6/Cthv
         quizhcjn7nwtPnaCagSZaGn51AcWHHasQcN+AIAUHTDpXG0CkwOv/ZWpZgCRKuWEPNem
         SO3YE0ksdqdfS3TDGmjNi5ncOBdjIButTJGsf8QLGh4K/wnunCtecn7ldydKmg4HSosX
         4gGsZ1ozalN3HcRcWJ8Qw3mazqZ3FGA4CusHfLzgU70MYJvyXd/WXv/T6ZxOwLebbLdl
         t+XuX3Yd5WZJqpam9ej1mDFM7II9xXB5xKxdJYmM/fK9kIDjy8lzDyFwIQSTaTVfSy/m
         ugtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnSVDCxqlfa0M+7/Hw/v4eayFNz+an3MbKfmsYtb2PRt24sjSOmQ8obahruiP+5FieBQpg/IYkVsPHH8rj@lists.linux.dev, AJvYcCWoc2w4xccuJedwt5/u2quja7ut851pNj1EIeae6E78O04tPLaRjvn4fWQR0KmkVhOdrYSVk9+5AnN0@lists.linux.dev
X-Gm-Message-State: AOJu0YwCYw2pPpUEOH0BevkBHwDA65/1c/MkVELRR3zb0TRDD6cwR9Qs
	V+BUKUGEdK31Q88JufVkstz9I2F/xPZp6EJgGlxACWv4qWpUKcN6gNG2Fl9z5pYx6m1ty0xhw/k
	YWspk70+n4IpuMtDDFrj1Arus9ZB3BwXX
X-Gm-Gg: ASbGnctIVbWCEuL3465hk/8jtgYOaNf1P7hGb8jnsThrbaWCvXs7dx4d36kYI9G0WIP
	/umeyMhSWHGA0Rh9s9WSWmOeqEbBncmkGk6xfUEWVpEPkQQkv4ndBNV0trKz4vdaXUVECW1c2ih
	6ocRT8TnhbVf1WctKO+3dGVShq2hEG
X-Google-Smtp-Source: AGHT+IEjWohxgS6QFXZWuTg4A0pi2qdj0bU/f77VwfTY/md7vhCf08Tc9jRxGV1xAr2OzJciGVWowFsETUp670XJ/s8=
X-Received: by 2002:a05:6122:3191:b0:526:2210:5b68 with SMTP id
 71dfb90a1353d-52772f2afbbmr1597277e0c.4.1743851899934; Sat, 05 Apr 2025
 04:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <2025040505-blip-mower-bab6@gregkh> <69c335ea-dbeb-4c9-135e-2312a77e9ac6@inria.fr>
In-Reply-To: <69c335ea-dbeb-4c9-135e-2312a77e9ac6@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 12:18:11 +0100
X-Gm-Features: ATxdqUF1PnSgaZiSu63nrpXsdgHcByUG8pGFlrnJPwLDedWu3X310PGlFdLlQqM
Message-ID: <CADYq+fYOvwmMGsjRDCm9AGeHRZW8si3xmFQ7jqEUq8CUQF1x3Q@mail.gmail.com>
Subject: Re: [v3 0/1] Unnecessary code cleanup patches
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 9:49=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Sat, 5 Apr 2025, Greg KH wrote:
>
> > On Fri, Apr 04, 2025 at 01:02:19AM +0100, Abraham Samuel Adekunle wrote=
:
> > > The patchset modifies unnecessary duplicate NULL test on a
> > > value in an expression, when the value has been NULL tested in a
> > > previous expression.
> >
> > Nit, the subject line does nto have "staging:" in it, so I don't know
> > where this goes.
> >
> > Also, it really reads as "this is an unnecessary patch" :)
>
> Technically, in English, if you have a noun that is being used as an
> adjective and that noun is itself modified in some way, you should use a
> hyphen:
>
> Unnecessary-code cleanup patches

Yes this was what I intended to do. ;)
Thank you
>
> But something like
>
> Remove unnecessary code

Yes perfect.
>
> would have had no ambiguity at all.  Also everything you are doing is a
> patch, so "patches" in the subject line doesn't seem very necessary.
>

Thank you, Julia.

I will update it as necessary.

Adekunle.

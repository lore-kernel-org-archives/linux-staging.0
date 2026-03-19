Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE738228E
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 02:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773887823; cv=pass; b=ADjsmEb725B9TyAWaQMJ3wYSnV394ryO3sn6wtzxLwK2gXxuzROgRYW2EIQ8XRovoOKO2zmDo72Z/ojHQXfjtGhIvzMQiEYFVMIEolnCxEu8IQ7OTMudMdig7uD/4hVA7eigtvZSds8my4QUDFYoseNtXk+BdhI2sX5QhowI3QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773887823; c=relaxed/simple;
	bh=EFeaMKilYWGX1XMXzgGkEn2zYLcYkWlw4Z/yiMD6M0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yf2LFLDzAc2Yv+WQlV1pDGz2QU+tNGExTzIb5c5nc4BbiOtfG5Q6xoDW3YteIRgBvj22uUT/fY4Ag7mfdR2eOp3DnsHsTqeCum/9GH2AbChMb1wBc3Y/35h62yvcMma7MH5k1vhKeaNGpjm0yYz2FRAn7oKGbdJ3iKpnpcmxsgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KA/Nv0jb; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA/Nv0jb"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ca9ec3ee7so748275d50.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 19:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773887821; cv=none;
        d=google.com; s=arc-20240605;
        b=RTF5Vq6Jv5rj4XGtVVz6O/rxxVIKkG8z3r7WymbLgliV6YnMa2TSitPwO+SofYmv7x
         SFOvRBCjxL5AeuvLXMHBTl3iafCPiDfef0cARlWXj3cUBsZikrfg8WIh/7JAlPd8hIN5
         Yb3gxXp22KtKxAtJEYI4CBXNgyYRGzjJkfpfDsn8MY+5w+C3umWuNEzgXOrC1hpyrC0+
         Ykx9c+DqzKalKKPHvQuWGBwCmeceWtnk2dXeEqkasxSaBSTZUbpCe4TX107ihoXqylWo
         hyHJYOomgjnHfED0RIifXTt2P6NIz/eh5kM+Yf+Nn/UMGNlih2YeS7JbOERYsk21oA28
         4rfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ElYq+oTK8+nRutGz6Shz1p2+MZzYihLiB9R2Ot3WgcM=;
        fh=QjRvC/ACmEHDBwGZRQ97hdNha8NDMSRwaa7rizf5aAI=;
        b=YmGeDhJnatFvRD22jnnCYwQrQVNIvw4C3OGqE+6Z1mMQxkHZEx/RmOx2h6XQtp5phx
         s5V+JNzQUT53gcUn5IN7xp/JDLPyIcLi3JL509Q513EIDFxHm+btTBgTl0ktNNr0zv6V
         pMn/wISRK94t+6e+1rsKnS1OsFh+yr1BNNVOEBi9LbPRl94vJJoHipP3mFnX45C0Y7qi
         fdpPrLhD/Ws1/h4YRm3OpNU+qqjUCjAjY5Cq6HoH4ycwrIIo3DwWa4kqy8oq3UEtm2dK
         MWf6LxkDpoDXhFOpGjosufameFO9k3rkMDhftXpD6q2/JZSgxnqCbD2rTkx29r4d8JRQ
         dyTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773887821; x=1774492621; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElYq+oTK8+nRutGz6Shz1p2+MZzYihLiB9R2Ot3WgcM=;
        b=KA/Nv0jbJh+C1iKKe0muv4sQNr0p3PpS0rTSeySg6Fddq09RSQywvH7OudXCMqRFFu
         17cRELqSNzhOla0+jg7aswPPshFG+RQsCuJFMeoE3ZKJ9BbK3dts4VY/T/kY85VQH/BP
         5/l91/EAWvUDIYGNAoCEkC9t2QTH6+Ao6krDeRZYxM5qllxhH3GdOcyVWxaiYUC2zDHf
         jpBiQmEl732iIFmbTC7qA/f9GHNLoUmrPIp5RN3z5ZPXN1175pklJozTMdQQqRl/rPyT
         oAHw3pK7RMt2l/j0lA4UfxATTQPuGtRUj8Tv1EGb+WzJH2i7n9mOOS6UxQM6QZOca8SE
         v+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773887821; x=1774492621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ElYq+oTK8+nRutGz6Shz1p2+MZzYihLiB9R2Ot3WgcM=;
        b=OZ94goBchyJVYZwQQzxDxc1Vf2F1t65/rZLqOqzZs6mv4KAqM7eMS3sm8pK12pMBGr
         CxYRlk+XzgB2sFyJjI41I7DlMlBs04+qb0Yitc9DejO+Ky/whXZpTql4rJrUsjg5QYtV
         4YZ0LYs732jeywGTRI97vZv+wjR+38abQWOSeY+Es3MyFM8SzOqEq/dAURU/F/q0K1xE
         hwZZQZDIhYtXV9B5REvs9aeRBMHJ/SQCJriBZFWj54SjbrsZSsbMRn6vND8MdxzKmzC4
         OVQTInMEbsjglpgfRZmlqcR9sq08SOkxNw0cHIEqEsOONpCghjQkkfdtqwkQyn7SMxws
         sf5A==
X-Forwarded-Encrypted: i=1; AJvYcCXSZeRUXgSD3iZKyb/jfczlEqErtMt5/7WwzWJ6nUpUgLubI4s7xUaf6Mu3eCBE6/ZkK4Dl4+wAJa/lvzpK@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr9xIZ6E/xkqc/bNKlSKxB1+pJ64ZSVKmUEjd2LXIWeFNwRmsk
	/V4FhqaR5R/GjbsyG34sXseDwrtNws3WpgYzZdMC8UcRvkpkGPJZWNs5CiM93vpFmjvVpWE/yRb
	cQMMp1FXbJz7Tvp2JHrtQ8+LqFOLSYvY=
X-Gm-Gg: ATEYQzzIdsTreXWg6eZWh80LIOTlYkJEiHSKkZQd/rXr1syDMVdxOhDxHhWffSs8hHc
	r5nhokbcjL3p0DN9vPwkJ3Dz0KNcPbnUDGwpq0vreTWwPjkxIDEIo7Ff06MxEnn215vUm00Zk92
	oxtlKX/m1Yp1yxEFip3+VHw3b2Y5cQf9eeL7UI14RZjwe7YvJeWwn/7ihX2kvgJk1L0CTFtfBK5
	YjciIAxrlW3lXwD9mWa+GhIo+MTB/EkEZswwnewQ4IRgdWzKkxpxW9CiqEBPkUZmTDsVxj7k8Ob
	lVapEl62lGewXx2HENWUmpFCkq8y8vjgB4y1tgXXuuz176RaDPpICmxZ/FNkNVM9VBC4ZHA=
X-Received: by 2002:a05:690e:389:b0:64c:9c1c:5f64 with SMTP id
 956f58d0204a3-64e9161405amr4759964d50.75.1773887821439; Wed, 18 Mar 2026
 19:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318092715.42538-1-architanant5@gmail.com>
 <20260318092715.42538-4-architanant5@gmail.com> <abq5dbYrYuq5DQ5J@ashevche-desk.local>
In-Reply-To: <abq5dbYrYuq5DQ5J@ashevche-desk.local>
From: Archit Anant <architanant5@gmail.com>
Date: Thu, 19 Mar 2026 08:06:50 +0530
X-Gm-Features: AaiRm51idL_sEZmadldZuRQIUtx69Pt4q-VHzHMPCypTJPFLFHiOcDNqZH5RgRs
Message-ID: <CADJHxWCcdNTj_76jomZPW9ifojj0iuWsWYUtWkYxbp7M4CBtpw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] iio: adc: ad799x: cache regulator voltages during probe
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 8:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Mar 18, 2026 at 02:57:14PM +0530, Archit Anant wrote:
> > Reading the regulator voltage via regulator_get_voltage() can be a slow
> > operation. Since the reference voltages for this ADC are not expected t=
o
> > change at runtime, it is inefficient to query the regulator API every
> > time userspace reads the IIO_CHAN_INFO_SCALE attribute.
> >
> > Determine the active reference voltage (either VREF or VCC) during
> > probe() and cache it in the state structure. This improves the
> > performance of ad799x_read_raw() and removes the dependency on the
> > regulator pointers during fast-path reads.
>
> ...
>
> >       case IIO_CHAN_INFO_SCALE:
> > -             if (st->vref)
> > -                     ret =3D regulator_get_voltage(st->vref);
> > -             else
> > -                     ret =3D regulator_get_voltage(st->reg);
> > -
> > -             if (ret < 0)
> > -                     return ret;
> > -             *val =3D ret / 1000;
> > +             *val =3D st->vref_uV / MILLI;
>
> Not sure I understand properly this MILLI in conjunction with FRACTIONAL_=
LOG2
> below. Is this simply millivolts? Then we have "(MICRO / MILLI)" pattern =
as
> of today to show that in a better way.

My bad, I thought you wanted me to use either MICRO or MILLI i.e the
fitting one
instead of 1000. I see this is the preferred way to show unit conversions.
I'll redo in accordance with this pattern.

>
> >               *val2 =3D chan->scan_type.realbits;
> >               return IIO_VAL_FRACTIONAL_LOG2;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
Sincerely,
Archit Anant

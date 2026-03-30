Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D953E0B
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774833593; cv=pass; b=oR1hyw67YKfZNcA///KnCikA5F91/B6vssukB9SOBlzV+G1P65lAWAmwwWgJKtILYD7Cmt3Zh2YnBqqtvUbUX6sxki0Fjug0PfCCKQk1cRF9DFpMJgc7DhHeiQbVyrc3VQ6RItsCz7AW9/EoCAx8wBVhwqemtqi3XvR2xwRtLZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774833593; c=relaxed/simple;
	bh=OvSZnGeX0OVBOLO4vKH75y21Lqa/jeNO4/gUCjChH4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpcTstrYzUXlzD+tKuj+C6pt+OL1Z7fqjs/M+qe+n1g9ZSsGEzC0A+CxY65LfYcsi1rL8a2HkRYHYvG+5MwrfKA1+I7VlQyGt7wF9Xxt+38Qg7phTJWthgoiJYBZMrLDxravhITGNPWaidqer/00lSUNmpChavteKw+VD9Yob94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDaTiskx; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDaTiskx"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-604f1bfecf1so2109557137.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 18:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774833591; cv=none;
        d=google.com; s=arc-20240605;
        b=glZvvCaI/u794EIBSH7gaNNO/2F36Pf2783AYkTtuf3mjvSv+V3vZSPPsSHXPkF/q3
         8NiSr6lwv0CaOI/xNgY2UjhnYYX4GeqSj7w9Zcfd0fr3kEXZoxSP8Qc71Ee/eL+qbuMt
         x8IXtxqjXIlQNdgi0/dmEiu6PmfLHuk+mZCVOALVQoPvTXLOblOoQtGEb/lhWEXKxdav
         3bnW8Yoj1cM1GzOCvj2+SCfF8++BKmn4IKaMHvyf1LdwaebKdTvDkrNcGfaluU/SUjkV
         Y8K8KT7X4wGLwxJhQ/fkONCMvLebZzoL+Gc4dB36gCou0F9btodsxVEbxx9Rdtch4LxB
         J7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OvSZnGeX0OVBOLO4vKH75y21Lqa/jeNO4/gUCjChH4Q=;
        fh=doVdyOpWQptlKMtzd9esUPbSho0DuKPzWj8aGHtjKSY=;
        b=IaGa4T9k+GrYdDoZjGG1MrICbu7q12MSVCA28/Cl07z4zWIpvtTsDrDSlMaEXWjUUL
         lWSJyX4rL+oIVG3zQXi3VvtLQAKWkgYg20eJEvbW3ydSDOtcLPWXvIDDSSFee6Qw7X7g
         R3AAjRnm3SsRkfnF/Kvw7yzSGtuar52DFcxIuR76T2bE72jluiq9w8Jpjc1IGW4fjxwF
         QilSsefj1wB9KXDbZAkSQWW4ygIqsa+poW9Ab1rRRLVmoLknz5khv9ykdMrlY+ohAQF9
         Nqy6Z1MOuB5G9x8ulb+vmc9d74/slvLkD6IbGkUNb3Q3FFSERJVkMcGNlEehvmaAqh0T
         Cj9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774833591; x=1775438391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvSZnGeX0OVBOLO4vKH75y21Lqa/jeNO4/gUCjChH4Q=;
        b=UDaTiskxxoXZN5gN70kbsDVqF7CoA/GbcgWhY0+qMDyfHYMCENBinl81OSEOaBFt71
         IZFpW7wPGV54u3QA/N/d9ebBFaepaOECYKyif/4qH8glyO9FFbUt9zmP1vmFplI3PcxJ
         uq1GfjogLjTT7Wgg+vR/XGpNi+Ysfxhzs1UbwrWNLnSTnwx8RruQEORLMnhPue3knXGZ
         r/OrBpRHW1gj64Q6ZNjDERUqKveTk8jYTXLfS3xYO5r+UgXhM4IVhV8guTB8YhyAmr/p
         wahPKGNsg0gpoAmPQQM2d0vVLORJKxcJxVLdVFfHw2uurY+tcg+a4ChdUTBS9rVmgXCM
         oicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774833591; x=1775438391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvSZnGeX0OVBOLO4vKH75y21Lqa/jeNO4/gUCjChH4Q=;
        b=W3tZ/XgDJi6l9cnHSieFfvOt8xvPR9MXttso1darnIn+cVyOjXQhGMhuO5LO8Z2WGj
         Du7DtNylZTs3e496AQWZ/92GMylADU3HnruFyLW+/z58VnkUN3T20kXXWrGmVsW/eZNI
         v/HNkz0tzwq1dYEvMFLXl6UYmKXJVWKwGhwgiICJZ8rN3Cd8tHB7Xlm1e8+gpfJ8UJXE
         Kson8K0xTsCbIryQw51yaaua8YjRhdgXKmAu9rPX6UorxBimD5NU57GIHzJI75uJoqZ3
         ZY2n9jFBIiF1uvk3NZzrYbjV5iSCG+fzoVyXifZ1QVbF/1E6etTJEKsHSlbKkHysPPrK
         aT5w==
X-Forwarded-Encrypted: i=1; AJvYcCUREJ4moVvB4o7MH46s0ILA0qsW2IaLxY4jW3c7yiNdEac4H/6lfnVYIYLUMZFHdzPPxAQVkO+YwzUof5Cd@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtdhrb8R5FBUcJGiJ2nTnOJUTsTWgqtURkZL5leS3t/0FL1GRF
	7Ox9YDso5fwTSZ20Zk3yHNDzTHZRwrPGMg/olSJ1xH0Io5Mx/hja4Awhgqt0NOR4b0dowAR9xrT
	ATzTNOzLBfLbp4AJgLNOnMJGva7dwkIw=
X-Gm-Gg: ATEYQzxnstuDg0Mp/wjOZl/RODmdhccKHc7HkbavjUFKXzlQo90k1I7ph0JFzt0h+eN
	ASeCAB6kvNRmYoHnjHWAfz4Xu5+gKwT9OMtexMth6CczBZCVZyyCkPINAZkwg0WEyC75UdWgPQv
	f44eAfNdAZH87auf+dgk/JRi+wwDDt1HWKWhOrFnUe4MYk0cugpsCCmKBXVUgpEeCatrWmYKIYl
	/8ly7fuYdIIbS9G1TTgKyB9YeD6s4yTcs0232YYFhYp8MGkbGDjAmVaKeOIclretyRDjcx57TZN
	z+6suP5r
X-Received: by 2002:a05:6102:3710:b0:604:ef07:592e with SMTP id
 ada2fe7eead31-604f937cf3amr4213553137.33.1774833590624; Sun, 29 Mar 2026
 18:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327031106.10386-1-anushkabadhe@gmail.com> <acZRRXXBoflHV0rt@ashevche-desk.local>
In-Reply-To: <acZRRXXBoflHV0rt@ashevche-desk.local>
From: Anushka B <anushkabadhe@gmail.com>
Date: Mon, 30 Mar 2026 06:49:14 +0530
X-Gm-Features: AQROBzAAdb38zg5lmYqVTahVQZy-GMtMSrPhG4kiXXVpQLbKYO85ytCYQioWvbE
Message-ID: <CAAfE=nMVP9zJKPendwusvVwjesVgKOTaSBHd0S219X-RNTMDzg@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>, 
	Dhruva gole <goledhruva@gmail.com>, Simona Toaca <simona.toaca@nxp.com>, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 3:13=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:
> > GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
> > globally visible.
> >
> > Move its declaration from system_local.c to gp_timer.c and make it file
> > local by marking it static. Remove external declaration from system_loc=
al.h
> > and its usage in gp_timer.h
> >
> > This fixes a sparse warning about global visibility and cleans up
> > unnecessary global exposure.
>
> ...
>
> > ---
> > Changes in v6:
> > - Mark scope of GP_TIMER_BASE static
>
> Good catch, but read my comment against v5. And slow down with new versio=
ns,
> no new version within 24h, please!
>
> --
> With Best Regards,
> Andy Shevchenko
>

Hi Andy,
I saw your comment on v5 regarding the GP TIMER comment style, thank
you for the example.
I also received feedback from Sakari on this file:
> Please don't move the defition here. There's a reason for keeping it in t=
he
> same location with the rest of the offsets.
Would it be acceptable to go back to the simpler in-place merge in
system_local.c, joining the split
declaration of GP_TIMER_BASE? I can follow up with the comment
formatting as a separate patch.

I'll make sure to discuss changes before sending new revisions going forwar=
d.

Thank you,
Anushka

Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED2282F10
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775335024; cv=pass; b=GEWQ/J09sdo2TPvjLnliomq6guEWW44qBN0Mi/oYHHw4WgejeM1QG3uRFbx4QO/MZHCH4AGxnENTorE5lMBZdz6vEsjUc6nFf3bSOZ5o+A4Ul3UoOnvVZfbKXPnDrfgMr3B8wnpOfesmsERGmmMOJ/xz1RohfHuqPYMc652P7pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775335024; c=relaxed/simple;
	bh=lvfq5IAu74hKBO2NtIfsV8+BA1AdPyTsV4IGi3Vk8EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tg7Gmxxy2DCi/WLzPWnwDm0nmd6Bk+nlNHkyplBbH/t1BUWCKuGg5+43PJXHXIsHvxDz5vgE0x2HMechBqCxek6qq8PayOAv/8nZg80H+ZAYgZ+xciY9hA6fOgE1s+Nfx3Xkgk5Iy/merQssBNwD6QNZ3/2gOz+LTXDaeUpU+c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTa3V2yo; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTa3V2yo"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6057723d553so1917350137.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 13:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775335022; cv=none;
        d=google.com; s=arc-20240605;
        b=aI7qoaeOyis7VZnYJ+m0wCsmTdv+IjXruyJfzb/Xkl4hfL/r7x/uEiYzzgCJ1BtmH/
         9jEScCnAuJxzFZPznePGdQ0Icnz6gcFSB1OQeb3He/gecW7VoXQ03v3yPhHCudm69My/
         o7FrXvwJuCOvZh+1yl8aWK59wLYbnS3M3Jkms1ruVVIsywkWPIj6PafuPpvTsMDoNRfo
         NAhjd4ABIBJtRUvXe+vhI6LALFNoeOHA7ahk8Nwsv62IJC4XufozMPu+wn+bOTYjtoNz
         lj457QOT8M5kJ+1UilgWo3/dKiXzavFUb5js6xax7tYEEwjNbj5B674XRi3K8O5bp9mN
         mfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lvfq5IAu74hKBO2NtIfsV8+BA1AdPyTsV4IGi3Vk8EI=;
        fh=kY1qfvfutpazjs4TMlew9vDFdirzp6XgtyoeGyESLaI=;
        b=fUltpek4Exxg4/PnHsahK2FYaI56VoAxoQdIp8s1divKPl+CaiSxqFzTk9sDZXA/ZF
         0VDkMtTlFCiHUpn+AsXEmRE9+4643XmVmQntS6fyhYJhTfGSzTSJYpWuyTo1RT8bwHXP
         qsL3TgOq1hu2u/6tw0+OGlFyXzGUCfoT/mWD1qOt6oy5fr/pUq2ReVvTDJqhZyyW9Wsm
         UFb9T+DdUOx52SmSSY/RhDWUjX5fXDW87Bz6ZCmFYY+dY4bEzfLUS7KSwBNyM9mzH5IY
         9TNqYuWp12GfHyLvlF6LuWl1Ron4kapsS4dzGsJWFFdkisvpLNcswguMz+uiaz7YBfdM
         y6nw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775335022; x=1775939822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvfq5IAu74hKBO2NtIfsV8+BA1AdPyTsV4IGi3Vk8EI=;
        b=hTa3V2yotnzxQdwK2J4MiS7WgWBD5Vda4lQI7egNPRnOkwRscVL8+cjQRisfIlhMBO
         bXT+uB2sAnIxNC5pc0kbZdq90IYN155EB1kc06T/tbCLModSfTWqH9fCjz4hGHZxOMWk
         cBfIzhKl2n0Odqgjyf3ObIwIcN8djKKDYpZ6RLXKjCQjcfNfq7UppAFttllJYyq7/xoC
         FOfj5GJGrJpPEpbRIDjuWNnkwTz7W5oXgjyIwuYNSsdLGpXOcYQoStGo4eIuLp+gSEMc
         WrakOsosx4OMEF02Bymo+uVDiR85JoMfILbTPsf6lJS4xwA0GvobSisJaZ2hbZ/cBK4B
         GP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775335022; x=1775939822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lvfq5IAu74hKBO2NtIfsV8+BA1AdPyTsV4IGi3Vk8EI=;
        b=XpqnnSpA1Kb7IxMq/hrCFsgJFMtClPNiCpZRU0pk2CIwfsykfvbI/nFx0e4KHAW8ni
         fKT1WbVrTbPhRNSb9lSCb+srAQypDttw1ZhY0aBfsjLoXK8bHl0nleUKlRDs7kDoKmg1
         qz4dov+6LzJSdjwJ15U1Qp67JnulCxL1Xoc3lL7tPI3bzGA7MtnZtEj9HV2EmRvqWU4m
         GRYWtiehyo0Lo2dlAQjHDCWe3Mk1exVI0eflbVDhxZFTIU1W6ngtoGfzrT20rclAePoj
         JfBHQVJSgF9+lnJB+F6FxPmujsZdjcjEpWpaPpn2n8cQFp9pvJbZjp1169N/EuSv/+1n
         TkMw==
X-Forwarded-Encrypted: i=1; AJvYcCWB2QeOO36M7XxX1joIZjNUQmnxjILtwDOYZhHGCbW2pJIU6z4eqr3YZ2yzYTP5DVZpwOGp0vs9GVVprhEh@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyz5oPlMb+RfAeUuvKL5RMVwYlguQJvJ1QGImG6/XRvy8BZReG
	P5NG5Y5RpSP5PyGKwwLHxqhsPcdydJeE17J0seTJX5Irhlwd+R/yfIzB40NsTQ9serq7Ed4xnLH
	3nrHNcHT6DrXYKvLKRbAbjLa+KUVb2ws=
X-Gm-Gg: AeBDieuZbnEEz4kISDrHyEJb8hZBL8IiTs/g1IaTLT7rD3sBbTXf7gXrlOYDRy/TkQA
	Bsmasxxmj39fDVmQ56FcC8/Xuk/2y0ga24dARRUNluUtjiqxRyy89/irN8HkM0oRYiRj351ljrF
	/MM16pSWNZeE3XRpyIYhNQZsgUWyVRKCaXUtvtDp8UzrEsKfZc/K/G6fOLCHII5QQgGntoZg/Qd
	OCmOfjJjYq5JJEKfl5zE3NomoX3eAF6C7ekx6+LcgQ1k4dKuGzDcZTJOa0XRqEMhqhLDxJJp380
	r4CpSadmRM5VCrOe
X-Received: by 2002:a05:6102:26c2:b0:602:a80a:4d58 with SMTP id
 ada2fe7eead31-605a50d70demr2815538137.26.1775335022192; Sat, 04 Apr 2026
 13:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260404121701.47745-1-bulgardaniil18@gmail.com> <adFro9mJzfSJbbWL@ashevche-desk.local>
In-Reply-To: <adFro9mJzfSJbbWL@ashevche-desk.local>
From: =?UTF-8?B?0JTQsNC90LjQuNC7INCR0YPQu9Cz0LDRgNGM?= <bulgardaniil18@gmail.com>
Date: Sat, 4 Apr 2026 22:36:49 +0200
X-Gm-Features: AQROBzCzSDjJrJZmLd6wsMupRBuqKKDmYzcJBx61jlUWPV9JYsfKHJaTa3ah_wE
Message-ID: <CAMPU55jeW-7X6u-0nCyYq_p5XneN4z6URLdCBnCd-B+YRUuxXA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: pci: cleanup and refactor
 tracing functions
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the feedback.

I have fixed the commit message formatting (resolved the 'shorty
lines' and improved the description) in v2.

Regarding the removal of enter/leave traces: I have verified that
these specific logs did not carry any dynamic data or state variables.
Since the kernel's ftrace (function_graph) already tracks function
boundaries automatically, these manual prints were redundant. In the
remaining logs that do contain useful data, I have kept the
information but switched to using func for better maintainability.

I am sending the v2 patch shortly.

=D1=81=D0=B1, 4 =D0=B0=D0=BF=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 21:51, Andy=
 Shevchenko <andriy.shevchenko@intel.com>:
>
> On Sat, Apr 04, 2026 at 02:16:58PM +0200, Daniil Bulgar wrote:
> > The current tracing in sh_css.c contains
> > ftrace-like enter/leave logs that clutter
> > the code and provide little diagnostic value.
> > This patch removes these redundant traces and
> > updates the remaining useful logs
> > to use __func__ for better maintainability.
>
> It's too shorty lines.
>
> ...
>
> Do you have output before and after to compare?
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

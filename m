Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBEE317164
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064632; cv=pass; b=Ya3so8n6i+UcWHu1GJ7wgMXMSJVSSjnvN9qqFjuHCHwLRte2IAqRW/oiWgsSPQULHvYg16IqVrr2kkjhRhUd3b5HyuQ5ie1RWzRDjMlhSUzBdBYtMmVKIfgkMM9xjPZx1StyHVUCtfrqI4wv5Qx7YstftF7LEoKWU5MBimLla2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064632; c=relaxed/simple;
	bh=pjHdncKmHOZCWoZTqY/92x+fh8SXFT9ycMKRMvQShO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMozYpoyd+Dp0l5vVTJ+eYKjDx4pJEzpCojjqPP05GFS/u92owfordZnpFnVtzNjfXfydbcKSJpp1O1x4atEO96JUUlI0/Pv7UCRvnSsvejjAkiXWAhJ48wJirHI9gdluElueQ9b6FzIfhHRAuZIQJoORmcpElItjEc9mjubXUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E16BHn7V; arc=pass smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E16BHn7V"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3864072e87.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776064628; cv=none;
        d=google.com; s=arc-20240605;
        b=CreHGA+8D1P8wvsKeg33goowRRESs2eY7LwIfK1Ff81qbVEbG8/75mG511b6TF+2KD
         7xdQX4cbeuVCD8Qdn91DD2wrg40Yo8KQwpHOAwoZVmCCBb+DO2HUHksSNjncVaAY4adK
         PhQNWcVXyi6NVl3UZlY+h1gkRbSqgBKOgmOB+xeCJzCrZ/f4ijxtiHgMu41VxLc4pCJ+
         iI5xv237OT/z0Yr0KwNgxmb3PrLqUH7LX4H5hcu4CwNfcC695HwTL2OhR6tqBe5jzeCR
         SZKphioPIlZkiw/p8t1mJcwRZYLhpuABIvCQRbJpkDawCMex5NoCZbKmFXu07z/qftrf
         Ny7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Die9sg34ZZeXCtCHZcsvZTpJDMMgm3O5zOEspkrp+r0=;
        fh=tigbn8iRlWF3bRmFOS0vs2BrTtSDRrpMintyTtKzxdk=;
        b=NyzNkSv6VG9rzUNkRZRMqDvTk2Mp5PrPi9e3tXC3iTW9E4Gbj6L3TMzTkdNDCT9DD/
         3YnF8uI6KjiSk2qT1xQMhrSrIQY4ZAzpx6mjx25xlUeWIxsjPCu0zTaa+Fyy+dhi1jh4
         JGOdE/ACp1+1kZHnRFlh8kDqWPNeRJNOe7qOgi/9SfGADXxEBDyXtg070BdR6cL5iUgy
         DP+UrRPnFSpR2CnnXdBzHP0TU+XZujHP+HA8g1S9Lr5BJZJ9P+ybV25lzbw/ChgE9Bzs
         sauH69uGFovYM7eOyCgwmvpZdFzcFumBs2gNM6ufJ1KzILNOtxb3JIdVYeOYtUGBhAit
         giuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776064628; x=1776669428; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Die9sg34ZZeXCtCHZcsvZTpJDMMgm3O5zOEspkrp+r0=;
        b=E16BHn7ViYV5kIwvNg6rcq1nkTAtltXjfO4j8gcEuA+iyEFxspk7D5AJRhW5ShFu3Q
         08lieb0lJS/3EcnLFBKQVt5j0zOaaHEuqILXwLb0ldmM93yD3P8iRsZIeVNG2sVDTA2G
         mgSHjZfdvQfiQ6/lx+6jOOc3J8OlqwEQwXbmX/LsPkHQgXM3Beq+vHJxUNL+9MNpIuJW
         h13IIMiqdGkYHQ+2p1N8PmzgSA7lHote3ovVrPUrMgRPFrLYb16uHwlxuKP78t0eYycn
         YMlpdWFSaSRmMHBwGURJm/kmJKPTCKIYGaC+a0W/vZiJUZ7/M5WtY7Uoa6a5miURO/VB
         2l1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064628; x=1776669428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Die9sg34ZZeXCtCHZcsvZTpJDMMgm3O5zOEspkrp+r0=;
        b=h2J979hPZb3RLKnTu1iHcg46lCa9DDKSvveT9KSBz5jhRC6Dj9ApZV2F1xg51avPor
         cVlXuFWlsFm2CYi4Z3umE44LkzIZriGtz2QHT5Hqui2zV+MQpmE8W3WIpGi4TEhATULH
         LLYIKTfhEjIdYfxQd9CBgAxl+KvIhhpcnhkDBKpwfSrFNYNlkQYNLTOHXL24zAK6Ao+W
         JIFfGuaJNvLT8Ds3vys/KdB3A1TeSbGLjCOei5c88T2ydO56J3OPDd1q1cGJn8ku/c65
         J+idHdl7lB/X3R4jdObr7fwALsdco3gz3MUjE/W0eId9lAcaNjUiGm3E/T/15cKJfnAV
         WIgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8L3b+uOiFF+R8EKjUM+RlTml1b9eOdnfz932xwPXBnlfvW4+ZmUNtmTLwTYPK9BfttrY8nexDH/WtKjqZN@lists.linux.dev
X-Gm-Message-State: AOJu0YyvASD0ThTq21HOEQ1/Fer0MQ8/VpyvDLIImkyYZ6/KDRRB9Mej
	ztjnc25NMHct+7atboogWGrDVRbE+7ppg2qKr25PpNRiXrAevMwFJbHqaQqleF/VcjC6jlAfruX
	spX3mmfkre0nXxfIVUgN30RVuXYOtWFw=
X-Gm-Gg: AeBDieum7bqeZW5fDsMz3lxzT4zcRttBn9DC12mE6vutBn7//t/lNYtz3UuOEF4mHdE
	ZP0zCoWQDTJqBmfn9FGig9CHvUthjmL+93QIShurMGhaPghUMpFZUh3IsmlWjh5PlgiGVNiwm4j
	gKGOYsuhW0F1FJffNyr4Y1Sctyrw7gnKzOmw68EVBo1lx6izmNS1AQBlxBTU+2AMXLz7o0L1waq
	8V+YaFB0pTX7pCBU0sNBBP8NPG4v784Lvb2Zl0GBeHKCGpQsatsC2ajU7XvwEWJcxhSCrBF5pRG
	JMFxpwEAyL74oDjUnad3BgOuRf5opr0gZeI5ALN2Dg==
X-Received: by 2002:a05:6512:3c82:b0:5a2:bef4:5dfe with SMTP id
 2adb3069b0e04-5a3efb2c6a0mr4123923e87.9.1776064628120; Mon, 13 Apr 2026
 00:17:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411182055.24413-1-dennylin0707@gmail.com> <adyVjoDaJoWqd-OV@stanley.mountain>
In-Reply-To: <adyVjoDaJoWqd-OV@stanley.mountain>
From: Denny Lin <dennylin0707@gmail.com>
Date: Mon, 13 Apr 2026 00:16:56 -0700
X-Gm-Features: AQROBzCKC64LFNSuYYHjwx899CaFhvd0OiEQM7-zxloCupsRdzA3TrOEL8h6P0E
Message-ID: <CAGEkeHdOWdUhjE5daUNd-nMAS7qx6+o_9=vKczbK8+VXqmdTiA@mail.gmail.com>
Subject: Re: [PATCH] greybus: audio: extract topology size retrieval into a helper
To: Dan Carpenter <error27@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks for the feedback. I understand and will focus on more
meaningful changes next time.

Best regards,
Hungyu

On Mon, Apr 13, 2026 at 12:04=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Sat, Apr 11, 2026 at 06:20:55PM +0000, Hungyu Lin wrote:
> > The topology retrieval code currently mixes the size query with
> > allocation and data fetch in a single function.
> >
> > Extract the size query into a helper to make the control flow clearer.
> >
> > No functional change.
> >
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_gb.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
>
> I don't see how this is a cleanup at all...
>
> If you were the maintainer of the code, then you could do whatever
> you want, but this is your first kernel patch.
>
> regards,
> dan carpenter
>

Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E8C38BF61
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114794; cv=pass; b=tGTt9v42E2IuAszJGTBqIYtkfQVU9wFVIpcH8yTO/Ix5tgeRSDwSaIdHv10NnqImNSuOsX3RJKTaMBn0c20Wroj9ZtvMFtFR3kJSkP7oUBQ+f5BKzvsc9tNGhKIZppBXCRzcyChkSEmbMz1tFAr155Wc5u7/hy9t8+iOXCsp85g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114794; c=relaxed/simple;
	bh=FsYlSXlZJpdy1ThdoQxU8mkas6T2ddqvGWar7MbfscY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+xUgbVVzU6fZbADBj833CD32rbBMU4hb5bGeXaJifODZ2VvKml25wNH6rOqBYXOA13XT18vq7KatNLxW6BVw1ZvVDfA18fjS2pFZbddweF8TbLgb1lOnbxmRd/ervlG6djSbjurgCpYhGIG4OT/jiqtGf8zPOH471PFvsJvuUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JplSh3Bz; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JplSh3Bz"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b982b0889d8so71911966b.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 00:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775114791; cv=none;
        d=google.com; s=arc-20240605;
        b=JFmL5NdLyKQ9wzUKl4112d0iRp6dJQmUyTkX/huPBmkGXAMZyQK7yJJBfqssPittQG
         2JBfqzQb9njoSnXsrJFvOJd/wg0IxgFtqJ0/z0wdirJCqehOrzYDUHGBsDI2Lw7qId9b
         dPh+OS7Kto8p5HF0IxfyPnsO/dIwfUop6ng+tY7FyehrM3ZP9zxtpAGk96dA3DjWvzCJ
         MLnx3F4AZm+ygN87K5wk0m4TvrfAfjBOsD0M0cH0qUexPxD09EUmal4nQZGF1+2ZJ12X
         vDYec4WsXpRu081SOX/NCaiJko/pdckkBffGS/w9o72mVRoE/CklbCFDjoi6UMTHe3SG
         yqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FsYlSXlZJpdy1ThdoQxU8mkas6T2ddqvGWar7MbfscY=;
        fh=reuE6pNr01Oik8O3lGOrgGCn006dPN2nbFCAlNmN0gc=;
        b=bqn3HE2V8f/StCVEmfUNEFKkKOO133+A8tFfkGFuGebfwG4D+83qJjdiUlZyYIJNk0
         JZIkCnBecctxvfDkZxEB+70at8dNwXMvHlhtR1gnV+LJHoZwqZDK6JJx9dy+wVzuWHkV
         eitNQYZWoVlsJWP2Z/9Q6tdbl/x72wMQ6i1Ix3ozU1TRhbFqsw7Nnmc9n6SfN594ZRIl
         JbqXYH2EDRqQQm/NbsgE+XpOJWyyeSppn5qX43VtusLpASEQdXHtWV3ejfZv2u6FLBcu
         01/AMQgF8gTX935pleK9IVoeuGdUg4lEOX32A/bso9sFVie+yhXuizpQbsuHnHEwtH0B
         h/hg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775114791; x=1775719591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsYlSXlZJpdy1ThdoQxU8mkas6T2ddqvGWar7MbfscY=;
        b=JplSh3BzB90PZvHQ+o3ARaiNELN1f/YkEClmYUJ5edjm0zF+dq8/ZX0ZKoRq1LjZHf
         Owz5/3D1Nyl7kZR4fSIGxgQEa2QupDwBlOPHMKW0xA4DNsLmnlYCoRSNeo1hjEY/2xh9
         EBtMOcUNiFf1oDGNdwzT2hTuNCtspRXMyY4jgjeeOhGAxkyTz/4CeziM9jzUTdMAKJCK
         /wLwVVVvHdInZKZbMLCJDKuRHpkOOOZHDUSc8vf0UvkQiuWFFmT0PPb8Hn3QsvLsDYUn
         JZYcxTkETNiyFR7LVY+euKzZsLaNREIMQUUEoMdKDtjXhuMPFoS1LhsFGlqrkn1F3h+F
         t4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775114791; x=1775719591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FsYlSXlZJpdy1ThdoQxU8mkas6T2ddqvGWar7MbfscY=;
        b=hMEoyGPzMKh5+qDV33V60q/Gih6wbULFYG3VsomT2Wldsv2qgQWa25lR8/Mh3HUHqY
         P1J/M7W2bkncu53GhywkptiSWtqMQaVZIwjmYHTna2zG2AKegH6Ij/XcewdP1R47uzI9
         IJekwIfVmmGy//GgXRWEZki/Yz3Q/a1/eCdB4Pozx8P9jblt3TMyhrRtQoSa4t7nlBzL
         r9yeWmeSYLHwCfjqxFRzL4M2hmkE6e7iHJF7tCX+BkGN3+YrxOYJgpLb31NGOo5iSGPg
         5Huqmu9Z3Fzn2DvVgPQOZPvX41zGL6kJx3wrMkVh6mGj09rxeZhCsQ5MU3m/l8BiPzZR
         dfEA==
X-Forwarded-Encrypted: i=1; AJvYcCV374XX1dOmwvV1v1wqxFNpzYTfk6lTPkeujgvMGXu7Pg31t00EE2SHzAL9sbxOWLDXHfNpnmWUlLvDujgS@lists.linux.dev
X-Gm-Message-State: AOJu0YxD/Rbkpg7VQoSjRZEKH1cpdgn6xr8kH6vTHj+FYQRDjz5c36A5
	J19rAnR4BklDgAL2tORefUZQCKFeZ7Sn4AbysBhvwDIN4+fvrlVUqKk3lH4ATkqU618AyCmrvD5
	K/n6eDP9mS7mEsDGHx47ZeQFLboRNps4=
X-Gm-Gg: ATEYQzxQnE2gtNcW5DNSLYG5clBfM8ch+vvl8/yUEvqIWnxP+f3xj/Zz1ubTNgnBfjY
	Q84y/IUqLqROX1QLB/hj6rnNcAvN+/89JcjXYLf+0lSMIrKALhJC9lyqgxkrayANKyFoV/7y+3Z
	TiS5rUVsLurd98mdCW4HcO8w4YdB1N8ttZuAg63n6kBUWwFvv60nl9J98tkyP7LZaWpi5RzP6ko
	1j57p2KQDG0a7Pvy7hN8xWmRESV9SzFh3NUb9G4epIBC4qTeGgA0kWbrNgZfnddyGaHvMo1LFoY
	PoNwYJIt+hyqwLy0tG3j5IKN0i4S9HMozeVGbkTcirF/Zq2gzDn1OBxnY76vA5X5/WuA9INt/xA
	wcW2bh88=
X-Received: by 2002:a17:907:a315:b0:b8f:a5c8:f75 with SMTP id
 a640c23a62f3a-b9c13ce0cd8mr459776366b.52.1775114790940; Thu, 02 Apr 2026
 00:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401170218.40504-1-sairambandikanti@gmail.com> <CAHp75VdwT7tRPhzyHdsR+WyS7-9NS9bme2cGrGfc+p4X6wykgQ@mail.gmail.com>
In-Reply-To: <CAHp75VdwT7tRPhzyHdsR+WyS7-9NS9bme2cGrGfc+p4X6wykgQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Apr 2026 10:25:54 +0300
X-Gm-Features: AQROBzCp5fS-K4NyHMtTee7gdcJpqRAoxNdcTv8uC5KiyvPavc8H3f1QHGBxPrY
Message-ID: <CAHp75VdMJ_kNDt74bkXfLbMVAE6MKZNnsf+Z2g25LpBonORWsw@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: fix memory leak in sh_css_load_firmware
 on error path
To: Sairam Bandikanti <sairambandikanti@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Claude <noreply@anthropic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 10:15=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Apr 1, 2026 at 8:02=E2=80=AFPM Sairam Bandikanti
> <sairambandikanti@gmail.com> wrote:
> >
> > sh_css_load_firmware() allocates sh_css_blob_info and fw_minibuffer but
> > all error paths inside the firmware parsing loop use bare 'return'
> > statements, leaking both allocations. Additionally, when the
> > fw_minibuffer allocation itself fails, sh_css_blob_info is leaked.
> >
> > Replace all bare returns with goto to a common err_alloc cleanup label
> > that frees both allocations before returning.
>
> NAK.
>
> > Signed-off-by: Sairam Bandikanti <sairambandikanti@gmail.com>
> > Assisted-by: Claude <noreply@anthropic.com>
>
> Please, use your skills to investigate what the code is doing and not
> blindly follow some stupid AI.

A bit of elaboration. There is indeed an issue with the memory
leaking, but taking into account how the code is organised the problem
lies in the error path of atomisp_pci_probe() to make sure the
ia_css_unload_firmware() is called even on the failed
atomisp_css_load_firmware() and in sh_css_load_firmware() to check
that sh_css_num_binaries is not 0.

It took 5 minutes of browsing code via
https://elixir.bootlin.com/linux/v7.0-rc6/source/...

--=20
With Best Regards,
Andy Shevchenko

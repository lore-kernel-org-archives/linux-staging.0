Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40331F4C84
	for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755546798; cv=none; b=s4wBTwfFiteLbZV+cC66lxT1IqyOwBNuB6Q9DI+K7G5UoObLYcafCbbg4WYvQ/V8u/5wacBAsQFMsmfGXibSEjoni1wN+getxu1v/m7ISkmVAp9cFVzc+J9x4Pzm5CWuNOVG/FRrcf3YSKUZpzi8sWY+SczHzpwUcVjyUFyVQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755546798; c=relaxed/simple;
	bh=LH0EOAloHY+TBXO5ZIVuNQjI4NF4jj37/tc2rIx+kSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hC52r/0mMfLwdMwAMgr/Sn+YpY6XsuqGMIlKhoTnp3wAF/srTDlLebXEoarh8BLwMhJE+5HNBe8gFVYEwaA1LFdSwr7/yhV3VDO1gYXUtkbgD1mobFlvotxvVU5yChRT/EDKNgKIEqTGYzX6WB8c+/FYF782UVjylVU/fT9iGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWK1hl0V; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWK1hl0V"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-323267b7dfcso4243268a91.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Aug 2025 12:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755546796; x=1756151596; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddujuKZzdznsNRHmWIL8Rav8U13raNV9R5xEbx1RJto=;
        b=TWK1hl0VEPVM4zAmhxXYJQlikrnY8hLnl04/jJbiQimwrjC6qmvPSQaDRUtxf3OQQi
         t90EHZSCC9r3FKvPICGMh0QEmQaqsW4LRcA4k4Ct3iVqghwuZSUDgMvPeRHccezWqLwf
         G0cnPCIsCcV9n2oGYpI3xFHb5TV54LCRkYTXXllueHCaRNn7uYnEdqJ4/XlZs6TOL7Nz
         DfEyUp1MN/VDwmXmdqq4GCiXsXtX6yE6gkaSh81E6L2R8x9tqaD2qGQXzDmtpRRfGQRC
         ITgp0P+idmZp9TW9Kpa6c4EvwgnEzy2LeQc4D3rQfzuEE4Z1prVTLyEt8taTr5n968Ky
         oxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755546796; x=1756151596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddujuKZzdznsNRHmWIL8Rav8U13raNV9R5xEbx1RJto=;
        b=PHaLH3ITypjq4LMD7DkmBQfpyl5Q1yyjHExrfIS3p/fk7WGlXhQwSUVq/qvo/oIZNT
         s6UvxgLyveasZ/upk88SvahlyE1driHyKIQZY+CA518l56rTueiC2Bq2tKh8OF6ZPtWu
         VZoMH9HwfGwgIyWgSJ5MpWFNxgLM4nwZENlwAWrDqvXi1RYOJi36IMWq/mJ7CA0URuC9
         6oE4thfU0Tjk1e6TVhbm+2ekocT2SLF/no890MrPs/Gvn8QZ2OteiRaEjyrD9g0z3nNG
         jtxpQFUzQpGRNuQc9gTiPKm8vnZwzNznP48NSoxqbSFDqx/98fOk/v8aA/JtAXLfQFIk
         Q95Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmvndKeRYYx8YBYVbBeRz3qoURYnQQwkyQbC3dT0+scRmrm8cbzp/G+9+7VUwm9fD2Xn77ARWpnBEi5KjX@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx+07XuafgxpMS1qbSSBPuh2SmLoq4qvaqU+yX+caDXmzCnSXD
	yFibv1GI6EkALcp5+pT8QTUZnBdWOuF8RrpzwFJsXmcaQ64D2jJnIKa3PRdcS0FZ+rAyOQsyaDR
	Ls8y0tMjZHH426rm4kdfbfKzSIe8Cxw0=
X-Gm-Gg: ASbGncvjb19leGsPQAOsl4VqgqA1YSLRtLkV/qvSG8BzbPIo7y13fmAv0Kq9OiZdL4j
	DpeSfgzCtgqU0uW+hTl0znHkWvCsLjuPuvKZVa0fuIJ4D5pLci7Spu8v41KvdnxM7dQPh9OZ9Q5
	aAz6IgPEhSMnZ/yFm3OsPgdnNKwnB9ryGGeb9KJsKEDLxLbEgB6uLJhPWALbg+EVS6xEYHm22JW
	Ipo7cHV
X-Google-Smtp-Source: AGHT+IEOXjh8m7XOu9uCTimW1hsmXKnD/yesqpDGGJb1xX58q/XN0hA0shVUPi2bcss3U64Ds2mbaAdmVSGdxcgyB20=
X-Received: by 2002:a17:90b:1f89:b0:313:dcf4:37bc with SMTP id
 98e67ed59e1d1-32476abbf1bmr125297a91.34.1755546795610; Mon, 18 Aug 2025
 12:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250817192425.12983-1-mohammed.guermoud@gmail.com> <CAMuHMdXQfUCYdt-PJX8rYP3bf8Z_ea3Obgunm-_7KmJxMrU_fQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXQfUCYdt-PJX8rYP3bf8Z_ea3Obgunm-_7KmJxMrU_fQ@mail.gmail.com>
From: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Date: Mon, 18 Aug 2025 20:52:39 +0100
X-Gm-Features: Ac12FXwyElvAUJvFi82Gmun_imSpGpqzSHFgcqTf4mVT3MjvaXtgPn6FrUMByEs
Message-ID: <CA+Vbt5GwiaNaFEVa+U_dFe3jLpYAE+7PbTXC7jgOoqt1YqQo_Q@mail.gmail.com>
Subject: Re: [PATCH] staging: nvec: Silence unused argument warning in
 NVEC_PHD macro
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg, Dan, and Geert,

Thank you all for the detailed feedback. This has been a great
learning experience.

My initial patch was incorrect and broke the build, as the test robot found=
.

Following Greg's advice, I will send a v2 patch that removes the
unused NVEC_PHD macro and all the places it is used.

Thanks,
Mohammed


Mohammed GUERMOUD
Software Architect
Stellantis (Formerly Groupe PSA Peugeot Citro=C3=ABn) - Morocco


On Mon, Aug 18, 2025 at 4:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Mohammed,
>
> On Mon, 18 Aug 2025 at 17:10, Mohammed Guermoud
> <mohammed.guermoud@gmail.com> wrote:
> > The NVEC_PHD macro was defined with three arguments (str, buf, len)
> > that were not used in its empty body, causing a compiler warning.
> >
> > This patch silences the warning by explicitly casting the unused
> > arguments to (void), making the intent clear without changing
> > functionality.
> >
> > Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>
>
> Thanks for your patch!
>
> > --- a/drivers/staging/nvec/nvec_ps2.c
> > +++ b/drivers/staging/nvec/nvec_ps2.c
> > @@ -28,7 +28,7 @@
> >         print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
> >                         16, 1, buf, len, false)
> >  #else
> > -#define NVEC_PHD(str, buf, len) do { } while (0)
> > +#define NVEC_PHD(str, buf, len) do { (void)str; (void)buf; (void)len; =
} while (0)
> >  #endif
> >
> >  enum ps2_subcmds {
>
> The proper solution would be to remove the custom NVEC_PHD() macro (and
> NVEC_PS2_DEBUG), and just call print_hex_dump_debug() directly instead.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

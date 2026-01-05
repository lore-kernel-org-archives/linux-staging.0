Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346DA29B793
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627850; cv=none; b=a5LVhdyKxlFHf9YcCHnoBsBL6eTS5eK8YIZ22+UpFDGSOCUEb/HG9M2fXPvB0fwMVIU2STCjS7XYzaEdifE/zCDdURTv03TLhq7RJO42W+AsSgShrt5B8RVN49/HKvOkcFZBJ8wq31Utmp7uUecaNVbnFuuhWUMGSqvOSEN4G6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627850; c=relaxed/simple;
	bh=KiNxep5hkYX8mBtTbqMNksK7S57ebqc/+kkLTcHNE4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyLcRSb0q5kleDSwDj5LfFZID1cSNLjvEBq6ewzwRergrdgxJ8TeBjSc4c26lm9jXVUOxtMWyYoByPLBo/e9aKlPmFDhgLDU/j94JpRjf5JD9wPgPrco5tYDFXBnbADBujVJ4Orw07WiketHYWLSEcXPMm5QM4CchFS6CnDRUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVxxbh+0; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVxxbh+0"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78f99901ed5so835257b3.3
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767627848; x=1768232648; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYkOfrIXwEeEFPSymxR3igzs8AcT4FFM6Z9IKdtfy90=;
        b=OVxxbh+0T0v2PLd3uGU/g1TEpErLpHPkYxxdcAuFskRARGDVGR2xuIrLkQ7UCaXIfQ
         SVUGuY62hKx01y0V1SAN/pqEFKB4nhGu2bJebMilzjZTn518RH0qzKnve3aogvVd9xPu
         Rspb/9hm0shWslz9qFac0F6jvBxLrPQqFzBSoKvMP5Si5wXRwyjeiU27QMdv6/Sh4bGv
         E/iqfYLJDm4nhrtH9mmi7Tmc94g2QnckTBsRAevutyrNHfe3XzQgn4cPdqwsrXHIaAR0
         sjCTZFfOw+gP+FCQhI2Qllp39KZTJkHElYyNSVB/pFkTeu2xiRWeMqr0tOhdYwY4KN2R
         hy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627848; x=1768232648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wYkOfrIXwEeEFPSymxR3igzs8AcT4FFM6Z9IKdtfy90=;
        b=CAzQWg7kdI71qFlyTfRYL54ITfVhe6M7UVpV/mNt3J7T9lyzK28x0aMzQE6u6pLFWd
         SJcJDZHr/g6AGyLYm+WIU5jZGC4llt/1E54vbfrkEKZcKzCakUVj2JPe+rXo1WPE3uw6
         cdm1tZX8rSj3nuRhgRfUeWD6gyp2N/lf6ihZ84CD7ohbc7u3AWcOij/F/Jh3oFxf3P6/
         KhBhFTf12vGbYjIR+HjYALBs6hgvltl95q/K/w0PX6eYR7urBx6BpioVID5deJqb1rfZ
         WFF1lzzFcirEwfR8mBgG5jh9G00O/7NH5bHT1VtzkKIFB9cr6OBKnUw16ZVsbm/hhUtK
         ykgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXah4P8KHH4SvfyFL5k322GaNOwMjXp2DUhZ2ckMs4HfkrgoJW4hgQ1JsEcG1D5kYFKsoglfdWk89JJNhNd@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4c7HWwq3RNvm9IaaTyXJQBwD7XZmFedabKCY5xUx9mYOfEZ29
	gJ19Io8bmbPQveYC54oF0mwQZymVYcbf7mXyuxiZMSqs7k+zW8xyzUieElwQUXT+lV9ttMu0WDk
	WJ5LwRLVZCs6MlhQLLKcPrrxNtv9yEQ8=
X-Gm-Gg: AY/fxX6SZbD7UaWlaKCV07gWTbMl+eWEbzm8KRdeIQRHNdkD6IW4Miud+SgP4phCLnU
	lJVsb2ChKCggONW+Sa7TbcsdP78gmBkcb82itycnntxfyexIlX0IJRzTQQ6odzZCQwL8ioxpad9
	OGe2ZtWvSCA5DKJlXxv6SPnR8Eh4U0L9XoOoO0Cw+vxMsMQ08RYgeZnI5uZhSqa/afrSxgj8Evc
	n7RmwvJ3H5/poaKqHXtrBuOk8SG8m1qcWO2VJ7dBOF1NJ2UEvvG8vlqiOOjng5Hd5KhQ15xEnqE
X-Google-Smtp-Source: AGHT+IENHVUmB19L8XKrR9F3h/bUcv670rXLNPc8TlmGC/MryKRU0KhX2UylF41J4XgVldLhv8H5dvEksf5MSA62IC0=
X-Received: by 2002:a05:690e:1901:b0:644:79fb:7dbb with SMTP id
 956f58d0204a3-6466a87edffmr38658466d50.6.1767627847953; Mon, 05 Jan 2026
 07:44:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com> <DFE83EE9TFJ8.FZBQIKRUYFS5@bootlin.com>
In-Reply-To: <DFE83EE9TFJ8.FZBQIKRUYFS5@bootlin.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 5 Jan 2026 23:43:56 +0800
X-Gm-Features: AQt7F2oqegGb5yKIGMER6lWYmnSkEDaT2O4LmiDNPF01eLd1hF7mOVwPxQMX72g
Message-ID: <CABFUUZGXjQttwmVfXSYiiswju4TomsDLS2S5_xv_ukMMJxh69Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] staging: media: tegra-video: move shared SoC
 declarations to headers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry =E2=80=94 I mistakenly replied only to Luca off-thread earlier.
Re-sending the same note here via reply-to-all so everyone in the
thread has the context.

v3 was sent only to silence the Media CI checkpatch warning about >75
columns in the commit message. I agree that for an exact sparse
error/warning line, keeping it unwrapped makes more sense.

So: v2 keeps the original single-line SPARSE message, while v3 only
wraps that line. There are no code changes between v2 and v3.

I=E2=80=99ll defer to the maintainer who picks up the series =E2=80=94 if y=
ou prefer
one over the other (v2 vs v3) I can follow that convention for the
next revision.

Luca, sorry for the extra mail =E2=80=94 posting this publicly to keep the
discussion in one place.

Thanks,
Sun Jian

On Fri, Jan 2, 2026 at 11:53=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> On Fri Jan 2, 2026 at 12:44 PM CET, Sun Jian wrote:
> > This series cleans up tegra-video SoC data declarations shared across
> > translation units by moving them to the corresponding headers, avoiding
> > local extern declarations in .c files.
> >
> > No functional change intended.
> >
> > ---
> > Changes in v3:
> >   - Wrap the SPARSE warning in patch 1 commit message to <=3D 75 column=
s.
>
> My understanding and my knowledge of the common practice is that you
> shouldn't wrap lines if they are quoting a single path, log message, erro=
r
> message and the like.
>
> So I think v2 should be applied, not v3. But I'll leave the decision to
> maintainers applying the patches.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

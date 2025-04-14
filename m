Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E8425A2DE;
	Mon, 14 Apr 2025 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616345; cv=none; b=JE0klqwkIUWal3vsk/uIf9LbYxOVzMZ74PL6xxtJqd7VNcR5+tHscFEkSCrB7V/nfMtAamN/OiOoujDqNbl1rGrOoQTjdrzBv7ilZIZ8Ulv0Q0eS73Uz4jiwVdRrS8GpUJn5bcNeHF+Q9D1t7qmdAvCt/os7bJXflwtkCX96Z/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616345; c=relaxed/simple;
	bh=vRX4lPBBhSqLsj/nl5x+IlRfr1EccgtzdZwc6VAotbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDNgNXJD0MP+2wK3Ov/sYS5u2tCAq27pYhIbboIfJz+zkTqUmOyDPKu7lF/gZ9BmjLBK7LPOT5Y2Kuf1LLsHAEiGzvF7KiyOsiLyFzOHJK0jMIHyOi1Mwc0z/oXLz0MByZCEe+B2nFeHAT0k7CjtoIAB4lh4bSrIyY8kobMJh8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPIwwqGa; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPIwwqGa"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso1748811e0c.3;
        Mon, 14 Apr 2025 00:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744616343; x=1745221143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z4nJEuqHuyUrFdt7zlS31Za3WCQlJE/qrLFA2Dn1yo=;
        b=mPIwwqGahupBlIjA1vlRfLabSEjBJvtzzf7NS5SaCWjw+ln7K7qt8TtSWD47AW0U93
         HIQ09Ko9XKeKX7v/yaNI2CLhQiA/zvq+uiCcxUJgCzgAsQk96+GFOCiY3k02r0zqBW3+
         nWDLysaiMFMUvKaG8MM0OZZ9cByhlh8PFFn9LIhPm9ncWTUdGE1Eihy4T1Ao/l6L4Cpp
         nDA3mmaFxBZ0c84h0O7LpoOpGwyT4xagD89ZdlbOT3eu7BMwa0ZNyP9wjZOS2Rj4SVrA
         P3vGl5x8R/afkOgQSGmcyhykEmt/G6UdenwtcZVkxXnCP3+YQ1wRD8m1zWttc+7mQycr
         PV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616343; x=1745221143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z4nJEuqHuyUrFdt7zlS31Za3WCQlJE/qrLFA2Dn1yo=;
        b=VsmAf/g4Q4ph00WqhADGdIBVcgjZd7cLkKdLKhP/j0tbqBw7PEFWLIANViMoFD40M4
         kqmxi4qRm5yMIDhPNHw5asRqU0iZI8Da1T/MPmBflCdZ4SlPOkuO3DkkV2PpjbUJswDZ
         Gj5hhiNA+N5Lt5NG2/I85LkI890qmN+BMdZcsX6DPbN+y/yk9LMIPDEPwRQisaddGNWR
         NuK85xUheNhnhusJFq6q5GKKrLrnQ0+ggAhZfgtwKIZRpjG+NYSqGKvaMieS+J/T2k9F
         crMZBkRHl7U/3VHTe5sqfdZlLFvDnsjeLGDmHQ3sh95NxNrN8IwZ1RohFtkDaxKilt/F
         vN3w==
X-Forwarded-Encrypted: i=1; AJvYcCV4kWvqksoXY/uoMHTWtJMIdWmpxITsmION9UCeV8EK4OZ8nKA73ewAf92odp7siwPQ00g3j0SbjnaPwHzu@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ8GtebF7fjX0AsYtsCMjN5SO6lFBfnx7PnrO2unXNZ1yzV6BQ
	dAm5qPjEZenu3yrdHV2ciUqfvM4p1qFWg/jtpxS5AMhhEbtU5ZnXPwnUaamNoTgMaJFZox7QvMh
	MtrveOG4v0cY7KDTTf2Zdr60gPxs=
X-Gm-Gg: ASbGncv2q4UkTfU8uROt1GiXHzsQYs89MJfaymBpOHxXm32e3ncy2GhIEVI6hB14mR/
	uBrWDSvD4bm9G1ltB5ASwiq14Gc7MemhjQADuwbsQjlt4ZrijoXnlRbKxf1fI0AMWMg+mdQos+e
	seUCcnSLbZaNA1Wen99HHCmFo=
X-Google-Smtp-Source: AGHT+IFdvo68lByhsQGJ+yQpLL+Zv3BA7pLibYHmDS7I9fwBd0wKSkpga5s6mS9FNHuP1yK0qZH2x9+K4MI4eA3urWM=
X-Received: by 2002:a05:6122:887:b0:524:2fe2:46ba with SMTP id
 71dfb90a1353d-527c35ec74amr7513304e0c.11.1744616342793; Mon, 14 Apr 2025
 00:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <2025041402-colonize-rocker-1db1@gregkh>
In-Reply-To: <2025041402-colonize-rocker-1db1@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 14 Apr 2025 08:38:53 +0100
X-Gm-Features: ATxdqUGeEyod9zeh4I6bChImmbBoTpYytq4sq4D941FelSGmmAGI54ZczFSbCXk
Message-ID: <CADYq+fa18G25hfTeWTxwyxc+A=xHmk_je_9kjWbDdwbo0seaZQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, dan.carpenter@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 8:23=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 09, 2025 at 06:48:02PM +0000, Abraham Samuel Adekunle wrote:
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power-of-2 value while
> > the AND(&) works solely for power-of-2 values.
> >
> > The use of `% 4096u` also guarantees that the modulo operation is
> > performed with unsigned arithmetic, preventing potential issues with
> > the signed types.
> >
> > Found by Coccinelle.
> >
> > Suggested by Andy Shevchenko <andy@kernel.org>
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> > Coccinelle semantic patch used to find cases:
> > @@
> > expression e;
> >
> > @@
> > * e & 0xfff
> >
> > To ensure this change does not affect the functional
> > behaviour, I compared the generated object files before and
> > after the change using the `cmp` which compares the two
> > object files byte by byte as shown below:
> >
> > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> >
> > No differences were found in the output, confirming that the
> > change does not alter the compiled output.
>
> This is version 11, right?  What happened to the list of previous
> versions and what changed down here?
>
> confused,

Hello Greg,

I collapsed this patch to the previous patchset I had worked on that
made the same changes to the same driver.
So this patch was collapsed into PATCH v10, which is the last version
for this change.

The change log in "[PATCH v10 0/2] staging: rtl8723bs: Improve
readability and clarity of sequence number wrapping" explains this.
This patch was collapsed into patch 2 of this patchset.
Thanks

Adekunle.

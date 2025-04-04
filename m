Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643702E62B4
	for <linux-staging@lists.linux.dev>; Fri,  4 Apr 2025 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743752212; cv=none; b=DGmbEctGrL1g3HgAXrY7vgq2IAThb0b3AZR4tXLSufG3vDC4PNiMnoEaheDbBDfQTVz4LwBFpKH8C0zp30ERDwBea7HW85IVlPFPgOn85l4kbiX8Cgrien4HIewQ25wFf9fuuge3B5HFlIx1Gt6VoUGTczi5mgCqJnd0qhL6Tjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743752212; c=relaxed/simple;
	bh=/JMu30CjQcudr/fHryRHNEXoPsMTAtgHdEimYDirric=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plyaHDzUCZAoz36RcgA1eCIXz63L8rI7Na3zGLko+1X1w5IHwqkgF1Usgkjrh4cQw5zITOkIeHhy0RBEmp5Fpia8kZqla+r4MBFmQfeDvztqWYCnlVstwv9pIFK3M78yRpLnO8Sz7ahkbDOUXKbMCzwrE8Z1HdwhP3Gupc5kgqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmAQHZYW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmAQHZYW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so2853957a12.3
        for <linux-staging@lists.linux.dev>; Fri, 04 Apr 2025 00:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743752208; x=1744357008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JMu30CjQcudr/fHryRHNEXoPsMTAtgHdEimYDirric=;
        b=CmAQHZYWjFMIdhJ1zPrGLcigBe7qRiTqM+39QaLPl5NQEYpnGCEZND2WY0ir6+C2S7
         u/hPX1qbOiLGdIG9K0hX2aEFEcxt7NlO//eJCgjyPxRhvDfTTgSl0Ob6u8b8oV9YEpTc
         5uHtHarwJjmxaLgGcWDKAmQNH5V2JBo06+WtNvdAE3Z0RRmWiHSZGw0bKeSzKlwhVG9l
         D2aE6RwMPyHJdCtLXCHPAysL9dZx4eOOKRkNbLLh4BsR7hXh4/Pqg0uWotWuJ61tPnOs
         L4pnyBmec+ZlolZfzT6QZp3NZsVvq9upm7fdCJk78FIZx7eo3hMv92rdLQgMHH2URMaU
         Lr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752208; x=1744357008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JMu30CjQcudr/fHryRHNEXoPsMTAtgHdEimYDirric=;
        b=tzZPLGaKTDG8ZFF0qjEP9rG+IIQm/jCE5qYUvLTtzj2BWXCABk0YLo3+3nxCJ08j7Y
         sAuDb4GTJCxO+qCcxjAW7+w8+7qBhM2XKvylyYlrvYLce9QkpzOQGUHhgd086IdWIe18
         FSHAxlrpD7h05CHrKjfGIkdcHh7u3FaeDkkdf/ELc4DodlEXdNwA0HjE1z+0yrijmYqq
         z/EtZB7ukMhBZyXeTNvWdVMRr7VoVpvSFW17JEX+StSGtAX41sooMRpFbNtwPdnDXCBR
         /p8Nn4Lpd0sTlozpgJBOnxWxEBiHH59PfZ6dSE4x3eTzLPp8jQUEnJIZ8LYk1Qr8UF/F
         vbXg==
X-Forwarded-Encrypted: i=1; AJvYcCXauNuCabYsu46DuqHD9hhQb7Fnkgby4kYty3Txgibdh8HiGMSB8v+3l4Hjhi3QUucmo3rZT49YXEHRL4Kx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8fWG+aynoK76hJmxVQCvENLVRHNcGZjlEWx6XpljOUA6k0l1V
	A+RLCWCalWZhYQeTjvSkIw7coK8oraR4sdRRT0SpUdYjCiQzVcKz5EgRqfpfg47CSqOzHl9mx5O
	uDkB+lKKzepZCXQDxAl7yeKvmY+I=
X-Gm-Gg: ASbGncs/RLMBQ28DIRHdOqFTBAteTaGdIBsNeJ9StHK1V5YL+NorQ1tVNUx5npRGsdB
	brJ0rm1/MxzusLIpCAm1x79m4AMpaqv5TVnomgpc3c9yTuMweascW8As1V1JUPhCUnhy4rhDGfT
	nIvb0znD5sYjkiG2QLngZF43fC1FbA
X-Google-Smtp-Source: AGHT+IElOHIIytFmbfWzBLqXsSKpHYVQVhB5Rj/aFXMOU2l0b6DC0FX/EUK3uWLpCJMa0J4+h8O+x/RydaTbnd1jyuk=
X-Received: by 2002:a05:6402:1d4e:b0:5ed:837:e3db with SMTP id
 4fb4d7f45d1cf-5f0b6623595mr1315347a12.32.1743752208346; Fri, 04 Apr 2025
 00:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <67ea5813.5d0a0220.293276.775e@mx.google.com> <2025040301-tightness-giveaway-a568@gregkh>
 <CAMyr_bL3sh3HyL0=Qb1h21_-5dqJy0M0Ewo0JMFPNr=x28oNgw@mail.gmail.com> <2025040443-serrated-flying-c329@gregkh>
In-Reply-To: <2025040443-serrated-flying-c329@gregkh>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Fri, 4 Apr 2025 08:36:36 +0100
X-Gm-Features: ATxdqUGY1yYTDvMXmhJXcUVznI-zoiX9fYi0bfoGGmZDMxXxSTlQAlmX6W5FJtE
Message-ID: <CAMyr_b+XY6hsDvxD2YMghoz8oFEePuC6DgsVVzw5XrjSTEy5UQ@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: modify function name to kernel code style
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 7:22=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
>
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
>
> http://daringfireball.net/2007/07/on_top

Thank you for educating me on top-posting, and I really appreciate that it =
was
given in a top-posting style making me realise the consequences by experien=
ce.

> Please send it as a patch series.

I will send in the patch series as advised.

Richard Akintola

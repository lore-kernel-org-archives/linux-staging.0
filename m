Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6081274C17
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710441904; cv=none; b=p/N90YEWLijpfxPd9HOl9Y0FPP7+j+C0sEReUcyfzkGlBXRDjRp7O5LuDHxf1EDrNXvByBWx1qOweDHWDRdQAJzVpGmpAib3oKO3MW4alGjTgwDMh2t+0P6oOOMO3VuM6kde6faWa50Ad3bd2jjcChlHJ96mRTX9XIhFOSzQ5p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710441904; c=relaxed/simple;
	bh=MdRUBQjuQKEr2keYvjv61bWNOQ7/Rlg66Padmbb9nNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pz+Z0wPkJ5HDchSZJzmLEMVYbMp9RpWkqXSK7ex7uIZFChks3SaSa0YLqOpD0OXqOTJFIgHnmbEb4HFvVTDwEy1oo3mB6eMm64yhOVc2TiT94S2cAnZ1xhGlabMEz2+bBjNGSdSp1LSCqQ0KPlUjKuPcmvcoBKv64x2YX8jq3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npFzYJkA; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npFzYJkA"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso1112006a12.3
        for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710441903; x=1711046703; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdRUBQjuQKEr2keYvjv61bWNOQ7/Rlg66Padmbb9nNM=;
        b=npFzYJkA9wlUqcULUMFbiJwZwwT7ikkFD9OdcB0RfHuCkFuUw5NBgXeRnGp/R7tJ/m
         Rt6PRh5Zo+98xdIgmrApwig74Kul4RDJRrY/pKcHnjii6X1xqT11WvViqOhR/5GxEnNH
         E/Ci5HR/lk6Y2Jy0KSqq3CY4mcTJeMBlE6CCBWQj2CthVO19RXUlL2o2yzEUoR6axcUw
         HY7TY9bsL3Wh26wGvV44z9L7lEBo548+kj+VwFAkCYtq/g8oFcEE4f9Z1dmAjGy6GAQ1
         T1A2qPiRy34ydQPvj8GIAeQ+oh4Tmhg39irFZxxZ2SuADFLmdAj/BTEto3sqHAmiz0b9
         DTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710441903; x=1711046703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdRUBQjuQKEr2keYvjv61bWNOQ7/Rlg66Padmbb9nNM=;
        b=VzROsCnO5V7qAvJ7R6uP5Z2AVgC1iAgksz61uC4eIOOs7RhHMshMSkRCZ+KWAKLuAE
         e2HgcmWkmtC5w/HjXBxH6uATqfyCLegGYg3p+fr6T89VBh0cFUX5pwyB1OurjJmTFy+T
         rW36xgP4lLGFunddJv2N+97nHvboV+ZqtP+k+MXz7ezGXLlraUg/58UQw9fJjrh5K7Ca
         lgKpyp0v3nW8m/I1tfkGSFXimtc4Nug0Dql/nLACwFxaO/LDs/f1X/NN0VsWb6t0E3Rm
         qFovTOHURbLmnhZ5BwGAF8+IwvLY84JHdyF/QmITZANt0K2dZP+c5YB3TE2FBI0YHlE6
         tjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXd/f7iVNYtAE3LmuEHDTcCgHsEYOZzL3ar0kl25DIAGEFIzIj3EnFE4JZO8u0jN21JtQsGfUJ23jV1Q9vQ0cwpjYhjVoeSdRaQh4nnQ==
X-Gm-Message-State: AOJu0Yw7BmTOwxmZDKXwOGyjeCwBFHw9vkolrKqfilBy2aDXSOfokzip
	ko+FWQTpnSt8wgNFhvE8S9BslPy3e5CQhmGCrSmctrF7VvDm5dTo7FQBCCkbOVYuWedf0TDjdEE
	5MOoEPH/7r1IQhrf5gE6JC4M0kk4=
X-Google-Smtp-Source: AGHT+IElVDkE6h2N+narObE2NptN8URSUteehVkaa7yyeR14RvAyrq7UfdfojrQVblxCfBAHP3mM/HO1U0Dhq5D4HGQ=
X-Received: by 2002:a17:90b:3118:b0:29a:e05f:3f55 with SMTP id
 gc24-20020a17090b311800b0029ae05f3f55mr2569865pjb.2.1710441902809; Thu, 14
 Mar 2024 11:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313154857.12949-1-tzimmermann@suse.de> <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com> <f17e7660-ea10-4d5b-8234-79251c4c3483@suse.de>
In-Reply-To: <f17e7660-ea10-4d5b-8234-79251c4c3483@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Mar 2024 19:44:50 +0100
Message-ID: <CANiq72=hG65K-Npx1uRxr1SdEZACAQTvAZPD9UgOp129y71NdA@mail.gmail.com>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org, 
	daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, Robin van der Gracht <robin@protonic.nl>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 9:09=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> As Sam already said, it doesn't seem to make different in practice. I'd
> mention it in the commit message and that's it. Ok?

Yeah, that is what I meant -- thanks a lot!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

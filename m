Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE63F4DEB
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963792; cv=pass; b=dMFzckO43zyT1gcNOKQPMsBU+nWsw9ROnhl6Bx7h+Y2mzXUrUcWhBeGiwwNzs4Elbn/XPIkhV3hiM8hzppRhVk3w6dhT8hqegO3/IWhlkH29fCC2QMuKrlmmnC/U2z2DFbhtZXhToAQ5YLBxMbp26yPwY5zqaWgnWn8FfH5sUEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963792; c=relaxed/simple;
	bh=vNuBttYXzn7l6JFZ+O3w0e33DT2r7ic+b7PA+10I7z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fz6MFL0UEuDnocCa5WR7Z9SJl6HYEulltsC4SKdgShE9k38+dynmIKLqVWq2TbTdk8YxmPuYVO9HDWuze0YSrJ1VRJgfsKNegVcaUIMQrpl9zi0CnqHkk3A/s0ZfY94n+i0A5867tiGd6h7HPkuOEOyL5cTatiznbQsmJfbBX1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgG04EcH; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgG04EcH"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca88130e09aso1861439a12.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 03:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786963787; cv=none;
        d=google.com; s=arc-20260327;
        b=e+GWjQAI29AD/XHj7UeYgNejrthdZ4b4DEdz3hfSTMG0PZpECvKSSnwzNxFax1ABGK
         nZDJ1WALWwN986mEIAY0YYZ3FTvTqYh4oNQWUxV1xNxo9Fmaoh7M6jWSN5Wlo7/vvX00
         G0jj/bcfitMN+xtAjxg6w4nPlihl57c5KIwWoRI1Oasf/agLUwfwiW5Xc3EqqUYuBM66
         Ahr1So0XYDNbVhXCuTDerbWD4xUTQRl3jDdaylzeAjiiksBXHo38DLflOhnYKai9J7rC
         4zenEaAH/4F0mf0H/gCMhTn/dNYKpQZ1fvLG56M+WWECO2AarS8Ka2uhPCI/hYfQeIPo
         HZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=10MVIIGEzvWvDaj1ETw/cKkyqZ37uW3f6xvqzSoqCb0=;
        fh=kgit3R+AmcQ69mjuNN64xdsDAK2MiislnOzudbVXeTo=;
        b=mN9zSLknikhgi/NXppnekpHlbMfNZn+Ay5I0G3eYjIsV113dqnzwmQR02ksaPXZQZl
         lembxZyZIjcvBsbx99T5K5qm9Y5pSKBqLjJbXpIGLycAnalYc40EL55ewjB/gAkdw7ng
         wuz4G9x1rkLcNWMjVKCCPqalJcczhGuotew4k79BvETCgjkfsm/SE9Mqu3N2KokWyijq
         aqKJDTHNKWaHKpD4aIV3jPwDMZbLxCGSoXQ5b9H6luEdsa8UiqJkJWbadlH+46jz0u87
         K4YckXu/65gWmcd57zeEulp3LqZKa7uoW3ruuI/BYH0eY5T8jW9jDIsJUdPmtF99u0E/
         x6aA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963787; x=1787568587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10MVIIGEzvWvDaj1ETw/cKkyqZ37uW3f6xvqzSoqCb0=;
        b=GgG04EcHpZMwlQYao8qPQljacxQJKV75NmZl/4+YeAlBzwlB3HdeRNaY6lSzxVCy64
         lhn/FD/wYbBeuTuatTmJi70YS6Msb70XVXcJ09A7nJSyqdZiQoX97BMQKu7ryPTOhdRZ
         QL1YcGwXxt3q+gq3pyGLt8ywhAHT6eTMX+SU1goR0+16NKmA3A4jSew3OZhviWzAUov8
         dZnxkgzjcLfE8ERbPNZlfxmRvcJCA/bD2AHGqulukbUkrL0AT3+1a9uq/6L+HlECgWya
         dR+VOnFhLpDQZ+S0UVpAscuVwUouBHBNfg7STTNktoVR4J+9yetWgenqz3+EnLQ8MKwv
         QW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963787; x=1787568587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10MVIIGEzvWvDaj1ETw/cKkyqZ37uW3f6xvqzSoqCb0=;
        b=Xs24Q3YBdjBzR9wN60ugBqxG8kJn3ZeiPaIOyRBu29Nd0q8jC+1Ny1mpeFNlEQyZQs
         uZPswjs7ymLmjdUOArD1KLWcYxWns6M9C3Vrv5QAktpGvJN7Sa3aFjvAGe/TH8yFu2VE
         2t0Al/IEhBwUH/osuIGvs/WgcFKy8CIOKveemb0jtii+7kGwVDxTkIY5nmzhMfNK6aQe
         AyWrGi8veJwCM2aI8nZ+sirctPcbb9EV5EjMhz23H0j1GkhfRC2AT81CL61faCiaCfhG
         OVgYEKU1Syac/Fdo3QMJ2S96XnoqIiuzeu/NoGFOT/xSFDBPokM5C3jgsXsiY7wcYsun
         os0w==
X-Forwarded-Encrypted: i=1; AHgh+Rqa+w9poDImY8c4pAiSRqRlNaems5hixa5hSx2Uy+BovBdcl+fWMlpq3gdX8K976vQT/dfewp+GA84Ybikj@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6FR4u2BF/iWbFds06wG/0uLzpZjXYoE9TeITGJgsGjBDmOeWO
	TwZ5pu/CGOFGJxpPkZ+Jlh+QyJQE4OQehJVjsK8Sft4JmtlBKz6H65AVmuWv0QubrAF+QbG90zh
	Zcg18hLmyQH+/eM7Q29Cc088GQazxB3w=
X-Gm-Gg: AR+sD10EXqzGtX329ZF5VLuMLTuP4xuZQ6ML9gFlR10P7QEu6TAzXt60j5o246yEN+5
	HlfDt/zIt+3ec8ATq2XmSEiWIYjrlVuQgbctEAE0olGv0zESTccs/sFmu5Re+FBDc1NFhEEKH0m
	E+U570e4Q5a393B5ja6Ugvh2e1NFNj+Apnh+eBEuMpVyQ6A+DGpnVkdYal58Xv7QPf/J84XgfMT
	TqWYFY+8ycULb0Gt20xgh5x/xALu3c2BFxpLyw7SjPhLSUBIFooHVtZ4gIsKNvGzCYdTT4uspYH
	piPdN+FZubSJUEeOld4zG6Vw29/d3OSCI1t23QHR612BjFr42mvD8+wlHzhoNfdV1Xs5gHehjgE
	6sg==
X-Received: by 2002:a05:6a20:da0d:b0:3bf:6011:53b with SMTP id
 adf61e73a8af0-3cc71e359e4mr28612349637.38.1786963786854; Mon, 17 Aug 2026
 03:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-sm750-fixes-v1-1-978c617e5a20@outlook.com> <aoLbbZ--FrkVN3SU@stanley.mountain>
In-Reply-To: <aoLbbZ--FrkVN3SU@stanley.mountain>
From: Yuhao Jiang <danisjiang@gmail.com>
Date: Mon, 17 Aug 2026 05:49:33 -0500
X-Gm-Features: AcwNN1WaN4sltzO3zSzfLw4CjufC35rEjXBIf8t5Lk-s1QFWw5Yg9F4K0utpl-c
Message-ID: <CAHYQsXR1RS+kzFUQQ24YFyxxUJE39Yk=YfuFgAsvph1hKqqd9g@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: do not program the PLL from an
 uninitialized value
To: Dan Carpenter <error27@gmail.com>
Cc: moonafterrain@outlook.com, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Teddy Wang <teddy.wang@siliconmotion.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 4:59=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Mon, Aug 17, 2026 at 05:13:53PM +0800, Junrui Luo via B4 Relay wrote:
> > From: Junrui Luo <moonafterrain@outlook.com>
> >
> > sm750_calc_pll_value() writes pll->M, N, OD and POD only when its searc=
h
> > loop finds a divider combination with 0 < M < 256, and returns 0 when
> > there is none. ddk750_set_mode_timing() discards that return value and
> > calls program_mode_registers() regardless, so sm750_format_pll_reg()
> > reads the four members uninitialized and pokes them into PANEL_PLL_CTRL
> > or CRT_PLL_CTRL. Nothing bounds var->pixclock on the way in, so a mode
> > set can ask for a clock the loop cannot represent.
> >
> > Consume the return value and reject the mode; hw_sm750_crtc_set_mode()
> > already propagates a non-zero return. Initialize the structure as well:
> > sm750_calc_pll_value() returns early for SM750LE without writing the
> > members, and returns non-zero on that path.
> >
> > Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> > Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> > Assisted-by: Claude:claude-opus-5
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> > ---
>
> Greg is not taking AI patches unless they can be tested.
> https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh/
>
> I kind of hate AI commit messages...  They are so verbose, confident
> and reasonable sounding.  But they don't answer any of the real
> questions I want to know.  How did Yuhao Jiang find this bug?  What

We're working on an LLM-assisted system for vulnerability discovery,
and this bug was found by the system and checked by me.

We proactively wrote this patch to push for a faster fix. This patch was
also assisted by AI but we manually reviewed it before submitting.

> did the symptoms look like to a user?  Are there ways we could
> improve our QC process to prevent this sort of bug in the future?
>
> Probably the answer is that the bug was detected with AI and we
> have no idea what the symptoms look like.  Everyone sane automatically
> initializes variables to zero so probably there are no symptoms.
>
> So the problem is that the user inputs invalid var->pixclock, and
> it leads to an uninitialized variable usage.  This patch addresses
> it by initializing he variable to zero and checking if
> sm750_calc_pll_value() returns an error code.  Either approach on
> its own would would fix the problem, hopefully right?  So it's a belt
> and suspenders approach.  But isn't the real solution to reject
> invalid pixclocks in lynxfb_ops_check_var()?

Yes.

>
> We're not going to apply this patch because it hasn't been tested.
> Probably we should invent a new tag so we can create a TODO list
> of rejected AI patches.

Since the bug is valid, and we lack the hardware to test it, leaving it
on the KTODO list is fine.

>
> KTODO: investigate unintialized variables in sm750fb found by AI
>
> regards,
> dan carpenter
>


--
Yuhao Jiang

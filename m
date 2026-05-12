Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E789284690
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 04:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778560019; cv=pass; b=YWGqD06pUk6l9ZbZdZUz6xnlhNlCCFkvJspa3IigCZItRSKMy53H3f21oMa0kS1jdH5gfKBi+BWHMJ/I3Fj4cS6uPyg4+Jl5PIBiLfBNby8Ll5EN0ZKPGfIG7RyJvYLFTmJYe5RoIpDf5TFc4iib8J5fsAxLx2bEaDaXjeHaE7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778560019; c=relaxed/simple;
	bh=+ySoRi6LeXBU8zA55VzU96r7TVruowwBuL5UEALxqcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndKSVKWANJrRFCO9hpuxLWr/64nLjFbn91vMJ2Tr4TRXZoGJ4g0EmBMXLvsk5KYpD0yUUBTU/kD2z35Mt9E0wp2JcdSaDlIRbgpMsxjxkr26OjgwTuW97VShFEqob1VzX+jMYXzzApohEcP8xkka/va0GRmVhQQr8YIZM0fQTw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tj3xYfG7; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tj3xYfG7"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd22b2abaa4so110280166b.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 21:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778560016; cv=none;
        d=google.com; s=arc-20240605;
        b=hj4YEoWLwUeP/k7s7Iky5Kzc/g+MYIxybiQaebTYr7R0Lnie57ZMtdveMfl8JcURax
         DQPBwFHQKKUuRCnTiKiyskG14/xoF6WM/wJlW4gIUjcFqotrlvKXQRgQoS8p/iUKWObM
         9FJbr7+pH/hx69Gv9v0KCxSF92BYn/AbmCcv7jyQFTtrKnbIKwYYs4MZFp9GIT/a9wpY
         wNhh0o8UCpybLYNFJGCWs/g/FlW54PIRGsPz6jSJNStRRzj+QKP5AgSr7NoBobI65GQG
         SHA/uJ5raRJhfdrzdqnh7WBfeuQzTpNb2VpET/NKdnuTsR48pV/tHVrpmPBwfVl8YnRI
         4FCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ySoRi6LeXBU8zA55VzU96r7TVruowwBuL5UEALxqcY=;
        fh=T5D7L17K21Hs/KOrTRMhM5J//C6gEtdj7J7KykNcyNU=;
        b=OHpPu/b/zOJJzOlZ8y3SMkvhDdBrs1KfyeAFcoheiaW/uzh9zxRnv+dPznlvZyblB6
         EUHdac3HGSrY6NrFROx66EgWOwenXqC/xpWgiD54gnSwagz5tLMK2IJZjsqM4SkRomyG
         +UP9X4j81D3YuxzDq4LY9F0f+k/RXjRdQE5/wVR3hPtWzSNaRTYqSsi+xcd7DxDJPzDM
         pKM4V1Zgff5mC/sa0mpXyocv/q1cXJduwvti6L34wKp5WToAP/dEhfKCYm9C3eTDHF9K
         ww+SgqohnNHR4sZmU+EQ0hAeU87BM4mlLCP4bGKMYT/obHLRepaVOjS+4he/Z4qn2v85
         1m0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778560016; x=1779164816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ySoRi6LeXBU8zA55VzU96r7TVruowwBuL5UEALxqcY=;
        b=Tj3xYfG7j98NmKN1tMEDvJPpw6earyGRg6GA2mt+FbkqsgwdngWyxOVoni3+K1tcIh
         nBaGaQ/Sp7twbl/jIT4P39hN71uU18CbpQeTDNZ28xASp1gj/t6kPCN+D7JtBiSvt+OJ
         TniF4GxFBGgE3rfY0Wnwt+qMKLM4rMDXUDrcxwRlZjhUZZVAYrA3vpWUfCnj8q5VW9KJ
         GX4IJHw8sodebQsk0kQTjQ0UX6IkkBaduJZ8QmND61TtskD6CfxT/NFZShP4RswmNhE7
         cGkhcP+EyM0NSqVXxGkp74VptEDxZRILeP6mby3nlLcp97yZijGLKCBES5mzxJC97MOi
         88xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778560016; x=1779164816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ySoRi6LeXBU8zA55VzU96r7TVruowwBuL5UEALxqcY=;
        b=b3Zfi+hbC3/COI5Yb08nYtMzMwRez7pkQKzwCH97AjGYnp2IOfkqaLSfyQ62gGTDyH
         FpQ9bIfK4tXE7nDj5FvBkK1lhWOtTFC7HkdgNxUcF2N9UUQxoqbIDx1nXF44Ll/FEQIP
         RGT+UvGp1s781NZU7QkKfWL8I2OjiIVK/rjc/RBLB5Lhk46fcZCYDNfD+YMbTz425epI
         3ru7EMD1Oe8aJSaHKcS53wcAM0jOmJow97A3AKplfwI+mgcu8aGgHnM6haTtqn3SInZP
         E7VoD6z34rc3NCd/Y+PtW7DrwPO4Jo0qI54lXlQ2HYVtfdPOCWXlTroIlfKlfUNCEYyL
         7WfA==
X-Forwarded-Encrypted: i=1; AFNElJ98uFRH40MY/1twFLA0XcJTAPK6YZ9VtopmPLClQrkDE4hi41ybo27Ol3xnk9STWwDC5EEqFTLTVhOfoRdq@lists.linux.dev
X-Gm-Message-State: AOJu0YyrnsHyjxwlL+/rEaw01lki4GPC52hMOgb/4YJiQG1fAdejQjfp
	mK5twSq1/UXIUcRBDcB129B1rUWwBnbZgBn/z9d9y9cHJ4l3MfVqdHQ3Rmb1in1zsNtMVwOtxdn
	uyrydHpsfsBUOCDvy9fU5V8vAEInuZ5g=
X-Gm-Gg: Acq92OE0eqiitTK7QP5q/dsDR28JQo+Y6USxLLcH7yvZtTwymROqJiz4AI3xKYSiIjI
	+u0XTHz0wAs877iR73FRW6WNsG1RMWxnVO4zFmviswdeRrl8hk7XNuNd+tBpah8HiURhyw94182
	YnZIp1QkV7waGty/yk98wEfOSt7OwtQRgsUxetAImgpk0GtARdA6Y6BtQ+ofGyhedEiq93vgAqn
	GDcifwa1JNvjbg3vDd3rOofrIJaAanHLK6L2PJykxLoN3AUXLJVEp5HLgCACgV/7Shp+m07PHTW
	aID6SP5QVor8aKA9A3vAb0ea+FaioutOLLzXFoHtgG8SAApWXsBj9bHnSZpwntHbTAtB7M38Mg2
	nRFR99+M=
X-Received: by 2002:a17:906:4787:b0:bb4:92dc:b84b with SMTP id
 a640c23a62f3a-bc56cd3782cmr1545358966b.26.1778560016349; Mon, 11 May 2026
 21:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511193222.49582-1-melihemik@noirlang.tr>
In-Reply-To: <20260511193222.49582-1-melihemik@noirlang.tr>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 07:26:20 +0300
X-Gm-Features: AVHnY4Kn9Rv-3n24WJGHghzuyLr222ljoNomIq2KvZY0XGkSQ0Weq_cay6ZEOcY
Message-ID: <CAHp75VebM9wwKpjnZKEGVvwA=TfmF4MDDuYssNAFWDnXsXyRTw@mail.gmail.com>
Subject: Re: [PATCH] atomisp: remove unused module parameter dbg_func
To: Melih Emik <melihemik@noirlang.tr>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:32=E2=80=AFPM Melih Emik <melihemik@noirlang.tr>=
 wrote:
>
> atomisp_v4l2.c declared dbg_func as a module parameter to expose the
> CSS debug print switch at module load time.
>
> dbg_func remains as internal state for the CSS print environment, but
> no code depends on the module parameter registration. After this removal,
> git grep only finds the internal variable users and no module_param() or
> MODULE_PARM_DESC() entry for dbg_func.
>
> Remove the obsolete parameter while leaving the existing default debug
> print state unchanged.

While the direction is good, the patch is half-baked. Instead make
sure the similar infrastructure is available at runtime, exempli
gratia via trace events or dynamic debug.

--=20
With Best Regards,
Andy Shevchenko

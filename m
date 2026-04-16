Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901082EBBB9
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 18:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776363669; cv=pass; b=RRigv7Ap6ezsUh88+z0Fq1DcxxmmSRZN02jviDbU/KeHIsSXKj9gsEqfPuAMrXpyElvNIZkd+uayoYf73nhGfSAjAlJmt9PwFeqfJimJoAGxxG3kXHTbEefXMpU5khktSVJdXI+j4OXuOMYeCIcnsgWC2HIouxCn3uXwpjxaGqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776363669; c=relaxed/simple;
	bh=zljY96aOpcZXaU0TqwGD9ncObvim4QhmFBnzHQtRmuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuSVzlB3RknE4Zf9+JAHT75iTTpAh86iTNFUppcbYlYkpu3jsQjbyEPHOupBvn+La7PLY7uxL3u/QK4pAaVvb0gWKhtEMBbukXOrP0VIeRtBGSYziXci3lmFwmene2u0UCS9Cys/BHwGTooEB1XnXV9AwliJDo/x8fcGdrx2hTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5lP74up; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5lP74up"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c11eba219so1089703166b.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 11:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776363667; cv=none;
        d=google.com; s=arc-20240605;
        b=aS7VqetRGadd4Pou75pFKjZNhZ4OnPtG2Kd3ux1/8CIGqm3U/v1ogzF0mMWu5JbjSU
         4XIizko63lw08WMG1ECvXamuJqAKroAL9qp+tG3uqAV5zOj22jN+IOFXvJOZVKg2qQFK
         Z4ShCrNoISGyXF7l04Qm+H0zknuQ4XQ3hcot6NTDMAiuqB6L9PzR0d5fIDFkNniXBt8m
         uAPIIIZpIMUGD58/Z/D0xx/S0jAmEFKjktItPx9I9d93TW6lnnDfiz7r+Is65JTy/D1Q
         cTRHXJi1H6eiMHD/rccIcFPRB78vBLoFjULn4Gue8sfGPfFvBdhM/x856Ojln2YPHWMk
         +HMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axbeRxqT1s0AditMUtuRbScbflsIyHPPu8lfF8iZ5eA=;
        fh=X1B86XyeVf9XKTI9vHS2gA3WIKCf3UXIcorQ2GaPFsU=;
        b=dbI2rnHclX1AT5AdFNZWSkiu5oJenhxZPER2kkt+WKdQ/Ch0+XIIiXhzc17F9x+PGO
         gDneHw3Ry+pDBRA/rvecMtDx9ynAC/eDiTrILrF/NYpcOwqy4Rl1Kwh0MO+Pi7ch+nrA
         GMFstKTBs2qIveickm+lhm4rKWwzqU2ZXAOhOjKglRhhoTI67X1mvmvChH5aQEKobHN4
         AYt93QHsjTKx12IXuH1C7+48I3D04ATWgkV9BtHBTp16aFCYV2douvWw3HQKMPDhq4mO
         JRn+/Jz46swZ/+e6lSF+7nwwm1V+9cZPl4dJkr6a0lFgX4DZYxxvTEdOMxEqLTkCpdC8
         E6ew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776363667; x=1776968467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axbeRxqT1s0AditMUtuRbScbflsIyHPPu8lfF8iZ5eA=;
        b=U5lP74upMoPQ1bEcUFMzI2ZToBVlznzudwOg3e90uYtpmr/i4mQ8FIBSFT5vsdeZk8
         C6RMQ5y04NpO+vx3grSMqH1VEg86NCOpNdc5At+nf3Peldf2ATvd0P0XVz2C6If8Ij0C
         +45RYTY4BTZPFzcia7+r1COLH3B/3dzyAKomfhq+SUOI/BILkfqngDp56TASpN+NRuY4
         0hwWi/gIY5PtbAgxp+uGsEq45WTg7wWZCkWklOo8Up9PQXYRQ5GokXxxQcl+m3ELNNIy
         Q7Z4sx96dBRKAXsD11PnSPeL02+/K13SnxWzAc1w5u3Th/W5xLmrtejnTEGw6LsqKTuZ
         d2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776363667; x=1776968467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axbeRxqT1s0AditMUtuRbScbflsIyHPPu8lfF8iZ5eA=;
        b=orqURDZbpV+odiK9Kwj93dtt0SF19Ro3+TrcVz3rR+50cKOqWt/nYlLjc4rA9vBwn+
         u1U//sPjkp2B4L6KD7YWKAuIr5hQzH4aTXeMQMZsGx+Gvdc1jGrHihfKqEWDdF0fw8Km
         +s1oNu61WWWKeZ2Qh5gb107OhivWeiTOHHJWurvbGSc3Qcr+yVfyI2gmX9GqKATyQQll
         mgYUs+qdLwpx78X60ytvRQtUrUiJe9sSBsvrUEF7ax7vL4wNcd0yZ5QJGCPvWv87JGmS
         rzFq4wUKAYT/j2UxgE9iz7aXDv+NrdnBdumggXLRC67c0xINisUSN6kkkfEDWBZLw03Q
         Ay/A==
X-Forwarded-Encrypted: i=1; AFNElJ9jjO48cLS4PfLleuVgF19GJv4bAxfwSq4sFrP3O4JohWY203q828ZlcRbbawuQXOzxxi/BUWk1gSGmTahD@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4jfdPzTjR732U/6ELLC0jvhtsvWjNdZw8YMAQMQ9HFBjx6oQL
	HSFeTbj/8gi5hZRucUwPR6OIIAY3EZAd7HeGLPfJ8wN8W+ypH3DFb38wje2fQbQxRRJ3m6lP8dI
	QFpz7t9wCfIYTel1/EH/+fQf12KNgEFc=
X-Gm-Gg: AeBDievSV+BmTzxHANqzJl+I3k/QRrSOhTEoTdJdyixkimvUfU08ederSDbSoKSbJjk
	IK+/HEk3dGmb6AqmDREGejzBTbsUtzN86wx5nMMwHsfeFbJjMjob4c9A2hkonbWgE2U57CQ1bTO
	A8ErpA1SHrxpOVgAeajhCHzZT0NEFb1vWjAlK/lsj/HYSLxopsMK9a0MXu0KQlacJ3DOVDx8l0F
	W7Ofm94bg377he7oOJ8dZxUfwQvX1fc2r7tsbQT8GqksYBem/cPksklDFn4q+x201ghM8mWrm7j
	85PIGAl7XO4sgSsDYA7ZedziPamalyWBe6PWZT1e7ZRFFTEjpRC246pt9qCC0V1l1rod261SF74
	hzv33dPXqqtHz4h41Bw==
X-Received: by 2002:a17:906:5191:10b0:b9d:ffb1:17aa with SMTP id
 a640c23a62f3a-ba3dbbb5f29mr24027266b.24.1776363666733; Thu, 16 Apr 2026
 11:21:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416164643.153765-1-sachinkumar905846@gmail.com>
In-Reply-To: <20260416164643.153765-1-sachinkumar905846@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 16 Apr 2026 21:20:30 +0300
X-Gm-Features: AQROBzCvDnFVFO9FhekHLkJwL2CmVDwz0QoG_VeE5ZobTgU6bLSZcij0D7r5CgA
Message-ID: <CAHp75VeFZ7PDV_tT8tDibQk-VPkFFHsxiAHOAx-9Xp0N1ijvAQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: clarify TODO comment in fbtft-core
To: Sachin Kumar <sachinkumar905846@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:47=E2=80=AFPM Sachin Kumar
<sachinkumar905846@gmail.com> wrote:
>
> Improve wording of a TODO comment to better describe the
> intended optimization. The comment now clearly states that
> only the changed display area should be updated instead of
> refreshing the entire screen.

...

> -       /* TODO: only mark changed area update all for now */
> +       /* TODO: Optimize to update only the changed area instead of
> +        * refreshing the entire display
> +        */

Wrong style.


--=20
With Best Regards,
Andy Shevchenko

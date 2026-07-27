Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7D3DEADC
	for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139832; cv=pass; b=RJTlSBibBZrkXUYmOpdSRJiEQTYm6VgzSSmYHJ4ifcVCtSUT3CBOGBCBLBMpDTsD3OZvImiBjkN6JF++Ot54NkD9FNs7OG9oUH02GMFTsnLy2EVcpSqn87BdYotvc36pGXXR1BL+NnHHW2EMyeRXn3nvsqi8jjblU1ZlUC/SEnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139832; c=relaxed/simple;
	bh=u1SOk4ZoDfRov22oP6IGlVlZUwuxcDk3g0Ri71MIV/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4dUA2ebzxTUGuPE5fk9IIz/sxBmJaSln+9ihORDRNfZFLmKntkCgMitX1k8AZiVOFed4wW8oZk6K1tCdyIFsSGqRlFPzTJczKvJSXEaRVBCOdgKwNcLL7M7a+MSmAMoBLJTxQW3npo5jPKJBWgyNUNKTtbc70EaEnKj+Vgd/YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBCxux5/; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBCxux5/"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so1359482a12.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Jul 2026 01:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785139830; cv=none;
        d=google.com; s=arc-20260327;
        b=WMIceRVHPEzQ4hUjvkcUWdRTvDVBIeP4Z0RWUo2joPhCY1m0AUehGdQUdQzTlETSML
         LFMlnUgmrJ6gWMxRlOy8C8FXNN6hMpgLXRToL59f2lU6cfLVPVyPrIrZjpRsKq/mt9ou
         cqgvvPUkZZta+8J13Ftdx8rKNYTVY25hjmEgVmdslkXVhTu3Hym9Wu0whLiUClTd6PUl
         NSzgsIysq3SSB3YpM6j6uZsdNOFfCBQ2ln+SqQRZ4+F8H2k5AGGLtgD8Z3BhKzKH3srH
         eDmGq6M27CsnTGey3k+70L+Spq3pmzV0/7hAF+wk24l/R2Qjk8UeyWMJVyqAp3mSJQDD
         2XcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        fh=i7NocUF4n4ERzNng+u8BrSBUWygQ/XspOkQtEingfk4=;
        b=abVtX3twt4SPALNxKiYsNN8TeyWpCF1V1q7CfnIXU32H0QG1GOjiEkZnpudcK83pIQ
         O/3rASNmzm2abEyeOlPTBGhEgOT3D6YSuq95vlkBKr7wyMi9bWf40fHCpPMNB+o/Te6o
         dYuMHkAktloStyjixQLidAwGBuF0kbdavWQED9jo+QZuDdPDCzTdi9z6MLOlx7Mn44LZ
         ehl1QNynKNQQJ+RAoCE2crG2hkNguQbEUFrEhONUrSD4cSENGooaShzw1Lm+KltA+emS
         smCSy2aQZvswbZsAALneD85KdAcSJI+BwakupUMk0V0sR/opKu0DnRRuqAKDScJ+m2Lw
         2giA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785139830; x=1785744630; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        b=sBCxux5/dbh1sYKF758mV5VqrBQyD96sUmUtez8ywhuShOiSsWeiRt4kml+ErFHztu
         Z1DekmtgVNkWBfCRddJktZDoE8QHYjrF64El1EEtWgpLXQQnmo51zJWGtioo+d94bPBx
         Vfu/vbo6FdvUuT3mwhYLgAMsxU4f5iM80GAaQMoZ7kE3QYVovuie4wJjdeBMnU4Tkj8O
         awPv3xJqnxtfgn5j/taijKL2au0/3scRqG24qXvpSAYFBzXvRv64XBIl7xNy2OhTCDtV
         XMRxPljTRPeKXzM37Sk4aCMmigUl3E2/x19WN3EEIhoWRIaIBPrEGEn4Q9cu1+lsCo4b
         Mnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139830; x=1785744630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        b=Ai9O26xf5f8jauQndkMtyVTMQaivWaF8s1nNwWpHtDJoPxp/LoDnjVXxXxxOmI3Iij
         ei3dLVHdiqhRLipPMv6KLZXtGmtV1rqwp5eYd1ZO92Nilwb3hdxyZmFcFZ4G1pe8u/FO
         d1Te0++5xnt83ujrYJqcRYgSThDxtqgHsCS0S7GVhyYdLt41UWQ48aTtDFuHRUscNFUS
         rAg2I4lp+Vat0gCsS5bL9TLohgMW0kvbBz2C9Xec8VJ/UsZf8tMY9vXogH+VyXCuvaZV
         inJjl4Ekj+nqr2wth09z5EWig5vxzEJxAJprUkMwgwUx6FqrG08lMK915BA6wUiPAhnm
         8oyA==
X-Forwarded-Encrypted: i=1; AHgh+Rpdk3rpeBT2M46+nvuFTeBPL6zq7OJwwKlaXDjOvRLIh2xm68JA7rWRbV7GclcCjVpVBVPT8souoKPXN8+a@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0ul5zDkDAI6Ihzo03TOBJM1Tyc7Vp2svIL4fr9zeLwm+uILb5
	7WkbyiYSNVLJt9kzOev+gmtb1h3q3yXN0cVNIRNKWsjdMK2Xz5uwCLGsjPKACR39hoMSBoOzbXA
	EvnVoAZDuoTkz0TrJ1SJBrGgYq9MIghQ=
X-Gm-Gg: AR+sD13F2x9ZUuqVF8dqw4CULMBgHRfa5jn1WmicMD9bOJAluIY+i8lgCxh3lNNmc7U
	4qCaQQMskEQ7lJo8b0kvcYtRA48WAt4AUR/+rC7Yj0ahW+2QOzbCAk6bdIFGDiatnX329b5GQeq
	pp9lYzn7p13VNGsf5U2N1SP0iTcguecvo0OtkhCBKPi7kZk0W1l2px05/Z65Plql9Gt9uvejc+A
	pxEC04iLxVDvdh3jiwhOUfu76Uzb4KPYxwyYeBQsziVFX96pA79P2WjI42PNEC/hrSHEvPD0dju
	JEHSQ96rKjk3ZZg+FKI=
X-Received: by 2002:a05:6a21:110:b0:3c0:9c19:b274 with SMTP id
 adf61e73a8af0-3c67dffb181mr6607471637.66.1785139830433; Mon, 27 Jul 2026
 01:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726100408.3262831-1-congnt264@gmail.com>
In-Reply-To: <20260726100408.3262831-1-congnt264@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Jul 2026 11:10:17 +0300
X-Gm-Features: AUfX_mxifE27HgmqQfF8z8SxvpEZvclmuq7ha6af2z_fycdCEGZFG-xRFnzkrOA
Message-ID: <CAPVz0n1V1YJsEJ3+SbkMnTzCbhyx3vJP2OuCPe1Ft1+ukynxHg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: tegra-video: fix syncpoint leak in
 tegra20 channel init
To: Cong Nguyen <congnt264@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 26 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 13:04 Cong=
 Nguyen <congnt264@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> tegra20_channel_host1x_syncpt_init() requests two host1x syncpoints. It
> stored the first one (mw ack) into chan->mw_ack_sp[0] and only then
> requested the second one (frame start). If the second request failed the
> function returned without releasing the first syncpoint, leaking it: the
> caller tegra_channel_init() bails out with a bare "return ret" on a
> syncpt init failure and does not run its free_syncpts error path (that
> path only covers failures after syncpoint init has fully succeeded), and
> the channel is subsequently torn down via the kfree()-only path, so
> nothing ever releases the orphaned syncpoint.
>
> Release the already-acquired syncpoint on the error path, and only
> publish the syncpoints into the channel once both have been successfully
> requested, so chan->mw_ack_sp[0] never holds a released handle. This
> matches the handling in tegra210_channel_host1x_syncpt_init().
>
> Fixes: 0e2c4117c351 ("staging: media: tegra-video: add CSI support for Te=
gra20 and Tegra30")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

Very nice, thank you!

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>

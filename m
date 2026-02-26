Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93D3290AC
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 17:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125771; cv=pass; b=h0kscAcxSWja6dEKTYQ3xcHaJdeMhs9U0X89XAV9yEKYl/tnHAMqd302oe9P5C8FFarwcPSJdfs/cRi7RV9rivIdkrRzJX9dKOYecUCYW0ZosaLHcxk7It6FvNv0k0+n20oLB3CJmKqOlNxcxIdbhjIofT13YcqyF62qRlvuC2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125771; c=relaxed/simple;
	bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzjHUYV8tcYvt6nxRIbvQrAXNTjkNmQ3RI+PDE7rEFeWzbvWUvoQPIQRdU7W84BBGeCnyRizD9qtgQcQAUQvcQrq4eN9GGMNabcLiETTmndA2j7Mr/VtU/fQUyNgA2qL2w1Blsq0wFtGFA4bimOPLDxytwlWdjJWgqnuFuwlTvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLjHtRBO; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLjHtRBO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43992e14638so1115966f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 09:09:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772125769; cv=none;
        d=google.com; s=arc-20240605;
        b=kYeIzWfY2JLhRTf0JY2aZ+2qQVYsqTbO9sFGwycJsGRg/9M8Mepemcijzbe/5GduDx
         qgKDf7lgpP1fariS7cJqmtc7RiqBBL0K8Q50lxCWjMUp9OPY39AbYUNdmFLhkfYYESJe
         ZVYB7c5O5N0dbRqQxL1u71Iqd4ICUGgpx05uPcv3tQdxjkhoxpuGCD74OsmJmOS/T5H3
         pFqWSKWrkbGEB7ETF+Fkxu0N3t94zru8mAQzj7/uUhRPQXnxarJsnrjyDjR4O3vwFB+6
         CUUuhPF9iHQfHTANIQfOej5JtiADA8+A5Zlgs6tJicMFSN1tzkkQ1QqWjIvhPTmdHdIP
         bWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        fh=3beoULy0IStsuIM0De25jg4q+xDEE98XXd9ryI3Dofk=;
        b=lu/UMj+KZKTt628k36MsO4IIMRVga7XFQL2N0lI5ncTfyVcgbUbE+OdndrMhjdPfo4
         gpd9v2Xyr5c+zxcmhhzwSL+MJWaaSWFZeEIaiRTweqCLsXUE8rguBgnPmwe0ntxMnnfF
         CKreMYIQ9GdCKhVBFc/s3WoRoclzsZspd3FaT9QmFJ29cu1369ma/JIGpZzWQAZ/4eNg
         beD2NMcO2aF/3+X3c6d1Ev/oHxZ4UhEidyflKvAgzBQEAB93Pc8xCdqN+CJn9ysH9rJA
         K9ydp7CWxwyM99dcJZpxmHDmfABkDN9NTDNj3vbxGTVdbq9SdSni6sOfkA+z6Q3qm2TP
         U6+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772125769; x=1772730569; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        b=iLjHtRBOOXAzUTq7ioWg13ApFfoLy0HMXOxl2GtRdc1xEnYFwwu2gzoQ27UwSayLeS
         ssX0IJ3LPDhtvIbTnlGFsSdINxUu9yYhuOHLW2ha0/Xk4aLiOVEicfPYr8z3Ln1cR0Uk
         3ZNgGrrEZeFF30QDJeWpVewT8nisB2ExhoFbKTDgxsm306jU4GafO63kE7uBCPY13fdt
         Kl7m8Q5HiDJL1JjmAnWEbx8/dYB/pdclvrmP1oLtzsWjoa/kSc5xlsYfpwslKBrTXZj5
         y9G5OZv9l5HLDD35R+X8ml3bQ0PE1XWgCFsOXyK0IhUd3oS6udPiFbzmiOosH99TUaLK
         djgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125769; x=1772730569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NdwWsolg2gJUNM6isgYnzGqyXeK2I3/x3luj0VOWYtg=;
        b=SEM3vi/2cHCiAnqpXzAsnUQsTw+UWI4FZj4mKRtYh5DhNEFmrNTzwvK1e5VIVNQKaM
         Uuym6Eh6P65xhnEtINAltf/jbK0+Ojs4Y3Eqy02bzH2PcO0ziacpQ3hdAudVtaEPY0Ik
         7VHz5FPBvk4POHEGyWt+K3eu/MUjBOc6TquyYoCPNZGpvgTSmkH2KH8VhG1pY+0fMbBe
         NGsTUAONFLyIRwhNw0Czm58D+bvcMLeEQKFWwz1bSDkOd5qtTOYzFPXIfMJFl21OPSB8
         hpVLaRc+sTkLAX5UnqswWdVQcx/y3xx/VHHqbvtob2LNGMlgXLP4Od7NL/CN1aNLExO5
         EOfw==
X-Forwarded-Encrypted: i=1; AJvYcCXByf6oJFCaDI0ZVCKWZZugpIC5doWl3Wj9h1CrK8+t7+QN8ZrqDLsmEVRzw5TtrYHOcX2F2vEgXShqdYH9@lists.linux.dev
X-Gm-Message-State: AOJu0YzYpfH5IxHFxEX7kgPZkZDCGHBa7cU5RI5Sf//G4AmTObLzvU8a
	6oV8+I1cfyO+BsSrhgsiiJbewrdh24i3uZTnJb0pfJmIFX+/yzaOBPsuqNaqU7ZEf92C/Z8FhVI
	+XcMk9MPYsrg10JS7vjcfbWBSXX99EOs=
X-Gm-Gg: ATEYQzxcLCLUhsGXExWqeXhA/KrkUr6B1HSq6DdmxbRcBOlTrTVQvqYRdZowIORRPzn
	F7LhITo6+FQ25oB3t15/PE/CI2ux1yEFUUyIVawOiCsT4dTltvWr400lnkJufoAZURPsU6utAgM
	YgjNRnBhwBydxFr8JysWbCFK0+ZE3wrdIBRkCRKWQqbnKYXpmzHYD63H0f0rOpalozSFUOpP4Be
	siuiewvF6VYrAnVtzrM44tGYtzo5vyBiCQ2CHiUvnQIl7t6AlxrutmMSrjC9X6WuwQsyfmK4irW
	2S2qtGsSAZztx+Bk9tE=
X-Received: by 2002:a05:6000:250a:b0:431:c73:48a8 with SMTP id
 ffacd0b85a97d-4396f17b061mr36791168f8f.29.1772125768766; Thu, 26 Feb 2026
 09:09:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130124932.351328-1-clamor95@gmail.com> <20260130124932.351328-6-clamor95@gmail.com>
 <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
In-Reply-To: <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Feb 2026 19:09:17 +0200
X-Gm-Features: AaiRm532NOiD6_qJCcwIyPfsUO4-fF-YWthyRveATlcMfJkzAmg60rnRqSw5Slk
Message-ID: <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:52 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> > Convert existing MIPI code to use operation function pointers, a necess=
ary
> > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> > that is SoC-independent remains in mipi.c, while all SoC-specific code =
is
> > moved to tegra114-mipi.c (The naming matches the first SoC generation w=
ith
> > a dedicated calibration block). Shared structures and function calls ar=
e
> > placed into tegra-mipi-cal.h.
> >
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paralle=
l camera
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
>
> I wanted to test this series on top of v7.0-rc1, but applying this patch
> fails (with b4 shazam). Can you rebase and send a new iteration?
>

kzalloc(sizeof(*mipidev), GFP_KERNEL) > kzalloc_obj(*mipidev)

> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

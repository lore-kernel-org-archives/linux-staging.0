Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23248377039
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439202; cv=pass; b=BhF6BB7l4NMjBWMSsrxbyHBXLvCOnUNPDI3QOhwyhApr4vmNjCE9fYte/ofbquI+qFHLg9LDGmaju/gTkkz6fU0e2s2PZGZz7Xdrxvo/XarTUrvhNQslwgjXLvGIWfDw8JxdfZ/B4RbefRA9hB77j6gaG9CpX7AKvck+GBYnGIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439202; c=relaxed/simple;
	bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4esxxocQXfNBf/f9IG/qAp4poijE/UfRX8csv1dsOGRPhIDhVNyE4XLtbIFfyF2s0YnZegi6Slm6mteTXlW+CZsOfI8qNodJWuXSsZA3wdJnGcTPDFf9dxf/iuEk+YzdgawmDQ9GwAA28Uz1hpffh4pkzyi2uqdhCAQ6NlhvPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RShcIPEh; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RShcIPEh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b78b638eso603739f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 00:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772439197; cv=none;
        d=google.com; s=arc-20240605;
        b=daNIWB+O37eP6azvEDi/uV43Ocr1hAcf4eD+GUQIbzAfhnioIYdFgiP22eYn5CgRSi
         Pij0eE4AFpnzrQB+SVsEYnrF2cl8vZd7mI7xVttkxvzF3RLE4P0sr6pGOv9Wn31qcvzm
         ROKnsR7JnAORHUSiia4DjAmPW3AWsse1/V+iq26tyYz0EHZHMVyB5BOBFlyIgiMtyEfY
         kamwKQEVtk2pEqQqZZxXnN2Mv3hq5B/l9eJbuxqD0X7GBGcQnYodeLBLReCn73k9DoRA
         Ryam/J1MTudzBtxdNTAsLEEVvJ4/LJLaTcs4ERfThO/K5obVwqpq4GpSksC3bDvIZP/A
         dClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        fh=XCznnu9ydCPFfHZulPA8pDd1XBzwfo0pk7xGSBMGjI0=;
        b=ER43umiu3np5bM/5L1q1P3baxzkS3CF9sxrugsg4VBkxbukwHsq2Sf3+UyQxwDAITN
         Rin9IAgKaDbS/SIUKwZXEWON8JYZ9LJA5x5dlj6X86UBi8wAStUnNKqAoW93MJ3/Y6nf
         PyJBHMcpu23/dsott121q34xSMbstNDCvymd3qE4fGEDCL6R2HLR7lysN16pKgKy+Vn0
         YLpmYzuTbKUNzKK1/LvqfL4VCFy6K6EUpyyBQmUsFpVfkQ5j0PqQokUfy39/QRSveB1U
         KpGWCXa7LhTwVzM+DxuG7XjHBVPEs1q2YJQlDlBUXtpMVANzTg8SH++yGAOXrZlrPFc8
         8Xyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772439197; x=1773043997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        b=RShcIPEhkMfhd+5n79PtTGw7XOvdIC7+tTVzztgugN3IRkHreZsYZtaRj4MH5FEqEY
         +5Ch/GdcBAVdYVp9a6Zpb9YW+5/hkJW4g4OJMx2YPcnDs4pPXAEtmC7IU9zxLaeQ3NXx
         /gsdTqVmL5fWfeXNqLmpiPx1u2/+0fYY+TSGY0HKtTa8TcuBAR4R2yZNQgyBVr2XOj04
         Fqk3mXZg9eGzs6ekDW7fChxhTwqzyVj1iSeoFcC1WkNTw51nAeVXcarjqP8pf0i7Rfav
         8usttaSIFuIzeyQ28XX0L4dauKQNvDAzzhDHMCiapUtR7KWhzkQgxSBvN3s/ME04HJj2
         V/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439197; x=1773043997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        b=BA8PcA2hyKGQOqidqM0nVKec5c+fP4nIv5n15/3Hg5Aq4MYF9C4xeaV5uiMEdK6Co1
         ZdzBCK5kRQ6uiXrpOv6dTDBowQwxlRR7WiUGoQ9BuKw72KbMG1eIlPXbhR45kiqLk6ke
         xTANNTgEcS+Rq3MNlOuR96rXoRZUx9z3jyRZRK40cgZrvmd67LOT2/5bUjGLqdqQMgHR
         +OaJInEVbOT+5SpU24lOaI7MYl948JCsxVRYq16JreJpE0V/CyxVDt2cxJIVuUNwEo8R
         YHeZUbT5pO+n2Dziuow6BoMQEI257csHHO+ghZGNNx3h/uN7IbxwgeE6Tz5XxLv5JPw/
         wtxA==
X-Forwarded-Encrypted: i=1; AJvYcCX0Jryk4NZ4gC8SpCMFcmnxvC/7IosvZ/S0TZKy3HJgaFR0Q/dXurjUCNNGfo7QiOEw7pr6B7IhnetpjKeO@lists.linux.dev
X-Gm-Message-State: AOJu0YxQAMQZZAcER+djrDdXtU8+7eEkApH8buVFpO/mHvripuItc9xA
	8IHhf3IWK5mkTjT7ZHKr5NEuTcs98lE06JdfSdYlX5uJkhELhBxNsYTrAydeQyFrtWw/XqBM/+O
	NTpUAbhF611VlmBtxFbjuJWhzUmLwO6E=
X-Gm-Gg: ATEYQzw9rob156JH0faoD0F7uIZQ4FCLu7JI8Ni7prfSdRtW4ikLMeqpY1/VBw5TkDD
	B/RDqycApqoKID+ODMN8FU6ZLxEhute2+wVt5+H8vPAA2Ub+G9GPHCPQ+SOPadPljdQU47SWO4Y
	+NlWeetH9fe4IPI7LSJjvTge7H8PalzraWBxs3nEOToKcMuYgHis0AEJ6arKYF7rpRptC0AYppd
	vA+wvrbYsI4PmZj88cqNYcRdZZ+Veh2oy6AJ+hFkxSzQAse6zuL3uXZ83kPwgg1lEiKzi9yQc10
	jiBctvSq
X-Received: by 2002:a05:6000:4011:b0:439:b922:8479 with SMTP id
 ffacd0b85a97d-439b92285dfmr2649252f8f.36.1772439197286; Mon, 02 Mar 2026
 00:13:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130124932.351328-1-clamor95@gmail.com> <20260130124932.351328-6-clamor95@gmail.com>
 <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com> <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
In-Reply-To: <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 10:13:06 +0200
X-Gm-Features: AaiRm513PJ2Vl3yAaZ9EK2Cx-_p8na7NMdLvn762xKViUHPZp6XfmHs_ZYNwew4
Message-ID: <CAPVz0n2rv3aey+7dVdtGeQfdgVpyMczp=RTKeg8V5SxNPr5-Xg@mail.gmail.com>
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

=D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:09 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:52 Lu=
ca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hello Svyatoslav,
> >
> > On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> > > Convert existing MIPI code to use operation function pointers, a nece=
ssary
> > > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configurati=
on
> > > that is SoC-independent remains in mipi.c, while all SoC-specific cod=
e is
> > > moved to tegra114-mipi.c (The naming matches the first SoC generation=
 with
> > > a dedicated calibration block). Shared structures and function calls =
are
> > > placed into tegra-mipi-cal.h.
> > >
> > > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paral=
lel camera
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> >
> > I wanted to test this series on top of v7.0-rc1, but applying this patc=
h
> > fails (with b4 shazam). Can you rebase and send a new iteration?
> >
>
> kzalloc(sizeof(*mipidev), GFP_KERNEL) > kzalloc_obj(*mipidev)
>

Hello Luca!

Thank you for still being interested in this endeavor. Sorry for such
a brief answer, I was very short on time. I have rebased changes on
top of v7.0 but ATM I still have a bit of time constrains and I have
to test them on my device. I will send rebased v7 ASAP.

Best regards,
Svyatoslav R.

> > Best regards,
> > Luca
> >
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

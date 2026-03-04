Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE853390993
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622415; cv=pass; b=Kwz+Yl3Xr0x90qy6f7twS4MLVNS9XMdZ6n9BahS4pjrR17vFy+qtJaT8uJjrWqgw6aQFR1JYDDA7s9i3LIougyYYdMhTYsyp/Mt3mWlo6I7eB/huI0WHO9GWkQVWfreGrhLOptglx9L8Oxbr9V12U6BC99NOBZoQXPSlf+hitUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622415; c=relaxed/simple;
	bh=2fkFTv0j2bW2/GT0WLhD5i89XhK2zX/tXK9CGn4Uwas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BW7GJ2TCyqz8eA24dQCXJkYMdNACUNbB3mW/gupVmw4uUjDYcsP3NzPeu/cQtjkXX4tFiMFwwVklYSOac4k4bidbD64AJiXbnK0JUi8XyApku6aldiG7hCv4lINNBFLedJF/gRQLZtjtZdc3ld1p9w4Akg0Uhh5oTjZ3qplQUsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KA+sJtqg; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KA+sJtqg"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65f812e0c83so12622207a12.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 03:06:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772622412; cv=none;
        d=google.com; s=arc-20240605;
        b=cXYUFANYIu4SkkeFB0BAy6DiIGC3t4uSYMcxNJuCw7uh7RTHiKTnYMf3rpx8+BkHeK
         r+OrIFxFOgqxryign+og0o6ySdCxgr8epEPw2CpXt/L9u5xpz8l6Ia29NJs2mBY9VvVC
         qFdWcvERN/Z5t7RkanFFen1DHgv/w+9+f1B9OQAOByKmDSnVPiiBY07q9/+6ME43k1rV
         kBrDVE7kntlzReZ1J/NUnaoisUquNUB28lSNLCPPJFGrqO/dD7x1hOVrdDdHzch1bzvz
         sZtKxitOGq4ogyzAmgUJutj/D+2XGyTbTDmUVuyr4rPiBrk8MfKOUEXFxbEu1sdGAjmA
         iB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2fkFTv0j2bW2/GT0WLhD5i89XhK2zX/tXK9CGn4Uwas=;
        fh=Udp4U2e/zLTzq/NqlI2w0VuAsJDeg/AXiAO+8jrh4xQ=;
        b=Nkh3fXK/c3HJ5NWwkAojWRYUvLap9u9Tb4sF0P28wgkuwYPgWhek7iFpRsaKJvZ55Z
         E45Otas+do88P7DddT1KyrAp4F8bP/GgYAzCUbQJKbzkXKDgpBm2qtnRB9k1xhqnxVcz
         iuoM3KN7sizd3JKxTdBDGYCaQgmxUX0GrWm13D/TFNq/czjPmhDf9yJujzu9bFWgCuvn
         h88kiT/vPVAmfMzMSyUN/kd7U5LX8//U8qw48Dbq9e5DDkWWzOKKdAtrV4uhn4b9qbnI
         51gOX1mZjD3/yn+L7SVs3ax/lqitvfghC/ZctpiWxThmqyIq9cA4XEWJtW49qGOekD9V
         0ICg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772622412; x=1773227212; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fkFTv0j2bW2/GT0WLhD5i89XhK2zX/tXK9CGn4Uwas=;
        b=KA+sJtqgoNEh/R7NcNgtTy3phM6m8GXH2GVBXf0pFeDXSKEPbQ2rR4o1/KvL7/LS6O
         CKC2V+h3NkKemdo+SeisF/qTwQT/hak8kzb5KklJedHea7/v1hUp4kXu5TnpEv9QZh+f
         +3Iegd0hZcgji5uYCxnL4zJT2rFUQfiImvakby1p/6gmTtEx+tkyEft1oSGd3YqQChnR
         ub+91objLtO3cPpgiiGKAc+YZnebPcKbgSJFD54m+Oj2fF1JjSkZIM6Oh3W0X32wDCmK
         dHrDGeKE502ALzRLFE4RkEGoYAuB4HNT0LvPzNTRJ+OWTsSs9qeKA0YeEEhrSECxwes8
         d6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622412; x=1773227212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2fkFTv0j2bW2/GT0WLhD5i89XhK2zX/tXK9CGn4Uwas=;
        b=O+Ig766DPi5iEY7FVcGIyMPaWIBlbD8BUrYefsqshRLQXOgo2q1LaUVBGq6Hn3oMUl
         kxIQswxu2eMYwa7hQVe2Z33FXXMfnvlVzQgYLuG4MgTJYZev51op+Hq+iDJ9uK2KJZJJ
         jX5SKVbjg12E9tiILNGWCP3/GcvnKiZ19G2GylgOpW7uT4jpMoNe1emS/MBvdMAWA8HJ
         KBmy1apomSN6Qd+WdPy0GW2BXYukUWjubSCBOt34c7xJXgWVnZlP0wuZmT9HRjGDZ6yA
         ufmSc0tNqFAdkf2nI7xyb92Yr4bPesJe9W4xfqk53b1AkJIFndRaTd2HE/t/GpX4c0VG
         iUgw==
X-Forwarded-Encrypted: i=1; AJvYcCWGTKMPvXx9c2rkOUsn98flvmGfQGp0ZUkReqeB3xNmg4Da/yrz8w5Ys2WGHXBIMCfF/xq3nT8CYc56jRF+@lists.linux.dev
X-Gm-Message-State: AOJu0YzCQhJSINGeajHzoJMamIVFtJwHz3jT0LGMgtS0IcajR9ICY+8O
	FYJmlWm61/dkvOvwdom8cBBbX2jIoi8U9RgHsd8X+mVOK67JHCj1Pk75Q0a8aDaa8dKryeSr+BH
	MKmxxMLRjF/IrkR3LwWSF70aIl59GR5Y=
X-Gm-Gg: ATEYQzx8C32KTACR3B6sR4kCLs+JugeZBKpYKsRT/cbMOOlS8q3y28OLhVRJvz9I6u6
	GJosLG12X4ByF1Jpgfffi/gflb52i0JNVuU+nnJEMy+P8lvJPsOWxgDPNvtAhLzMSh+igrqrSNz
	KlyBj4rRdu540wzhnGaFWyuC2ogqWwdGR/wpKw990exTpBvgk1udygYm7L2fu8LTtqjBpFlN+fI
	yz0SO9Vq1D0OwFkKSP3PBoiSseEDwSyVxem33lDWmPRnUOq0Acx5e6SK5Q24JNhaCfWfVHPmZIe
	epRo7gPoqJ8nLz5VNUZWLl+aSlYElCJK5h9eoJoDHntPrw2tcvsqkcVO1B/Sv/fbg2uAIv3WGnB
	2KpTqPkfCkq3+/5dd0A==
X-Received: by 2002:a17:907:3e18:b0:b8e:d4ed:5ee8 with SMTP id
 a640c23a62f3a-b93f11eb667mr103028166b.12.1772622411906; Wed, 04 Mar 2026
 03:06:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aaf9uQOBzCwQuff4@marchy>
In-Reply-To: <aaf9uQOBzCwQuff4@marchy>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Mar 2026 13:06:15 +0200
X-Gm-Features: AaiRm537Tqrc3m_d0DtxfH65gd9ff1kw56kzwnPZ5X9o-CIIf_MObBUVfO9E2pw
Message-ID: <CAHp75Vd0FqVJ0z8bsxZtArXRy+h8d7i1_XdUpu92GGuFwSGkPQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Update RA8875 Kconfig help description
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 11:39=E2=80=AFAM Adam Azuddin <azuddinadam@gmail.com=
> wrote:
>
> The current description is too brief. Update the description to
> include the manufacturer (RAiO) and the supported resolution
> (up to 800x480 pixels) to help users identify the correct driver.

While this is a good intention, I don't know if it's a good point at
the end as the idea is to have a proper driver to be located under
drivers/gpu/drm/.
Reviewed-by: Andy Shevchenko <andy@kernel.org>
in case Greg wants to take it.

--=20
With Best Regards,
Andy Shevchenko

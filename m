Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E2C395ADE
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150256; cv=pass; b=Borp5x/grbbPageO3upqviBDWcCrDztctWF27Ff0gjW5QXfM0n2htp55jekdoFUrJYd4CZBNmla6qVp3OsLlMetLAvs2VUfcH1MnFGx2N4n1JeKwmBppSJwULHFwmfjZHbUQKkFB7oqdhFNEArEiWnN/pJxjSdZbP1yKXkuGv+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150256; c=relaxed/simple;
	bh=TaI834qg6vT1ShXfJtq7GyeHB6LbsfVddYwRPQFFqBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fji/kP6R+D55jdlNftawxzO2hPIazh2jRbp0+F3f+n9iHWCWhAzKa+FeiZ1hAJOBCEKVzJS8UlA4qPm1O1nBFLqUIUgbCi0ENI7QIGiPc0RqzQVAIyebMSZ1dig/QajjD7ak+3HQWvTRwMI07JTDUdtl6AIg0TDm50RxlfIQkrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=ewg3sK8x; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="ewg3sK8x"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacf197759so18564845ad.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 00:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783150243; cv=none;
        d=google.com; s=arc-20260327;
        b=KzjGRioR6d9MdlDXJBiuMgBFzyMaTdS3+yO9eCZi9TpHds+Ol2+w1jzJQlI5xn3pl4
         5DgIdKQG7+hfWyqqVtobNgd6Z4LY1Y9z2Mi5ynUWeBQxm4omXzweyxmET1he005Ly/Sf
         hPv5clCGwC6toUqaqd/joNNjcYN7mfwx7Cg9POkjytEDBtG1HCC1aDSD0Ma1HFFL97XC
         TUndyzkPvl1ITh0T/RXbwGK/N+7p+Nwpp2i1//am1I7sxb6wL4S7BD1YGbyWum9CqWwI
         XsUv4Tj2ZxydHH4dYD7ePlPj4nxu/JAHyBzVvV4RSGJNALyvPRAubQoPIchPZJfxc6ij
         7FRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TaI834qg6vT1ShXfJtq7GyeHB6LbsfVddYwRPQFFqBo=;
        fh=6byxMfrkIm0JJWZdx491s3uXrxy3px6A5rjBuVwJoL8=;
        b=O2TXjSvc0r0Y72+O4zvw+o2leLqReKfkhrIVlC34TIKcSchulE4Y5v6qBSxPuA4tzh
         gV8rupUAuFDtuwIBgst4S4o8hCZC2G4wTvdsxHjF8O4dZ9dSyyGslp1AgwLmiP5JpA4M
         ogvZ3QaytH3y8jLVTeI8gXvmszeI5WEwKhNMxUK1w6JnRSV4nJYaYikJ9TcrVOzF4dcC
         BgvGFMAY09UnHf6usJTwDvFO8v1KZol3PfR5IXhjAlqtFXAxODoSwDptKl+Rn9FUuEtN
         ++XhJe+dOSk8tMQ0YEOTFMCPP8dmwKi6tqRVSRK3i4r7vuheXFWw1cQHNB4xUj2KAwQf
         HXmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783150242; x=1783755042; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaI834qg6vT1ShXfJtq7GyeHB6LbsfVddYwRPQFFqBo=;
        b=ewg3sK8xs86TSkVdLQMP3OAAveCRFLl0T/EV9EEdWeAOTUb7IftRhTL+QFuEid0u5s
         PCsbGgIB3aqAVz+zD58YHjcMymc08ApnKaiRA3iy12V8RsESmt6yw0BIG3+yN+tkFGEj
         CuBcN8vspwJVrlhrYpIfYy/8NCF6tmzD3nNNHW/78GuyJkghVjjg52WLmke636GK91ux
         h9d32F/XZG5s95lZVy7zqyL955QEqcqQQtjWifR+8OvDOAgEMd0DC6CG0J85rWnlK0ky
         PiyxYn7LShIk71nc/chBzZBxMS/MlFpDEACs4k9drc08EL5W1FJdVNLuVMzo4u5LGJte
         CNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150242; x=1783755042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TaI834qg6vT1ShXfJtq7GyeHB6LbsfVddYwRPQFFqBo=;
        b=Wfy5arBD469Un9nYjkJZ2M+yJMnqodjFe+IMF4NmsN4RFqp36BSOMpEhEcArOB5DMK
         GSiccq3qeR5MSkCIbtMB9WHwqSP8TA2wMTMFjSlYsmJ0/yJnOE/kIQRICvzMbH4Wer7W
         1ziaIZWgAq03GsYziIs5epRBgV82JrLfyKOSwU4VWdotHVHnQjHF7mtsdpSrsLu3SjGh
         xXosFFI6csCz/JJYQRTe1wac2J8f4s6wdTkIFLOLtQYCsQ7QXnR6foVfP692r8ze/iEb
         Y+afKwQae7xC38hfOI+lOpM+2oOhy6zlXL5TMKd1PVG0H/4MIlywsRKNN7lAyJCCWm9+
         qP/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqZn8Vo0kO2wt/iHxmv65qG29O9hrLB8Sil+yVaYKJGHTB6gKpaSOxVRafegfA0HCqSYpqroWaSaumz9LrG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6BD2eGlQHvoAAimUTZupQhUz/el5TVEbLsMC7iLmA8mmJze7H
	8DS0pHGvgE3Abv2e+i+xZj0z2gZvz/hbiTg1oR07hF4kKiQ/AF6dlSomxfpI/S/Vz5QmevanMz+
	dJluwfB6heS5wlsNgWf5+lc34ZiWLrZZI7mI1bNU15RA=
X-Gm-Gg: AfdE7ckwe3jsqmVqJ9Soio/2GE3VKrQ2+Nn9zA/enj5URzhAmqG2S638e8Y/3883AeS
	2hPTRNlDXkfo+s+mnNO3dq/5IW8+Uf58y3k/3ltK7iAWxOvfzCTd+aPcClZKiOSScBRotyQinCY
	17yt1l15YxaF1fmDI9oy5BbzKrNqkvqqf0zwpveWRCbQhuyOQXm5hpTewKp2Orp3VEJ5SXAcgwQ
	rFHOSITlmvP0rkpWt5oegZjncv/hyvFqDwJ2L8OpikZXcyuTkUFCbEtOfRDvwADLAtF8uNVAEQV
	dm2lOTWdB42OL7Bo3ojuPdlYkJNNc3t1MLv8NcBrllfB9AL/meZJWSmK
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2098 with SMTP id
 d9443c01a7336-2cbb9f008dcmr25071165ad.44.1783150242558; Sat, 04 Jul 2026
 00:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260627100119.97650-1-doruk@0sec.ai> <akKdPGsvsMRqE1Hy@ashevche-desk.local>
In-Reply-To: <akKdPGsvsMRqE1Hy@ashevche-desk.local>
From: "Doruk (0sec)" <doruk@0sec.ai>
Date: Sat, 4 Jul 2026 09:30:31 +0200
X-Gm-Features: AVVi8CfO6oXWzOfpwRE_kh_3BfW4G37b8_Hvk6wT7-UtjQBZMaAtl0wGMrjyt-s
Message-ID: <CAPdMp1pipVZqU2RkBWA0E_h4tESOzdHeC1Bc6zeTEo3vzY9j5A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] media: atomisp: validate user-supplied buffer
 sizes in two ioctl paths
To: andriy.shevchenko@intel.com
Cc: hansg@kernel.org, andy@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, error27@gmail.com, sakari.ailus@linux.intel.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 29, 2026 at 06:28:44PM +0200, Andy Shevchenko wrote:
> This makes these patches low priority. Why do we need to spend time on
> them at all? Nobody knows right now how the revival of the mentioned
> private IOCTLs will look like. I'm pretty sure it will be some generic
> ones that this code should morph to. Since it looks like your tool is
> useful, can you check the rest and reachable parts of the driver first?

Fair point, I'll drop this series and point it to the
reachable parts of the driver (and the wider media stack) instead.

Appreciate the review.
Doruk




On Mon, 29 Jun 2026 at 18:28, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sat, Jun 27, 2026 at 12:01:17PM +0200, Doruk Tan Ozturk wrote:
> > Two ioctl paths in the Intel AtomISP staging driver share the same
> > defect class: one user-controlled field sizes the destination buffer
> > while a separate user-controlled field sizes the copy/store, with no
> > cross-validation between them, so the store can overflow the allocation
> > with attacker-controlled length (and contents).
> >
> > Patch 1 (framebuffer-to-CSS, FPN / S_ISP_FPN_TABLE path) bounds
> > arg->fmt.sizeimage to the frame allocated from width/height/format.
> >
> > Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
> > width/height dimensions to the stream-grid-sized destination config in
> > both the ISP2401 and ISP2400 branches.
>
> > Reachability caveat: both paths are private ioctls, and private ioctls
> > are currently disabled by 2b7eb2c5dc72 ("staging: media: atomisp:
> > Disallow all private IOCTLs") -- atomisp_vidioc_default() returns
> > -EINVAL for any non-zero cmd before the dispatch switch -- so neither is
> > reachable from userspace today. These are hardening of the
> > disabled-but-revivable private-ioctl paths rather than a live overflow.
>
> This makes these patches low priority. Why do we need to spend time on them
> at all? Nobody knows right now how the revival of the mentioned private IOCTLs
> will look like. I'm pretty sure it will be some generic ones that this code
> should morph to. Since it looks like your tool is useful, can you check the
> rest and reachable parts of the driver first?
>
> > Both were found by 0sec's autonomous vulnerability analysis
> > (https://0sec.ai) via static analysis; neither is runtime-reproduced
> > (Intel Baytrail/Cherrytrail ISP hardware required).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

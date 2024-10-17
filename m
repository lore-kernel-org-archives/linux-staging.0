Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F189F1D90C5
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157221; cv=none; b=hTOedoeR+AR1VSET+U5XYK6/J28RTQG3c0g0uWmvyF1cmIT+wXJdyiPnnPQtxLfrW9i4wnsmD/STwgimgWhbp9bHi0oWxDQU7VxdzIzMzkV2b7N4I0Oq+OEHUIxDuakLBC5Co4ljrnx2ebCSVpaa7yuFajza43gpDO5lEZ2KhX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157221; c=relaxed/simple;
	bh=t3KxzpM4k3PmUVr58LWHbzeL/RQDf+IDCWW4NsX0sp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8ZkYELSLuREt0M20Hh1q3yP319AvXL/Aeid0/kYS4aElHvQb9V4eaP2+37aj+WMrYRFq7l5dcxUrdRnlTVnhgZIf0isBo6FqK8XENfy5nv25Jtg53Areyo2l9TSgmFjHAbkaX+ZiLhRPI/L9rFEzsX/X/IpL4Y8JgsLaqWYqE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=YMgEY+O1; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="YMgEY+O1"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so787065a12.3
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729157216; x=1729762016; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEgrYIi7WzE12AwX8CZbYs+MlkznNlBl+g/tYuRmHxE=;
        b=YMgEY+O1YLZ/viO1QIuXFbeG5ODCqVk05q0vSDmsTyFt6q8xyTq/dnTyBCuslokjVR
         /ureP8Dlz5AHeolhuJLDBBAAji8pLYZl7PskNoWFrvpGe5ZzGPeFnxFUmH0d79bEiizC
         r6tUcciIsKoOkp3mdq1vPrJ3jAl2xLgcfOy61EYCUAlcrd3lPyt9jwyBY6BLTOIirzg9
         Xy+74pMFOJqCIgSrWfai6tLorJDKnnDXZh2KY6CQ5TTHocQKyP+BXsyetiJbaro89Wur
         afmzSLv5NRhunEd+NNuktVlojEf/m8EbtBj5iO5Zdb67YQaw/HzHRlMBXfEPCdiW9SHg
         uzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157216; x=1729762016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEgrYIi7WzE12AwX8CZbYs+MlkznNlBl+g/tYuRmHxE=;
        b=NuLbmUE26wGwVh6iLURtYkMR5RqKoqvvWPXL8SNaeMIraYz/OXe/axc01ME0HSNmIH
         R4PhcC6SqjFV5A1/unz6v+jjED1UxghNxx3e+lpp9VLBZzPtUArD/ORBw/mdNFrji09J
         hQXi7HUyyRP3SgJ4nPq+yoRp5XlWvDcvEpifXsVMqyccipFHpnWkLeAv3tZDQm64yovb
         CvfRcFji3v6Q+ahW4mdq+FTFKiuDy6Zn6XXLGVjAYnYLK7WSLSXZ+BiS6wfPWyKCLYd/
         2RRdHWz5f5owyK+EO/W3KCiqYeJtl+gDKxui600fRIqY7biWw4RTjzQfNQHV60D3dcS3
         6czg==
X-Forwarded-Encrypted: i=1; AJvYcCV9oWyVCEKhZMaNI/tG0LGwq/CuwXlFkqTejuOHyyH9wsWQ8RE9j0M3c4RpSdCOstfgdyRto6qq55m3Aqq8@lists.linux.dev
X-Gm-Message-State: AOJu0YzJqXUFE3e1piBij4/gZTA9kFi10OfoO20iHKKrwysZN5od6Wfv
	bvYu1S7LfYLfomw4n/7khqjTh+KC6+YLIdkUEt/N6z8tc/gzSzqQyWTsCeLLdfzdZPj3ehOJpzq
	Ronv9kbdrv2ZXOEJD+0cviHeZfyXKpBD5KgzyBg==
X-Google-Smtp-Source: AGHT+IHjeELE9g350Z5J7d23ep+p8aXewpY15v8XcW5jGHiKOgM7beZeK0j94PyEO8YwBr64YtJfcwCRFgDO7j1z5r0=
X-Received: by 2002:a05:6402:3510:b0:5c9:8964:bb5f with SMTP id
 4fb4d7f45d1cf-5c99518e7afmr5286213a12.23.1729157216019; Thu, 17 Oct 2024
 02:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017082022.16874-1-everestkc@everestkc.com.np> <85cb4aba-60ca-4fea-8d1c-dd01578357b5@stanley.mountain>
In-Reply-To: <85cb4aba-60ca-4fea-8d1c-dd01578357b5@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Thu, 17 Oct 2024 03:26:44 -0600
Message-ID: <CAEO-vhGhjX27YUkvue7dc1tn_k1wXDT7nv4kn=+zrcK=1j-yZw@mail.gmail.com>
Subject: Re: [PATCH] staging: gpib: Change return type and error code of fluke_get_dma_residue
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, skhan@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 3:01=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Thu, Oct 17, 2024 at 02:20:22AM -0600, Everest K.C. wrote:
> > fluke_get_dma_residue() returns unsigned int with -1 as error code.
> > This error cannot be caught.
> > Fix this by changing the return type of the function to int and
> > returning the error code, that was captured.
> >
> > Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB dri=
ver")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
>
> So like quite often we would merge a patch like this, because there's not=
hing
> wrong with it and why not?  It's a step in the right direction.  But actu=
ally
> in this case could you fix the caller as well?
I feel so dumb that I missed it. V2 is on the way.
> Do it all in the same patch.  It's the one *whole* thing per patch rule.
Noted.
> regards,
> dan carpenter
>
Thanks,
Everest K.C.

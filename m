Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E653D332C
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898288; cv=pass; b=DbQJ4KNC+/xVetFzbQBj4xj6Xjcsz96nRaDGVGlhtQ50qzlk34XcAjNsmJjuneMpQWyI2+8isxvFBIaAGJf1H8U3M2217uSLexrtFQVUg5T10yRTcTSE3XjHCgD+RxqIHIszbDGcioQGl2vRfUcdvjrnNE3RCC1SYazl7XOzPa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898288; c=relaxed/simple;
	bh=FfqqxcPTcirgaqci39qUR5yKEhO3JjMgLQYRf2/CQ/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozOPuVWu73OHQX2zssmPt5pgDuIQKrYGFnt0089+UVMzjvcbCT4amORtl4/y1QkX+Gxdkn9EeAPdKuSEABVC9IL/XZHFFTO5E8Dbu0CEtx81yh5kVschpcY2PfWxcdnxIrIOZ7cnPX3JRVF5GP9XFPfB+rPZ0L5gPANV5mW1RrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfHm1Jfj; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfHm1Jfj"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c0bda7f15so3909286d50.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 05:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777898286; cv=none;
        d=google.com; s=arc-20240605;
        b=NOiAeAXBjVaO0g2gOK6UShXuRgYao/NshaqKKHu44OiOoslIAAa96OQ1NZwYQIJp1U
         nQHB/ccdhGWpTOcD4qY0afTIKT+RpnK8I/x4sP8RCr8a/5R4S3zl05HbfFoFnYSh7/N+
         Ik90TnkEbQAyr/a7UPxdEd3cot/vYaunFi2f7yYBwgeX1jetjhvADFQoOAIEhAk2gECv
         brrI8aNOje8H/aYipd94UJA1sTf6tBucHFC6ZOQXxQJKDQY9I7JBiim5gPKnFado3ygr
         UwRZi7gPEaKUFug8M3Hy51dWVoBtMaoEV+pzQDoZ6sJiXLIrAyiy++KyYmeWjJ9YaizE
         zCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C0QLzfdsy/762jJnx6qDN465oqLLc9myxsCHCvlD1PA=;
        fh=yzMGwytxAIMiJVJUgzWP3oX0O1JjRLJhFEuBRpb5cS8=;
        b=MjoRQ0gPabUi0iWG5ZPHpHVHHCqYwZZnZfOUK7U8Gx1qd/+w1ktOTTtHMHBUOiRIzs
         a2JZZr8UHCowsIwoaxHm/sbw0o2pFPtyDfWeU/8JpJlVW2L55zrSuFjr6/IycDMN+5pT
         sZdhMjkz5kNxiBqYDxiDOaloteT+3GZXA2tyt9xg3osz3l2Yz9L1cns+9JhgVgZeHrGj
         APyovUtrx44kjD/FqeDa0ZgiA+pyg8eIWaCtunTEJH20TNj5FMJgO6tiZKdN4ZduqZJs
         CxeNSMr+GqH8JF9Xv7sx/pW0Keu8f/7ibxZIJsBMk+fFPGdJo2DYbfEy4G6pX0a7r50P
         dtCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898286; x=1778503086; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0QLzfdsy/762jJnx6qDN465oqLLc9myxsCHCvlD1PA=;
        b=FfHm1JfjQyY/v++hVuHgDoZuCq4todUeQ06hu7WSCIzRPfkuJZd0sApAdkWOjWwzrA
         OzhM5thVClwWr41b5EUltBP9CdgU3sY9jBj/xA+zR3tKHuwoTbwuQtdD1fD+yQ6pPbyx
         S+ZZ4wpxv6PtBCd22Qc4qdwdoT+huio4Pha87i0rJn27lJ1LNWD8HGJGX9ApkcPf18BE
         YCcHSxBhBH4Nf80o906cR4BsQuevwGdpVUh6pwW8eZyxQosdJee5TIRU6oJZePHRyo+y
         i21/Hyr18cT/9v//iZQ3AZDgOl0l9bcLtlFuEEdKb4D7W9qrkVDmXUhaZSzbnc15fkPN
         nsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898286; x=1778503086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0QLzfdsy/762jJnx6qDN465oqLLc9myxsCHCvlD1PA=;
        b=ESQLtUE/EC9kE4K/b7qhtkgKNfbxmruDRt+SyRprmohID5b0BnVQOQK4TZiRRwty1v
         nL7Nj0Hp6rhIV+0Chkj6J0Gk+P3o/h10xvCL49Jch44Je+nA6Fy300Ov5kPjj7v/p38c
         Lmpj8fz4arxW/9aSc/pTMob/Ish5WW0h+SG2uus11xDpVjoKq3vKi8RDDSUaAgkDQjMq
         WDgvDfc8JnB5l3ZxKew/LP+iTCVi69QhT0Qx7TV2LKrHd2gMifrkJ8cjDr2qkLKw7vnN
         okBstHTrnh48Pyy3GX4fCVAXHENZYfPcHC0XCSDcEo/k5WYa/ZEuhd2yBp2tc/yea52o
         yDuw==
X-Forwarded-Encrypted: i=1; AFNElJ/SjDm9hy5wCg1buVhRcBgiWRa5yTl3CUkmiFDGFOHR07RlvsvBDq6qqYKU8Sqg7MH6ccWoALiZHlnEcuKU@lists.linux.dev
X-Gm-Message-State: AOJu0YySw4/gAc4ubEG18i8DcPPTXuR6kq6LY0xJqzf6xJRR+kYM4yIw
	NxSmi11QGxC2521n+XY5UgnRfoHR3wPpzaksMx0yTEAAonUi2Ypao+X/2TmL7CjpPlgeJtCTTvd
	y+oZKJaHBlevmNzZepshmWV7tgOECgo4=
X-Gm-Gg: AeBDietNU/8CmYQ9Fo2xyPhAOBeADrZo32llNSjvCAUXVnJISEps6ZqD6NO4rqx1Zy6
	YADWFVluAFHcn2MvencHS33kGh0XVvOAyAJnB5CgfVYJwAzCojbkbtxLjzp3jcYlN22UDFutcRW
	oyTpUcflNfnYbGeVC7HbvwElITvQuOUFRMLAuY04uBsMj3h3Zj3XKAubDbC+dhVR2g6KQvQG0aW
	rkjrU688XZKw6KcGR/ltAcc/hE1c3vqbjxL9p32LzUXGa1gH4pwx+eyoGiE31+afqPCasRUhrM4
	fg8UNN8geBemwpC15u+1YZmHtQ==
X-Received: by 2002:a05:690e:4185:b0:65c:31e7:befe with SMTP id
 956f58d0204a3-65c3d9d2800mr8774419d50.2.1777898286096; Mon, 04 May 2026
 05:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504092059.1536094-1-angusg778@gmail.com> <20260504092059.1536094-2-angusg778@gmail.com>
In-Reply-To: <20260504092059.1536094-2-angusg778@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 07:37:54 -0500
X-Gm-Features: AVHnY4Lg-0PUmoelN9gi__VRkfiIwUkZdhPRMm4chQjF0h3N1NHgT8Rji-PnYMQ
Message-ID: <CAKqfh0GstbGF5VS_4BCUAyu2rDoXMWpcDwMOsL06EYVrQ1B7RQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: iio: ad9834: simplify -ENOMEM return in probe
To: Angus Gardner <angusg778@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	Michael.Hennerich@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 4:22=E2=80=AFAM Angus Gardner <angusg778@gmail.com> =
wrote:
>
> devm_iio_device_alloc() failure returns -ENOMEM via a local variable
> unnecessarily. Return -ENOMEM directly instead.
>
> Signed-off-by: Angus Gardner <angusg778@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9834.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
[snip]

Looks good to me.
Reviewed-by: Maxwell Doose <m32285159@gmail.com>

best regards,
maxwell

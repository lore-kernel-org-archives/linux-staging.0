Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC50D255255;
	Wed,  9 Apr 2025 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197742; cv=none; b=iOBflwaH7x4DogtIpAxzTTRP0IiudR0lo32THN9tSSbq9BEbxCD3zQ995GMUYrG8ncf7yPrVelgO7fh02McLHmlJgOQG7J6Eg9nqMlxgAIi2n7AziYi3lA9gPEMD/wkvTto8l44OViMelxm+khw9RhgzyOX5q9RDwhOsyAC66CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197742; c=relaxed/simple;
	bh=B+7bvO3lKFW0aylYPgYmk7X3zfx0r63tAkXBwA//5UE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kvuKDMz47nullfibuJWX1mn/TAWAzlIXnw+pRHArg9vlD91IIBWHTQopPj5UEZtLVct7btrTlH6UQ74FJ3LKRTgzpGUbMHtgxPwOkbu+eMKMw6ZUe0xt1tOQvIIMnxeAyEZhPU0ayc+qsGhjtIhntjoBZj/5XrAZh7MRmto16vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elRZHOxn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elRZHOxn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39149bccb69so6232486f8f.2;
        Wed, 09 Apr 2025 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744197739; x=1744802539; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XNIF4tYvlT4HtlqHyWvypv696ndc9VfNTquhjpGjigo=;
        b=elRZHOxnnlentJ37lke1/ypM7miHROiXqIvwM/z581MTjQUqA9GnqHXL3ye/wzIhA7
         fStz3KcRljnIZHheR7CCqKmiUJcdTzHq1PBpkbihbJs0oXlipfVIjskq6yiqmziP/qXj
         7GSVVNSaXYzk8klnFySrA+9MrnBiAZNigV9Ni0Usik3lNnZeS76a7GT+mlS5bfuuOeBD
         sIu1U4mbHnXkgjCXIZA6oP4iXwxYByfW/tqx+i13tbg0Qn3Wr3brtNh75lJti2QxnZTr
         lwKOsm8M2cDoq3OsHd/FVGjuRnwChA6A99+43pRvq1nXYN+4GE7ilN65VrVxDrvwPDjB
         S6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197739; x=1744802539;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNIF4tYvlT4HtlqHyWvypv696ndc9VfNTquhjpGjigo=;
        b=rTGz0qm51NzMrlQRcUkE3B2bOYegFq0AG9iUW0S9IHPHEkCpBATcdQlJegnv5l4rKi
         H9PZJOLJ7LOUIUdRbUIjUAF+FFQ78A0Y3kUJL+KHwRv/zLEIWwTb2+io3WyXxktuBTLF
         WfakEU7uV/DfCQx+8TcwWPxdxlLqHVP8+12h9zPMbE+8jQkIumhvk2EevXPq/UCHXWxN
         piQacaUh3RGd8EyEup/h5G61SQnemsq74PvuN1LYrnohpVN8Y6mvVIp9jTNC5AFnHqvc
         Bgj8FVgViTAEb1lC/RpwLjGdNSf9d87oGUmhSLfTIQ01VXBhMkJMtcbs06EycBj8/Iax
         ndRw==
X-Forwarded-Encrypted: i=1; AJvYcCV1qE7SJh1wZpjeQwwpYgqgCeFWrOpOgLxRZGypZgP4nzGlWk0Da5kt/dIJ8BmUqhwpwVMTRrnMgtGa@lists.linux.dev, AJvYcCWMl0kRiZ8aMGBhGfC3BypLceiHFHF4BKByRy0C9zgWb1/FZ1RTpVO/LQCstihRKF5E17swkSkNRmskLtxV@lists.linux.dev
X-Gm-Message-State: AOJu0YyeBuISse4S67zSCHXqizDUpXemDpYK9PDLXGXupU7kyA6GI8rx
	/8zN6AgJ3xS9SdDAQWQ0T8vwWYQzsFEHAmzv1e1uJ4B2JuDVth5Z
X-Gm-Gg: ASbGncuLnoFsAXx+fgT1J1dDBK4y+3YRchsNZjzQGBKJ15o2ept5/yA0urmMRmLT61J
	gGxTXDISzj6+oJ3t/KRd0DLJwlZKLYr0CrV259pf7pto0zX+K34tX3GEVt8jn3f88xqvti79N+g
	93pDnyJ8y5MBORQp5nSJIPQUSeTS0ijYQdzZlsDkkRzyx9/lyzrJygPD640ZjNio3wb9guBEf3O
	gO5zcx2uJICOFrrrvF1hyYn0q3FhZ9OhEpmOTf+H5m6KZwiMrSA/L+0GhdMMQ/jLrBqORAMsk1C
	syfWPCvfcYocJvNDKJ8eRVltbaeRQ7PMRSKTCATUPMe71kvHTk4=
X-Google-Smtp-Source: AGHT+IGZsN4H73Ax2Gfnh0e8fMsPZGwpetqpePrvoTb4VCAuqX0OWTeXNXYhkOf299IK2Z5tkz2b4Q==
X-Received: by 2002:a05:6000:40c9:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-39d87cdc2c1mr2226345f8f.51.1744197738762;
        Wed, 09 Apr 2025 04:22:18 -0700 (PDT)
Received: from [172.16.8.120] ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89361290sm1367992f8f.17.2025.04.09.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:22:18 -0700 (PDT)
Message-ID: <9dd38b27ac15fe9d76e326e4f4c05d71a18b2154.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: Improve code readability
From: Erick Karanja <karanja99erick@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Julia Lawall
	 <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 09 Apr 2025 14:22:14 +0300
In-Reply-To: <22a2c8a7-9669-40bd-b886-713833de5cc4@stanley.mountain>
References: <cover.1744192642.git.karanja99erick@gmail.com>
	 <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>
	 <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>
	 <22a2c8a7-9669-40bd-b886-713833de5cc4@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-04-09 at 14:11 +0300, Dan Carpenter wrote:
> On Wed, Apr 09, 2025 at 07:04:18AM -0400, Julia Lawall wrote:
> > > @@ -729,10 +721,9 @@ static void hal_ReadEFuse_WiFi(
> > > =C2=A0		}
> > >=20
> > > =C2=A0		if (offset < EFUSE_MAX_SECTION_8723B) {
> > > -			u16 addr;
> > > +			u16 addr =3D offset * PGPKT_DATA_SIZE;
> > > =C2=A0			/*=C2=A0 Get word enable value from PG header
> > > */
> > >=20
> > > -			addr =3D offset * PGPKT_DATA_SIZE;
> >=20
> > I'm not sure about this one, due to the comment.
> >=20
> > julia
> >=20
>=20
> I feel like it works.=C2=A0 I wish there were a blank line after the
> declaration but that's something for a different patch.=C2=A0 Both of
> these are okay with me.=C2=A0 Try to be more creative with the subjects
> next time.=C2=A0 (Just put the file name in the subject because that's
> the only difference).
Thank you for the review.
Erick
>=20
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>=20
> regards,
> dan carpenter
>=20


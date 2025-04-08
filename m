Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F6822A814
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142191; cv=none; b=uD9HoxhuTMlFr4b/hTxQFq5lauRYRpEd3ppdNKax4mlRVNcAkzfZDyeYPoysERql1Cq7WgeoASaK7/8mm0VubHu4DskqXpcPmYc7Xm3JTmE29e5EKSdUqU4dGDV3l0mapaXvCWTbBoqDHJZyasp6J/ImcEZwGjGw+uyMgvAXvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142191; c=relaxed/simple;
	bh=qjwrFyqSZiIBplQuQi4BEbeIde22oGa7JC/EofrU9aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4cd+U9sWBBQgtkMa8xsfGLNup105OensLJ71LFTlZTP9uEmytMmq7zzrXdT5d37aLwc853ABUNqEhvVheyovEc44MUqNcDvsJTqWBy2DdU9ehx/l5IBUv22ezXkFv1CZ3hZ7uXM7giXmWUCZkeNH4DfycwiDBL6sgvGhyCltjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2bb8chM; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2bb8chM"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6fee50bfea5so49808477b3.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142188; x=1744746988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6cDbUybM1KG7HZRBqaHKVMVEzJc7+qySRY9tjTb2U4=;
        b=c2bb8chMmk2dj8n4QJ4XWugiogn5Jc7OAwn5q3QnVdvCpRHmAwOGGwFsqC5NctkFd/
         PfbvqLFQKGfR7bGdRrz7VSIbWtLrUc/ncX42q5RK5iCMdm/wzHJp8Lla4Jv1s0Wkr6iv
         N2mYY/V7md5Vm6GqzbgeFbulZjNIPXTGigcE8fU8abivScQaMsq54HfB+uL5167vGid7
         ta2COfSzNZ27t5ml1qAuva2bY+wXBZ1Z+fyDVf7ZURt5QkrZ7xqtT99yO2wABsoHs7ci
         vGcHZzE5LiUvZN4mynOuXEx8eNNkFO13TYX1Xv7EPAJkd+R/eDB/u+1GpHbUZtxRcvec
         ASQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142188; x=1744746988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6cDbUybM1KG7HZRBqaHKVMVEzJc7+qySRY9tjTb2U4=;
        b=cZWjRuoYUxZcFSyEbYHzpR8V3cn3Fe3W+2/HSSBTgKET2gH2Q27/7muFc18j+Nsd1d
         5uj4IMkQgO1nBkFwZSycL4vpbmwgI2Xw1v3jxkiVyom8zQ5iKxfkUuQ2SzSceVFkhUW/
         BjF+DgmUXE/BW7lEJVE4Hq/AaYS/0opFNxtOQtJRBD1E6zQ2DMZN5xoCor6nFi1HvDJz
         qC2MycCv9sZOo3h0Db0kwE8fWS7/meMPmAnEVV1nbK62COqxxhg4VctBlwZh9GBfwjQ5
         D1TvHMZN+MnjBPfqNl6SXEcRWf38GVnJXI7DbOO+sWYUb27Rautb0afJaBenwkmyjeR4
         zCpw==
X-Forwarded-Encrypted: i=1; AJvYcCVUXXekMI1T/0pRrcUlqcUrbarNVH5l6nyGxFuVTaSd1qjOCUZXZMlknIuv/5Abp5E7ZG5nolo7nW6qfHEr@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+ofCUb8ZmPly+MjIZVd4JStJds+0UdH41z5+CGe0WjhAyCE4w
	34Egt5ZTEuexbs57az4+E9R9nt0d3iLuNlEkGdypUN0A+x8Ac2ml1P3qpWHwzl2ueSdk5FiRrQL
	4cnL8/zqRis/rDXBZ8scHX3sfqxE=
X-Gm-Gg: ASbGncu4lg4XR+N8Tw3auL1deveKRyqsUDqtWcEP0nYhjppJ3CsBdQVtFyz+K79yRlh
	tveUdF7s6HpBCwZyQtSV48GE8WkI+ONmMfJ8Nye5gS3c2n4c2tfZHZLcTGmo2l7Ph/rI7jgGSEp
	Z/G1x8hUyMZ/anT/CTuaqgnbwVXXWzFKXi3WNIda1qjU5DKKoChwIxpsGZs/M=
X-Google-Smtp-Source: AGHT+IH0R09ialjzR7tBCVZSJpPb1eM5DyxBf37vmd2V9TKgBmQHBgF2t7u9Ira6Et6V2dHcNRqnHToxvM78YRXL21w=
X-Received: by 2002:a05:6902:2381:b0:e6d:e429:1d70 with SMTP id
 3f1490d57ef6-e702f5c7df7mr29068276.12.1744142188598; Tue, 08 Apr 2025
 12:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250330135402.105418-1-simeddon@gmail.com> <20250330152044.18cf81f6@jic23-huawei>
In-Reply-To: <20250330152044.18cf81f6@jic23-huawei>
From: Siddharth Menon <simeddon@gmail.com>
Date: Wed, 9 Apr 2025 01:25:52 +0530
X-Gm-Features: ATxdqUH9sgSrCRUYQW9CwHIhT1t8pCayapMz7lxbogfE6j6N7Se-rKUcJD9Z6HA
Message-ID: <CAGd6pzP470VDxGoP4e_2hVXsKrJhnhbv-WgFzCq7tMX9RjOLwg@mail.gmail.com>
Subject: Re: [PATCH v5] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, 
	Michael.Hennerich@analog.com, lars@metafoo.de, marcelo.schmitt1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 30 Mar 2025 at 19:50, Jonathan Cameron <jic23@kernel.org> wrote:
> > +     for (int i =3D 0; i < ARRAY_SIZE(regval_bytes); i++) {
> > +             freq_cmd =3D (i % 2 =3D=3D 0) ? AD9832_CMD_FRE8BITSW : AD=
9832_CMD_FRE16BITSW;
> > +
> > +             st->freq_data[i] =3D cpu_to_be16(FIELD_PREP(AD9832_CMD_MS=
K, freq_cmd) |
> > +                     FIELD_PREP(AD9832_ADD_MSK, addr - i) |
> > +                     FIELD_PREP(AD9832_DAT_MSK, regval_bytes[i]));
> Looking at the data layout here, this seems like an interesting dance to =
fill two unrelated
> u8 values - it's not a be16 at all.
>
> I'd be tempted to split the freq_data into u8s and then you will just hav=
e
>                 st->freq_data[i][0] =3D FIELD_PREP(AD9832_CMD_MSK, freq_c=
md) |
>                                       FIELD_PREP(AD9832_ADD_SMK, addr - i=
);
> //with masks adjusted appropriately.
>                 st->freq_data[i][1] =3D regval_bytes[i];
>

Hello Jonathan,

I briefly went through the datasheet for the device.
From what I understand, the device is expecting 16 bit write operations whe=
re:
- First 4 bits: Operation type (frequency/phase)
- Next 4 bits: Destination register address
- Last 8 bits: Data
so these fields would need to be combined into a single 16-bit value regard=
less.

As I am unable to procure a testing unit at this time, I=E2=80=99m hesitant=
 to make
changes that could unintentionally break the existing driver.

Would it be acceptable to limit the scope of this patch to introducing
bitfield macros and addressing the remaining feedback?

Regards,
Siddharth Menon

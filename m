Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEA9396D24
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066096; cv=pass; b=qV9VGY4L0JGlEWjGSPgj3xd4fiyeljyI9nfI7oMQ5tNzJ5n8mPbdo2bCPcRF2iTBJ4mYU/RePZ63nbKUBKtuXyT9I8D6eevg4Kb2o2yNPtRmFHkoeDMBXK7QfnkCeLQr2eRjWJV9YfOiVs699a5vueEqny2wjUOCzGH3h9S/0jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066096; c=relaxed/simple;
	bh=frLCNGyhruHajehA2tRK+zfH+CEyqy5ChitPWJULUcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeyBtWr6kPHARuom7NmoN4hJF7M3+J+8oIllbKDpw3gGUp3zK1TP0FyvbpIQnZIh/wMyelldbT/aVwNnK1izv3/1LwUpFGGyLyMk2QICFvRV/8OQYGQ+BHXnfOvP8xX/2ku2RcglfdwzsW1kUwuQixewLP3GKcvDEEhm8Um8tGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=or6Wz8uI; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="or6Wz8uI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c04152730so618937266b.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776066093; cv=none;
        d=google.com; s=arc-20240605;
        b=Z7feg/bxjCbjxQ+ijKFvpNd1JmnOIS5ziqrTCdc1uvKwAO6zJbTF/EJLrOQ6AWiWj+
         HnA3diLdJgiYSS59xAq4veyKrbXPb+tHHCj3J5LcjEpnivNKomDnIdAcb2Ip/6vhMIVN
         199DR6I5XT8PjmJngWTtSxQ00NBDY7N6A/hmbd89fiyi2UDkVV9BHe0e5k8e+RzXRkCU
         QDqfz0bDhAHVCP3YWG3sLHpFvA2hCsawwHKfbvL2vJy78UCNbtehZmOYOjR7VbNqunOd
         ws9aNtVmfxCMkSGBINpWysq48OYeyljztXYqLi6YtHALbsBYRUY0zXch0vO/cJhbxVeX
         HTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJ2wg8gTbB5vb5wi/9vxh5q5ilM1n2u/1JsWPDvfIwk=;
        fh=qG+egJKH0gV7UHGQqRy1tY6TCPo9HwPUO2BnTonEWvw=;
        b=iv9Z/a8i5/CoPlmxdeMv457a+LEOZseqnD5MRm/X5ktxvin15g4PqV/l+0lTM20GGB
         vYeGQBrA4DAuwsOZ/509388UN9KB3HulWEStztIHeocGIX4dzlDaafCr8OID6i9j6abr
         r7waj0o6HZq7w+EB0tHGgi1nk6zbxJLyAUVyZuA2j4BUaVenHF6BIsC2D572aGtVsnnc
         tt+V8s/ASLuWCyS4yzzXJj/sqz7JgBfovWcCuXxnq0YYCybfVkIVOH4sy7FEbR0hoonI
         +2YK3Z+CNgkY4dT3udwLepqW9HZTC6wt6mSkS5UNHfCAaz7I+8hhvORvN1RN6jRG/CZs
         Sb8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066093; x=1776670893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ2wg8gTbB5vb5wi/9vxh5q5ilM1n2u/1JsWPDvfIwk=;
        b=or6Wz8uINysPWZ+jap3q6vHs3z1Gjp09KPHToKBQN5+hobrASR1/FWtNJqbTE5ygkh
         dQgk8OUqUN+rRhprdkQu/Poc3lj0pbJK+9M65yoes85+FtLII6W4hRl3o+NyTytiuPPg
         YeWczuXS7t50hUwHSb8uBM70QmuPBDEzKHppymxDV9ymAIvXbGE7pnm/i+AcmelsNwxA
         849pnSZgxaJdCgx6887Cc6Cx5b7IpvBQoMmEfWWZRF9leNbOKN7JrAogNsNNpa1+/Ye8
         gpLFMGoXj7bYW6n7dLn29VgGUv2LozSmFiAWf4snLJ5sSCNF5JWzc28XBb0TFRgfiTtf
         EvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066093; x=1776670893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJ2wg8gTbB5vb5wi/9vxh5q5ilM1n2u/1JsWPDvfIwk=;
        b=ObFr+TQRWh7OvAEcPQSTM/EFSQ4ASU6RiAhWQ7VhkJ2RtuprMHgfL5wmdotbXgw8Rh
         UurKYxzKGT1jST6sBaZthHltN7Vc6LSKsf4YVS9JY217JFZnUbsPigE3rOLLk5CBHMXm
         mWvDCFAKv5zIifDCv92L00cfDH19zWWY9Zzrn8j7DddWUujQeKjdAW7vYqVsYgRaMgcZ
         iyprisQNI4h1DivppFU1UyslKmAFTontS6TicTZ3NRcBI+aar1yXpXO9YnVcoxsqOitD
         tokavRVS4ACDKYldSLZVc7nyv34+Qwnmld/QzHoG16iOHrfZDmW/Ve4ZKAu2WMTQ4mNx
         XvCg==
X-Forwarded-Encrypted: i=1; AFNElJ/SwCJlMVosIcVSm53VcucW1iU60benCvliPt4aJ8e0eQx0s9AAVgSVq/Cum6LmycV/JdiMKEu0S665xy1h@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo5MzO36SLqlpckbRD16gEH/p1fcHYV89ljmsqfIBGfUVG8M8z
	DT1AikXylzHN2WH4qYwUASrUDC6l07CzCs6rvXlXwX2QT1PsjE+XijYHu4qW9esvvDq4dzaptFM
	DVNP+b9CBdVPX4fBdOIlxTc4N9jbYDzk=
X-Gm-Gg: AeBDievC+VIldklhNg7pdjx/xC8R/STCfeo+hMm2PJhvhqPs8QLqGg3A9n1wEPSlnXE
	csb4eaUaIuz9jxsd4NHdjXUdJlQoq11SThAXCHPJ0HuulrGJ1h2mwHVLHujpAO5kErveH2eVuEu
	ZMi1kyJPJeCDQQJ8jhMc6XHVM/zRw5sEBLouGIIIUG4Xq54Etsz64t0ovgJ5VcdF2iGJ+XiiE0z
	bZCoZfSvzZ6KkTzvdb37D26/MwPLwQslF7/C4Lp8JUZmTqZ8F0sXRj0xo6HnjUoJlH5deQBGnME
	mHNuwNr9+DsuzQTZUY42OhGALaR6UMJwprRTJHHEPkrviKn8Xt6Bcz/Q4+u+jEC081ivIdkyVGo
	Fjvl12to=
X-Received: by 2002:a17:907:3e88:b0:b9c:b069:8abe with SMTP id
 a640c23a62f3a-b9d724d9f66mr684902166b.12.1776066093035; Mon, 13 Apr 2026
 00:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ziqbdajRR4fZ-_Ww25Td-vQI4lPfklpXD_pM87A2d1wMTKsMCgxh4hKyrZCFZSo8PXakp6_PYauSQWb3NUlsUnC-LCt6YeT_iIsD_M3GK3E=@innora.ai>
 <20260412000500.62475-1-feng@innora.ai> <CAHp75VeL8S-ymj6Q8wfFY7GZ7LWdP365b9fVUmzaxrze1oueeg@mail.gmail.com>
In-Reply-To: <CAHp75VeL8S-ymj6Q8wfFY7GZ7LWdP365b9fVUmzaxrze1oueeg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:40:56 +0300
X-Gm-Features: AQROBzAssBCAZR7ObT4GPYG9JYV2qp4j3B1lmOBezwfucAin9tBA8WHXaKA-3Qk
Message-ID: <CAHp75VfFzq3UpLmc+gfvD=-65i3QL=D9EW5VMMKR+1U=E70-QA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: use array3_size() for
 overflow-safe allocation
To: Feng Ning <feng@innora.ai>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 10:35=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Apr 12, 2026 at 3:05=E2=80=AFAM Feng Ning <feng@innora.ai> wrote:

...

> Please, go further, id est
>
>                dvs_config->xcoords_y =3D kvmalloc_objs(sizeof(uint32_t),

It probably should be sizeof-less parameter, I haven't read the macro
definition carefully. Please, double check and use what it requires.

> array_size(width_y, height_y));


--=20
With Best Regards,
Andy Shevchenko

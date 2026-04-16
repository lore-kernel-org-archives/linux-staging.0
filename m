Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82953AE6E5
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370006; cv=pass; b=RjwC3eTKEk2a8q+Jw5OaA4Tj2KuSPRLpaaZ7RtGTSkgA5xrIKO3I+id+AcaewDCy3cXZG7a5ZfQ5j5sFRuVX/0uobjmaUHzG7HolaOfNUjshJgVuJhV5Idq5Hyld/h2u6kykvfdQjmVRG7AIZ1k5g9mfBEi8W9qwGOTlAXbaer4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370006; c=relaxed/simple;
	bh=4teVBuNaxFxK+3ZcTnOIpvYaVeA0ijq9NRDf/er3lkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqqUczgfNwHLzq48EsygcCPZP5JVaTtSwZVXX7DTE2v4kLoYxMRfBzwftCOPkX2i0Tt2khJp+vj1r/HUW0i1c6Vae+gg4NK9sh6gRqc6/2pavFHHwlAd6DXLdd6uStbLwMJhlF1F6Mq06y+1dtkKfK31wXCNM85dfHGla/AX100=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmdTZeyJ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmdTZeyJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6720c7968e4so2331916a12.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 13:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776370000; cv=none;
        d=google.com; s=arc-20240605;
        b=BRfKkuWXNQkFeURFl4tPIs2qZYeFj9CYuxCn/yaK3n+WO4VbDhKSMqklpRJNR3pp/2
         qZ3Tt98VbAUs31LA9qhyg4p4D8kcLiNtWUpOBgRv36yb/3H5Pp9xLnSBDiPkVLwpWQQQ
         +E+tArp1VWYR5bbExIvaktg0YalZcCnEaaISF7ELEeu5gE17U2nd9RZemci+5xWBf9Fx
         jm58/kwQtdgzxtgb8FY5ar0aX1mzM5Q9BIIXvfFM4nWktL2p4KnXY9ThmbbSQguIJfYl
         BJWhRCQ6U67VG3H7gK745b4NbjyYSYrw9l9frRWrpV97sBuFWeowaur8JdJ4/L/Hxkrx
         NptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4teVBuNaxFxK+3ZcTnOIpvYaVeA0ijq9NRDf/er3lkM=;
        fh=sRqW0s0P1nWP/qSfGfUHf3j2Zs7Mb3Cqce2YZKJ1dEs=;
        b=db+9n9yOkdMgbXfSZj+iHDp91hiEXnW89CzgufWTLtVzDOHo88aETIMHZtzzeC/vS9
         /vZHHRfsNJJ0mENglUpKqpacgl65QXeopflT85engwNfAfKj/AabyqXqpE2skLdXj628
         /W7KHEV0YhhGEHsuWAeNnqcsAyOGICXvqYN/Dt2QtbOb8AYvlVM3vNa+ESn5J1ubL2hD
         g+rX9Pm7KmXDdGgY/2eZIVP3wVCKPLK/JAPLsqEA9wH6/ijWt+i5A8gCmBgc/liPD1H8
         mdunu6hRHRdcGaa1hI5X5/xGsdPJDH0e4z4VGL/Dev+c1QGTN8K9aYGIr7zsb84FaH2h
         L4AQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370000; x=1776974800; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4teVBuNaxFxK+3ZcTnOIpvYaVeA0ijq9NRDf/er3lkM=;
        b=OmdTZeyJ02uEuIhjHk4AJe99l3NSYym3SNpuuTiihFWCHqGgVhe5s74t34MWkOiGmn
         zGFC5hBRi5ewJEwq0WgDtbg7lD9rKuY6djRKKrT2MUe3T8XcAl9HYkXIPrJ8AhHwYk7Y
         DK0GnfIFoh9vuN9KqpZtK0fuCtPrCyj7ZRu+jwipswlm2GZrQJDTGwP8vH8MtgBlbV33
         dMOFLy7mnkvVep5JGOf/qxy4uGzgxobnui1yp/P4HxotcIXtLYFNAHQcGsCzmdV02LvU
         vCyaACHgMgWYm5+2wXxRHnPB+PCryrrEFN2oK2bBCy3ke2b9pATmS5hWoXASnVDKywTf
         TGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370000; x=1776974800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4teVBuNaxFxK+3ZcTnOIpvYaVeA0ijq9NRDf/er3lkM=;
        b=IGoPkW2Eyxwd5KGkIDETzpusL972LJGoKBFlsy/whZb22tpGBcD8O/jSJi1sqfYYN8
         iJC6ZoWulMCT5qzqZ9M77+G6/TppO6cp/XQkVuTRj/JVBOceISxaTnM8vKFiNDbgbHaL
         Z9sxnmUOZ3NRbgWpSbw3bMIsdokjfM3MJxlMHwYYOQXV/ja6gSLA3UO1dGSIHrvIJtth
         yex3QrlnHCWLnpq17YRDAudwH6/9zgkbhlwUoIdk/eLCYi1M2znxnZNZteWjvaeT7j4E
         zvdKJzbQxQxS9ZXt7OzZG+FI7n7sBml4YE+GCmZmFANLLbcFKZHZRDGHaRkw6a+Q164s
         q1Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+lcbhJFvtOo96m4JnH/U7tOVdMRWxQDwwQ9y+8yO05N0BKIrMHWXA07VJBtleCXASA/1Ths6/n/ZNO/H70@lists.linux.dev
X-Gm-Message-State: AOJu0YwSatbaACI3AJ8pQgcNvdaOiZyaEn0XhrgrOltSIZpUAbjgzMLb
	xzkYAqiBpDiSv6V0v1iukTa8dvtPCoUmX73P54ovzkjcf3/Q40/ch6VAXcAScYpPsTV2lN2Uc9l
	KRgSp9jMo7HqTrrp9zsAKdznIGfJHXSs=
X-Gm-Gg: AeBDiesHNR4iIdwLfb+Qw2qGoAuu18UCfIc3G38qIjVzvBanxNUHxOiRbVwuKrlCttn
	fkIW03iYC3b1dQTTZTkkHstU/Y8L/zKEEFJMMjGwmS3T+7TlWRxTWE4rLXe0IKuM2dF1wDGYWrk
	XNeZwyfdYD06sRxPHqttBxsUqqooHLGrFg2YNzAPvBfsfVQiDial3SIdK9KZoPNaom9fEDRSusn
	TIruTHbe9wndvBhxmFRwpaduSKMi76P6m0+LlzhG+gh265M6rwN6IgP6h1KqKzQA9ygXbN9Hnk3
	mQo2LRCr7eQkGt0iS1VUi1miAElOzdeDMiai8mNzU/1wt7/mzw==
X-Received: by 2002:a05:6402:22d2:b0:670:7006:6053 with SMTP id
 4fb4d7f45d1cf-672bd030266mr234125a12.11.1776370000247; Thu, 16 Apr 2026
 13:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416134214.130665-2-pontescpedro@gmail.com> <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
In-Reply-To: <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
From: Pedro Pontes <pontescpedro@gmail.com>
Date: Thu, 16 Apr 2026 17:06:04 -0300
X-Gm-Features: AQROBzC-EX1p-Maoxgj9JeHTXDGaZI_Q5teK_YMXo8FiyszicjSakN0eu5QKZWk
Message-ID: <CAG1t-2LVK=QjcZ3pmikjt8k-x9-kqXvrDrbutXHp79Xmkv78Lw@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> There is already a patch doing it in a slightly better way. Have you
> followed the mailing list?

I searched lore and patchwork but couldn=E2=80=99t find the patch you=E2=80=
=99re referring to.
Could you please point me to it?

Are you referring to the patch I linked in my submission, or a different on=
e?

> Please, better to help with this driver is to subscribe to the mailing
> list and review already
> submitted ones.

Understood, I=E2=80=99ll follow the list more closely and review related pa=
tches.
Thanks.

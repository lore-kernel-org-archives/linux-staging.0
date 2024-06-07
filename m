Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552D15B131
	for <linux-staging@lists.linux.dev>; Fri,  7 Jun 2024 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751968; cv=none; b=qkNo102AuMygI4W0vGtfx4XZ1ZrAToJ1ZMQmp4w5/fVIPqyEfshnnDc2ECdxF7KhzPWyMj9BJFfOBuHSGEXg+mb8eGvaA5K1rUFrRUUeysftAp3+dxtNKlIV2oMOxW+XkYHBWVeaofQlKidumyPBWcgO4QkVzx1adgPt5CbKKHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751968; c=relaxed/simple;
	bh=V56qmirCFVXzJkhSirl8ym+WKZELaohL/SWX8q5xyA0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nzEoVNJUPGpIx3gBBsGfYO9a87X9nUilw19SWcwFL/qFsyAxF55sb4elInMWuG316Xc6yFFJ/o7QzJNeRniVexf2JJCnroVA3PxOp7AnvuSg1n876yaX3XGwEK1ldmnECKvvN9GMoy+3kJF8QbxLDT9lcO7H7RbFHlP+PLxaFAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQuugaSD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQuugaSD"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a44c2ce80so2100153a12.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Jun 2024 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717751965; x=1718356765; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V56qmirCFVXzJkhSirl8ym+WKZELaohL/SWX8q5xyA0=;
        b=GQuugaSDVCKmsL1L9tgjFBW1x1u5h2z+xY1O8UxJ4XwI/EPttQJARpr0Il2bD3VJYJ
         YH9tdr/JgX0hSY93UUBWsck/0EM8e1mnTi5KWMLJOfhiNFUfLCeRvlqfr2XEG/GijtMi
         5TwPn6+NKC7xYNfjL29qqg0nD/jDe8QS18ZohoO50CSpqP239kF9iQHG5gapNzR4ttRG
         5xqQzbnifGkuIsKwFDsDUz+LkhLYISDzLJGDTa6dKTSB/zc9VvWAX6Mwz+KcaXn9mdnU
         XaAyACWIDMYZ0loksrcaOpiVFepXiwliL7S//5odjyR4o755U5+qXsYqu6CkO0AZN7uM
         ZxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717751965; x=1718356765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V56qmirCFVXzJkhSirl8ym+WKZELaohL/SWX8q5xyA0=;
        b=AF889+/lgDyGnsC+kUKHAIWuO2TDxgOCGYrUnS3cGN6Hgi4Zc/FfP77pC+9JegM/e3
         +koNbn9wqYM1pTrNlPOAQaaumhqFkhJu1ok8y36Cjraw3HLJmH3jJSuHNMwbIYQ6RJfC
         cdIMfhJuKXUjBe+deLnDelp/APbS2jwUFc39pepadfCiC3oek6GK68hhCHNqP9nJA1k9
         xLFD5rwA/o9qlbY0f2w8pIn49FidPfgJQdunfQzfHfilRXgutsmdWti3Pkv8quYw1OHh
         zqhHXyQW/2Xi04P6sqUDtZfsx53Nz4MrS5diM3gzrLR3n+QQjiDtlJ1iGjeE8kMQ/r5k
         Cnqg==
X-Forwarded-Encrypted: i=1; AJvYcCVIsIq9B3IxTW+6vPUD6oX5/6pxiVUtoL9i4cU49ccMp6S+Zzmrr3w92ztO1+OGQ/pnaXyvtgDuus3Szh/isYYc/cSHOQ7HleRT1q9Dnw==
X-Gm-Message-State: AOJu0YxG5u8zaX/ubOoQ8/ZNkBi8AQZwQs4LLESRsJK+p9ly/6FPavO7
	fXzRMHWEKV8+7K6FoX0knzIzDgXlNiWVkUiujIxyoRwACe+MQ7sPy1GDoV/zIhPiEw==
X-Google-Smtp-Source: AGHT+IE5eH3XAjqumOHvbveY5vCe4FKDD0C2xPaYWsV28+Mwai79w3ytVk7FDDsoYpsteWi9vuyvKQ==
X-Received: by 2002:a50:bb66:0:b0:57c:600b:b64e with SMTP id 4fb4d7f45d1cf-57c600bb6bemr264703a12.27.1717751964949;
        Fri, 07 Jun 2024 02:19:24 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c5fd78477sm265913a12.40.2024.06.07.02.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 02:19:24 -0700 (PDT)
Message-ID: <89675b5391c3c37a69654f0cd4ffd0e2ea312056.camel@gmail.com>
Subject: Re: [PATCH] staging: iio: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@baylibre.com>, Jonathan
 Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
	 <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev
Date: Fri, 07 Jun 2024 11:23:12 +0200
In-Reply-To: <20240606155407.499344-1-u.kleine-koenig@baylibre.com>
References: <20240606155407.499344-1-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2024-06-06 at 17:54 +0200, Uwe Kleine-K=C3=B6nig wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>=20
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

- Nuno S=C3=A1



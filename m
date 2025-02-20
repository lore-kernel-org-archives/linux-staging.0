Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531C9213243;
	Thu, 20 Feb 2025 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072897; cv=none; b=dXxjT+ZGHjDqrhwSXKec8d12GpwpZlfgTRYCOvTINlOUXSCAspAOWH0tNQ84Nc53Zf/E2s+R44spQg3FYAP6D6Z3ak1hBYXMMoQ3TYiLABUH0EMNum3vL8d1EXOT4pPz+AlxS+HBavAFxt6EN1vgEor/n9+0mJjgB+S/D/QZJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072897; c=relaxed/simple;
	bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hLU5gJLkjhlf3SyRBJX0f73JVpDJbWODNifxUwZM4bJ02opxeR50TKojp7daGYcgCZZXvBOSrva2SyQBzAkhj6nJKV7K05gPfpYQn93g/L9NrmINPXiw5FebZpTBHllgXZlSIPSOh3IxVMU9lbIi/JmUzf46fGVrwwnHWzZSDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ds7mQize; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ds7mQize"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43937cf2131so8781255e9.2;
        Thu, 20 Feb 2025 09:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740072894; x=1740677694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=;
        b=Ds7mQize3sfq8m/pjX1KW3ldf5K5BKiquH5TfCcEBjTXUra7+e1TfO2/7cGgsY6vuB
         1MGiKJjzxF48zkqPfR6KRA+vFuq+rtOaikQMumAAVhQo5JqsIStIH8HIu+/BfESmKJGL
         WcTODq1RSTDYk+N7Xhy4Jq/XEI+ZiRHT5j8140QUNIse0er1ZcoPLdXVP/jY+x87qyu6
         XqyXj2/rJi/gr3e2LiuwUWtXiRkPXwkDfe8w+JCBXtaz+YlRuuvzNbrKGd/UkKhoyi+U
         pTx1jtD3JFrtLd549MOHd5fqhcCTaQcr8NS0Eswx5LNinyc+0bPML46rpTAD2j/Y2srI
         Cukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072894; x=1740677694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=;
        b=W1YBlzyHW+jqg3o6gRjEDx7QhIra2vsWIo0GDK4Cs7k+uf2Z8x6MOz4w+tCdhIfk5f
         d1i/eILDGodtyZBxfFYMcyq519Rq2sX91Z8uUN9dUedpVJIFov/3bUOW48vZ+Klleb02
         R5SozJg/ssOHmdB9tJkHfTijBQsiHvBCvgwXlUwMlrf9jdK80tP2h7+Pvt5D9QBqO3kw
         j6NfCjk4+WKHMUasIUHsijkcJV48GwmJJm8RwPHCEeKEu34y6mBaE6ZZMkuXsK0gjmSr
         xUjRtBqLqSjCuMUZapl9JAZJRqgHkhp/d2gJYn9mSF2S2nSFNBiCOP+vkpat8TMVoGH+
         EJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5BI3/Q/ERf7PEdTIKwdh1WfcygrS3jnEBeefQG2WvQwJwsvzgiP0bvF+gKeLFZHWiBBUYxOSMoUzRidSv@lists.linux.dev
X-Gm-Message-State: AOJu0YxzWC6pf0FXmu9d1h/4WSqBsat2Tw3eTm0mCpiBK8S0cHiQUD4o
	bqg85Ftk1FeMDVIPLZ9MfyEokiJNaiiJyXsYBid2FBVBdbESyZva
X-Gm-Gg: ASbGncstxANWnjotBHWUuPi3c9KySle8cQnD/ElJXQSiuAATCeVZr1160KD1hgxqoUw
	cXoSsibi6iQUE8GpeRUC0hM+pxoqDZdlAGj1k50DEh/9ncco3H15IDok9nyhRf+xT0LOOzBvoPr
	J3h4qWeN0Xo8nfkLVjWC/j+C95S8QDH9Y52yuoHQMfTpJ6YxFFfEQjv9IUf+E7XQICJpES/9XHD
	svbWrBT0kv1+qHs9hagjQXsGBJ10AqqyapTLscTYU9Hq+EI9nVoLNPuXp/vyij6je6+meyGT8Oi
	Wl9LOoAjtppmpxk2IZcjbH1QGnzDt/4NErDg8bx4kiEJBwq3uPf9uIPvjEgKT3PgsZE=
X-Google-Smtp-Source: AGHT+IEPmmiKlS/ysPrkAIpR7/izG7EDUAs9G1mfa/hbF+C9JMVOv9VrwAD1oHez+9k3pqPo2/fSbg==
X-Received: by 2002:a05:600c:5493:b0:439:9e8b:228e with SMTP id 5b1f17b1804b1-439ae21cdddmr609075e9.20.1740072894371;
        Thu, 20 Feb 2025 09:34:54 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43987088ecbsm117191125e9.31.2025.02.20.09.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:34:53 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] media: cedrus: Don't require requests for all codecs
Date: Thu, 20 Feb 2025 18:34:52 +0100
Message-ID: <2235304.C4sosBPzcN@jernej-laptop>
In-Reply-To: <b3ab99a1-2e72-4b7e-8569-f7fe9beb3018@suswa.mountain>
References:
 <20240731164422.206503-1-linkmauve@linkmauve.fr>
 <20240731164422.206503-5-linkmauve@linkmauve.fr>
 <b3ab99a1-2e72-4b7e-8569-f7fe9beb3018@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 31. julij 2024 ob 18:56:15 Srednjeevropski standardni =C4=8Das j=
e Dan Carpenter napisal(a):
> On Wed, Jul 31, 2024 at 06:44:14PM +0200, Emmanuel Gil Peyrot wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >=20
> > JPEG decoding doesn=E2=80=99t need it currently.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
>=20
> Does this change have an effect on runtime?

Ideally, driver should allow only JPEG format to be used without request ap=
i.
Other codecs still require it (decoding doesn't work properly without it).

Best regards,
Jernej

>=20
> regards,
> dan carpenter
>=20
>=20
>=20





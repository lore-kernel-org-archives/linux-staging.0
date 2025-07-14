Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34423265298
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 17:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514645; cv=none; b=dnBJDOaSinwcMFVbGkmSULObmmEEuogGI9qGW8zzVIUHZb6LBm6XDisAlXRWVf+GjWj4cvMQke4cmmjEAricY0Gxu2gEHsbuROZunZOUHBQshvA1xcMX7eBa4BZ2Bgo17inyJbsOqlUUpVNWOcoKg4S4zXspDjcvyDgUENLd24w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514645; c=relaxed/simple;
	bh=6pEZ7I/Q2GU5GEstfXRLF6p8IiymWe8ubsklJS8QlRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6issBVrwWpTgCAuIOTED3pumPU/lbTkaZ5+deMlAFyzlVoR3nidVdBMzCzx8CXgqWy+UJbvVYhEQb2YOV1/tJKD1DIN8Bk5Tn+5C8D+tuPF4E9lK3+YS2fZF3VU3wXDOPaUN7aynLVL2aXrijG6LsUq2UOLOLSJTZhLZdDDbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UusEijEt; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UusEijEt"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so728808066b.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 10:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514642; x=1753119442; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pEZ7I/Q2GU5GEstfXRLF6p8IiymWe8ubsklJS8QlRQ=;
        b=UusEijEtKv9TfMG626J/F9NsFWgFNCqVJOn6/7Z1kJBVcpS+sLj7Gj3hDHWOo7P6ux
         TpiM/86Az6l6s+ASttpnO16jnD/PR991+y5B2G/l4BYcKu77y8jANmg8RapTGTGF3m4s
         +sU8I4/qvEPMKzs5hzIUOy2a/NPTV0wK4jbjV8CN9lxbflepT49t6YTQ+6VJLVYT5Nul
         Yki+DmD8RzwAqG/Y3JoizbH/jNKWq0G6wMZzH4RbAysX2Q6t2mG3b/eKSlQSc4fJGQ/t
         j05PPLxPAxWrxyGhsTDzERySRcKbd5spBb+QUCEbW2m1XteH86x8mwv3x8nuc18v5MOM
         O5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514642; x=1753119442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pEZ7I/Q2GU5GEstfXRLF6p8IiymWe8ubsklJS8QlRQ=;
        b=IUnrhR2xJWnj0WiVY/Q/3IMhdqGCtPWEyR9lWOTTieTHkOrxC31aGsn91iAp4sxex5
         lzVF2BVFtVSvKW8NEiEuEO6l0jaVnSdYQboRGHtREpnJ0FNSAz3C1NzrEUVzvuRQXJlZ
         1Y7pCSCHHBwo6wyHkfm39c79W0k3bxt3W+6DEjKbaetJzq6W4T0u+9GT4+Q9RzyGzBlm
         pMywfupJWyP2vftv+eBHXVVT9SJrPVfjg1xJ0lKfQlEqoKyLpHJek2o4B0MZrINrM1hx
         4KPlPf41eFKRikukzR/54U55er7B3/axO1ruNNLtDWuTL6RhdjUQpeCuAHcEmGG46zTb
         LRGg==
X-Forwarded-Encrypted: i=1; AJvYcCWfluDhB5AFbNXkoxlgGnvw+L5OQPKCsCCdIdcaA4LuYplA9iFICEMblfSUeMVrKLBo8LsvyDwPThuIS9VM@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Yelrgil+bLF41BOFl/rRSFljI/dc7HSz+hkkMLDgCDW7WohG
	U2uzQTKjgW6KCIh/fS7ppE1AtRwdEf8VLZFLwPdcGcea/PNqmWamgrPzD3ZLfZf4+OS/UMq0j/f
	VLiAgB/5fazt7AH34wi5qZ+8tLqQimT0=
X-Gm-Gg: ASbGncvFIG/KrN/r5VPXvJWvwlvCoqr0vv3marIZHCYVqxPbRrLsUIYmvrUqcoPPjdG
	GcaYyXR+oWNOyTkyWZNB+iKKvn1ypTEL4JtB6z2GRopU6WTh0twpa0xFzpeF+pkuHEscen7Z1of
	PK07CJxCrWty6nq8hL+sBTXt3k1MFqFhf6n3kr/FBzb7ZpIKx8sPKwJdbwh3MjCDv32WKnuwJI3
	6wKczA=
X-Google-Smtp-Source: AGHT+IHS8CYjJ4Uox34B5QwX+bOoDFcJsRHXN/gnJP52JWMnOUQ5TMhVd6PKJIQJ4J0wH94fnk6IQbcllBpE6ThbE/g=
X-Received: by 2002:a17:907:3e9f:b0:ae0:a245:2fef with SMTP id
 a640c23a62f3a-ae70112fbc6mr1213767866b.20.1752514642203; Mon, 14 Jul 2025
 10:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714140651.213850-1-woohee9527@gmail.com>
In-Reply-To: <20250714140651.213850-1-woohee9527@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:36:45 +0300
X-Gm-Features: Ac12FXzZXTwWek-3E3s0kT-QtlLxqkYpdEk3lPMglBFHQC3lg24MEnkpPCDn3r0
Message-ID: <CAHp75VdsiettsHRQr3cEmTiaFMUUZwGYUzgmY4ECKCwVFnsH=A@mail.gmail.com>
Subject: Re: [PATCH v2] stating: media: atomisp: fix open brace placement
To: Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 5:07=E2=80=AFPM Woohee Yang <woohee9527@gmail.com> =
wrote:
>
> Fix checkpatch error "ERROR: that open brace { should be on the previous
> line" in isp_param.c

Missing period at the end.

...

> Hey, this is my first patch, I appreciate any feedback, thank you!

Already second iteration of it :-)

Is this the only file in that driver with the same issue? There is
another patch floating around, perhaps you can combine the efforts, so
only one patch for the same issue for the whole driver can be applied?

--=20
With Best Regards,
Andy Shevchenko

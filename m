Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908C3A1E9C
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767134903; cv=none; b=d6vJBoA4ZulF90L2ytJsr+vEy6tyjpPycmkQLjddUP1Ns0yc7U0e7DVnOJrLMjelfA8R2LABGVpe//k3eHgl+g+tDtgs+3fV5HoyBPH0AJwFMKQtd20RUgblvVMzwHLht48Ue/LJ+TKVqh3nuyiDc9jWEaCLIIJY4xNyReq0Q8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767134903; c=relaxed/simple;
	bh=2je5wPhw5+ZlYngfejHtJBbd/iBRaGw6zlXRFZehPIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBSY7nZTh0aK5Dme5XWq1zGEib7HcYj+nAIs8evH8Gb0rmcCCx3EEWJuLV+WjXB/kpznWFwiYNy0fj+O16RoTdH2OPZVGFWyUXQ8kd5tColm9U8PVplgql5MirgPLntdnrM59xWuU1xqLdQ4/dx62rWyyqUH0ImyKrB6dbfmPZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U23fQwX0; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U23fQwX0"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b832522b47cso596178266b.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 14:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767134900; x=1767739700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2je5wPhw5+ZlYngfejHtJBbd/iBRaGw6zlXRFZehPIE=;
        b=U23fQwX0r64PvxewFDOG/+Utc0aOBdd7AFGMe3Th3MPbCotXE+MBKzoAD6ZFAQVVPt
         LedroUKBsoUR8UPaqyEwqrRevRyr03G2QQU+IS61A/jOMeyz0Ch7BbwcNIGmS4cAXT33
         PoNRmoDfXZftoI/oprY2H7bppQj+RU+X2McqAWcHyEtmghk1FmuJrF2utoILA1t2VQaz
         HGYmkaNl4p6srAJQQfm0YqBXuKB0bQLMYT9CpMIjnJ+om5nJHobvDDgP24c6oAX6PD0U
         M4KwGktz6RH8ifN+FhjzriVm2qFtg1krCxANyJgms0S1Zg7P/5Azk3pcjJVRch8El5LO
         d0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767134900; x=1767739700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2je5wPhw5+ZlYngfejHtJBbd/iBRaGw6zlXRFZehPIE=;
        b=DW0oqxqqFQ9z03bKV/Z9XbSYvCMKa/KbxQvbp03oEqq2vS6w6uKyYMYpJAp11RSIGr
         cgN/+eD8hcKhuApnmbXSpvgZ0lKsuqV5J+8YPBwaG4MirxR3MQ6Ig8ScauM2N7eyatSo
         FtbVjlLeKl8AzyKdD9K0EK+kKbqrh52H1QW/WpEDjE91bvrHe6f7k2vNwCTtJpuwich9
         O/zcxWLHDtx1p9isbFI/wwjrlWHuUoCrMKzNwf9znRDhg+nocFglhZyw00DQgNJAwlP6
         YEweBszk8/Lu53aFdqHl5yfM99ICoAYrOlIZM4JFLzIHYG1JE9L1jVjoDdaIrDPHH8M7
         rciQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfpZ8OAxYUB9r0s8klKPfItqli8SV8gGClYy8xDdY+n0Bpd9q/H5lqQZNOsKhujLYTdq7jMRBVHZBPs6ho@lists.linux.dev
X-Gm-Message-State: AOJu0YxdBzmqVvN/ouWyDOKZPyzcrBPziS85dYeaHCbn6ykdsDO/+7sQ
	EAz6M5QZ0H68R8DN5lyOtdSI+ozrgbKSBpgGHD+ghgUrFfkd+b6z1y4Ird5cC+kzaH+r3yXTarf
	UD2DiNyTtfpEByWF99WEB5/mx6E+Z2O4=
X-Gm-Gg: AY/fxX5gXiEU67apiXyiWSlYYGU+aHeefZtmtlFnMwTsjGTWTmBl8uuMTY1uw3WAjGE
	CsCLw4WtykyS9cShH7wRZZMFsxDNzaMJ8eXztCSUQ4C0csrVrDzfFKvqy8Kk0Pr6ZskakQq2vJe
	USFcFJxBFYbdNt8KxWR3jsFmn9NATI8/CV8apRbYiEj2Mwph+9vrcRWluhRASgWa8u55mvZNh6H
	G0oGdxgVj7WVcSsuTV3H/9P9oHERSDjj/4iriKayLUs8ZJxXOiO/kkHYFfgWDXLXhpUnpBr+LVB
	kd1Rgkuwpa25Exd5hYt+Vxc0p/XOKLSnmxavUQ6KetFebB6+uWOZ+bErW79pUPRgJglPcI5GiPG
	79G8/XRs=
X-Google-Smtp-Source: AGHT+IEDGoTQI7uKjBc49LAmZVoOmzDjVBgUzQPslVzBe/0D/d2lgEUVoI1oZyRs9ugb/qMJPIM0JKt3f51xPXsCt10=
X-Received: by 2002:a17:907:1c01:b0:b7d:22b1:2145 with SMTP id
 a640c23a62f3a-b8036f2a9f9mr3380566366b.23.1767134900417; Tue, 30 Dec 2025
 14:48:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230203459.28935-1-tomasborquez13@gmail.com> <20251230203459.28935-2-tomasborquez13@gmail.com>
In-Reply-To: <20251230203459.28935-2-tomasborquez13@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Dec 2025 00:47:43 +0200
X-Gm-Features: AQt7F2qPZCaEWiqlEPSM4kOdhk65I8FKSx9FO4nIhZZDWZWt7eP1ebu97mtSFYQ
Message-ID: <CAHp75VfBwsKMdksib_UDMGraoPREBHF-ttcxxBpKvpyV2bEQjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] staging: iio: ad9832: cleanup dev_err_probe()
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 10:35=E2=80=AFPM Tomas Borquez <tomasborquez13@gmai=
l.com> wrote:
>
> Cleanup dev_err_probe() by keeping messages consistent and adding
> error message for clock acquisition failure.

AFAICS this does two things, the second one is reuse of the temporary
variable for struct device.

--=20
With Best Regards,
Andy Shevchenko

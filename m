Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7303AF674
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860919; cv=pass; b=ZiS88l1ZtnkyIhqqlDU0WAvyCORGWqb99cO9iycfZvG898nar0J9/hn6xuSQTyenaVwHa13x1G8vrgzAz/Ga/xnv1JBcET63ByYLX2hIMFc2TGrRi6LTYEtrni1xP2YqBJK8bYNNJrVETAaF3FUTwU+yY9YHWannNKshpLPN9OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860919; c=relaxed/simple;
	bh=9Q9JEGkw4BQdruA0mUjl1v8bI+C/2rhy+ihIFm8QwsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHCWx52alznn/jp+K0du5mVPxd5iVz3Y13jcD0AtmqidQj0xodU/6uTzonukrCReTdh1jT4A5vVEWuls/j0noz0xVROiLLPiR2W5J4BMz/hqWMukcFl6v1atm5c6ZMaLWHjMp505xpOfCMFrrGSUapKWpI8yJWeGWEkOszaZRUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6uAxW8r; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6uAxW8r"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9961e4f71bso634689166b.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860916; cv=none;
        d=google.com; s=arc-20240605;
        b=PrpDm1122oqN9JptjsXrwAUjiMQdJ6YyiER5NXrTr3QjtPeZFEKgwHwTnVR38fiQ8I
         iNFezCAPozwT3NIOycWBF/rjwnpQplJulaBWbLcPB0MRUwKaNwMOZu7HeK1egjNJ22B3
         H8F3QW4Eqj0rk3uD6Lk+kSkdScrR6YFiAC64NYl51SJuLWySDHsOpptX60nY5BKwhgrA
         DR4Q5bSJ4Y8kG3cFj5gLO+1n4mdRzHViPqvFAwQE+rJ04r93nJp03y4ITbov34xdKz0w
         YxPMGfq92TPGwcuPNtmjwcZImOIVFXDf0iywLL8R06//Wj43zUDU3fJkSkKW2pBs+tEE
         TuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Q9JEGkw4BQdruA0mUjl1v8bI+C/2rhy+ihIFm8QwsI=;
        fh=Sx3YDANfFoQM+1NfokmwUr7sKUXZ8etijk1CYWA43Bw=;
        b=QfsEzywE64vDkMEyxY+WVBzpSzQaFjBaa+mVJUv+82HaEz0x68voa6U7XQPS20QNdn
         AKmHm3q2DPZWNtFB0yzniq7gUB2TdffjJc0XnHWnEyHxqoTvKBH+MqfizrJZuQ+n3iFz
         HMSrZL2Sf64hMJ+65H+Ka3KHFOO5u3g11i5/9yQ5+ysd1noHrLr+gJsAZAjIxFIH6ixv
         gsXQrxSmPGd2TVm1Ow8UnCBxiEvKNxmbL1yHAFNz79LL0h6XP/2FObIoEhxCD4HtBop3
         SeJwTycj7vHjKrOo89g/4wGYz3+v4zriRozDEyobZXhTvkuQZgwSbXIyjltnPF+8goOB
         4BRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860916; x=1775465716; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q9JEGkw4BQdruA0mUjl1v8bI+C/2rhy+ihIFm8QwsI=;
        b=e6uAxW8rOar0gTDdGOIBnEaqK+FjDwFJR04jTDsOUkkwSn7R/WZuyeNZv4U7oMPSsu
         6slx7UzzQYumjjVQfHRQdAzQge2FSxchz7Qd8/350OzU+kbp3kMEY6TRawesm4PSu2Vq
         ISErY8yLwz+AUxJQVzk92HkGk2k3gRf8yIO258utyRmGwI7oY0j7p7chp0y/2aX0y77F
         pqFZtp8cTpnIR2ByfMQGvRxYwjetH6nY/5eYCKTWhxYkXz0VHRi71RnhD8CSBwBpOE7r
         IgWufIwwz590odjAv1kxeza2RVxLjwwcUaN2fbiguTRrCCV3wsnMNgWcaYvqMA6GaMxC
         vGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860916; x=1775465716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q9JEGkw4BQdruA0mUjl1v8bI+C/2rhy+ihIFm8QwsI=;
        b=qyR9Ot8Mn3jGBQBDgogybwhlrsrvXmJJ11AD+o2pCgxENtnQ4ugTfuwpgsTxI2FhmC
         bJjHGNtupJ8Q+cYCSFY1tIO9n6C62sPyj4dOzsh/1qgp3wc7Po92ispE7xnjKjDRsy2s
         t11vkX6KdFnjULSAfy41uDrGaFjS0FQlgv+wGss00edJmlQlXWZQhuNtDW9EapiR9ou8
         dMmeVdUOWNZ+Nruarjx4y82E00oHmXoZNwSHGrJerP48JWsO5QhLda5gAHXxw6Wp6FOP
         TP2WYkJ/vwuzquSCL4AeprlPHvb3vZVWfV5sfZrneTDF2gRSsvCWkh8Xts9Rb5ImAiNn
         O3og==
X-Forwarded-Encrypted: i=1; AJvYcCVu3WU+nlsB8X1qi1hWuFps3ziT3/Lhu1pQAnfpjr3FcSUBUUMOGKyNv7lO5ShFzSjhBdBnLL4uIqC0Dz45@lists.linux.dev
X-Gm-Message-State: AOJu0YxpbD1dShbuWPQaHYcJ51RgF641l4VobpuKkIuAOnLvet4lZsZk
	D0moOlLd8zvGma56EzWCd9vNCHE+CZfepLsleKI/PinNCPdaOos4YsQTo4POvyORbxnF/5prhC1
	RJfc/Zsg29mcmaW++fgZa6fxWg+PWK2E=
X-Gm-Gg: ATEYQzwkphTnYITnOesz0lFvztMwL3DXpu8R3xvprA0vfrd20jAOfcrfyyDGjifN6GX
	rpx9/v+h8u+Qf8BySl9goJ2Si46sq6lcmnUMErlrc6zy1pGA9NZRBwifqJsWKcnEDZuZHGvLZkl
	uwucOI7/X99QMSn7v/nA7Mqb9GM3anCxOPdn8RSkt/3HZX0AOs8H6yqoOCA/RuuWcZ2onpyu5c8
	YFGJK79qHtV1YVo+er84fyZrx80C3pnih/groHrHE0Aj8OWQ89vs1tOfQR0SLG5qvmdccmcMIRo
	xoIhz+f192VjMWWII+UkY+aEDkWVx93R4ATM/wKog4ecLnjBubNuXSB0akUDgOwLQCKXgrFX2+8
	lV/oCuBs=
X-Received: by 2002:a17:907:7a89:b0:b98:9da:4d94 with SMTP id
 a640c23a62f3a-b9b5095e40amr779922166b.48.1774860915908; Mon, 30 Mar 2026
 01:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com> <20260330073549.5782-5-robyserbanpascu06@gmail.com>
In-Reply-To: <20260330073549.5782-5-robyserbanpascu06@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:54:38 +0300
X-Gm-Features: AQROBzDGxgPrw5tSDCjcr3lAOZiimubfJ2u2BqmMiahhFC2cudZ_awdZhqc5uWk
Message-ID: <CAHp75Vf055-Y=VnmEeHHP9icUsB4gWm8K7HLjD1M29wkvYxO=A@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] staging: media: atomisp: remove redundant blank lines
To: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	m-chadhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Serban-Pascu Robert
<robyserbanpascu06@gmail.com> wrote:
>
> Remove multiple consecutive blank lines to improve code readability
> and follow kernel style guidelines.

Unneeded churn for now. This driver has many more issues that need to
be fixed first.


--=20
With Best Regards,
Andy Shevchenko

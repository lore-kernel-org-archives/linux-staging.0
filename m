Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E37C1EE7BE;
	Thu, 17 Apr 2025 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910584; cv=none; b=DVVMXLWMoMEU2Ky/u7mctaxGSHm8U7HMMKUnzs07A82eqSUDYiXvej35i6K7KxFimcAegk1qeElLBpE6pnE4Zd0Vr13Ii+bvYy3+ngSU4n+5xiJRenDOV/f2UJhN56MeHTnCMceccIsJeh2Qi+1j9pmhjASjSPAzbjtW4Xvf+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910584; c=relaxed/simple;
	bh=2n4Yhi3NLlYRVnd9ltNUkqu0ipLpa7E/5e7ig9W8q1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTrW6H6RRnt8cIFlKr6w8zgQg9rMKU7j+HsXImjbVHTe2m4+pB8RPWMO2lT8AWg8IoPR2V1ODKID/6MqQ1Y02275bFO82RxwP1RL96aaWfQUsWV4mmiY3TI9NVXhfVnfMKsx/nBx41UhlzaTpdwGg+1LQk/ABC2MVuKkt2L3LpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3ko+5FD; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3ko+5FD"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47691d82bfbso17619051cf.0;
        Thu, 17 Apr 2025 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744910582; x=1745515382; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjbBi+pjpYF6x4ayVnEMHrCSwrafIYoi1gwG/mlXe+w=;
        b=E3ko+5FDSp4KijT/e+U0MgMuZ5igsVroCy0FGxFQZjd71pGtvV1cI8bTskLWJrTh08
         SChzDTT14OaG5coupAv5lSlRhiFXqfNIQDAZvlcFY4npUD0KGd1zcNxdoEyzVqAHB4PH
         8LKwk2KbZmo7jQD0ynTVbrkaAiOIn7nfroPPUXUHQ+pUkeiqMjM+yANRIKIeB9Fzr2A8
         TLv/ZztSKopL+oT0gIMphE29mTQy1+EiLWYQ8crLFcnVT0+wvxaLCiehNdQgarmMw4ex
         0lv8bmClzLNBXPl3tYDzabeEek0kqaTSE8reToEVlXAIVzjQgONLcP9VIoxZp41gVyz+
         kqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744910582; x=1745515382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjbBi+pjpYF6x4ayVnEMHrCSwrafIYoi1gwG/mlXe+w=;
        b=CiPCSlZtqx1YCdrlp8Gqv2K8efUe1wwvmbXmWf+r1u53ThUjjhOEgHSF4awX6lDhsL
         TcPTVOQ7LiXG1L3Z/7yTPNrysYId+0q/CHO5ulK1S4m+MBWPLYSlWRuxZTIhRSu/IKrI
         /PTYQToEoS7coCyl34cHv7OuPF8MqnzzYnQVZ9MbyoBnZQ7QvWqII8HgdqYvGB5cKttJ
         y/LWvH4tjnt41uPA+P31zckN8uFvzOj+r5PDk/yDHN481l2zm+os4czRSQb7KOLKg5aH
         nI+IEYJzm4p2m4LVZyHbCxAptLFRefyW0o18qYg8lYoGbB1Y04dPslpTkmnRj6svz6MS
         MuKA==
X-Forwarded-Encrypted: i=1; AJvYcCUpKglZ8aMSVcm+FLJADSjw0hC8KaE4xDakBAoLQfYStMXNw4t4fHxShLubGMzq8rMf8XPAnBq68+1QkNYIOckMYa6XWw==@lists.linux.dev, AJvYcCXBkMeQZX0hPOwao1GHWWZq9usfDVaS9Bceeh820izZ0e8CxkXspS1kWmbck1nn/Elh0z9UsFKLSoT9uq7vEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywsz+NSQCmxrpCazOjJjpbNl1oc6Tu8fWi93kPFrcRWlh+372cE
	IrqGMt04XK/zbjhovyRYcDagxFR+I8uRCv1ZnwoWi6NYSzCTGHr7JLAZ8u2/5SvWzYpxiO3mStI
	CEFzDcn1HQNTX/uxlOIN0/PPanys=
X-Gm-Gg: ASbGncuyoj9JUvKbXbbrXPmKr9NcZPwfcvdP3aaJ4H4aRnUT1P6g9mgDQwCXlZLmwQO
	nPrjZBg4vJ/v9hwIpwoPYgXqS8slRgyPT2ltxOcZEXx9uv2WktlGYjQ2y77Vx1d2ffpVx1xeJjG
	3w1jIkrvC/MlZIWJ4fIbh/WOAbc5akC0zEKOILAHb5F9lcW3EWdsobgA==
X-Google-Smtp-Source: AGHT+IH1R432djUArtqSJrov+jLeeKK7G5xyysfPPLkP7YEzAl8zKUnp6HImxKs4Ip+6mwoVVlinZORD3Tm3ypgijEI=
X-Received: by 2002:ac8:5787:0:b0:476:7199:4da1 with SMTP id
 d75a77b69052e-47ad813bbccmr120921701cf.46.1744910582249; Thu, 17 Apr 2025
 10:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417143220.572261-1-gshahrouzi@gmail.com> <cd50b4eb-ef6c-4842-88cd-932042ca2629@baylibre.com>
In-Reply-To: <cd50b4eb-ef6c-4842-88cd-932042ca2629@baylibre.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Thu, 17 Apr 2025 13:22:51 -0400
X-Gm-Features: ATxdqUFI0LdVPLpa26nw1ypvRkXPxjdqsVqmWuFga-NKkYCZCKf0ZqJW1TcTCp4
Message-ID: <CAKUZ0zJW6ihoNTu_Lecztn7fqci31Q1sb5oJJHcnAw_TxrDFxg@mail.gmail.com>
Subject: Re: [PATCH] iio: frequency:: Remove unused parameter from data documentation
To: David Lechner <dlechner@baylibre.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 12:17=E2=80=AFPM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 4/17/25 9:32 AM, Gabriel Shahrouzi wrote:
> > The AD9832 driver uses the Common Clock Framework (CCF) to obtain the
> > master clock (MCLK) frequency rather than relying on a frequency value
> > passed from platform data.
> >
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> >  drivers/staging/iio/frequency/ad9832.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> Please include the driver name in your patch subjects. Otherwise readers =
will
> assume that this is something that affects all IIO frequency drivers. I n=
oticed
> you are doing this on all of the patches you are sending, not just this o=
ne.
Whoops. I thought that would be redundant because the information is
in the git commit body. However, I realized it would be useful for
people quickly glancing over emails to categorize them or get an
initial idea of it solely based on the git commit title. Therefore, it
makes the most sense to be specify the driver to indicate specifically
what the change is being made towards. I'll use this convention for
future patches.

>
>
> [PATCH] iio: frequency: ad9832: Remove unused parameter from data documen=
tation

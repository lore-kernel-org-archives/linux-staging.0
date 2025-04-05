Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0831A072C;
	Sat,  5 Apr 2025 11:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743851750; cv=none; b=NgBMVJe2O3oW8HX2SbJ2T3pIp2O2gIDYS/7cPx+J8VFEY0MjQ8nb9946AQKpJ95i05+C/SI2bJ1XN1RdrksS1FFHjkcPrgBz2qriexYpqkVg81PA0+NpA3JcMwbhOnawM7u8g1Ihop7DCZuTul7Nb8vAVhVRvlH5+MCBMwJzKtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743851750; c=relaxed/simple;
	bh=NrF2CEqTwuXEdbtBq66rFkkpMx1635ei5AerzCO+SzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbceSaeFNXhQ7nLQfLR1QwsKCPrgJE5PA/VaRdkz6L7QQycJh8ppi17NqRVoI+MCfmh7efRsAlELwKCOOLgW6LuJB1HnZYI82mPun/RSzlRVQd2752GK0LyBVvACud5sjzIYGgL6LJH9T9r0PEqU1T+09C1G80zU7PWXXZO/8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhHY3Wli; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhHY3Wli"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-525b44ec88aso1453253e0c.3;
        Sat, 05 Apr 2025 04:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743851748; x=1744456548; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrF2CEqTwuXEdbtBq66rFkkpMx1635ei5AerzCO+SzU=;
        b=JhHY3WliEjBA/pS/UBdkphmpMJRzSEfjHPaFeTrC43rPN9CcXR4KYRi/51ZKhz4m2s
         yJPFNRuApD3pFZZjFlk+Ypw/y5FVHvVOtS16IvVT+cQsQJlBsM/l5WQeLRqM60uv1eOS
         s+cPxGyF9A1G4XPVi9/XCChOqRI8Qz8Osx11vAE77skwCVVDFPAVY/nYHNEpwQmaKQac
         tqLEe5fQ8f0VyU4GmTu5jB9DPqotyZ08QBvejxomQOaQWOBZy1a513hTgMwcFUdWnLE6
         LTrg38nXr10CtKNaK/HGm++KhyOVnFhuax58A04BrhL3o+iK3Q7rngCUgaR/4JClS1xo
         2nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743851748; x=1744456548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrF2CEqTwuXEdbtBq66rFkkpMx1635ei5AerzCO+SzU=;
        b=aMU/BQJLgGaFFSNswBXv3rGVG2aWc70JPIrZ/jrBt9fiPFVQmPySnDQdtTq2uizBt1
         XMf5PWIhJngD/iltaUes1oluoT4saz4EB+JPAxHsqlgWvZlKjw33e163X4ZE+VQm2J45
         WJyzYVss1fqAvqhZPH4t9bksRiD5qY039abioX4mEWKevOsrMEdZ02vb1/y63FSk1bZg
         HixF6BH+Q5jDc8kzm+mL3dAnoBOdPzBmmRveCJ2U1EHZPVy0RSitcFNEUA+8qxVe/nJ9
         8QTy3J4WeLeNK0AUDpB5XjNcnthBn1A+CLjNAv/7D5ZUbN78MECSuzWzryQjXQ0U3NlX
         aFpw==
X-Forwarded-Encrypted: i=1; AJvYcCXiMrYYLVxgpFoYQHE5xqPQK3cdnMl4As4knyv1QCQxvPxtUtqlEyP4iZJttraO8s5drOlyxEZbBLRKyX0H@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7c9NMbF9HVhPxXZd8ATTzLyUMh6HGfd1jL5UJFancAFHkY2aW
	+5Z6mWq5YAKFK7WYh3s7zH3KqrfOCKwma81sjzW8VZg8xcYFeu5yYwZwfYMYihtbgWoeZC41b7f
	HBdximmGfJXZRuc4vgcb3wN5zgeU=
X-Gm-Gg: ASbGncsxzumR6Hs/seWYrY4Nl1K5RYnIlnVqTUqYe8O+lFFvpTrGQp80R3e+FRL6QRw
	3R5+AsLlThZPyw0icCZ6xXBO5jYxnTAYK8rBalxcj8910EfyLOxkGKK6lE2rSn2/QeJf0zKB6Fx
	P026VmBMHHDDDN07ETqvf08VPQ2ukL
X-Google-Smtp-Source: AGHT+IF+XO7H72mp9nBWh9nuR+u50y75Y6SGC5FpR7Val7PMcolaV9LU+iIqzW4xjbS8fbNZNqXbjiaqIknPpMENavE=
X-Received: by 2002:a05:6122:2506:b0:518:a261:adca with SMTP id
 71dfb90a1353d-52765d6b697mr3141192e0c.8.1743851748233; Sat, 05 Apr 2025
 04:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com> <2025040505-blip-mower-bab6@gregkh>
In-Reply-To: <2025040505-blip-mower-bab6@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 12:15:39 +0100
X-Gm-Features: ATxdqUGKaGa5YZEZwrnLGDoCzWkMJGEwLMILZyPLX1EnBrAJYbZ_j6woBsFy5wA
Message-ID: <CADYq+fZyKSGihR8YbAXbGii9YCy9CG1UcLQUHhD0S7ifsesu-Q@mail.gmail.com>
Subject: Re: [v3 0/1] Unnecessary code cleanup patches
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 9:37=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Apr 04, 2025 at 01:02:19AM +0100, Abraham Samuel Adekunle wrote:
> > The patchset modifies unnecessary duplicate NULL test on a
> > value in an expression, when the value has been NULL tested in a
> > previous expression.
>
> Nit, the subject line does nto have "staging:" in it, so I don't know
> where this goes.
>
> Also, it really reads as "this is an unnecessary patch" :)

Argh, Not what I meant to say at all :)
Thank you.
>
> And finally, for a single patch, there's usually not a need for a 0/X
> email to describe it, everything should be in just the single patch
> itself.

It initially started as a patchset with modification for three different
drivers, one patch for each driver, but two were dropped from the patchset
for being media drivers.
So I thought I should add the cover letter to the only patch
left in the patchset so details about the changes can be made known.

I've made a note of this. Thanks.
Adekunle.

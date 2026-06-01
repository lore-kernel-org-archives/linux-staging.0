Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269B42FDC27
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332363; cv=pass; b=AiF2mbYVr7/uySXFkaI77hG8UyflqlNmPZCJ1dWUebRcqltTY+lY4dbORfsCDFHgMErZmbGa6GuEeTliqNVCRxIOhNK8Q5wC11YSI+hwywCIECIwUPpJS6yo+2G8sefzgAnTVb7pFkcbE82OiBOcZt3T0AyMWCAWn2/B3Izbn3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332363; c=relaxed/simple;
	bh=nozntogzwu8XrYMaALgJ/9r5EMgDTBdhZKxzPsTSeOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqjScm1LBjvdOWQcD+WvAvG0+mAWjGmbMnfu1TolFnxFAmeWB6Y5gvN9WrOX5I0ILQA08S1zyIwEyi66Lxlmlv5esHgG3tqEIv3M+2MEyxymczRQVF9Yxe9eCSn6HAzh4ZKdFYhtVwBnZGpHYoJkk/JMVSptF2Fsgmw0dQShQX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4oX2149; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4oX2149"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso2033114a91.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 09:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780332361; cv=none;
        d=google.com; s=arc-20240605;
        b=D+7BY1uPOYYjpDDlb2zqZAakW3mUgGpTsX/K31a4GhVBR76YqLyZ3N+QJDUT05pDhn
         N60XrT6L+YNU/xhM7LrSb0C1uTVoyRZ1iUCUBbqgB1fihkOO5Vio3Pe5JTTrytY1JHTV
         AySbh6dJcd6+ivnkSQ4APg6HoUie4KuUOtN8tfwTVSXVhKB1cN+im+/lNCMYbUAagwT4
         nPvAuihZsAyGgMa9pt5SpTcoyXdVHm2hNOyveDCs8L/Q9nlSiSQfZiSrDZME1+MBrOXS
         BRWuETQLow0nnRx8CQQyYY0Ae5BPf0apAYGvDfIIPjzOwV3ZAfn985e9agsG7YGjAkei
         bXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ANhlLkwHvRoelO6mK6br0cQySzE0loZY7WZgKnNoyg=;
        fh=gzmTxBuTc9hcgccD8Fccv8y+gj2LD5m+4pOBOrHnB+s=;
        b=V1XtvC5vASdEJRZbR0H5DgmIrJde3zJsLRKqLLVXx40jTus52CHe73cnzj9kO1F415
         smwoX2cOcGvzUDcga5N7Qm0ZZhVQ5bxaFeyB4mkAYL9tB2YAfFKoZwlwr1IPwmIwUta3
         ZMFT4MZY8eO10aNaFvOLtARZo/9k/jba8ybMivlFaIfnt/qtXthZ+PgG9q1j5/Msu/Y6
         nCh/plyl5w7LzML1mxshMhg3GPSCUi2/ojbp8fSN371WVAJuV6WgpF6dnyDcXv5SKPEq
         gmAYHKBYZVuhRac/5dBP3uMDiK4sxrwmwSkjGI7107iGtF5ST//wewc/vjF2w9SI0FwR
         UtlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780332361; x=1780937161; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ANhlLkwHvRoelO6mK6br0cQySzE0loZY7WZgKnNoyg=;
        b=F4oX2149Ss2xO6k1PQZ+SPuLKFoUoGnRJslvdXztViLz8NDP83ElohX3FxmrgqMh8G
         aSEx56dM9ko4pp0w4fOh+dwkqfd+fUKz/v8CowQZa8Kh3rmUF8quPJkQF8rpMcVsuOH2
         /JTSDS3HeLll5gNgCAn3Q1eaSa30pd3OS7KUfTvMrwY8G+ukyGdDn/Ke4YN2o1CC7d/d
         4PCCiEVIo4cE7aAUXi+bElvMGaGAiglydfZDtSvIdtYhxmb7aSLQXLLSkE25GkBx6X4e
         4SYL6n4bCGgfB7mFMA5ET4gCBkJlL3dU9Ton6YC6U02ww1MlB+Yb09weNqE1bbrwQfkR
         i8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780332361; x=1780937161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ANhlLkwHvRoelO6mK6br0cQySzE0loZY7WZgKnNoyg=;
        b=jQpFJ8sEWDpsngWliTWIZmSTy6XrDnk/+I11o6H9kIID8LnHgaBFWrZWuBagHbHdqz
         ATxesRPs0gzZWlJSPiI6xKE5kHxtv0MQefm/mpc4EsZrIBmHXcl+Pyb5tyg1bMt6wCy7
         kFET9a9jR+1MN4m0CmsVy9F3AjUsJ4iZu6ddbbMMprajKtfVKPiULqNg0Z1BT2hGJvAo
         +yyfTthjS7F9wlfss0emVkzcMbSiOzpsEkVlwSBvGa+9GCSZMbs8OpbGW7wLWh1lK42U
         hWBPgfzvKRyf9hzI71J2OGKEnxTgDZ41h6fPSOQvb5l9rJ4tFjSSv1yuX3ffW5VdFCEr
         bfGw==
X-Forwarded-Encrypted: i=1; AFNElJ9H86Cx7GQD9+Hk7TE/NJrF8gq8p2grSRySUthCLkUiniqTvfJ3RailABBIigtaIzz+ROtulA8iXifTDhut@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+//c59eXZ95WtMmA01QjDBXto2SAZ3TEgUy/JiH70qikSLoOy
	qie93BnaCtIWChx88EztY3gswMkNOwSooPQKq3/pkKVqQAX/QGXtGcr2r5hT2yQ/G9uP7r7wfjK
	9klWWRHGdxaXovEKkFomZTVk0LcvjJfc=
X-Gm-Gg: Acq92OGIWLzB+WqtJNrFXbVRK23nPjQieb32Kvgu4qej7qAAMonogV3H5o8zUgEhTRk
	MUZU0Z1IL7/T6iMc9voO+Y6ePxlic+fLk9z1mhRyXHxdupEsy4e25S3Cf1+JMg9mcjK23b5y0HG
	E3Ft7WVxdUOG23fRo8P2Z+48eBXZ+jd8QxP24S9JFAKzoeG1NFJ+ENDhbROgK1lW12/EuEjvvV1
	D4oKqUXIMKotEmDzFkIaUrvMKftXFjxqST2w0026oWy88INX0V9fYDq1eDtA242iPeejqfd7HHo
	+FsZ0woBtHFiIb5xF20=
X-Received: by 2002:a17:90b:3a4e:b0:36b:ba9b:7efb with SMTP id
 98e67ed59e1d1-36c4fef39c9mr11682696a91.5.1780332361350; Mon, 01 Jun 2026
 09:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
 <84d8f2a1-6562-47a9-93d7-2d7ff33c31c0@lunn.ch> <CAD03fjah2GMedDtauPQjP0++3USpy6tm3AUemgAjVHS=5Nirtg@mail.gmail.com>
 <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch>
In-Reply-To: <8f7eb9c7-6695-450c-81c4-fb96643adbc2@lunn.ch>
From: Grewstad <dogestad24@gmail.com>
Date: Mon, 1 Jun 2026 22:15:49 +0530
X-Gm-Features: AVHnY4KRCdi0h0Pqu6KDLr2ceAipTIZUEfDFKMo7TgmBS2phs0b3-uUhiqQc9gQ
Message-ID: <CAD03fja5oG3-BrQoy4+LEmCWPYGW_JWDEkaPndjSVz=PbRj4wg@mail.gmail.com>
Subject: Re: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: Andrew Lunn <andrew@lunn.ch>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, jacobsfeder@gmail.com, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, hjk@hansjkoch.de, davem@davemloft.net, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. My research shows that no user-space application depends on
this driver. As you said, we cannot determine the subsystem without
knowing the actual end users.

Thanks,
Arihan Bhor

On Mon, Jun 1, 2026 at 5:59=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Jun 01, 2026 at 11:35:14AM +0530, Grewstad wrote:
> > On Mon, Jun 1, 2026 at 1:22=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > >
> > > In addition to what GregKH said, look at the vendor information:
> > >
> > > https://docs.amd.com/r/en-US/pg080-axi-fifo-mm-s/Core-Overview
> > >
> > >   The AXI4-Stream FIFO core was designed to provide memory-mapped
> > >   access to an AXI4-Stream interface connected to other IP (such as
> > >   the AXI Ethernet core). Systems must be built through the AMD
> > >   Vivado=E2=84=A2 Design Suite to attach the AXI4-Stream FIFO core, A=
XI
> > >   Ethernet core ...
> > >
> > > when used for Ethernet, a uAPI is not needed. The FIFO driver would
> > > just expose an kernel internal API the Ethernet driver would use. Are
> > > there any Ethernet devices using it? Is there a driver for the AXI
> > > Ethernet core?
> >
> > As I said to Greg K-H, it's 'chameleon' hardware because we don't know
> > what it'll be used for. It could be SDR or Ethernet or whatever it is
> > programmed for. The main thing is that it is a streaming interface.
> > But we cannot assume the use case.
>
> Flip that around. What is it actually used for today? Make sure it has
> the correct APIs needed for what it does now. New APIs can always be
> added latter, especially if they are in-kernel, code to glue it to an
> Ethernet driver for example.
>
> However, a grep for XIL_AXIS_FIFO suggests nothing in-kernel actually
> uses it.
>
> Are there any real users from user space? You talk about SDR, does GNU
> Radio use it? Using what hardware?
>
> If you have no idea how the code is used, you cannot say what the
> correct interface is....
>
>         Andrew

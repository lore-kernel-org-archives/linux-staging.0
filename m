Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2335025D1F3;
	Wed,  9 Apr 2025 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188802; cv=none; b=vCexXiTJWGZZBcIfS2PsROE8j3bBYwNWQIDWNuDSNDiKEcEF+LOyTy7xr4A2r3yisHKbop7yh99G3PBhSGJWLLmUYDRNZkERqhvg4ayRVoCD49TPCTh/Zs8WfSOJsOibNEWPoFiUeX5lspdo/Oht/aYnaiLV7ookg6n3WlnlYHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188802; c=relaxed/simple;
	bh=5LtHgusi0DYB4k8LoSlQMj6591nPND2Az8+N2UCeyUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X59+3QyNDwoM++mwM03Cba2BYwfQ3B4ZL9NDgIL10MzofPEX740smRlGUwSYxjNAbM2USVPNWa20tDSbVuuVcWDisDO5NCfd0q1oeWz9op8kPRy34lrjGvrfYwXtwJ3R6Q/imp4NplN/V7dJxFzVklsrW8KSLu9jrPmUW7r5qDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnvfJjTn; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnvfJjTn"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523de538206so2876178e0c.2;
        Wed, 09 Apr 2025 01:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744188800; x=1744793600; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LtHgusi0DYB4k8LoSlQMj6591nPND2Az8+N2UCeyUY=;
        b=WnvfJjTnu+Kvxi8lNM74BcgdGTSpO243Q88C+tLj2RhTY2596gXHTlsinPqXZEB0uA
         9pNC7JcCd/FOMwao1Vky86mwsbm3Oo9Yk/67y6Bpg+t8JjYhA4CFUrdCOAbUUNOArxRA
         +gpGZc3wH1UKppTSA3u3/ryHCPi75/7MDZZe8ZfRhiDollnrTPPszqT2mXEwbJyIxh9W
         zSZw4ENEMGWbC2Vv+c6O+fQtMa5tN2w1dZ6ZPbYBUkJMPwqbH3z9lfzKsrermS7rf9hH
         qhu2kBqKti25PI4a25BpVbuCJT2oCDVD+WFnuzpyyTUkt0yhWMGVZGM1uwfORTt1xBcN
         OV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188800; x=1744793600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LtHgusi0DYB4k8LoSlQMj6591nPND2Az8+N2UCeyUY=;
        b=gUdnSGogF4RQU0lXDMYkAyt4jZJrAhi91htiQ3xFMVd2NqvcuGEvwfOrEBZ09kypY2
         QK1JsXu588qCaFH4+ImRyZSLefRRyvQKZORnCr7tQjdf3p8SGynELt3WqqkXEsxxcEjC
         qrG+Vx0xN7rKrBYEKgdbuZvdEq4WhtqWXcMF3sOrPOnAegWH509zSdbgBhb/UFIr86Km
         Gn2aqIKJftP7SMbf0b8JwG4sYt5Tc1NHmR6t4VIOtkGJwAdqAxE6ajSB1fynABq7a5bo
         CLawhn4J3xPYhqJRgnEmXdnOBB6ZfVEndQV0Vx3I3UGodFsW8QdJtgJat/kEYlDN7aq+
         Eu1A==
X-Forwarded-Encrypted: i=1; AJvYcCU4qVnouTwiQTFUvcId4FfQlwe5fMlOhD7QzC01VnriQPknmb6ec/FyYHO87As9LuA4znOJgM9faF3LTux9@lists.linux.dev, AJvYcCUse0c26E9TZeCCNTRHOW6iFi+QzqowDc8XtYhi1aJBxLNTrlo19aqqTTER+y7eYtYXVHcpa5fq36pY@lists.linux.dev
X-Gm-Message-State: AOJu0YxUvmMpdZ+IbpJg8tRCl0Dt/BqPqDmqpgdRlIQNf8khgdcwsxUi
	qptcoYMhKitjg+oO8F5CuMcPHQ+c7/Ocv5ZII0Tgc64l+V1nOO5Fc+2gz8OIIRPTgADpk6N4ogs
	Y7Pm6wmva+D5+HpYYXNksp58ohGo=
X-Gm-Gg: ASbGnct3ZNsEb5JcgIvJOhQldYwNFS8QCfp+JKM7p2jeF/sdbSYaKcarphTvT5s24/m
	dJEC+z2aNyc4a1SInwKiT5c62RrxmyokomoWde/CsFvev4lLHW8a+xWyFYpEE/0aGkmHhXgkEVK
	LU7VD5GZG3KTidMJVT4GmM/DYS
X-Google-Smtp-Source: AGHT+IEN5uVmKF5wn9rZf6ilGSYyjwAo1pIYlP38TLCCIxdf4qZXt+sHLcFubwYXct1iytoDjzKBUGC6aEskhftJhJo=
X-Received: by 2002:a05:6122:da7:b0:526:483:95fd with SMTP id
 71dfb90a1353d-527a9e12274mr693131e0c.10.1744188799915; Wed, 09 Apr 2025
 01:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744126058.git.abrahamadekunle50@gmail.com>
 <Z_V70-9Bk-aZ914y@smile.fi.intel.com> <CADYq+fanYZR1UNJVR0iapynQeXTVEe1xPMMJHXHHCGc-Sc3B_Q@mail.gmail.com>
 <3878cce7-1a85-7f87-70ac-722cfa9d3e19@inria.fr>
In-Reply-To: <3878cce7-1a85-7f87-70ac-722cfa9d3e19@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Wed, 9 Apr 2025 09:53:11 +0100
X-Gm-Features: ATxdqUHbg2WozVzGaSYlAbtv3kgxsOyEjlEPeU5hvICINksNLg2KiyM6lqEiz0A
Message-ID: <CADYq+fYQHtiQU71w4-4V2Rts7mEHVxLEYbxJp7LnCQQAoxycqw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Andy Shevchenko <andy@kernel.org>, outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 3:11=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Tue, 8 Apr 2025, Samuel Abraham wrote:
>
> > On Tue, Apr 8, 2025 at 8:41=E2=80=AFPM Andy Shevchenko <andy@kernel.org=
> wrote:
> > >
> > > On Tue, Apr 08, 2025 at 03:41:55PM +0000, Abraham Samuel Adekunle wro=
te:
> > > > The patchset adds spaces around binary operators, breaks long lines=
 to enhance readability
> > > > and provides clarity on sequence number wrapping by using a modulo =
operation % 4096u, in
> > > > place of the bitwise AND(&) operation & 0xfff.
> > > > The patches are required to be applied in sequence.
> > >
> > > You missed my tags I gave in a previous review round.
> >
> > Oh, I'm sorry I do not know how that works, please.
> > Am I supposed to add them to the commit message?
>
> Yes.

Hello Julia.
Thanks for the clarity

Adekunle

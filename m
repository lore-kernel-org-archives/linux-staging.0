Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDF7263F38
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514865; cv=none; b=TDww24zGHc18CkAgZvzw/yDoNCNVFegbnESIr/TOOCPfjrUH6bDVXD7F5jOPQvI4RgCWfvPy7eKRVu+ARpfqA/gz5nO6+rrsEOJIz4ts+1TpaCmh9hRgtBzVMIT88zkaVstoZbnP7XgbJfgkf69+OGwEQ0h0ZTl79W9yjWm5BE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514865; c=relaxed/simple;
	bh=NPFd3R8ciXJFzWHMJJumcx2y8sJv394JB4rAdNTOTZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvIBQwKzSgqKaSLg6SeN+VihVAfE8hjj9CSW7gMlMXLVlUde/hVwQ0nMgrsV/+KFCzWQqzpDTWaECgz7gZZJN6X9V7PFcQJDNcAhOaj/ZUIm9e2IYjSYhNQpL6TXuT2TXR89PcvSYR5JrC4W/QBQxajVkBmdGAF1vKpDvEtRztY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfrIrQRW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfrIrQRW"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0b6532345so1027846366b.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 10:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514862; x=1753119662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPFd3R8ciXJFzWHMJJumcx2y8sJv394JB4rAdNTOTZg=;
        b=dfrIrQRWxE6sPbvw/nhfg8IjfhjiqFSwNLb8flN5ZWH1DzZ9zM36aRDFkhWCNzu+mM
         uTYDU/4zTrpXf98RkzP0tdcLgqdibggK1tCq2QWZ7AkgkOgsr34UKfUm0e9tHr9RUNOy
         y0yvP08wAwfKi2gAIOy0YcQNLhrB4Ib1AdDJDkQvLHEt/tQ2YPVHOXAI0YpkkN5b4FLx
         VR575wLV9gVSxLrcrLAfZHqnDLZEtF31LdzoDYJle2vEOMxtO4E2RHe5t0YyK8iCaVLN
         ziSPLzBrx6sCiSIjT4nQASS+u1vow5mAnBhRvAddI/45QOnxzBnpPrHM3xdeVzv7DptW
         CrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514862; x=1753119662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPFd3R8ciXJFzWHMJJumcx2y8sJv394JB4rAdNTOTZg=;
        b=k1NJtpo7hEtG+zrsq/4lK+W4nhL/Bq/fqpzVEpUeUjDBQR7ttVlU5WPUHY5rEWLJDQ
         hVMeYXTffIiv2cUWtiiFHpJufSYtNLeGQ6P5vEmwMy+kKmaW/RldvPl+ovxQvmVOx3/b
         TnR8tgqw59lLAOsz3tdhtQqeevmReaYjYiksMvbPVtJ3uwk9t7RvoX8E8NkCosp5Ge8Y
         iDyr9Pm8SY14M675CgzudmJ+hzNOHgOx3yD/l3fAbX7zo6KQ5cgGQ8vmi/6SOf37Xjy3
         tAl8q39bfTTAnxIMnjbE+jfJ9gbsQwWODUsz9Z3zNO0psVp20XSqUZ0516Sj6bUmlo9W
         BCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNQMJde9cKx66lw5sBoyUl0z2W5JFWAVdsDMT422tW3EjyJprPRxcWqARqiAGruCYmSUNkRg6+GE1Je8p1@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmkxgrs7FziLlUy9L0XCj2pv4/SmQJqyUIS9W0iCcRsXg5Wjz1
	kb7iJbVXs5hTPFbquZzoXIZHKAMOqRNpLveFybf7gNhMu0LpuIo7QERbjmfQNU6/3cktDYje6UP
	uMggoItcPJZQ9EVGeO2i6hZv4veP5Xt6A+PtC1MM=
X-Gm-Gg: ASbGncv7Hw0Bac2gbUm8lxznvOF6zbxxIZupKmbod+zY1CUvivSHyH53TTM/P56VAvm
	wR9MD6s2oSJY+0n3MVazFdNxP/5JnRyRm5q/gbFhEYwREsZdTIWQxrQMpYs0w/zxAYSWaHqxL/0
	oqqeWWrtoyRK2DwM5DqlC4KN+AYyOA7PMcjXnEhjIErsiaLL9VEOdiRo3EIIPNuQ8lNog8V3pMA
	21Is8o=
X-Google-Smtp-Source: AGHT+IEXKFgpazo2t8Our8NWjsZVR9xU7lCVsLBI4sXrZBBdTjy4XX9xQS1xqz2uAv9NTIz6K+dT9Chhb64cXkuf+g8=
X-Received: by 2002:a17:907:7283:b0:ad8:91e4:a931 with SMTP id
 a640c23a62f3a-ae9b5cb0f68mr48082666b.26.1752514861527; Mon, 14 Jul 2025
 10:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714134119.67280-1-jmkim@debian.org>
In-Reply-To: <20250714134119.67280-1-jmkim@debian.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:40:25 +0300
X-Gm-Features: Ac12FXwPYmMO1EkQwRChQx0VnT-S9mLxYW7JoqtZdWg7MeU_PNj3a38ix5xAwm0
Message-ID: <CAHp75VfPZNaQsUCJOyhmwUd+GT-mkujTz2o5Ofx6oRK+QTuSFg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix open brace placement
To: Jongmin Kim <jmkim@debian.org>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 4:41=E2=80=AFPM Jongmin Kim <jmkim@debian.org> wrot=
e:
>
> Fix checkpatch errors "ERROR: open brace '{' following function definitio=
ns
> go on the next line" in binary.c.

It seems you are doing something that another person is already doing.
Please, coordinate.
In case Hans wants to apply this as is,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

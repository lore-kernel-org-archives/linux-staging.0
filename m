Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A9A2652BF
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514782; cv=none; b=WksfRrRDAWUsrk3KHihzcm8e2GvTMY4penX9d9eY3od7HcOuJ2fySDfwiPFENgFguzUo0gP5iEjA+5GFtZ7swlKluIwVrYf7zjRoZ/HuzeyOdCt7OBLUoJCApP1xppOJQUHZzPQnxC2lgAn9leNznXuaG2fnfPtXyQ/nilL0gvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514782; c=relaxed/simple;
	bh=cU17IXtRjE/g5FNdfOe3IwcxfEOOWsaNIheB49OcDCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Za4lCOVGFjWUh/h4TkysWh6G/mJMMEcpFxYckGw4fFwTDxEdYzq2F5jzsaMq8GVWR8yeCTpUatLXZ9X87gbj1YzeYbLwU/QdHWy0Fs0rqdFuTIUrrY0+KVBTMX+7rIY/bzDx/LN/uSNQuvxtQ1lmhK/5oB5BVpZSHqdaz805zGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjJ4zG1V; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjJ4zG1V"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso961738766b.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752514779; x=1753119579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cU17IXtRjE/g5FNdfOe3IwcxfEOOWsaNIheB49OcDCI=;
        b=EjJ4zG1VjrzDx0m1RCVybvmYF3GkwTKYMimZpPpFcAHQz/DnfAKy5ZBq2yVfsrJsV7
         8olx6VWFRX96rD52bDtS9n9LH2jVH3jpEfGOhW6XCqkkr6zRCgvQgMW1ZYXU3lz1bZBI
         vW6i18H7pONCwunkezDLA+SPEZAXKuJZW6+5hqbV5OvEHPUXGH99eoexpd0UwEXtzlHh
         mltvemtEX9IkMO20Fm0g7txNRICISBmgNepydnXNF5jKD0Gpf4YLfZMrvzXk9YDGB7mE
         3eW6BryUipflT0xQpv7R5UZ917wSNgR3/hNPo95GzGAlfDAopZnhehPnRTRshE8304qd
         wPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752514779; x=1753119579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cU17IXtRjE/g5FNdfOe3IwcxfEOOWsaNIheB49OcDCI=;
        b=EtmC/mFiaqRDy8RxCTRikeJdV3v6+yydBY3L850LSSOqBMcru4YtWW3TwMS/q5krv4
         0AAla5GlRpSh+CbY6wE4lNwACUkA2rA7AU9qib79O8GnEjUiZT7uerZHjKrEm4bLGZdK
         iCD7oCw6YPUPD3mUjVhjpNzqknER8YJc9BH39C+ES7fPiedm4uvSHBN8fkhAhfwgSo3d
         G8Za15Ie9kBXmGutWaJQF0R5J1cDH0q+gwx96q3ajmjHQ4DgrrEpbwrybhO0j1+kAniq
         E88Ooz496WWaAzaEnUdET8ZMIE6D6dWDIUaXZIUiKCRCetBnJXs6EaiymBQsOrgoUh8f
         Kebw==
X-Forwarded-Encrypted: i=1; AJvYcCXTr803Z90xxTIK7kTnjMhrHhWnGkjOnDsT9/VIJZcogXUbcpzeJ9hVRP16YkvM5O/EBsTZsj9gGt7wCaVo@lists.linux.dev
X-Gm-Message-State: AOJu0YzJPYshiPg8KF8nMfoZNzqFIh2bUCC4mz7G8jnYGiJuQzE2O7BC
	pe8wUQSfRIVk66V53H7ogpZc/pIIUU8QhqaJOBG2ZAug4fjUhKFkAO3P/4CB8s16c85fqqrYPP8
	sgIxqgj7+9OQe4Nx8rIsMuZO2SnFB1ms=
X-Gm-Gg: ASbGncsKoHaTiJ81N1yB6+hDnSWSnqf7fTdpHFh6LJmYokCI0Ll64LIjG6VeFvN0EzR
	wLTqFWxqBmk6airmvhRHGaysffTLrcihBS7GHvJD9EjmY+FWjo7LdPXrQnOH7harE9LZhsgOJpR
	g4moR71xu+bablsg4efZPUf8jsI4/DB9fedYxIRoL0T/mPl08D00x7IDNalrHikj8EW/KO+XFvX
	Y/H3Qo=
X-Google-Smtp-Source: AGHT+IG1Ctij+EGX1otG75IANmHO180ycHXry+QJ4rItTcvUJH+rr2yhxqL5Gdu5+vo7pxYQKfgQS+aq2ffNK4FPzVc=
X-Received: by 2002:a17:906:c154:b0:ae0:dfa5:3520 with SMTP id
 a640c23a62f3a-ae6fcbc353fmr1520058466b.31.1752514778719; Mon, 14 Jul 2025
 10:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714140651.213850-1-woohee9527@gmail.com>
In-Reply-To: <20250714140651.213850-1-woohee9527@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:39:02 +0300
X-Gm-Features: Ac12FXyQ-jBnxVCHt_y6qgKcfWbp8xcmJc9sGe-gi8aexP5HNnbICg2NaDShIts
Message-ID: <CAHp75Vd1uaCCJptDz_Co52T50dtXcUSzOoz4JjUOz3PAX3N5+A@mail.gmail.com>
Subject: Re: [PATCH v2] stating: media: atomisp: fix open brace placement
To: Woohee Yang <woohee9527@gmail.com>
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

In case Hans wants to apply this,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
with the added period in the commit message.

--=20
With Best Regards,
Andy Shevchenko

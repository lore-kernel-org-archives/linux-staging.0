Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB58155C87
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 01:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764810217; cv=none; b=KkwHCs7GHHevHEY0Z09xoycbLOMbWId0e7eSE1veAP5CHOOtxH/iTxrjFqukL2MJ6g6PQv0PNOfreJUcB4h5oemO8AfAIbace8lyUyAa6hbj+XuFroA5LLi9AU0K1ggUNMKSBlWeZcZZZ9yXK89zAvJGbKF3RMSy/VtIi6UUYgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764810217; c=relaxed/simple;
	bh=z+U/HS+zSWUPiivxVp1v6hSxQRcXNBb6C3x99QEvAmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCHL6SU+bS5HXQ64Y6OaY9Z8yvX27/Bflitp1oddSv/NP2hHD56+ruizkI6kgWsyYL1Se2Qgmmsej+GP7vn/7JjzNBE8n+y+mATWnLyaoK4MdrdVp01w9OKqsCZG31TOiasiAA08OEfvKhj0n/I63OIJR3jM8HsATjVG+ryhdlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2W/HBhR3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2W/HBhR3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-295c64cb951so90025ad.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Dec 2025 17:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764810215; x=1765415015; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+U/HS+zSWUPiivxVp1v6hSxQRcXNBb6C3x99QEvAmQ=;
        b=2W/HBhR3WE3Yn2MPHPB+JMgQZ2giUV2lt1Xu5AY+sktDWfIAMiGDboXY1iBAoUh3z1
         0pSF4nCIHtPXBVBzKTq1qN118NBW3N6sT3YbQvcR7a9fpYIfYf+hEIR8/Dch2ODnNyO9
         EjUCQFZ/YHmXLOHO4qjPGYnoOq6TLK6oIi0CJ1DbIHCKiTljCbr/Qy2iDr+kVz/N1dOK
         NTTFHf/oU+P9/B/k/Bv6mSmopzqhv446xyMYT3ruaRy7TcWu++EWhOMkWuyAybX+UWGt
         RjnAO9j3rKn5ymInK7au1G3VO+q9M/NWiVAmp5v+bsuS7mjVpv8BElbS+4oBmSuoD5WP
         mPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764810215; x=1765415015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z+U/HS+zSWUPiivxVp1v6hSxQRcXNBb6C3x99QEvAmQ=;
        b=JOowHGqZSRgls0EuYfuE1pxvAZRCFg2tnLxFr0jYyAQmges9fxsiyRDeGr01MSwbQx
         Q7oaIx1wVw9jwbp9PJYgmZiv5cgw7xphArdQ1Hb7BeFQ+SP4c+Md+njLZdazU4T+Nmkz
         ua8fgexOfYzgxTudTEixGN14i7AeKiT7vxRCiSX+e2M6fRnpUxbXy1vydrW4HXdP22D9
         kO5zRyOoHkqahqj5erF0aNvbQeFNQ/ZsbYIkNlOzPJkuyG3+b82JwC5U8ARIyuVa2gm6
         s8VusEuPFPJRJka0cs3tVXwIIF3UqOGY3Evt8c/ioNuKPa8DTiw845AE4BugUwZNbD1t
         QYeA==
X-Forwarded-Encrypted: i=1; AJvYcCW2d0XwzRV6uiK+YrHxJg/SGQx6FKdfawVwUg6oyUoa8xSyDwOKNwM8N8FDRSqSxmyGHFCvaBhJq8MsxWxI@lists.linux.dev
X-Gm-Message-State: AOJu0YxyfJ7FskOAIFWU6BA9mH/fft52VjUI24lMnMhrtDBteqlIz4ig
	wpjwch7PpTMv0nfJhwVK8D82nal0xqLpURL4ZRDFo8DL7ZgObvbZJDllYORaEpBUm+EqRnPUjJa
	CfJ07Apg4B4p9SoM93sauaGvcBNtq/STiH2vSZWjo
X-Gm-Gg: ASbGnctYVoKMGIjBoWyR2YYO46xbkgBYiF5X/38IvP7+iwCGHF1bCegz7MI3NAxN33q
	VrZCnEwlagL3pS123M1jRoN1Jr3s7zClUEUaNDt7A/xPuOQ/BemmwBnjzAF0u53s0fJbd6TPJOb
	XA322KZjUaGn2SST4EQzw6LB8P0vXC8ymk6JEnRifunNgWQYOzvYsI0ZClgQrvi6HbKnSQHZsRq
	rS9N00Bx5i/iJI4cRLRP7j0P+EAXL6575nhLAVf38i8ze3xcSCMAQtzrs56ZTghK6beYj+jbkYO
	Y2PdEEVN0uwrPttLECHYLdyx0/XSnXD8Q/m707E=
X-Google-Smtp-Source: AGHT+IHGsIaOr+2sjAnAtvhVFv1oIb09ZRNvaPHqrxfiq6Zap9xUYraSx5C5I2d+2U31Gask0ZdLduLT64mxUmpNqh0=
X-Received: by 2002:a17:902:db04:b0:295:30bc:458e with SMTP id
 d9443c01a7336-29dacb15b9cmr766165ad.3.1764810215044; Wed, 03 Dec 2025
 17:03:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <176398914850.89.13888454130518102455@f771fd7c9232>
 <20251124220404.GA2853001@ax162> <CABXOdTfbsoNdv6xMCppMq=JsfNBarp6YyFV4por3eA3cSWdT7g@mail.gmail.com>
 <20251124224046.GA3142687@ax162> <2025112730-sterilize-roaming-5c71@gregkh> <20251204004314.GA1390678@ax162>
In-Reply-To: <20251204004314.GA1390678@ax162>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 3 Dec 2025 17:03:24 -0800
X-Gm-Features: AWmQ_bnv9xZyMTw06XPgCBCiPbHMBUnv_pUdGqpUXwgy1KdHSLO1d8rRz8SAq3Y
Message-ID: <CABXOdTfd9C06i8Q8fGMDyMMoTtZ=fwDTvWnM=Yx7g5-ABaAvcg@mail.gmail.com>
Subject: Re: [REGRESSION] stable-rc/linux-6.12.y: (build) variable 'val' is
 uninitialized when passed as a const pointer arg...
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernelci@lists.linux.dev, 
	kernelci-results@groups.io, gus@collabora.com, stable@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 4:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Thu, Nov 27, 2025 at 02:22:46PM +0100, Greg Kroah-Hartman wrote:
> > No objection from me to delete the driver from all of the stable trees =
:)
>
> Sounds rather nuclear for the issue at hand :) but I can send the
> backports for that change and we can see who complains before trying a
> more localized (even if wrong) fix.
>

Already done (and queued for the next stable releases). Sorry, I
wanted to copy you but ended up copying myself.

Guenter

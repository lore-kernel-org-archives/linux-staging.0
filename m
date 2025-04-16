Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6831487E9
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812585; cv=none; b=u5JXtn97mnkm0liYUmCxhaDsIx9JJQEukRNdL7L8Y/BF1Jtr+svTDwG8Ycn87kjY1PZ1Y+fmYWrpbHIvIOVUxOIY4U2C+z2exN/h88Y0i63ftIwQSUfuXy/KjymC/i+wJXAIeDCx0Mpyn8sEP4DsdwGkvszIvYvKyGBieGhpin4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812585; c=relaxed/simple;
	bh=FcJay02OXRgiKLviOP3wdoez0z47A0kpA1eKJc55HAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sd6suEEjihHQOomivZ90VmyT4TmHivUeNsQELJ48CrYBoHNdbWLZWFUg1NqS8tbLuELE7oRIij6AyWMwtBwpg48CPN3wKD30Cw2FU0xCx4YA2/WSHbaxoabpyOYVfxGINPIJX3u+o3PuwIi5orw/Yh9OY6jUGHDoFvNCa9tblD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asCVQQUd; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asCVQQUd"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e637edaa652so5266934276.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744812580; x=1745417380; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FcJay02OXRgiKLviOP3wdoez0z47A0kpA1eKJc55HAQ=;
        b=asCVQQUdOJE+a9bF1y4raFww05PSpJ/j8O6IvUDLY8O8kHBJbANIhIhP+88BE6Pi1A
         Sx0QDptiPAzBkiSUYEZ4zze6q+HPNTAe8m8frbZB3gA8sJ2OgW58IlqJqazJ4Lwl/P8L
         lDEZhPaxhXKFtz0ovPNm08+SzCf0BPoe/V28uXNQvollmTRIM+a3d8Rs+8/ZHRXsImT2
         yf/781iiSFYH4yjXC8ntBnqVOwljwUEWWB++SsJNtncwrWukhpGabHC5jpsCq2lp1ZPk
         fzg0IYsIsHjcWzcStadwT4r3XzilcFEtmEEk23qYXawqAE87BaxUbbO/+rbpl4HS7fNV
         6x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812580; x=1745417380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcJay02OXRgiKLviOP3wdoez0z47A0kpA1eKJc55HAQ=;
        b=jx2eDeI30HlUyhAG+KWI5uAqFwSo9syUhYn1AT06jjsbR2OusDzfbdlTrSM3duOKt3
         3iI9HnkLyahGcjm5cYlnZxOBdf+WhwywuI6q30N/bAHOwYFcvUQiDSja90Gt0ougEBN5
         EyLancc/QntMCWRDz0kVd8BF2jgfwFmy+zNMd1FsAG8Pq3NwouopNY+HnZOz+WlGnt7m
         rYpDVGJ8V/NQ72nFUFpDBNnYWaBYbapX9NCny1Qaly+W93Z5QFftqVlZ2iEW7u3Gkxns
         ZRj6tx4miGgFylirXvPIuGRm45yYS9hU5R/Nx89S8quSdN0UdDIsI+hA0oZPmhsmYQEZ
         Zo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfUZn+oOWn1DlLnYXupwi/p2xO9uBLM+X9UiJTnIUp3zkKWeklWlgjhQ2Zq4gF6cLVPBdRWtCnkUIwURZA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5YYzxJ6QzU2Kk5t2odwvEqRI3M1Bff6zVAKRunmu4boKPRP3N
	PIShMgv4PvgJosBP03w7ZRfIX58RUH3qTwWHmOiwbJJ/xy0YSPU26jlNl7OISshCLMATKDE5RbW
	HKoAb34sQTlQm2M0JU+Cpkv9AIsV061RZIW2gqA==
X-Gm-Gg: ASbGnctUVlSbGvGzvvl2cK+nCoALJi3/GJwyLMuy/u2IL6rbQygJybMSalj9aBOMMmY
	7IFjK7M82EY+1G62R2neBRqBPNIzCNtUZnvM2W7U0Rr6apAKHm181udpdYAcX+CltpwUfe5wWrG
	Fb2RSHAaMPHK+ByWpmXHVUXYy5kn9O96U/mLuCucQ3ga+Zbw0N0m+PELQ=
X-Google-Smtp-Source: AGHT+IH7BogyowVhZgdDdJ41SlGpngU1ACiv5K/50Yuk+QgLJ5P2BPxYjS2B20fpFM1iAX36mvGkHBEJCpEG+XPLOiE=
X-Received: by 2002:a05:690c:6c0a:b0:700:a6a1:66ae with SMTP id
 00721157ae682-706b32a622dmr28688397b3.16.1744812580534; Wed, 16 Apr 2025
 07:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416140259.13431-1-simeddon@gmail.com>
In-Reply-To: <20250416140259.13431-1-simeddon@gmail.com>
From: Siddharth Menon <simeddon@gmail.com>
Date: Wed, 16 Apr 2025 19:39:03 +0530
X-Gm-Features: ATxdqUFxkqVeEMkutQ2O9qZA2vLCBghk1w4Zl8nTIwNu3p7rC4e1BhIDGExKbXc
Message-ID: <CAGd6pzM6=A1=ioLm4C51Nc8TBai5sSELpWbLfShwScbxfs=HhA@mail.gmail.com>
Subject: Re: [PATCH v8] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	jic23@kernel.org, marcelo.schmitt1@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 19:33, Siddharth Menon <simeddon@gmail.com> wrote:
>
> Use bitfield and bitmask macros to clearly specify AD9832 SPI
> command fields to make register write code more readable.
>
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>

I'm sorry... I forgot to add the reviewed by tag
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

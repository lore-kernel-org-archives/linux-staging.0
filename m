Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C6637CD4C
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 20:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435086; cv=none; b=PuEPy01SR5vlRp/ZuQ6UoDoX5iLnRZqmSpZY9LDMmYTikL++Wbhi8Fk+GtXNS8s3fL93/kfIKMeU3FrlLMZkI3M2hByyJkIWCFP3U5y+iCMlpjUQ+nkXIxdwfucrgSgnDWapEgaQyPJj6wAbMiyZ1No3ykN8PtqecIGyYL+/X+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435086; c=relaxed/simple;
	bh=Z6rkF1Q9RevTynVLwPPE1unjc9tpTo6jijfoXQMTXm8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cFvQ46hDJH8dkkhmqEJHez47dT4zpWlLWJQKno24HP6lJPk2OTkYnd8y8T3uVwEjO0K/nj2EMsZLIapArYK6gtJl7Gtf3dTDikoG2X70sck/BmUotY2Aa/esyRjXphTv+RSmCi2VehROiJVEePK80dU8Z7/F3A0neCl2RPwiN1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmrz/DPi; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmrz/DPi"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7986e538decso22928177b3.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773435085; x=1774039885; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bNYnen/WIpTRvR88n+u56DIFY9ug5DpvsBdr7O5z1w=;
        b=bmrz/DPiYxHaufG0QeAsRiZcLr1bkIIjhoTDcjlgZg60Qs8RfsEZvQ2gZpsRNgjw7E
         KhqF/FAMNM82vMQtip5Gsm7588Y9Auh4rWvdbbTvRTyBsXHOASiPYNAE7/GqGd6x09GN
         dYxE/inuqmPza55/2U6RDihQBCJETmYQfmuBFSFfjzIKsWqKvLLUcFb1za7E5o78wJvr
         34dt8F65RHYjhNCGU30rhCsipw7XbfbwC7ReBx7hn4BCUdLAbNa+RMwk2rP9U6waVSdq
         DPSWn7rC3vXCSxYHOU3KjmurERrj7BtDwAP6XYfLWNWkSzhPy9hwkZk5bBMMSdmT+EOP
         BY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435085; x=1774039885;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bNYnen/WIpTRvR88n+u56DIFY9ug5DpvsBdr7O5z1w=;
        b=gn73eHWrnUOx4xns/6I/G628WIToos9Lpu7+pyCG9Ekgvi87uJHSokCEJ3zgdGHMe5
         rWpM70r4iVbwt6wP6oGiJu8L9kuAaSCf8FNELTJHDDyr7Ooz1u/D1JPOM2yAKv3z3EWX
         xkg4bcgE9TJ64jk+i0Kag4ezKse1eYuoGbF01tAWD8gQu6jSO7GPO38AkW/Xm27Funx/
         lrmCL4KDk+s/oGOYzPD3lL3XQl3R/tIbxfEm8GFKn+MeQycrUjULKs9OtBPK2s3xSEF4
         xXzDloYdVC3JBhk4Z5GPkl1vkaHuWAC7YOd1HE+nwhRH7Kir3PgMn4lcow9RVK+ZV+Gg
         njKg==
X-Forwarded-Encrypted: i=1; AJvYcCVt3wQCYUONvKDl/Kw39cDXOCG8y/b9UKE56iAKjB6OwLAfGWm4CHtitV+papOi4ISFzvERLyU93n++PwbI@lists.linux.dev
X-Gm-Message-State: AOJu0YxtFksYFuEl8ulkdRyhJYSoJFN0l/6Q4S7lU+d71ksD8/rOhBz8
	NzvxAVtwWVC38Mr1tonP+MPagkzv68rJ9CPLiS9HYGsyYY2XXmAQDr0z
X-Gm-Gg: ATEYQzznHHNnaseTRmcdz5krCiXiz96HXKdGmS3oFNTIrOXgTXK7Vy6gTFRjmP0EM+i
	6SHVTQgH6Z/TM2tWy4NZdHs6oS4uhrFOWikOS91YnKgkyqYUug9vlVe0nKwztk++ZUaKLWwGcQu
	fL4WROtGqDVbgMpyWC6O5DtdOvU+M0wci0iGKJQrOGRPi+vbTlxho5yeUHeXRfaR/OKZKrL29ug
	QUukn7/1SZJZgmLrX7O0gdojNb2OoVfIK48pniSMvFqcrkSsQOeGr6KqsX0XNLUrjOQH8iroMtl
	HVcBMMjgzdn02g3W19I+V7pdoXtq2xrN45KYRghVaH/oHAbL1AbBdVKXJlw22EHHxlgvvuH+EwK
	KcAS3fDJ+jb1TKopFlQkQAiBGkTWactDhuzcKILZ3waS82L6sY0h/Lx3d/PsgBU1q20ELyKRoOq
	bWHLw8VzmBL0RGDrd1bho5lGbZHWN0LNeh+GtxmYtO6ngRG7/7xo4FpzdCvq0/5htpBHZ/AOqLO
	ljcdci9rI5AbKPftiHyYa42N7Du0SSc
X-Received: by 2002:a05:690c:dd4:b0:797:f30e:45aa with SMTP id 00721157ae682-79a1c08b2c3mr53203807b3.11.1773435084797;
        Fri, 13 Mar 2026 13:51:24 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f4889esm50670757b3.53.2026.03.13.13.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 13:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 15:51:04 -0500
Message-Id: <DH1Y9HEL19NE.18H6NA9WQK0DY@gmail.com>
Cc: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: media: av7110: replace C++ comments with C
 style comments in sp8870.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7.ref@yahoo.pl>
 <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>
In-Reply-To: <20260313-sp8870-cleanup-v2-1-ca679e62f9b7@yahoo.pl>

On Fri Mar 13, 2026 at 11:32 AM CDT, Tomasz Unger wrote:
> Replace C++ style comments (//) with C style comments (/* */) in
> sp8870.c to conform to the kernel coding style.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

...

> -	// not documented but if we don't read 0x0D01 out here
> -	// we don't get a correct data valid signal
> +	/* not documented but if we don't read 0x0D01 out here */
> +	/* we don't get a correct data valid signal */

This needs to be a multi-line comment:

	/*
	 * not documented but if we don't read 0x0D01 out here
	 * we don't get a correct data valid signal
	 */

Thanks,

ET

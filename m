Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BC61411EB
	for <linux-staging@lists.linux.dev>; Sun, 23 Mar 2025 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742766611; cv=none; b=XyxOjHaMoLPJMtMeEHJ4xthFJ+7LrV35kubqBpNmUYykGxRSQDf4oYCC32MnsxVjipmV1zSCqg+/E3scm8PKHLivRF9EWWaVgWdPujsF33Uewp1EqvlykwI//0nAxDmeYnP+mEgVNadNcPIfIVMhv6i10oHq/wSlvFD1GrmlHyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742766611; c=relaxed/simple;
	bh=3y4rO/7RiCd/pFb4JYX3u+yiGImq7J+myMfUf5q/Th4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZApTT7v5YVeMfjsXYB5vIaRRFLvkvSX5kfsOxQ5uPP8mhuDsisJoKcErEEDhBFhtr6AIPTPbwMRvRZqEGzQ2lukGjmkwHdyEYV2j8UKVD4Nt/sWWx1nxfafGsbHBY/zcKhh26opwYBCy9jPrMmfQhBTCghfr/gUNgzMoA5v4c9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqHOkgEI; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqHOkgEI"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ff1814102aso34832927b3.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Mar 2025 14:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742766609; x=1743371409; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7YK9hSEeXlqBd/dSx9S0EUy6JtoDUxXqJMzcXGhHJVo=;
        b=KqHOkgEIO9KeWi+Qp/xZ0Fjlu2NAbkJ22LDu9HTQzm/Tr8bcLO8j5Y0qPKCFWl7RFV
         V0XPmlKc7M7n1XMWJbUUl1+DjIQ4YMPpUsdy7ymXqIkqYH0J4AuWn+0bgkRspfFkiji9
         ZybITpYETZ+mCLe17AqDPq9wz9/2zpZ74wwOa1jNiJdcQmn2gzrDSmkEaAQTYmVIYMyw
         ybt1cy787SSWCNMXsF/g+XJs7AonUVctjHWVgqvltRFefek/qGtvTKHY5MVwRgnYM9Ca
         JSjZJVoMhIhJDydW3wWa1g6cMErJaOb4jt8RcI+8yYH/Lgse+rbRXDTklX5VZZrJACaA
         sXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742766609; x=1743371409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YK9hSEeXlqBd/dSx9S0EUy6JtoDUxXqJMzcXGhHJVo=;
        b=G6VrzTrPjCV7Jbji2tjZi0eePT9oJju7GR5AiiB4Xr2OYcyKgT7x5+pxaOfvcjrjKj
         0OqcIQ0z0G1sLhylXZhESvgoeuIoROxvjK3gpuwX5iVpSC+oCYVYdvBwGgRRVCs4KAbF
         S/C5kJX4XC/TmFaV8Q9XdrxoaV6RejPKF8RZBpP5D1tybXpEWL2x8SN9OtJCdfH8+Nac
         tg5h9p9bm4UxLJsj6JoDBDecpabiKn4NQQgaJYY6GGnHaI4qOsUflwUIvQ3zUvqNKiQn
         v9tyaLN8N+lQYSR/GCLHwo+znsA7am0nLj+8WZD0++nYF/rYIloKtDh3nLPBrpxDMzd0
         IwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcda+WGeo56qD/JSISX3/9Ox0lPKcZ2UdgYgK7Q0h++tAZRbBybTrf5kaUgW1HpJlfkb7sqUfp3Zt67hL/@lists.linux.dev
X-Gm-Message-State: AOJu0YxlScQSZrv9KTthyGyfLpVrtaUATyzjdL429y8AV7NN8lrWxE3b
	igLxmLa94P84zU00w71iWo5x8wwMeDZvpLQVcSAjnmzxWaZzRoDlUnWlHxE1XXZhlsChm0oAcv3
	ZMaRD3xquPldXSUGJqAnOSyBrN4I=
X-Gm-Gg: ASbGncu7ev90awLDTQlECMuChFh61K74wLuT3BHHdBJbhlHSDr/7cDJhDSdMVUkPuzx
	2r72ggf7QRmS4sWNUlj+K3g+KERTv5qYKKDTOm1yKxN6O7ET5QRz48Rx63jnO1BW6Y6Voua1QoD
	hddeSLgj5e0c/SsyNB2yzQT7Ib1lc=
X-Google-Smtp-Source: AGHT+IFqkFmsnw65ljFJDTbRHivLD243CgMFBjluIQd/vQXLJ7f83WCWOfwcqnfLBw3J69EpfZSkekGFMg+9jA4O95M=
X-Received: by 2002:a05:690c:a8b:b0:6fb:9e2e:93ed with SMTP id
 00721157ae682-700ba45461fmr155678577b3.18.1742766609091; Sun, 23 Mar 2025
 14:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250322163211.253009-1-simeddon@gmail.com> <20250323120211.000b4305@jic23-huawei>
In-Reply-To: <20250323120211.000b4305@jic23-huawei>
From: Siddharth Menon <simeddon@gmail.com>
Date: Mon, 24 Mar 2025 03:19:31 +0530
X-Gm-Features: AQ5f1JqxnAyaVoEUute6A6Zj_lUmu0w1rFMtgvUA-U3DszY-WGtoSHNmAHudKLY
Message-ID: <CAGd6pzNL_TRfEhinDYa1Tveam-gvdV3dB976mRqOoE=vz+kpkA@mail.gmail.com>
Subject: Re: [PATCH v2] iio: frequency: ad9832: devicetree probing support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, marcelo.schmitt1@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Mar 2025 at 17:32, Jonathan Cameron <jic23@kernel.org> wrote:
> Marcelo gave a Reviewed-by tag.  This time I've picked it up
> manually but in general it is the responsibility of the submitter
> to include those on new versions. Obviously sometimes things race though so
> maybe that is what happened here!

Sorry, I was unsure whether the tag still applied after modifying a patch or
if it needed to be reviewed again.

Thanks,
Siddharth Menon

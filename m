Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBE33932E2
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614862; cv=none; b=mX9a4gwtCu4n80xTrcE+H7ItsIQ+DFlptfQz2I2ytTkbRnR/wG/7mlbmbfoX8USrWcmZzhRCs2pZfSqfXvYMc20iYrSmFSZFY6smYuT7tT7yLjNBKHM/ygtgSu4lvBIqy8xhFIU3GwaCbwN+Y7wlzEP2Lg4hRq43Rk7sO8A50/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614862; c=relaxed/simple;
	bh=ZUINjc8GDGKRHjYUkVm3QNq7keLdUONnYMboAhGvVWk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Bf29INQopR8z+CdpOJd/iuLkqRf6sclKGA6WU3gRUNYv4T9BTa7Y94kA3r/TEmQw8vjRQ8Fl2qV3nRn6xvEfiaxZ71yLToGxBzLhJp19Dd1op+ZZJsO5XONDKg0S2StV0S1xoEGEH1YBwxuFXbxVcJtQjCQXADUEVPKJv7RIqNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMoWd9pT; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMoWd9pT"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79885f4a900so37331307b3.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772614859; x=1773219659; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUINjc8GDGKRHjYUkVm3QNq7keLdUONnYMboAhGvVWk=;
        b=aMoWd9pTgTsAEty/HKLp7DaCxycxft2hHbgOrsqikwpvYrMMGHA93sx8toR4+V55kN
         rLrmNt2ismFIWh0sdJInZsrxZzyKlT/sP9fWft4YxYDhe7ZYj4/VT260/2CooLfpD6da
         BpTMtB6H8ux8fZ+Z+IZ3x1whNs7Szl+QSiny3CTT/a/R82A49gUA67apEqTSu/QCljfZ
         ogcqg1wFIYki8p8E2pqiPlR7YSjA4wjVca2BXdjY3yfSKmolTZFtb5P2BE3VJeaNnoUb
         0AxrdZeAuEegOw8fdeA5BKCYiS97vxscDfgLua0ahXBOFjaLg4yfDyZKbTOaaTqoeBrW
         tRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614859; x=1773219659;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUINjc8GDGKRHjYUkVm3QNq7keLdUONnYMboAhGvVWk=;
        b=C8/8mDaLTitO94ejrc+OwozN9RDDvDcKFc8B4YyIEBfXRqFC4S21f/pBEIY1JhUiTO
         7HH9e2yKHwmI9NsmKf+mdX7usL+vsjpZe+Xq4BepEaUhIVmWopDJ8qnCTk34IdXmbpGn
         XP4+hFXGjgfKJKf4pS0O6qkRP9+zli+nXNW/mZzu4M3nrBHOBrNRvT5QRb1zM6sjA6qF
         5GGw/5jeBgjQP5IsR4+H+YaTHC3H6ZddJORZENghWLDcSV/UITwko2otNfS3FTCaUByl
         RZhSX6HEs6u6V7l7/GqvDQ0mmeL6RnGJv0wQomLmgcd3RdBE19U+x+FNBmr/OrDAVTSg
         IA+g==
X-Forwarded-Encrypted: i=1; AJvYcCWz7kSuu7KHETWXI+LnOXc7ZZoju8B8BWhYg6PeiEpv4UdU78RJBvxCy6no1gJbOgUkPMrTmZPfHZhbmVk5@lists.linux.dev
X-Gm-Message-State: AOJu0YxM/wma46zhki2/dKrbjNtE/wtlw22Et5OhzL5PRuBBYHIFfEcw
	d/GDqMCVNxXLS8NFxp0A0Jf5qu9TwnfQdfqH8tU/R+BkciT72dvj+YVl
X-Gm-Gg: ATEYQzyiDG2xZ/tJLjqj6WpYwh3eHl+AT4li2gYXwlfmUG4PJolmujAxsPy5yl62y0W
	ZmhgkA3WQirLwVg0F6XQEf1KKV9QMEmFn2tVjF7oOAJqndxsdpfnMER7WaNHE+o13+UkU230En3
	mMJtWFipa1OwGUlHBg7lErK0iyoizLeyPgHYAosicQwF6uSeTMSQFklNxUNcPdfriA8gMhklcWf
	qIoscxGbMAHDHs3Ekp6S9tT4n46TJDiRv1AOvCa0pbAcBiXOsMIHeQS15pxb/qvRT6es99SmJNk
	zGKP+Z07JvuiBS4I1tdlTNCpttRZL17Ofu9F6TmvCufSFvF2POxvzvWdTz6cboLSLIkF92pcxdv
	byW4fj2gRjBOxP2/qpnM/a9QjqbdUY/ke4h12fE1+6o1uSHzE73EFWgO0Iqw3LHx/siASdHNP1v
	6hU09r62enSB3Bvj6+H9gv27tE9lAJmzaM9bbCX9J3o/RJC3n0X4DipalBR62TxMOU0RoCM5/fS
	wmzoDI9EAEuXMsFtT79+FdQZ2ZayGkq
X-Received: by 2002:a05:690c:3513:b0:795:1d73:4d7d with SMTP id 00721157ae682-798c6ba1bf0mr9948427b3.12.1772614858716;
        Wed, 04 Mar 2026 01:00:58 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c8d209sm73590547b3.49.2026.03.04.01.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 03:00:36 -0600
Message-Id: <DGTVILYVFRUP.36HOMAEWHR7NR@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Khushal Chitturi"
 <khushalchitturi@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@kernel.org>,
 =?utf-8?q?Rog=C3=A9rio_Fernandes_Pereira?= <rfp2005@gmail.com>, "Abraham
 Samuel Adekunle" <abrahamadekunle50@gmail.com>, "Artur Stupa"
 <arthur.stupa@gmail.com>, "Zhuoheng Li" <lizhuoheng@kylinos.cn>, "Ethan
 Tidmore" <ethantidmore06@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove redundant blank lines
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303173844.47975-1-azpijr@gmail.com>
 <20260303173844.47975-2-azpijr@gmail.com>
In-Reply-To: <20260303173844.47975-2-azpijr@gmail.com>

On Tue Mar 3, 2026 at 11:38 AM CST, Jose A. Perez de Azpillaga wrote:
> Remove multiple blank lines and unnecessary blank lines before closing
> braces.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---

LGTM.

Ignore my comments about sending a v2, Dan pointed out my...
dubious point, and looked back at this patch again and everything looks
good.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET

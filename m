Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9476520D4FC
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770003841; cv=none; b=pRGy5aG0sK6MtDVv2VygHXuVihKVKI2LC1AYdGtKhbMQI65wK9WEVXpvmDMZ9lKR/LiHhDrObMGsWxfRo8QrEvFzq647zFhTyKNOy1U78yrkmmngjjmvPIJXQPPOF8Y1WTmWMd67r68Y+6eeLnZNaIZkYjm1K31/gqH99h0hDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770003841; c=relaxed/simple;
	bh=H1s7SUNYvrxLVpk+ZueYr0lzSQlqTfcWN+UySkB5jMA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QDtGs7E9ClZbuw8qmogHRoD/srq9/O5raYzBjv3YD6wCS7L9Z0kHG84LGRZO/0/ktGXje81JjKzTyVW3m7dGYU/IL2WCb2EVdTGj9DJ7xXWctn7+NhwLyMlXeQPwVHEU7BJTFNmuOUrdgkpTRAn8VGDtO7aR4kkGEKfVCOoQPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+ArMSZE; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+ArMSZE"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79274e0e56bso37028827b3.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 19:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770003839; x=1770608639; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1s7SUNYvrxLVpk+ZueYr0lzSQlqTfcWN+UySkB5jMA=;
        b=D+ArMSZE+oUXkCNiB8FKyGP5XLu4yvYYoMabIaY3Eea3qyN5DOVs1Q7MWnA9zrKfqx
         3EVyowAzSYtGbkjAKANVPycCujg5OMXVaax37FxPdsnMl1PCg69l4pXKDnQroNR/aE+9
         BbFh8rHPmCyix97LuhTe6QCNgmZel29lyk8plGTfZbjtbjeoRi+XcOJDVIAtVQbzPSEX
         nL9iHPyqaBJ3NcSVo9mAWBVVhgz8A+NmhHFEkB+S/pGIzrfEkiaZv4BNgZFlYRGpvNa3
         uOQujad1xYXWaicHQXbZmwHFoLjbdjJJxngELCMyLxph3gCf3xUIWrqvq4+jYBYB7RMz
         j/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770003839; x=1770608639;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1s7SUNYvrxLVpk+ZueYr0lzSQlqTfcWN+UySkB5jMA=;
        b=WUyV6vg22fB+7tTYWpRvA9hNESW6BjzzYEKpWtL64NwI+6jFjDoTNYl647IVV6iCD1
         RcbgDBlmnEV7uU4U2EHDhc9FSjaoC0QjAcQ0qvHn9o4xKKL0yE8trZ05/MQ6c2DaBOdm
         OiF8BB4ghwm1jNojgAaurPQ8W9wH+oQMBOdz2ChZaksiEg/4Z84DOD+1e/lWF9j8cAtU
         hctuFSYt/lujuTB7Llk55ml+mTKqLXdxm8cJtAzQXFRJAEbnfLbAtIJjAiEI+Y9zx2G0
         eo45QckLvmVw+qi4DuwTnPRettoolTWmmfOmI45gud/t1GeJRZvig1H62U4dUp1HzSHr
         n3WA==
X-Forwarded-Encrypted: i=1; AJvYcCUyZiykYdDC5arb6RLuFlMKViz1GZr9Gw+EhYKYKVbMkQpngVNoH2b+9COVe/bHkG4yJFeqQKdVsaw7s4SL@lists.linux.dev
X-Gm-Message-State: AOJu0YyordwwXvrIu+bP/wKOjcdjOBbAwJy97cOMe9qvjcLPHRYYQJ6M
	0wfc3dJAvLP0fyOR6znv1xLIP0W40+1Jj//WL60bmLV4pK0BcMtblyTt
X-Gm-Gg: AZuq6aIF5aZzcdRZEqC6ItYwW9Hlj1FcnxxiLermBJZr+MS788MEcIHI4ZmOqFy9i9h
	RGNWXQZCiXxkC3iDHqeUFV3+x7Stzar4w6gmB5wkNYFZ3UhfCKiczfO7dPoJtIdiZo9gM5+nJLf
	QhrQoD8NlImM3eZphousU77oBgw49EXg1XCcDE6d7IJuHKQgztwtPhjM/l1+Pw6oIy2Oaq2TDcw
	BGdYHQNc5z9ftspdL5Xtsf+wE6OSKNmToSY9bKAwZR3f5xKqmlH9jiz5N/KElHSgV6c5M0Jwjh/
	6FcbfEGXgLZ3iCuNseAbE53HqqklaUOCfXwQNhXgdEnRYlSloIDQuqePhbp4bCoieVQuuIFXshI
	LoWOBEYWYhQSRsj/UFE1Va+h3B7QA9qBgLohwZas0TG9L3OPB9T0QSAoyJ/lcGERN46b+F+RRD3
	GoWOsez8s7mCWsrOfVIsvEDpzyUIiFgo0=
X-Received: by 2002:a05:690c:399:b0:787:cad1:bdb2 with SMTP id 00721157ae682-7949e060c04mr82379887b3.69.1770003839194;
        Sun, 01 Feb 2026 19:43:59 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794828cb304sm74278637b3.45.2026.02.01.19.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 19:43:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Feb 2026 21:43:43 -0600
Message-Id: <DG45ZMYPENUQ.2DOGOIGXSC4YL@gmail.com>
Cc: <dan.carpenter@linaro.org>, <straube.linux@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: use unaligned access macros in
 rtw_security.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Archit Anant" <architanant5@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260130075113.34666-1-architanant5@gmail.com>
In-Reply-To: <20260130075113.34666-1-architanant5@gmail.com>

On Fri Jan 30, 2026 at 1:51 AM CST, Archit Anant wrote:
> The driver defines custom functions secmicgetuint32() and
> secmicputuint32() to handle little-endian byte-to-integer conversion.
> This is redundant as the kernel provides optimized standard macros for
> this purpose in <linux/unaligned.h>.
>
> Replace the custom implementations with get_unaligned_le32() and
> put_unaligned_le32() and delete the now-unused local functions.
>
> Signed-off-by: Archit Anant <architanant5@gmail.com>

Looks good to me.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

ET

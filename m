Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6955721A459
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 03:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773632042; cv=none; b=geBw01S24yOl8E+iGNBoQfJJ+RgBXOBB0f2vOawS0DLSC7vtgOgGt1BqMgMsKlBXkkMNrylkKGdx48p3eAIkQPAean+y42Q39DZv0PSTE9nP9rjwYs1YyEGDF0boQfPQZ20DbKTD1cLI6mlBZiwBADEvRPE5rFRlYfQLKPgk7eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773632042; c=relaxed/simple;
	bh=N/VnBxRZuZcYNpWXExSMCUc2g8qnhnF+0StuxD/qCOE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GXl/EnhwUZ73N4tsY48OEVGMWUHhrDXIR8p1sD/rft3PvBnI6ZxXih9NqEoEjZdNkDrmhOP+7otKxECzMkrK1l6euaA7w6sSb2U3nRULIgs2ItaKT3Xo3CkqsF4vHj833r/PVnAB5wcCyLDPVnrewsnPtBpsqXO2FzV2ugx+HNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqXEfRO5; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqXEfRO5"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986e0553bdso32193137b3.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 20:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773632040; x=1774236840; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/VnBxRZuZcYNpWXExSMCUc2g8qnhnF+0StuxD/qCOE=;
        b=KqXEfRO5hDLii9/UA2X08CuLkVVf78qmxKxZfXat04D66mwpWE+lEFHi9t/jUbZpOO
         ag3qG7PhNcZu3ZFJmkIIfnvqgErMic2b5EKB35tydyYKIHo3IvX6gzAugu8ggQgVeqI4
         0kHphOPXvXp45gbtUZ3OyrxI9WRAuMQFNtuGGUjBEpA9J3pPu8KgfOtTYm+3AZqbc8NU
         GFg912LNiZEHTQ3al5Q2IZzqW/ybvdjWJGTLR7HpsCTCqfEZQDCW3dSU1tjwfMo8EkXF
         a6lV74QzVTq3/iSzInWxlbIbLisV1gxUzdsOTSPFK+2ydsd/tkpy9Q9CvLPdtltNeXnu
         QSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773632040; x=1774236840;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/VnBxRZuZcYNpWXExSMCUc2g8qnhnF+0StuxD/qCOE=;
        b=mNwNh2a2pClR19tLmh7lzWpgLB0tdkj4CuzN/VrjgmAdPxYGB9pb/dBkMGHFvMXPBG
         LmCIlkHTVlmrAooLh+jJejyqYz1mcNKo8g5o7nzdyAZ3c9NtG/bItfv0EdTRTauUStZb
         RrS4ydbAQILiHyle6s8i5SxBu+jvV/Dn4qBUkXpq+qHtbwo0o64OkBI+ublWex55xTkO
         XXrrJ+2FpwGmY54wwntxb3BjH7mppWMZy5fJv7E0lAc4qJTLcwg5aybK9nohaxZXBkm7
         tnHBWzuRwAWIZvW653IRmQM/z1AzQha3P45pdnOm4DBznBHiv2sxm7SF5kKZBUouDGzG
         PXtA==
X-Gm-Message-State: AOJu0Yy+VcPvgUsSc/YEaItVagrC+jO0DfXvL0/app0RM+w5m+myLneQ
	wz3X5oaR4fnfE/G0TEWEKG5Ew2YJ7PtR08RcbReQ6o3PbBBCkinC9d1k
X-Gm-Gg: ATEYQzwUwEySdMqBv0X9wDvzwmDG1wVWOnUlXtm6N3PRks9kRaITi5w/ByTMKN04Hm0
	ZDdpnc0NXAS/m0A/yuyQnXinoiZ3nDlFZj/gr7j1yCQZYSU8kSh5DC3L6DMDXVVBtvRPzKkfMeN
	iMCwGrTEQw0y5efx19P+6/hWbqyc3oZDY4dxa7RH6sUfaJhLSTabpUkGVsXu1cQ4qtvWcJy2BVh
	rQwnIGuyBwdEgUUoQTTVeycv0zJzVIPRKrdLSkvAHnwOEUS/t1gzvQueLKX7t7piujeSxsI/XeY
	94MnYBkHwDjTTsitXz+QUseq05cuuKhpMgvnCYrfsJT+YAQL9GInhJDJ72wsyw/Ltdyq2+jkos5
	bAyU5zYlN1FavB8T7nJS/cSXIRfBFwvoCfp6bp7YkRYPJzxxsbKGYrQrDc8gzDGGW/fdXa/rOEq
	YNiiRNMx641LOEtqEPYq5e7Yp7rlI8teAQOFEGGzoBgesc61fVorHRY36dUBbJmHP9F2BnIMT/K
	R4WFockf7ImlWnGJw6cGKYm94jSPsGj
X-Received: by 2002:a05:690c:306:b0:799:266:83c8 with SMTP id 00721157ae682-79a1c1b0558mr111194747b3.44.1773632040351;
        Sun, 15 Mar 2026 20:34:00 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917de8c0dsm80734567b3.1.2026.03.15.20.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 20:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 22:33:38 -0500
Message-Id: <DH3W2T1WEOWC.1XNWCCAKB9A6P@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <DH3OX3CFT586.2HUDPSK7M65AS@gmail.com>, <ethantidmore06@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary spaces in
 rtw_security.c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <abdlQzChJylv8evY@ubuntuarm64>
In-Reply-To: <abdlQzChJylv8evY@ubuntuarm64>

On Sun Mar 15, 2026 at 9:04 PM CDT, Joshua Gu wrote:
> Fix checkpatch.pl warnings about spaces after casts,
> along with other double spaces.
>
> Signed-off-by: Joshua Gu <joshuagu789@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET

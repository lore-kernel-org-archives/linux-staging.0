Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB2F1B042E
	for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771361076; cv=none; b=NbjVLDhErLFihj6qNgbJ4pOUHenfpRXW0B2v7FxlxNg4ZX90l1q3ueqRTwF4Gob3L5F3EeeA4h14EzPW9SjBMzRTDtOnpx6kJXG31JS7jeICVSa74TfSiU7KgKP+eA03koqEGdwxhcUABNb335jPpXhfb5toVQ2GkO/hCO1qRro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771361076; c=relaxed/simple;
	bh=xraqz6oAeDWHXJQpanhFiK5KtMlpxZP1rwypJBi7DAc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Q1vCvAqfzbT6CSkoNv3yrRPcNK3lqDr4nJ6mZ+uT3todcBBi1snPpXUR/3lTSUSemDGbVtvHcYV83Hp4uTv5/RyVOsmQGDzxUSSFeoRruBwOZ3VASa6wpOCMLcTiwiMt94XhkwTY7RE1g3P3YtVEvnlxp/FOGFdJodvNZ6sVj/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK7WRRRH; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK7WRRRH"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c70ce93afaso443176985a.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 12:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771361074; x=1771965874; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDTrjwCgrkQiE6misp2vgl4Q79L7V/FkAsh2FP0TYnA=;
        b=OK7WRRRHs5RpJevLlCfTeB0IO8aDiMkEFZYZhq5T93zIPcKJ/eJVGGjWUEFEhP62Hg
         QeZqXmL8+XqmFVyB7186f2qiLE+5AitcfqKAkz/vYfM22Sv2R5LE36FTTTUNMqzcF7kC
         eTXTaa33pLtaI+aI49LKRVUO2oGUU3nzZo/V10hadOIBPY/zfAGpj90yGcxGA4Sw2MuV
         se5+UqS5tCdmb2zB727P9ogr6tR5kXj9h8c9F09cX1NoW9XvEKvSm10PvXumviZhTbof
         LoRNRyLj1kX4ExZulZExdrolyNogWLvV6QSkFflcFaMvrlL2XIvuARAF6YVLsYzd7vhE
         QKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771361074; x=1771965874;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gDTrjwCgrkQiE6misp2vgl4Q79L7V/FkAsh2FP0TYnA=;
        b=W1aUHO8tY1a/F3KGAbH2o/5JX6AvUM/vvkLvVpxqzugu/MBKCkKevSsI9LFQo/LE1q
         P1NODQL6SNaweDF0BN25u+rhoC54Js8/jI/lsyWFMyMqcckdKp+Vfo6UCty3fdv2e3HL
         xij8W6Lf7wAJhUlTT38y6uIWhL2ElUN+0w4iQlow+UYzftd2HfaJIo81UvNgX4dO0elS
         s6i+1eKAL6ZBxp5yOYZx4yPCV66J17FK6elVgHO8TAkitW55/Gfl8adaQ8y3pmnUhaw2
         MCmwSKEqkPMo/PCWXPy2lCoGK1WJugohW9k9+K7SVYLRbNrYl8KBadq1sW5SfLllsndZ
         +QNg==
X-Forwarded-Encrypted: i=1; AJvYcCWwkbYbfMB/9KTRlZbV+y0L1lyfGk+onuJqH392R7miugJmmoz6/CNgHmJPjr0+WeHDVGw0FnUGsqFQ1O6z@lists.linux.dev
X-Gm-Message-State: AOJu0YxqRAuj7mI+Xz0y+Q4hvmENj/pUpQOvWP6onmOwY07NnnM4+gdV
	w1sXGjA1CKRVEWSgHDgp4bmXOUTsv4daLanX4l5blTnb7mNI6es5KMpiGVFKWnrP+Kw=
X-Gm-Gg: AZuq6aKM3+cKh+2uStEbS85NqCaCl9bV0lxTRwpaE+M+Dsh2QyiD5TeKmd7miFsOuBK
	FvXaYZYZ8h9A7OrGnZ1dtPSnYGScHiBWgnyuzaCcu247ZLdyYLou1m2KoLrdgi6eOcr8JLRozb7
	t21KtRU+o9Ta3biXEZrgzjdyD5mmVphOtN9lUH4dgWXrXjYUMuBNvez8Gg/8YrWZj2dcfCQ4PWR
	RlkWlGzFZwWI0WB/m2RhDHhbGtw6v0Qv+Re/8PM2yYA2EdNVAgyqp1Xqv6ZuHriKZuTN2QaANIY
	T+qu8bwvPbOuaDCkuaRwblUmPpufxAJTPnUich0DrTsg2kKucmID30fO/sPrq5oveN7fkgz2A8I
	qMl9V5HetgIAII1kv8i3U1R99fUVt1sWVdvXg86B+FIOa6tLZCI9y6R4iRuGMayZ0voVfPz5Qe6
	0vdlCDs5ODmBW1E8qvLhGOanPmS/G+B6m225HyP0BdqE/4YKXkKl6R0SHup8ZCtMePnY48gAnkG
	izKJyjE3SNMn4jHa9HiAOQxWusMjMr5Rw2VOrkUf33rDjN/r5Q=
X-Received: by 2002:a05:690c:e372:b0:794:e992:8f84 with SMTP id 00721157ae682-797a0cefa54mr119236167b3.56.1771355086116;
        Tue, 17 Feb 2026 11:04:46 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c254d82sm115204987b3.39.2026.02.17.11.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 11:04:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 13:04:29 -0600
Message-Id: <DGHGYT2D00KV.111X709FMZFDE@gmail.com>
Cc: "Michael Straube" <straube.linux@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: use kzalloc_obj() instead of
 kzalloc()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Mariyam Shahid" <mariyam.shahid135@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260217103402.4359-1-mariyam.shahid135@gmail.com>
In-Reply-To: <20260217103402.4359-1-mariyam.shahid135@gmail.com>

On Tue Feb 17, 2026 at 4:34 AM CST, Mariyam Shahid wrote:
> Replace kzalloc() using sizeof(*ptr) with kzalloc_obj() to improve
> type safety. kzalloc_obj() ensures that the size allocated matches
> the type of the pointer automatically, which prevents potential
> mismatches if the pointer type is ever refactored.
>
> This change cleans up a checkpatch.pl warning:
> "Prefer kzalloc_obj over kzalloc with sizeof"
>
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---
>
> v2: Resending now that kzalloc_obj() is available in the tree.
>

Just updated my staging-next tree and kzalloc_obj() isn't there? Make
sure you're using staging-next when creating patches for staging.

>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/=
rtl8723bs/core/rtw_mlme.c
> index 22dc36e8e38a..8cb9a760f763 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1954,7 +1954,7 @@ signed int rtw_set_key(struct adapter *adapter, str=
uct security_priv *psecurityp
>  	}
> =20
>  	if (enqueue) {
> -		pcmd =3D kzalloc(sizeof(*pcmd), GFP_KERNEL);
> +		pcmd =3D kzalloc_obj(pcmd, GFP_KERNEL);

You still need to dereference pcmd here or this doesn't compile. Please
at least compile test your patches before sending them off.

Thanks,

ET

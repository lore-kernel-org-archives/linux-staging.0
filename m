Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629612882CD
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769631354; cv=pass; b=EW3OcLNiyyR2sRGVC73KRhx9shMhsi68p0mxvJepOWmqTjK968qhRL8AcY3yhe5KFyEA4LPdjxiutdwuXH4bi3TfMjwmu53xwqqXw/M+/PSJ3NPrgiXgxcl+goXcNMf3x4ql5vF8GW06WDHzms+W0O8yeb7HHu3pCLHcx8ZkOvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769631354; c=relaxed/simple;
	bh=wfE3O22hCD/7mNlOVcWQuyXY6r5yQzConnpvVa8nubU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rsk8UkOPaYG1zQkqf7sQZIoWUOjq5VkbxAK64raNH2V+E8nUTz8uGMVyFgsMmajkfoX22EBvvoS8bU3Dn9kzoI5GEqqcNK20wldAb+VNqtjgRRHW6UR6BlLpClttfZanhoJGfyQAEZuFfkO5DagF1LW11vg7sgb1KdyKYHek+VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Po8AJNER; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Po8AJNER"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c69ffb226eso35735885a.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 12:15:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769631352; cv=none;
        d=google.com; s=arc-20240605;
        b=GKxApBLnUo+rXPDinR5NsMpU3KQOKyHTpDkk6FOZB+e9J1Qv3BhIUIVrmJiJSClEH8
         T+Pt6C9k2pNdJZ7zaV/ZM5zBgZznVYeLie7JT+jhRKFh4bHzxbbJKt9q/zEYr0IBgxJT
         dEAFBSLAx1rpsh8tnt6uzdz7oC0IN+o04RzrAqVMDNWMf0EQVfxDqxY/GQjSbTCzJVOT
         Q103LBtcF5GSfhzxtT8/fHcnvumBoC9pYEPEFuygrCbjTUwoDA26Om3EfHrQ4AVw/T5V
         Ed7Thc792V77qherL70E6s3qL9U8+DJFvaeuyuyJpvxM7PW0mrOI05G4FSH0ON+QiLyO
         57Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kgx43QI0Tph6o9g01BJZBvFYK7Y8Jri3Olqg5E/yei0=;
        fh=kxEGHKnDJCksq3nmpwWs/0updo6xuOoXW+CH/2YV5wk=;
        b=LlyOUspvYhYwEoBfDva0KWsJ6a4EFx0v5QONT6GBkaE9DAs85hS2LB5vMWcuzCUFsY
         4plu/R2ckLNorBXRYyMjccKHyew1iCTr6N4CTtYGVGHTgv2UR8wr+NSWhIr9DQp06lwQ
         0S9JlRzSd04hbWui/8OvNpMrWBmJyIy0h2zomb+EsBjhJPFfcYUskKG60KKI86s/xNzX
         9YOijknQ27NZhA5vOFBRSRrAKW0zQmuPfKkVWF3ZvLXYw5iZXQKLE0022oBjsTZBmEvs
         nxGmBKwt7dNG8ekR6ET4SENVBQbntq+KeAY6F6k87hd7cJlIRVu9mUY8SFuBQhXcuzh4
         PYSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769631352; x=1770236152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kgx43QI0Tph6o9g01BJZBvFYK7Y8Jri3Olqg5E/yei0=;
        b=Po8AJNERpELR97d51ZKB8MACOskY+9k0J0XRWCELjJWEgXE7kHOY2CpKM8AMKlBNjy
         gcWopfWN0F/Tm7baRE+zkf7un3HS00NMHIg7jczvl3JuiD7os0I+Blyr9yQfaU8ob3ck
         SQxEO1RNkd05d/U8ygtL8x1CBOPbYKbirX9hJ7jLCFn6lFUcG+p4yXGGGP/PHhEeQCPd
         2fvMu0nDyLKF3OGn28/kiqezRWAJr9B7N8NV38DB3s7rqHc248AY83aW08tRfqXxOhDX
         O/VULPyC+EhUOCQMQXCLJEtG8WvVRJIwRBknJKpONnf3d2BGKQirw6/XgmkO2ZyTf0yj
         T3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769631352; x=1770236152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kgx43QI0Tph6o9g01BJZBvFYK7Y8Jri3Olqg5E/yei0=;
        b=SDOU7hqA92nCwyAaNQRg5GUWqyjenOYrnDYzG14kbmQfcNOskOTnZaDWVYefDB5Gg4
         pQED3JZ2rJKXjhT7LSZvJRJ9E3tNL8FGq2nRcTgQCYHoynvxq2BMfDhFxP0gNVyYxf2r
         ixzemEqo4IitBU61vNFSlg/IM1T3cfKm9BZfmqIOwHtqRBxR5yQNVNlBApJdBDgikaik
         g3t/NF5zvkUVGSk92oM7neyurlARlUSoAOxC5YfyuXnJzZKJg7b5RVHPLtsQP0DOKH6Z
         mH2S8joU8fEAOrkD5iD5S9VumKC2qK7RgeIdhh8kJ26WNKITZd7yfyVFMsKH5AePFSXV
         oV8A==
X-Forwarded-Encrypted: i=1; AJvYcCUzo8Ru+ZoxSHAhV2koakg/BuBMd195jAbdltNu5/2eNoAXJ38lcsMdfMRzeB0/p4skMHDMWlYQNdLNmLZu@lists.linux.dev
X-Gm-Message-State: AOJu0Yx64eXQizs3ClGTuf2DBgyqiR4uuCCyPqVVbmKC/B8TbSGpwXnz
	RdSmEXyDOegKlkCQDzjT50iAlC35F+nZ4viv/kra9Y2allwkg18zE7PqBu4TvzZXIkwXLICmnh2
	8p0HPUchwXmVuYFtoo0jZgYLfhQBxm3M=
X-Gm-Gg: AZuq6aLD9S28JggHECLByifBpiDbZGBFeu9IsPUUVe0t8tVWiZoU8wuQf8tVvPQhGx6
	9dzyo+gw3B29se/o0TkmJzsZ5831VyJdlNpZK9fKdc1mLisWhkc34lg9AIdwwUOpdKiwD3oDy08
	xBBgsD4y17AeuP0g37CyGlT0r8VLUq9j4XwS2bEILgPY5ASrVX41c/ylwikbfNth6ukkEXrZA1d
	mJLk61o9oTl0CzkkLvqZvmmxwg6f9KjP536JXCnWMPj5bIRC6M0/zR7/BQra8ncqVHPlzK/CTT2
	7/+1Xs356g==
X-Received: by 2002:a05:620a:f10:b0:8c6:55d1:aa4c with SMTP id
 af79cd13be357-8c70b90eb52mr744527085a.71.1769631352225; Wed, 28 Jan 2026
 12:15:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128113900.44852-1-tanjimkamal1@gmail.com>
In-Reply-To: <20260128113900.44852-1-tanjimkamal1@gmail.com>
From: Ethan Tidmore <ethantidmore06@gmail.com>
Date: Wed, 28 Jan 2026 14:15:28 -0600
X-Gm-Features: AZwV_Qj3J48dmI7vvPHRgAXDv1HnTyPz2IyVZL8fYswvLzW1PBAv2OHQoz68xSA
Message-ID: <CAMBTqh1vYFeC2jwZ1mcpi_p865Eh=4FpFQdbhZ0ZEBkc4KbtRA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: constify _action_public_str array
To: Tanjim Kamal <tanjimkamal1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 5:39 AM, Tanjim Kamal <tanjimkamal1@gmail.com> wrot=
e:
> This array is never modified. Add a second const to make the array
> itself be placed in read-only .rodata instead of just the strings it
> points to.
>
> Fix a WARNING issued by scripts/checkpatch.pl.
>
> Signed-off-by: Tanjim Kamal <tanjimkamal1@gmail.com>

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

On Wed, Jan 28, 2026 at 5:39=E2=80=AFAM Tanjim Kamal <tanjimkamal1@gmail.co=
m> wrote:
>
> This array is never modified. Add a second const to make the array
> itself be placed in read-only .rodata instead of just the strings it
> points to.
>
> Fix a WARNING issued by scripts/checkpatch.pl.
>
> Signed-off-by: Tanjim Kamal <tanjimkamal1@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/sta=
ging/rtl8723bs/core/rtw_ieee80211.c
> index 92b12a13d..febc14de6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 fra=
me_len, u8 *category, u8 *act
>         return true;
>  }
>
> -static const char *_action_public_str[] =3D {
> +static const char * const _action_public_str[] =3D {
>         "ACT_PUB_BSSCOEXIST",
>         "ACT_PUB_DSE_ENABLE",
>         "ACT_PUB_DSE_DEENABLE",
> --
> 2.47.3
>

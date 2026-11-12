Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794454484;
	b=rsvgoNpswtakMc13IcniA1H7j2DRXoQLtehXZCXrCeh2GAcoy0XGpctJ6sg1ZAdgXx/w
	 iiu7kAfAhjOEMgyTGgHyT5tiDF2CekpKGrFHUrZdQthQ8bhvYifG4pFr1XkUdnBN7Ubn4
	 5tCO0pvTsaUdk93qPPoJB2BAnUMXySqmCg7BF7MN88tAtZInhG+/bzaZ7+1Z9iskM7N81
	 814lMI68b/TLboB6wRSUB7RKaAo+XprFaL875TrjbmGowIh8F4quO+kvmPcBart08uAy2
	 JX39tkeSoJkT4z+mDi68OkqzcHjBoaLuOG+v18MYvnzEQNGQlRghXAYO3xjhXhTe+0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HFD04U9lRvgNQz6jrXmGg5HtLCekxqCd9hERP4fkq4w=;
	b=ubL4Fk2Y1d6tQ7+Ra22+WiD1SKPStsLrT+9uAGUKAWQhQqpYepEFWZeCnskPE8/h4Z2i
	 cjGUqpaoZcAEzPHZmxZZjanC+7atpfhWvPurRrWaX3y6mBCwRTq2QEAwR7NLWv3JGEwU9
	 QkH3MFvUnEtwmXfsamT/uIdI5f6reL8Putp03FQuJu0J8H07NzhOHd0h45RSj16ffsJqc
	 PHK4YTynIf9+ARDyjC2qoL4S710OrhKQvx9AfoqikH3noAs+vDkOFY/M3/pM/nCpOR0VA
	 ZIrJ9eJ7J9WfVxCultMhNxPv9HbkKieCdDHGSlxXj/+x9YLYwS+3tuwzC2nfW2Guscg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wG2qVd42;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F817606A334
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 03:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F817606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wG2qVd42
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5083bc0e28so16666966b.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 19:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794454482; cv=none;
        d=google.com; s=arc-20260327;
        b=GexGSpwAQCE1Hs2IyJHiDqXHPbU9+9zTF+SUN5DFFadHY0z/9Extz3EljAJW+04FRy
         mSnREhSRqfGNfaxZqnkq4cMJu4Rcg2NMLpjL43PDla07EzeoTPCLmyquZE7XPLNTh4r5
         OGYnuwtoubxDHuxCZHEuJ+UH5pLUqE+Oxe22K9efQx6yVqb0XPufoM8puveojHoj+WOh
         qtc6w5UPvhpF91N+jv5oW/Sd5iWpciGd3gX0mjqe/gyRquAUusPSvyq2qIemsxQW4fl+
         MdFgIt5xAFYgWynbMbHXahZQuaIsHs8nE6XQ2LbQSX5CYXYm5LrzJ04fDU+yBYQINGzh
         EygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HFD04U9lRvgNQz6jrXmGg5HtLCekxqCd9hERP4fkq4w=;
        fh=gZ6sO3NXyIXTl3CTXk2laXA35hp3sSHO1HK9/+1H1O0=;
        b=F9HYb945Zy1UMjP/hEJj9ULtWwcjMLYyGS6D9lTHhHxK40+xcrcaeFHSR3cA5q7Ej8
         +sE2BIHpy3GItlhqcV6RWBHhMWzHAETPKlBzx/u7CDKchWmia1fix8/E+vnqMyMVav62
         v2p3tOzQit5PbxsgQ9UvbRN2WaAQLtNQvcGoZ4G1E2qK+5B9KHu3r50hSZB8JupB0T2A
         wtLTiKIEOZuoiIBdPvhDZkenWaKtphklUXTeu++lPwLyhOf8LDMbJWeVwjQkzk/oqjoj
         BaRMESgN8Nc/3H0w69mu7/3vMZ0kiR2AkhPwpcJ9gxL5iqY2VxMx4M7yWrJlwbrS0RCG
         uGQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794454482; x=1795059282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HFD04U9lRvgNQz6jrXmGg5HtLCekxqCd9hERP4fkq4w=;
        b=wG2qVd42xMO7eGhhc35Hwa5+36SswZU/pVhAwslGIUqhlGU17MJWnQJUNdLw7SHvnF
         5zmdTloLPIazBA9FrSpeVGJEBSWgHRCuu/uyfc1Z7EZ9g9Q7WuSbvyCRnK1Q12nXJtzH
         OD895ZNhe8dJ1nm/W5EiAAlIlcXE8qfD4G4rlzdSLLMD3agWgqMSuim6A7//hP8MAAgB
         C+202DWtD8FAWXNrcTOoeOr4gnqPmM9qfx1Vz/+xDTwVXBRPH5h8PKcdMup6NypxbwX7
         /SfKzY6b4AA0CWdh4qxLFHniob4StdwUapGoJKq3R4d1qwQVGz+BMER2QOb1bvmCj6TW
         sPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794454482; x=1795059282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFD04U9lRvgNQz6jrXmGg5HtLCekxqCd9hERP4fkq4w=;
        b=k4Y0dSmFPShh3otekIWQ67XnyfP8WML4NTtmA3dMNHmJToUBkcDAEVjRihIEbETGTS
         ZoplDFVifuQVXkPj6pZbx+mE4JF/58kqXW+GM/JW3athGAZKuhmLjlwcgDVv0I6gdA1z
         4mi32jT9sz4DGBhoBukSpWo54RB5wM/phm8KfrPsPOuhbqfsYwJhYQg8CU39CH9EtfOP
         WGlDGUKV2PJiSODeXYTchCFWoEhhMnFLu5s3kWLCog0LSYzzQ+bw8M8W4z7LoewqCshp
         SPwC3LwWBz9xl0S0cfvVpfwp0G5/BjIEmXotB00J5fUrrv+yEI3hkS7FbVmrtb7wtw3q
         sVDw==
X-Forwarded-Encrypted: i=1; AL+hErHWbHGamARHoCnUSEw3j0kQ9uyrrPeEDZ6S7F7NQCrOPWa8NoijUXMNoN30JFneX3e6SoyeEgMI3YZQFzWn@lists.linux.dev
X-Gm-Message-State: APuU4Z8QZqdg5wy6iVEfwhBOQ++lQ72pbcgMf4dVzKMLBYny/U30kKD7
	z/geo2MlWzX0YMzTVYSxm5c8UxAXg3zDzrslpHNF444rzWSi+IUz7MnCLFJMX54sb9WzoCMvK//
	jtY35N00rFD2HlYpXBWpEIn3spvwZ7Y4=
X-Gm-Gg: AYBFou3NpnOpWn8xtBYOUUrlF4SvREU62UztBOV5eXVSjwHm6PmgqjLMkY+1n8xNh6K
	5bM9OdejxX5ut/sbHDUFb4jzcg4BJMQ9vel4L9k/M1TLNhW1UkVebBxLXtRXjT8JLoU4Luf+X2G
	ZXT1xkmQDDILgeN9Uu+HFcHyb88TynWFzLHlJ8pH/SZUOkWvifiav7Ync5oLDi//GymubhMLLcR
	sjy+/Ws2fkuC8VH1dO9Q9aGk8sFFos/CuzmLG2sjypkXrrxD3rUx01D/AxXiOQmXNNw6xITjwiE
	A4RORNsoUnn1+m9GuL6fBoPHCg77H/hVbwfNft9ABhspthi276xlEo30ahVGSyj39jmR5cywKbQ
	8wIpvKUg6CyfSeuKy/EfRWjeozLz0d4z9I/1v6sjvGFX0Xe2gvQ==
X-Received: by 2002:a17:907:6d18:b0:c50:5545:b67c with SMTP id
 a640c23a62f3a-c5066b44dd9mr369952566b.18.1794454482354; Wed, 11 Nov 2026
 19:34:42 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
In-Reply-To: <20261111-octeon-init-pipeline-v1-v3-0-e5581974fae4@gmail.com>
From: Alejandro Lucero <aleszlucero@gmail.com>
Date: Wed, 11 Nov 2026 21:34:30 -0600
X-Gm-Features: AclHuK9AV_1Y2d0UxZ-1Hr4sJSdXijhOdrfjQAveTFrzhQ1dDz2Bh1ByTpqCY6s
Message-ID: <CAHDi9tqk3rHYJZ2Abu5Gn-=xVhA_AawCX9VRK_Nu0sHmNkeM7w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] staging: octeon: fix probe error path and
 pow_send_list matching
To: aleszlucero@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this series, I sent it by mistake. I will send a
corrected version shortly.

El mi=C3=A9, 11 nov 2026 a la(s) 9:30=E2=80=AFp.m., Oscar Alejandro S=C3=A1=
nchez Lucero
via B4 Relay (devnull+aleszlucero.gmail.com@kernel.org) escribi=C3=B3:
>
> Fixed two bugs in drivers/staging/octeon/ethernet.c:
>
> 1. Call cvmx_pko_disable() in the cvm_oct_probe() error path to match the
>    teardown sequence in cvm_oct_remove().
> 2. Split pow_send_list on commas using strsep() instead of matching
>    substrings with strstr().
>
> Oscar Alejandro S=C3=A1nchez Lucero (2):
>   staging: octeon: disable PKO before device removal in probe error path
>   staging: octeon: match exact interface names in pow_send_list
>
> Signed-off-by: Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com=
>
> ---
> Changes in v3:
> - Drop the ndo_get_stats64 conversion patch
> - Change commit description.
>
> ---
> Oscar Alejandro S=C3=A1nchez Lucero (2):
>       staging: octeon: disable PKO before device removal in probe error p=
ath
>       staging: octeon: match exact interface names in pow_send_list
>
>  drivers/staging/octeon/ethernet.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261108-octeon-init-pipeline-v1-e25ec64f49e3
>
> Best regards,
> --
> Oscar Alejandro S=C3=A1nchez Lucero <aleszlucero@gmail.com>
>
>

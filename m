Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B1293C42
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 16:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665169; cv=none; b=ldn9EDY8rNtm9gU2d011IEVXsjQUWB83mo1CA4bDOJ1JWiyDw0hhTrrIElpP+m4xhbwvTdcoAjwjaK7ycfHoTzE8E+SbUrTE4CTNNBHRqMI4s3Xws9sFD1fVvBseFglo6rFXE5Fb9PACTmhCz2q0mJuVtRIju/awNBFFR1cRZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665169; c=relaxed/simple;
	bh=xYfUoY6UzYEKZAC51SxnxCkW5ilc3yc4RLXze/3oKaM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BcBcRL9yTUuQcrI7x8UEkhJ2y1i+A/mxp0tR/pnYrRV4VZN/zPIXSc03/HA5wxZ6/TCkOMAOEYgXwCYYqbsENELyHkK4iBJOrQAaj9GfYnWEiaxDywYfA1j6Vh5XjhQVBknSKMUhPe4/Uuqa4fNTdUyTKfwT4S1DlCtSKeIUMnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KnyGwhZv; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KnyGwhZv"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775665166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1a/P+DOS/zBSzYw9JpBcYTLm52tB61fEObLsRFKsK0=;
	b=KnyGwhZvfjx7Sb2I0EgWnhpNjhyjsX9EUyZ4n/NgAtwan6gEaPeUceY8n0WAWrZtIBec53
	o8Z4l+sTWOVxCxXEP81uvtqDC5QKWIt0H888R93HP6HqaQVypcL9cayi2sOyGmuOCXCux5
	+a30Wl7+y7o6uwODKMxIMkSHM8tV1/s=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 18:19:21 +0200
Message-Id: <DHNWRM5936LY.2U3AXP4KDHHCX@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Feng Ning" <feng@innora.ai>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3] staging: rtl8723bs: fix heap buffer overflow in
 cfg80211_rtw_add_key
References: <20260408150019.16368-1-feng@innora.ai>
In-Reply-To: <20260408150019.16368-1-feng@innora.ai>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 8, 2026 at 5:00 PM CEST, Feng Ning wrote:
> The cfg80211 framework allows key sequence counters (NL80211_KEY_SEQ)
> up to 16 bytes, but ieee_param.crypt.seq is a fixed 8-byte buffer.
> When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
> without checking seq_len, a heap buffer overflow of up to 8 bytes
> occurs, overwriting adjacent fields key_len and key[].
>
> Cap the copy length at the buffer size using min_t().
>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Feng Ning <feng@innora.ai>
> ---
> Changes v2 -> v3:
>   - Added changelog below the cut line (per patch-bot feedback)
>   - No code changes from v2
>
> Changes v1 -> v2:
>   - Initial public submission to linux-staging mailing list
>

...

Hi Feng,
thanks for v3, however this patch can not be accepted as is.
First, of all you should configure and use git send-email for submiting=20
patches as your emails should be pure plaintext.
Secondly, your emails contain attachments which are not accepted for=20
patches.
Thirdly, you should not include your gpg key because as I previously=20
said no attachments.
Please read Documentation/process/submitting-patches.rst file for more=20
info. Logic itself is sound.
Best regards,
Luka Gejak

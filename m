Received: from mta0.migadu.com (out-100.mta0.migadu.com [91.218.175.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089092E282B
	for <linux-staging@lists.linux.dev>; Wed, 19 Aug 2026 15:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152267; cv=none; b=KsAIb0Z53xt6zOSUkdhYaXQ7QAR2Tx9jY0tn736oXjpndTnG2N0FEqGmMeUyPA8eYd9U4weGwVcpC3gP13+fBFjVombFcDeU+YEavrA5YMK1Q8OT+Z3BqrROvVvSu0hhH4A/gfwMlSSn/eV1mF76iQ0DWsnfc1Y2RK0a25m4Mqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152267; c=relaxed/simple;
	bh=TXuiatat5UNrxuNK3IiyyZkGLk+6hlTyNxh3lHR1m2I=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=iMB6BsE90gp2KlUTebzOAh4PG6nXCIh8TiSKi5inMFKwLx4w+SDn7/l6WGJDt2SwyWXtMOl//ZaAb9rJjLoEkd7giI7WkfG+srxGYBA8LxzpxM4gtGLKxmS36NvLisyRbGQaj8L9y5iQsjbcsxL+OkSbsEUhD/5DFNn1w1K5Cj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QpWBC1Ij; arc=none smtp.client-ip=91.218.175.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QpWBC1Ij"
X-Envelope-To: linux-staging@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=TXuiatat5UNrxuNK3IiyyZkGLk+6hlTyNxh3lHR1m2I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787152263; v=1; x=1787757063;
 b=QpWBC1IjBwRM2+nJulwWuC4AuaNRpwdTvFRPJJQ6bbUj7DVC1CVf9ljdDXcYA3Yu9xTPH2Km
 T/030g9SXwQorqAZtH5ocD3JtaY0blkY4oSrjXBypSCmgt0ZNoApTBxyr8/ip5DYAlH58VjBASS
 8Gg3rH8b7NEM0P/e73N6Cj9Q=
X-Envelope-To: linux-staging@lists.linux.dev
Received: from webmail.migadu.com (2001:41d0:303:fc7a::)
	by smtp.migadu.com with ESMTPS id 5edf8862c3adca07;
	Wed, 19 Aug 2026 15:11:03 +0000
X-Mizu-Trace-ID: 5edf8862c3adca07
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 19 Aug 2026 15:11:02 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <fb7186bc58696dc2117139adef454d674c705ef7@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] staging: rtl8723bs: fix protected RX frame validation in
 decrypt path
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: hansg@kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <2026081946-trolling-handrail-ecac@gregkh>
References: <f718ce8ebdf9fced440fb47bc921026bd24ca879@linux.dev>
 <2026081946-trolling-handrail-ecac@gregkh>

August 19, 2026 at 10:45 PM, "Greg KH" <gregkh@linuxfoundation.org mailto=
:gregkh@linuxfoundation.org?to=3D%22Greg%20KH%22%20%3Cgregkh%40linuxfound=
ation.org%3E > wrote:


>=20
>=20On Wed, Aug 19, 2026 at 02:22:47PM +0000, Tianchu Chen wrote:
>=20
>=20>=20
>=20> From: Tianchu Chen <flynnnchen@tencent.com>
> >=20=20
>=20>  The RX software decrypt path mishandles crafted protected frames f=
rom a
> >  malicious AP in two ways:
> >=20=20
>=20>  1) decryptor() never checks that a protected frame is long enough =
to
> >  hold the 802.11 header plus the per-cipher trailer(IV, ICV/MIC).
> >=20=20
>=20>  Implementations like rtw_wep_decrypt() and rtw_aes_decrypt() all c=
ompute
> >  length =3D hdr.len - hdrlen - iv_len. and a shorter frame underflows=
 the=20
>=20>  unsigned subtraction, turning into OOB reads/writes.
> >=20=20
>=20>  Reject such frames in decryptor() before touching the IV.
> >=20=20
>=20>  2) validate_80211w_mgmt() uses the skb before checking whether
> >  decryptor() returned NULL. On decrypt failure the skb has been freed
> >  before being used.
> >=20=20
>=20>  Bail out immediately when decryptor() fails.
> >=20=20
>=20>  Discovered by Atuin - Automated Vulnerability Discovery Engine.
> >=20=20
>=20>  Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> >  Cc: stable@vger.kernel.org
> >  Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> >=20
>=20No assisted-by: line?
>=20
>=20And you have read this:
>  https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh
> right?


Thanks for pointing out, I have not read this before.

Assisted-by: kimi-code:kimi-k3

> So did you test this on the real hardware?

Unfortunately I have no real hardware.

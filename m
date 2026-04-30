Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4083AEF33
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777581580; cv=none; b=NK2Pscc/8xt6fC0SB6yesMckP93I41EAmcog6euSpFdFhDDPXYzsiWeF7j0OmOVB1Su6eRBhyoFjBQyUjAMv80Z5ohsl/xu7zWQwU+YPEaeL+nrv4/hSoflwFXf1KDAWYbMhqoeuJ5rR/3LCRSKVZlfJ//RivjYcOzVVD7yNrCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777581580; c=relaxed/simple;
	bh=Kx+swj4PIVdjo7Sj7KYGOuPX1gurDC1PrsYOw/JV5yU=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=u9XPV/8Yf47IodxLJ7Uoe9gJHdagUM9ckigwYaYyM9jTvAV5MDwQCrBBaZzRSYZGNdGAZA/mSVqqfxE4FhnKX7J9AnOmxIOPsEDjeheLaC0odpUXvORvNFU6A7nPT2jkwVL8hK0B/0xvgb5FN31IpJ8mfFwYjLklXTvZV+/6zUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RuuXB6QI; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RuuXB6QI"
Date: Thu, 30 Apr 2026 22:39:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777581575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=hDaCckASr8zmyH/c1DttN0/FrpNtssshniSjdH+C65o=;
	b=RuuXB6QIjAi0yFbSMIAh/bVIG6lQTqcrQJqxJ73zfmRxrwKFlAJ9vcqzg1jmjkqbzirXua
	DQKadiEqMvlBUk1bam4DpJBPA5szq+RxnoJZobd5/YIZowW7+XSVMi6RmNkiGCC3hL1ZDM
	Jl+U8+cWgkah6aLUXf5CB2AACyCjJaw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: nikolayof23@gmail.com
CC: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_staging=3A_rtl8723bs=3A_r?=
 =?US-ASCII?Q?emove_wrapper_rtw=5Fhal=5Fdisable=5Finterrupt=28=29?=
In-Reply-To: <20260430172954.12828-2-nikolayof23@gmail.com>
Message-ID: <5416F110-D087-4D58-8880-849425148D4D@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

> Remove unnecessary wrapper and call DisableInterrupt8723BSdio() function
> directly to simplify the code=2E
>=20
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail=2Ecom>
> ---
> Changes in v2:
> 	- rebase on staging-next
>=20
>  drivers/staging/rtl8723bs/hal/hal_intf=2Ec     | 5 -----
>  drivers/staging/rtl8723bs/include/hal_intf=2Eh | 2 --
>  drivers/staging/rtl8723bs/os_dep/os_intfs=2Ec  | 2 +-
>  drivers/staging/rtl8723bs/os_dep/sdio_intf=2Ec | 5 ++---
>  4 files changed, 3 insertions(+), 11 deletions(-)
>=20

=2E=2E=2E

LGTM,

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak

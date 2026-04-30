Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8212D7DC8
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 20:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777581842; cv=none; b=fVWrtJ7FmZ1FcNw8WFuYYdQJ+K+hmpKUdXhgG9TneA1PBjMhEklFYzF+v1bsjyqFtkj9DOhaZ41Q//iaMT3njbPBDijC8tZs3PjyN6hLnVf2Gq/KUJfTMU/nNS6Jmxr/56zoErJha3VKPyhfBob5FV/fw/lHr1B6Fqj06FUhsKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777581842; c=relaxed/simple;
	bh=i68zz+jJLewQQVFZBA8QwhAOyKujzZSF2hRo65TkIcs=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Z3eLMFVCuIvAjYaECFxockCn74bh5b6B+0odvKtKuofDpUA8ZfC4eSrXRNpNKVM53ukUHHkf6QNFliiaGV/eWHhE80J0kfm5djTb8a5I9UN2PCGA0UY/JdJQEKjQvf0e5RG8UadTbHlkBRPoCwuIY8jc2b6IeRng+Y8CCGebWdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Nzzbayr6; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Nzzbayr6"
Date: Thu, 30 Apr 2026 22:43:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777581838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=N/fljBC0d67cqhRwhoY/hI0mrmMylwpvmfWU0XX8GRM=;
	b=Nzzbayr6UiQIUpYXjPnUOggQDrcLbmppOIv1wRHxgv2QWqFUzw5KNK/e71DHvS3r0MA5jb
	4JbjW1jRwBdvRuJnvWhEa6p+NQ9e7tu1LUR1TbylDVX8ytN/SEWaN8GYFRAdj72NwwY8pj
	yLonTBO8R93xb813D5ynY6AbsBXTu+Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: nikolayof23@gmail.com
CC: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/2=5D_staging=3A_rtl8723bs=3A_rena?=
 =?US-ASCII?Q?me_DisableInterrupt8723BSdio=28=29_to_snake=5Fcase?=
In-Reply-To: <20260430172954.12828-3-nikolayof23@gmail.com>
Message-ID: <523262EE-C246-4820-A980-E0FAA84BF977@linux.dev>
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

> Rename function DisableInterrupt8723BSdio() to
> rtw_sdio_disable_interrupt() and format its description to comply with
> Linux kernel coding style=2E
> Declare this function without 'extern' prototype in the =2Eh file to fix
> checkpatch=2Epl warning=2E
>=20
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail=2Ecom>
> ---
> Changes in v2:
> 	- rebase on staging-next
>=20
>  drivers/staging/rtl8723bs/hal/sdio_ops=2Ec     | 17 +++++++----------
>  drivers/staging/rtl8723bs/include/sdio_ops=2Eh |  2 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs=2Ec  |  2 +-
>  drivers/staging/rtl8723bs/os_dep/sdio_intf=2Ec |  4 ++--
>  4 files changed, 11 insertions(+), 14 deletions(-)
>=20

As far as I see in v1, Greg doesn't mind this patch doing multiple=20
things at once, therefore:
LGTM,

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak

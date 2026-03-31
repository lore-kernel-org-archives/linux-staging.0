Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87BE450909
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988758; cv=none; b=FWttIIv+Cu5Bs7x+Jz9/Q5JypTR5CEVq1cgvGQ6EOZvFg2Z/Z/1CyfM/EdSnMLhI9ejAvCRrdbFiPsXLqpVLd4jCRFPZMjTpAHknGoRrD8e9+RubJsXZIqKyQtWTWtMinNQg2bnSJRWQCvQHJtAAycW5ScTVEsULwJa0hHLhnNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988758; c=relaxed/simple;
	bh=tDXXEotEY+wCW2NcbcRWu+37C+RRvkiKYh4ZztHxx8E=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type; b=hPb6dEzFKgY003JP0aL2eFCRw5a8pD6B+5Vcp++c6ikrzPpCfP55wP2p0a1gEBc06E2wHZ67jk/MQDqRQx/C1Ttn/K7AiqJ+YlzJU40/Q2MKqzhkG1oXQ4N2xeCVzeq2ZhaTcjlVXJ9RcMKTz1mF5xaQGeC9tzXe7bOO8eb2YAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jcFWboKT; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jcFWboKT"
Date: Tue, 31 Mar 2026 22:25:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774988745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tDXXEotEY+wCW2NcbcRWu+37C+RRvkiKYh4ZztHxx8E=;
	b=jcFWboKT28VfxpUlcUqP6QKH8xCO0a2vKbRe4jv6LXcIxBaBEYI4hvw9GcOavn5tPfMKz5
	nzgv/8+TYi7VG+H4V0B9sbuKn4yFrPLdcp3Hppi/RrZLx6zuKDZwHYCfUCz7PjCqTt+Cjo
	VnRZ9XWtq946hGb25dZQ2VsxWA23Lag=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: omer.e.idrissi@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
Message-ID: <B2394A3C-25FD-4CEA-8557-3E68F1F60357@linux.dev>
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

Hi Omer,
Thank you for submitting this patch series=2E Efforts to clean up the=20
initialization paths in these legacy Realtek staging drivers are=20
always welcome, as they are a necessary step toward aligning the code=20
with upstream kernel standards and eventually moving the driver out of
staging=2E
I have performed a detailed technical audit of the series=2E While the=20
high-level goal of improving readability is correct, there are several
critical regressions and architectural issues that prevent patch=20
series from being accepted in its current form=2E=20
Please see the detailed breakdown below:
Patch 1/5: Use direct returns in rtw_sdio_if1_init
While the move toward direct returns is visually cleaner, this patch=20
introduces a significant risk of a kernel panic=2E In the original code,
the status variable guarded the cleanup labels=2E By removing it, you=20
have exposed an uninitialized variable bug:
struct net_device *pnetdev; is declared on the stack but not=20
initialized to NULL=2E If the function fails early (e=2Eg=2E, if vzalloc f=
or
padapter fails or an early hardware check triggers a goto), the=20
execution jumps to the free_adapter label=2E The logic then evaluates=20
if (pnetdev)=2E Since pnetdev contains uninitialized stack garbage, this
check will likely evaluate to true, causing the kernel to attempt to=20
call rtw_free_netdev() on a random memory address=2E
Requirement: For v2, you must initialize pnetdev =3D NULL; at the top of
the function to ensure the cleanup path is safe=2E Check below for more=20
information about next steps for patch 2=2E
Patch 2/5: Remove useless line in rtw_sdio_if1_init
This patch is technically correct in its removal of the redundant=20
padapter assignment=2E However, the diff shows that it also performs=20
whitespace cleanup by removing an empty line (the "two minuses" in the
diff)=2E To maintain a clean git history, we follow the "one change per=20
patch" rule=2E Mixing dead code removal with whitespace adjustments=20
makes the history harder to parse=2E Please either keep the whitespace=20
as is or move all stylistic cleanups into a dedicated "Cleanup=20
whitespace" patch within the series=2E=20
Patch 3/5 & 4/5: Logic simplified for rtw_init_io_priv/rtw_init_drv_sw
I have verified in drivers/staging/rtl8723bs/include/osdep_service=2Eh=20
that this driver defines _SUCCESS as 1 and _FAIL as 0=2E This is the=20
inverse of the standard Linux kernel convention (where 0 is success=20
and -ERRNO is failure)=2E By changing the check to if (func()), your new
logic triggers the goto error path when the function returns 1=20
(Success)=2E This would result in a driver that fails to probe entirely,
as every successful initialization step would be treated as a failure=2E
Requirement: We cannot simplify these call-site checks until the=20
underlying functions themselves are refactored to return standard=20
kernel error codes=2E
Patch 5/5: Logic tweak for rtw_wdev_alloc
Logic: This suffers from the same inversion issue mentioned above=20
regarding rtw_wdev_alloc return values=2E This patch also introduces a=20
trailing whitespace on the empty line added before the rtw_wdev_alloc=20
check=2E Please ensure you run scripts/checkpatch=2Epl --strict on your=20
patches before submission to catch these formatting errors=2E

I recommend the following path for v2:
Step 1: Submit a patch that properly initializes pointers to NULL to=20
make the cleanup paths safe from crash=2E Although initializing pnetdev=20
to NULL prevents the immediate crash, the cleanup logic remains=20
fragile=2E In v2, please consider refactoring the error path to use a=20
proper LIFO (Last-In, First-Out) label stack=2E Each goto should jump=20
only to the cleanup steps for resources that have actually been=20
allocated up to that point=2E This avoids redundant checks and potential
double-frees or leaks=2E
Step 2: If you wish to proceed with the macro removal, provide a=20
preparatory series that refactors the internal return values of=20
rtw_init_io_priv, rtw_init_drv_sw, and rtw_hal_data_init to standard 0
(Success) / -ERR (Failure) conventions=2E
Step 3: Once the functions follow standard conventions, the cleanup in
Patches 3-5 will be correct=2E
Thank you again for your contribution=2E I look forward to reviewing the
revised series=2E
Best regards,
Luka Gejak

Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976C36494A
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038784; cv=none; b=JM6YTmgDks58dUeFW9iYk9MET7btCphX/DioXYqdLiKaakmJO2D8h35pzIwVYNe9PPFS39Le/ApMHxxFRimEba4B7dk10USTXhS0OSbQyB8O9AQ5nAk24/+DOCI39TzviG8UDiu+ghdAO25ZezT5YnlyKng47nhVWPZfCg68690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038784; c=relaxed/simple;
	bh=J391vavnmzP2B1EDfVidlbLBl2yVD5ygqPAmF2ciV5o=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type; b=W54ciBklA5w0Z6sPGlljrxiXl3f1nfv1jNoKeShWsyRWBEQNz26ndczQgrmwt3BBCjxAZHKiozLIA4vTUpesGorbXZsu4BwQ0aU100LRWayLJjd7BeSOGLRc9tucsFp2inQ/aED6Nzk6KWsPoYOY1E0ynZUHtHRL3g1CWkIEGEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u4nDBuIS; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u4nDBuIS"
Date: Wed, 01 Apr 2026 12:17:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775038776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J391vavnmzP2B1EDfVidlbLBl2yVD5ygqPAmF2ciV5o=;
	b=u4nDBuIS/odKFiRw0TwS8q8be6iHY+AL/FyLik0BWXOnhmZDGrUPzT+96OueCmnMEkszt1
	gvwlhI+uiGjMdbCTg+3NfGLnJl4cKW7A0Q+uMwelweQrNJzh7NCMwQxnpFDMF115bspRRr
	Hnj/yATBMmlwj74jWYSs0vWbOJPuftA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: omer.e.idrissi@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
Message-ID: <272CEB11-DD9C-43BE-B47D-49F8BE1A0392@linux.dev>
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
Thank you for submitting this patch series=2E I like the idea, however
during my review I have found that there are several issues=2E

Patch 1:
While the patch makes it visually cleaner, this patch introduces a=20
significant risk of a kernel panic=2E struct net_device *pnetdev; is=20
declared on the stack but not initialized to NULL=2E If the function=20
fails early, the execution jumps to the free_adapter label=2E The logic=20
then evaluates if (pnetdev)=2E Since pnetdev contains uninitialized=20
stack garbage, this check will likely evaluate to true, causing the=20
kernel to attempt rtw_free_netdev() on a random memory address=2E

Patch 2:
This patch is technically correct in its removal of the redundant=20
padapter assignment=2E However, the diff shows that it also performs=20
whitespace cleanup by removing an empty line=2E You should stick to the=20
atomic patch per logical change rule=2E So either keep the whitespace=20
as is or move it into dedicated patch=2E

Patch 3 and 4:
I have checked in drivers/staging/rtl8723bs/include/osdep_service=2Eh=20
that this driver defines _SUCCESS as 1 and _FAIL as 0=2E This is the=20
inverse of the standard Linux kernel convention=2E By changing the check
to if (func()), your new logic triggers the goto error path when the=20
function returns 1 (Success)=2E This would result in a driver that fails
to probe entirely=2E You cannot simplify these checks until the=20
functions themselves are refactored to return standard kernel error=20
codes=2E

Patch 5:
This patch has the same issue mentioned above regarding return values=2E
It also introduces a trailing whitespace on the empty line added=20
before the rtw_wdev_alloc check=2E Please run scripts/checkpatch=2Epl=20
--strict on your patches before submission=2E

First you should submit a patch that properly initializes pointers to=20
NULL to make the cleanup paths safe from crash=2E Although initializing=20
pnetdev to NULL prevents the immediate crash, the cleanup logic remains=20
fragile=2E So please consider refactoring the error path to use a proper
LIFO (Last-In, First-Out) label stack=2E Each goto should jump only to=20
the cleanup steps for resources that have actually been allocated up=20
to that point=2E

Secondly, if you wish to proceed with the macro removal, provide a=20
series that refactors the internal return values of=20
rtw_init_io_priv, rtw_init_drv_sw, and rtw_hal_data_init to standard 0
(Success) / -ERR (Failure) conventions=2E Once the functions follow=20
standard conventions, the cleanup in patches 3-5 will be correct=2E

Best regards,
Luka Gejak

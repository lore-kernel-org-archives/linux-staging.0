Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D0042050
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010441; cv=none; b=sZfPaN/bKyANzFGHAi5mdgem5QMkwgIqSUI4CNwZxhwnjoziTCMiVb03AJ3SPaRvbEc5OkDFlwgvdW/Imyknm4YbSTQY8+DYm6TlcRGC5+GFn79QckX7alAHUp4XxVJC0TaIBlrqUS7u0jjoFs7K1P2UsjW6HTGj+Cvdob3F8tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010441; c=relaxed/simple;
	bh=NLPuy44we6vYy856GdCpDe1CXEElMOZhg8qngCVKjJM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=jVBh1RFMRQ9fCFcX7IaKssv7XTy0zE8k2vg8qMKV/fqk8fVjVScqzgMZ2/n78c/XUhCxyssQHDcrX6GtfEo8tGUW/hutzho1EwQZWhKxWtylqUDNUVHPUOkjp5m6evAk+JXz2zwS3r9yAutMfzgOXEpsyvs6eEbULvTdV/xxAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MLAJaf6D; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MLAJaf6D"
Date: Sun, 12 Apr 2026 18:13:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776010438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xgr7GHWoRCiWPQroJlzSNoHkysPibJrJb5Vd6inEt88=;
	b=MLAJaf6Dye0y5Rsqnv4ZZQRxiK6mQzVUA2NgD158xEJk40FiRxrhjpIuBI4bCo9eHxLF1W
	FavnQQIwRbWFuJBt36BFZ0AOtdWCpxF5kkL/t/DSOSynlSx3VCL6FIW6U2C1iJiYU81KJN
	uSwgwdPSYecb8Cft/41sF8K2Ucz1rG8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Josh Hesketh <josh.hesketh@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/3=5D_staging=3A_rtl8723bs=3A_remove_?=
 =?US-ASCII?Q?unnecessary_else_after_return_in_sdio=5Fhalinit=2Ec?=
In-Reply-To: <95E8D91D-326D-4972-90BF-098F3EB556DE@linux.dev>
References: <20260412150633.12071-1-josh.hesketh@gmail.com> <20260412150633.12071-3-josh.hesketh@gmail.com> <95E8D91D-326D-4972-90BF-098F3EB556DE@linux.dev>
Message-ID: <7EEB8ED6-933E-47D7-851A-E5D1441F3AFB@linux.dev>
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

On April 12, 2026 6:06:00 PM GMT+02:00, Luka Gejak <lukagejak5@gmail=2Ecom>=
 wrote:
>LGTM=2E
>Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>
>On April 12, 2026 5:06:33 PM GMT+02:00, Josh Hesketh <josh=2Ehesketh@gmai=
l=2Ecom> wrote:
>>Remove else branch following a conditional return statement
>>
>>Signed-off-by: Josh Hesketh <josh=2Ehesketh@gmail=2Ecom>
>>---
>>v2:
>> - Rebased on staging-next
>> - Split from original patch 1/2
>> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/st=
aging/rtl8723bs/hal/sdio_halinit=2Ec
>>index 4a4f6b03253a=2E=2Eed82860ae9b6 100644
>>--- a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>>+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>>@@ -641,11 +641,11 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>> 		padapter->bFWReady =3D false;
>> 		pHalData->fw_ractrl =3D false;
>> 		return ret;
>>-	} else {
>>-		padapter->bFWReady =3D true;
>>-		pHalData->fw_ractrl =3D true;
>> 	}
>>=20
>>+	padapter->bFWReady =3D true;
>>+	pHalData->fw_ractrl =3D true;
>>+
>> 	rtl8723b_InitializeFirmwareVars(padapter);
>>=20
>> 	if (pwrctrlpriv->reg_rfoff)

EDIT: Sent from wrong email address(I hate thunderbird and I'm not=20
near my laptop)=2E
LGTM=2E
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

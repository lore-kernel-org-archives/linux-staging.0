Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B162A1AA
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 05:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775971988; cv=none; b=jcMHlZu7KajhcBkIAugOw1ouuDMdTu2MBk2jVT5Bj93ssd/2mVVunt2jNfJh5aw3KTNorIf35uoqfMAKKdwfJX+pujx69KPcLWo34JuBLGRHEAJZN5yZpc16jn6ZzlTLVn4UZIkAFoGvTRt4GYqHGF1mngi87+agC3JWGB79Y90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775971988; c=relaxed/simple;
	bh=yMk5u88511SzYnOLO+jEANdXlVtwWj3GOFx6F97ZtWo=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=PnYXd7U/IUwrNtGm+gsfUFDOSdb8AlmyV0jnchR1nL6idYhpkexvd9rPCAymWHPBI2+he4U/YMWmDHvOqedMSen/tXb/f1nIv3cYqhtY1G9SX9n6s44wLw1wFcjlUjkDg3RZptHfugp95RQGi70IVsKf3VNQgvWncE4FfQiatJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oFhwu2Mh; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oFhwu2Mh"
Date: Sun, 12 Apr 2026 07:32:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775971984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=K6hifG4Ql5JceGCW+2aDnVhtxnE6AJUGqa6eDXu0OeA=;
	b=oFhwu2MhYhFRfoTHPzO8SIVDtYJxX3i/JT9/oDRMmuMS++h0z0tQki2R6Em1mSkcJZ6FYx
	q3RqQc4z1Bs7TzEaklfqm2SHj+QlIqlQBDAGIWWE63jCGFlRrPwdTXFIsmIm4pR0VPpBYv
	UWPmnQscOrVFnbduVRhLyXd7uqcB9ms=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: josh.hesketh@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, straube.linux@gmail.com, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_staging=3A_rtl8723bs=3A_fi?=
 =?US-ASCII?Q?x_coding_style_issues_in_sdio=5Fhalinit=2Ec?=
In-Reply-To: <20260411214001.8849-1-josh.hesketh@gmail.com>
Message-ID: <0586BB0B-507F-4409-9294-1C08E8FED3CB@linux.dev>
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

On Sat, 11 Apr 2026 22:40:00 +0100, Josh Hesketh wrote:

-/* 	u8 bMacPwrCtrlOn; */
+/*	u8 bMacPwrCtrlOn; */

Instead of fixing the spacing in commented-out code, please just=20
remove dead code entirely=2E Git tracks previous versions for us=2E=20

-/* 	=3D=3D=3D=3D Reset digital sequence   =3D=3D=3D=3D=3D=3D */
+/*	=3D=3D=3D=3D Reset digital sequence   =3D=3D=3D=3D=3D=3D */

Fixing standard comments like this one is fine, but the commented-out=20
code blocks above should be removed=2E

-	u8 	bResult =3D _SUCCESS;
+	u8 bResult =3D _SUCCESS;

This change is good and follows kernel coding style=2E

You should split patch 1 into 3 patches: one for deleting the=20
commented-out code, another for the legitimate whitespace fixes=20
and one for adding newlines=2E Also one more thing this patch series=20
doesn't apply on top of staging-next so please rebase on staging-next=20
branch in v2 and don't forget to write changes in v2 part under --- in
patch 1 and patch 2=2E
Best regards,
Luka Gejak

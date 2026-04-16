Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523023A3E9D
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 11:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338426; cv=none; b=VUfa+cIltybD/AZJL8rJ4TVAXZtExrbsZ5pBSxNNKwwvooeOZHYDm5i08XQvdHvmPidzdjFwUYzsTp4lD/0E0GMrDpJDqwlflu0UYNsztg/Wr1UW81EnGJpviLIPzrMsqTo1JdHB/fylFKm/tBiQHBZYwxO+KJhb1DREioBMcqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338426; c=relaxed/simple;
	bh=qD8KvqDX+LnCE2fYP5e4h89TGXVqrL9t/DknB3upHxM=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=OU8NivNNFvl7E0JzsrJCLq++JH4GrvqsM+NpzDKeDr6mLWaAqEq1hs1F1i8vkcj5G61yhSKGI4pCWYMJifPy7LQt5W9kOzS5mdrIO2S/Bzzcqr06d0xKKW+yFA6UoMwAvYJJdABpF+fKNlN6wxdFLr6/Ku7bUl7ja1j6LVIHkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aYCMohiH; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aYCMohiH"
Date: Thu, 16 Apr 2026 13:20:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776338422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=qD8KvqDX+LnCE2fYP5e4h89TGXVqrL9t/DknB3upHxM=;
	b=aYCMohiHUiuXnA56nwohrmjDsssQfWXQvh9WpXzunxEJe26t4lz2wPAoHU5b5OC/IrwTyI
	tTob9PRSlAxel5YwcRd1ZhzwlLiRxDuq2mO15xWTsWEaLWKljgJQfDpZhMftK9aw3/yLjR
	iwPPFYCu551F7IVVTVzYsYZ/gE/PGkQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: mpikhotskyi@gmail.com
CC: arthur.stupa@gmail.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 nathan@kernel.org, sameekshasankpal@gmail.com, straube.linux@gmail.com,
 luka.gejak@linux.dev, error27@gmail.com
Subject: Re: [PATCH] staging: r8723bs: reduce nesting
In-Reply-To: <20260415184727.285753-1-mpikhotskyi@gmail.com>
Message-ID: <E4BF62EF-C6F6-431F-8EDC-77C1E613E66B@linux.dev>
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

Hi Maksym,
Your patch doesn't apply cleanly on top of the staging-next branch=2E=20
Recently, we merged a patch that replaced is_broadcast_mac_addr() with
the standard kernel function is_broadcast_ether_addr(), which is=20
causing conflicts=2E Additionally, someone recently tried to do a=20
similar refactoring just for rtw_aes_decrypt() but introduced a major=20
bug=2E They wrote if (stainfo) instead of if (!stainfo), causing it to=20
fail on valid pointers and crash on invalid ones=2E Your patch actually=20
fixes their mistake=2E Could you please rebase your work onto the latest=
=20
staging-next branch and send a v2 series? It would be best to split it
into two patches(a patch series): first, a bug fix for=20
rtw_aes_decrypt() to correct the if (!stainfo) logic (please add a=20
fixes tag), and second, your early-return refactoring for the=20
remaining functions=2E Also, don't forget to fix the subsystem prefix in
your subject line to staging: rtl8723bs:
Looking forward to the v2=2E
Best regards,
Luka Gejak

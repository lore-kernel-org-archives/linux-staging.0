Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18313446AB
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777199401; cv=none; b=DUFPI/YeDBa9xfeLOzuN4r+zOrTdRuSynuOAlSMEokidrKFMdGv8ReWjsHBEUziIZvNafTiosF7bwRCnUAsL+1iPj28DjdhMjP2g1jor4SuP0epejGpBixbTZPDuxRPIyNqb8EfZSxu42G4F6VppfcqPgkPPaPF/Ewyl2AX81Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777199401; c=relaxed/simple;
	bh=QQ5vfL322ZrDbi3e00rrC/WHj+nEirnV0K0Zq5e98gM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rUZ3+/4K8wZWSwcVD9HflotJiHUmOKlI+OybUr6EJtiBs8pW/2BEcw2qRyQmULY4W5K85V1LpLIgDDHo4ycYpzQKccdgte70ekth4umpMllyV2rthx+evdJv3plkjfpy6h4uPcs1ZLrKjKi31MPzJCxo6ROrS23pkmlV5JINg4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bYOWz1yB; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bYOWz1yB"
Date: Sun, 26 Apr 2026 12:29:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777199397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQ5vfL322ZrDbi3e00rrC/WHj+nEirnV0K0Zq5e98gM=;
	b=bYOWz1yBbckkFK5F9OmJkX1YZUAVG1L8SsAstUMDkwQxL0H6cxCVDXaoL4kXg9f23qGfmm
	a8ibkOrkb/Fw12AcKyZZ0jSg5OClSuckj2LF9VfR9zFg5aC2baCi0ifmX2MkrRaivKAyYT
	hAQFfpQErpwf36ijo8IO+Jrzk6ukDnY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Alexandru Hossu <hossu.alexandru@gmail.com>, gregkh@linuxfoundation.org
CC: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, hossu.alexandru@gmail.com,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_0/3=5D_staging=3A_rtl8723bs=3A_fix?=
 =?US-ASCII?Q?_OOB_reads_and_heap_overflow_in_IE_parsing?=
In-Reply-To: <20260426095156.3523480-1-hossu.alexandru@gmail.com>
References: <20260426095156.3523480-1-hossu.alexandru@gmail.com>
Message-ID: <DC7CC9BA-409F-499C-BAD3-8ED124CCDED1@linux.dev>
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


On April 26, 2026 11:51:53 AM GMT+02:00, Alexandru Hossu <hossu=2Ealexandr=
u@gmail=2Ecom> wrote:

=2E=2E=2E

>This series fixes three related bugs in the rtl8723bs staging driver's
>802=2E11 IE parsing code=2E All three share the same root cause: IE parsi=
ng
>loops and IE handler functions do not check that an IE's declared length
>actually fits within the remaining buffer before reading from it=2E

=2E=2E=2E

If these are bug fixes(which they appear to be) they should have Fixes=20
tag present as well as cc for stable if they are present in stabe tree
too=2E Also Reviewed-by tag goes above your Signed-off-by tag=2E Please=20
send v3 with these changes=2E
Best regards,
Luka Gejak

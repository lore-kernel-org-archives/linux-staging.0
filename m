Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA66299929
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 06:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775803526; cv=none; b=TGnTs9bs8mhJzpO9BHNPfJmZALvNlFouHukl3e2643psfQm7rrH9stFkbwCBevHMDSZd6m7snDY69dPNN0Bp7zh1lXwNeC/wSGt/329D457ZqnHBw+FaSj/atdcpg2yJ0XIY2RLt5tM1P71n1SVrnHd84upD8B6ENoU7SSKnNjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775803526; c=relaxed/simple;
	bh=odFuiJRyILdepZFmvk2fJG+BHGIzC0rDtYjGl1LsVAw=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=MHsSUJ4RPcJyRHldUcLE4sabtsxUfRm/kBFukpUzRd8vv7L43yTEdUrrctd2hFatwEykiMU7Om2WRYIIddjYq3yC2cVp3tXpDnQU/2l5xvJuUDPuzxnHO5m6ViOJXWDeLGjzHKrs97EsI6XHWDW5+KFusErsMS4I+rfwXjg0rlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BAPW+mPs; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BAPW+mPs"
Date: Fri, 10 Apr 2026 08:45:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775803523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=odFuiJRyILdepZFmvk2fJG+BHGIzC0rDtYjGl1LsVAw=;
	b=BAPW+mPs7WmSioQSHOVj0v+J2ZSSMOAfr4z520lh2RxMaX19Xo2f5EH0yyr2rFRv6L+2gE
	yzzTik1JYVFQhMQjT3kl+5QftrCO2taBX89SQL5h64Re6FnyI0AbPKY/nuF5ajoqTQ4ADQ
	V1Koo94tonQBwQXjhnB/AxnoRlqWEkM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: boyakhil978@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: fix comparison to false
In-Reply-To: <20260409221122.77303-2-boyakhil978@gmail.com>
Message-ID: <58EA874E-2ADC-4920-8ED0-802F3CF1DF7F@linux.dev>
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

Hi Akhil,
I am sorry to inform you, but upon checking, I have discovered that=20
your change was introduced in one patch in the past=2E You have probably
been working on master branch(one from Linus) and not staging-next=2E=20
Therefore, since patch wasn't merged to mainline yet, you didn't see=20
that your change is already present=2E
Best regards,
Luka Gejak

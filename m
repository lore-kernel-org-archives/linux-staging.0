Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878273D88E5
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899860; cv=none; b=Iu6SdBTzVF25u0LQqmrbrM3EeROOcA03cdTnAT3KDhtx9djtROwEz1crzqCr1bC3dAIA6RIaWnznu/WSEdsjHAJSEl9FOK2W6lnGLVynS91jm7OZ0RC2pD8X7bhCclByskN5RH4sp1g6Dpc2xH9aMS2nVy3vWeJU0jBFi+inXRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899860; c=relaxed/simple;
	bh=+20Bbxv9p96BDHvUo2X2in6wAIU/Yv5TYj91CjQNq5s=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=e7jamiz/xgejY21E1bKzPLGRVEE71739Ke2ZLM1iu5pBCRaW45hVOz5EsGDJI7eSRuKvDoQVPQWGHR5DpFDzgV96GuiSqRGvOHB+i4fIhhKpGhiiiMM/4e2P7N7r9uJqbZ0ob2NAGux4szrCi/bOOdcdz1TI+G1G5SYIAR4xTZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DXCebjPZ; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DXCebjPZ"
Date: Mon, 04 May 2026 15:03:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777899856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2Q4r/myQKT066C7XrVq+HcEA5BHQNq39X53hPA4TmQ=;
	b=DXCebjPZTfg+GKbAr1vkofGmOrvQL4biDMXuZVHpB/dDY+Olb5LGb3QQ395pYJmqX9gRbv
	A7UVG6GoFCqpVHPXgWxPPb0/bJJ1xxBS4cR68ywWXPC8o3lhLF3vXbud2rQQyPdVHY5/xV
	muIXTEUumRY5cd45IBoEQZSKdCOz9yw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Stepan Ionichev <sozdayvek@gmail.com>, gregkh@linuxfoundation.org
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_staging=3A_rtl8723bs=3A_remove_?=
 =?US-ASCII?Q?unnecessary_blank_lines_in_rtw=5Fioctl=5Fset=2Ec?=
In-Reply-To: <20260502084930.857-1-sozdayvek@gmail.com>
References: <20260501163815.759-1-sozdayvek@gmail.com> <20260502084930.857-1-sozdayvek@gmail.com>
Message-ID: <9C5D7553-B3EB-4127-A655-F7E270752753@linux.dev>
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

On May 2, 2026 10:49:30 AM GMT+02:00, Stepan Ionichev <sozdayvek@gmail=2Eco=
m> wrote:
>Drop blank lines flagged by checkpatch=2Epl in rtw_ioctl_set=2Ec:
>
>  CHECK: Blank lines aren't necessary before a close brace '}'
>  CHECK: Blank lines aren't necessary after an open brace '{'
>
>No functional change=2E
>
>Signed-off-by: Stepan Ionichev <sozdayvek@gmail=2Ecom>
>---
>v2:
>- Rebased onto staging-next=2E
>- Dropped the hunk between rtw_set_802_11_infrastructure_mode() and
>  rtw_set_802_11_disassociate(): already addressed by commit 7dbc9fd71438
>  ("staging: rtl8723bs: remove multiple blank lines in core/")=2E
>- Narrowed subject to mention rtw_ioctl_set=2Ec, since the wider scope is
>  no longer needed=2E
>
> drivers/staging/rtl8723bs/core/rtw_ioctl_set=2Ec | 3 ---
> 1 file changed, 3 deletions(-)
>

LGTM,

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak


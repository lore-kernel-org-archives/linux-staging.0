Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F72D3725
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774028870; cv=none; b=p6PetrsrMl7uu87+zfcn3l/wCtX7AR6YgFaEJe65KhPuN1V8iWdFufPwFZwWPKdD09pKdJ6Gr2MNysVeAv7DXjaIIiI7HaPu1yno0VqgTK3ORCtLZqRl6gQFhRb3/U+MpDHK+PxrVO5YeTZg0RJUMePlGYRAlO4pWym5q3P1+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774028870; c=relaxed/simple;
	bh=hRgfi8tIhjsBM3hHjn1XaHswb2wzkcm0eAVgmjPwwVA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ucrPB986w8t5zF0bwwo8XeY0KEo4+fNZF3nI0wxcWFrUeyAovnSW7jHCTUq+9YAQo1cYTKfejnkL+lTa8QEFLLY2J8T0CTYE/TmhjROjtzBURaU62QRkdr5lrhB6r+AqENrqI1ynd96KtCqvkRRUSnOWne6dTT2yOzkLC0gJHCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DvloMJ20; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DvloMJ20"
Date: Fri, 20 Mar 2026 18:47:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774028866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKt8ashEqstS/d6MJKiXoIClNTVlX+1Xv7j2sBDXfQo=;
	b=DvloMJ20ReXm6Dc6ynTLUk1xoi3qiOJQr0gafMrGAre/FbtTL219o7PBF1PduF1aUMO+aZ
	pJoxm4m5fY8aw5L18LCj1LG64wtHYEc/YWgmicNIbb1H06cXm/mLkUYuPtaBmew7TLVrUn
	yrZJRZNhIrHmWmlh9o7I2DHDgy3fRcw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 linux-staging@lists.linux.dev
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Khushal Chitturi <khushalchitturi@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
 Artur Stupa <arthur.stupa@gmail.com>, Zhuoheng Li <lizhuoheng@kylinos.cn>,
 Nino Zhang <ninozhang001@gmail.com>, linux-kernel@vger.kernel.org,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/2=5D_staging=3A_rtl8723bs?=
 =?US-ASCII?Q?=3A_clean_up_rtw=5Fjoinbss=5Fevent=5Fprehandle?=
In-Reply-To: <20260320154724.603847-1-azpijr@gmail.com>
References: <20260320154724.603847-1-azpijr@gmail.com>
Message-ID: <5CC04830-7A2E-4A64-BFC7-83F0ADC3297B@linux.dev>
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

On March 20, 2026 4:47:15 PM GMT+01:00, "Jose A=2E Perez de Azpillaga" <azp=
ijr@gmail=2Ecom> wrote:
>This series cleans up the rtw_joinbss_event_prehandle function in the
>rtl8723bs staging driver=2E
>
>The first patch removes dead code guarded by the REJOIN macro, which is
>never defined in the kernel=2E This simplifies the function before the
>subsequent refactor=2E
>
>The second patch refactors the function using guard clauses and early
>returns to reduce deep indentation, improving overall readability=2E
>
>v3:
>- Removed the 'retry' variable which became dead after REJOIN
>  removal=2E
>- Remoed the 'ignore_joinbss_callback' label and use direct
>  returns=2E
>- Preserve the original comment for the join_res <=3D 0 case=2E
>- Keep the original newline for the netdev_dbg call=2E
>- Moved the 's5' comment after the spin_unlock_bh call to match
>  original placement=2E
>
>v2:
>- Split the original patch into a two-patch series=2E
>- Changed the subject line=2E
>- Removed all REJOIN-related dead code=2E
>- Fixed a typo in the ptarget_sta comment=2E
>- Avoided unnecessary changes=2E
>
>Jose A=2E Perez de Azpillaga (2):
>  staging: rtl8723bs: remove dead REJOIN code
>  staging: rtl8723bs: refactor rtw_joinbss_event_prehandle to reduce
>    indentation
>
> drivers/staging/rtl8723bs/core/rtw_mlme=2Ec | 156 ++++++++++------------
> 1 file changed, 69 insertions(+), 87 deletions(-)
>
>--
>2=2E53=2E0
>

Small spelling mistake in cover letter ->Remoed instead of Removed,=20
however this is in cover letter so it shouldn't be a problem=2E=20
Other than that, it looks good to me=2E

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918A2BE642
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 20:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902218; cv=none; b=tTMjw6iy3jFyyOrrsPJMK9lb4bNlBp0oplXfpSIP7EPpLuGrCaDXyfXvWBD7iyXfr7OdcU1L/pxgKE7rFfglNOrP2qsEbvxOPpwfBJN2HDZKqVQU4yeGVgRZf95UxOB3t9u04AdnWI04KFvGnFUuLdWqH9suYag2q6Y047rMIC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902218; c=relaxed/simple;
	bh=c+uTb8a16SfTYLt42z7yuSWjYBMa395RNlJBu52Os6A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rKEuBf9PJXBhDsLqgrvB5y0Ms6UWYIum1Y37/7F8tO8riZnyewKObMn7EVlNFRZ6x2L8UtyIy5xUlQLxrZv9GBB/ixqnOr5TF060cYtHfhSvR0Vzhq9f51PPEDv10+sM0j5AwJGDR2uP3hXIvrkYpKXItwPUVf0q6QIGWOMh6Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FrKnU535; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FrKnU535"
Date: Mon, 30 Mar 2026 22:23:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774902214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hre8dlCHJNX/sjTIpVAb50xPJn1fCIgoLQQitXl3vIE=;
	b=FrKnU535dFziuLdKH3lw3qCrqmRHrdHJLRFuAOi8C33hNBVsDFozUwsLW9pgA9d6qLbfWm
	JJiSUhx6ZGg1w25ic09UGlLBY9lzHeBPgFeEcDWUu6vCB3/pO+IjkpZVA0Q5t6I1HV+4SV
	iHo2sxo0g5h/sqeJl362snEC0YjhbPc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Andrei Khomenkov <khomenkov@mailbox.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-staging@lists.linux.dev, luka.gejak@linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/2] staging: rtl8723bs: cleanup code and style
In-Reply-To: <20260330184640.17795-1-khomenkov@mailbox.org>
References: <20260330184640.17795-1-khomenkov@mailbox.org>
Message-ID: <84E92547-BFA1-4854-80C8-2726CA0ADD37@linux.dev>
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

On March 30, 2026 8:46:37 PM GMT+02:00, Andrei Khomenkov <khomenkov@mailbox=
=2Eorg> wrote:
>This series of patches cleans up the rtl8723bs driver code to improve
>readability and better align with the Linux kernel coding style=2E
>The first patch simplifies boolean comparisons, while the second one
>performs general code cleanup=2E
>
>Link: https://lore=2Ekernel=2Eorg/linux-staging/20260325110143=2E35466-1-=
khomenkov@mailbox=2Eorg/
>
>v2:
> - Split the single patch into a two-patch series to separate=20
>   logical changes, as suggested by Luka Gejak=2E
> - Cleaned up additional boolean comparisons found using 'git grep'=2E
>
>Andrei Khomenkov (2):
>  staging: rtl8723bs: simplify boolean comparisons
>  staging: rtl8723bs: cleanup code style and parentheses
>
> drivers/staging/rtl8723bs/core/rtw_ap=2Ec       |  2 +-
> drivers/staging/rtl8723bs/core/rtw_btcoex=2Ec   |  4 +-
> =2E=2E=2E/staging/rtl8723bs/core/rtw_ieee80211=2Ec    |  2 +-
> =2E=2E=2E/staging/rtl8723bs/core/rtw_ioctl_set=2Ec    | 50 ++++++-------
> drivers/staging/rtl8723bs/core/rtw_mlme=2Ec     | 18 ++---
> drivers/staging/rtl8723bs/core/rtw_mlme_ext=2Ec | 16 ++---
> drivers/staging/rtl8723bs/core/rtw_recv=2Ec     | 72 +++++++++----------
> drivers/staging/rtl8723bs/core/rtw_sta_mgt=2Ec  |  2 +-
> =2E=2E=2E/staging/rtl8723bs/core/rtw_wlan_util=2Ec    | 18 ++---
> drivers/staging/rtl8723bs/core/rtw_xmit=2Ec     | 37 +++++-----
> drivers/staging/rtl8723bs/hal/hal_btcoex=2Ec    | 10 +--
> drivers/staging/rtl8723bs/hal/hal_com=2Ec       |  4 +-
> =2E=2E=2E/staging/rtl8723bs/hal/hal_com_phycfg=2Ec    |  4 +-
> drivers/staging/rtl8723bs/hal/hal_intf=2Ec      |  4 +-
> drivers/staging/rtl8723bs/hal/odm=2Ec           |  8 +--
> =2E=2E=2E/staging/rtl8723bs/hal/odm_CfoTracking=2Ec   |  2 +-
> drivers/staging/rtl8723bs/hal/odm_DIG=2Ec       | 32 ++++-----
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd=2Ec  |  2 +-
> drivers/staging/rtl8723bs/hal/rtl8723b_dm=2Ec   | 10 +--
> =2E=2E=2E/staging/rtl8723bs/hal/rtl8723b_hal_init=2Ec | 13 ++--
> =2E=2E=2E/staging/rtl8723bs/hal/rtl8723bs_recv=2Ec    |  2 +-
> =2E=2E=2E/staging/rtl8723bs/hal/rtl8723bs_xmit=2Ec    |  6 +-
> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec  |  6 +-
> =2E=2E=2E/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec | 51 ++++++-------
> =2E=2E=2E/staging/rtl8723bs/os_dep/sdio_ops_linux=2Ec |  4 +-
> drivers/staging/rtl8723bs/os_dep/xmit_linux=2Ec | 13 ++--
> 26 files changed, 194 insertions(+), 198 deletions(-)
>

Hi Andrei,

Thanks for v2 of the patch series=2E
These changes correctly simplify the boolean logic across the=20
rtl8723bs driver and bring the code into alignment with the Linux=20
kernel coding style=2E I have verified that the logic remains=20
functionally identical=2E
This is a solid cleanup for the staging tree=2E
So for the patch series:
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak

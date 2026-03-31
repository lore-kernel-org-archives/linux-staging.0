Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB13ACF02
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955182; cv=none; b=VW3+mu7JH7WpJGHSfmJA8B+PlXEGDMFKFlLSW7bpQsSX75/EUQxe5XsU4nG12Mq55lFw2UX4jFCS1Pc9q3JXQHqQA3+IXFunVAL9Jrah8r6Dp6dKbS+ArKk/rDc9AB+RMBLtAcmF/9CLZqinfnARtdyuIE3fArTldWeXy6ah2Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955182; c=relaxed/simple;
	bh=6/wC82y14AWXmcl1LjryBUt5U25wi4EkqmvxVGvTOKw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=l9la4YOgTU+rnh7tnepMPiZJKA6SjqAVwqeUunEH+swX3Ga+pjXD5LBPrELnk3PK2cSzvlMb4EQ47mPwLhEqyLa4Ugp6ssxqbHk4FhzWAjIQ1shXCjnATxPBk5XTf7bQqf3kt7DSYnlcBWLLMnPcWeJr73x8jTHmI597XbLnf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iZTHGQAE; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iZTHGQAE"
Date: Tue, 31 Mar 2026 13:06:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774955176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFJ1tgGc8ObZixLpN295pqflyqNUEmV4j7PDQ3V27HY=;
	b=iZTHGQAEXNN5Hrzc/qWUws4znnTDbVD5EU2SaDz40bTpQf2QBoKuDMFujsusB/O8EEr3bS
	SIJHUEKIbM/sdbdZ2wlsCcx4dgkqfzchBfFCr9Yga4U/f2hemxHDM2QH/Yz2IpKZXq5+op
	dRj+tWfh62H3AkCTEO2jBsRxU5+TJYM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Andrei Khomenkov <khomenkov@mailbox.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/2] staging: rtl8723bs: cleanup code and style
In-Reply-To: <20260330184640.17795-1-khomenkov@mailbox.org>
References: <20260330184640.17795-1-khomenkov@mailbox.org>
Message-ID: <3831D599-655E-40B2-9E5D-9DF956013088@linux.dev>
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

Hi Andrei and Greg,
I am retracting my previous Reviewed-by tag=2E
As Greg pointed out, I reviewed this too hastily=2E This patch=20
improperly mixes cosmetic style cleanups with functional logic changes
regarding the bitwise check_fwstate() evaluations=2E Furthermore, it=20
introduces a syntax error (unbalanced parentheses) around line 782 in=20
core/rtw_xmit=2Ec that breaks the build=2E
Andrei, you will need to split this into a proper patch series:
1=2E Separate the functional bug fixes (the check_fwstate logic) from=20
the pure style cleanups=2E
2=2E Group fixes of same kind by directory (e=2Eg=2E core/, os_dep/) to ke=
ep
the patches manageable=2E For example simplify boolean comparisons in=20
core directory=2E
Apologies for the noise=2E
Best regards,
Luka Gejak

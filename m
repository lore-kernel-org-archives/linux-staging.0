Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC5391E79
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775922046; cv=none; b=H8yoar1TvO51r8dqhW96sswnEnKgxhJ1Yxxc84wV2DCt2rU25+mbnSkPxUagjMp6P0jjChczIkU7eB7sBkrjlepeusWaLhQmLB0z9BQjdTxpkZzd8sY1XncPlB7EQW5igYeUf6mf0GjHzRgfrc1/cEfKll++uape56k2BOIi4OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775922046; c=relaxed/simple;
	bh=8kbPQwvgoyj5oZdx1TznLLaBTGYwK1YQbFcWTVBMxIM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kFvymC5LUzSNWWw+7bffSThVWtu7GguFSPoNTb+pm8LdqugoPcQJVb3BjlvJfDjW1qgt0Ql4IUwDLYCLIaUiIOZdJR3FaJtMsWBW8Dv8CUpg+yiLf7DPi/JGQTL4If9THePyHPH+IE6fL9Ot5/48xB+oH4MZ6izyrgDj1a7qOFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Kv9M2924; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Kv9M2924"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775922042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YXXy/Mgq/H+al3cKggITvQTqJmeAuJibU1VZ59J+w7M=;
	b=Kv9M2924TiL6GA2DrK8CmqxXoxyzyd9ROuOdqBMFZDUMJkvdVRCW9p8YTUzUo/lhTCDGNS
	YIXxuORqcdaoLT0vbk5VM5pmPrg1/DDCDg5o3OEsZTnpviNnyMD4NpeWUQppI91eLqDZRP
	wYxfn3dSgknvwUnhOEnjoPoLABe+qlQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Apr 2026 17:40:39 +0200
Message-Id: <DHQFTM1FG7B7.18GOSSZDHD5JM@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] staging: rtl8723bs: verify boolean and logics and
 rename dot11AuthAlgrthm
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Nguyen Duc Thinh" <ducthinh100812@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260411035303.859-1-ducthinh100812@gmail.com>
In-Reply-To: <20260411035303.859-1-ducthinh100812@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 11, 2026 at 5:53 AM CEST, Nguyen Duc Thinh wrote:
> This series cleans up the rtl8723bs driver by renaming the CamelCase vari=
able dot11AuthAlgrthm to dot11_auth_algrthm and refactoring boolean compari=
sons to follow Linux coding standards. Both changes were verified by buildi=
ng individual object files and running checkpatch.pl.
Please wrap all text to 72 characters. Also you don't need cover letter
for 1 patch, so unless you properly split this into 2 patches you don't=20
need cover letter, but more on that in inline review of the patch.
>
> Nguyen Duc Thinh (1):
>   staging: rtl8723bs: verify boolean and logics and rename
>     dot11AuthAlgrthm
>
>  drivers/staging/rtl8723bs/core/rtw_ap.c       | 28 ++++----
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 40 +++++------
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     | 16 ++---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 22 +++---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 70 +++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    |  8 +--
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 36 +++++-----
>  drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme.h  | 12 ++--
>  .../staging/rtl8723bs/include/rtw_security.h  | 14 ++--
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 ++++-----
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
>  16 files changed, 145 insertions(+), 145 deletions(-)


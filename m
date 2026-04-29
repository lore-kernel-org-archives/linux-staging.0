Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EF323EAB2
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458301; cv=none; b=Bx1Qm+DYW5YkWI7MCtWcGPPtb3qqJZvUpOH4EV/R2lwE32EiSKgbM5jKgtebxnWzKgZ98d18Cdc46MQhmGMHzuwMG97RXS7fER+RNUOQVbHcYdJxT8RpWxswCmkd7mO7PXg3cPHVv/aWqyOGqnF/s5j7h95lO0oTX7q5mniwWAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458301; c=relaxed/simple;
	bh=o4R2rZCEQUm5p1t2ADSbVpepvNb+E6+GOpF7MFcIbbo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cUOq/vxi8o1MDwWWIh33Z+AYG7Oi1jv+MB3XzZo9uwGurGDXcAZgADAreD3YfV454uWsCPq1+sp+s/Mdsjo/CmRYFUwmFIeebaCtfpFdrA6WOPvEoLj2M9jQ5yFD0xZg7F3uES5x11JzGMyV4QOA/wpENCNKiLUxFW+zklCpVh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mX7A1all; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mX7A1all"
Date: Wed, 29 Apr 2026 12:24:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777458297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QPcnVZqxsD/rQFwROM5EH9/8f3vJkDYj8YOE/5zz1S8=;
	b=mX7A1allR+CJz1PVKpRcfahZK9mgiCsZI/9si2w7pAOAc7lIb1if46W+DmO+H0V5XeUW48
	fA94tyMH+oUVoNCtZAQWVcTovzryPHTe2DRWysjvXjwWFebzJJXa9igYUM6mnSq5r5QF2S
	Hg+APOjSSa0VHEiGk43R+c6ccKhTMBs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: linus.probert@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH 0/8] staging: rtl8723bs: remove warnings in rtw_btcoex.h
In-Reply-To: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev>
References: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev>
Message-ID: <2097F9CE-F003-4BE1-AEF5-0B30294973FB@linux.dev>
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

On April 29, 2026 12:18:12 PM GMT+02:00, Luka Gejak <luka=2Egejak@linux=2Ed=
ev> wrote:
>> This series eliminates all remaining checkpatch warnings in
>> rtw_btcoex=2Eh=2E Such as CamelCase, redundant blank lines and unnamed
>> function definition arguments=2E
>>=20
>> Linus Probert (8):
>>   staging: rtl8723bs: remove blank line in rtw_btcoex=2Eh
>>   staging: rtl8723bs: add function definition arg names to rtw_btcoex=
=2Eh
>>   staging: rtl8723bs: rename rtw_btcoex_MediaStatusNotify()
>>   staging: rtl8723bs: rename rtw_btcoex_media_status_notify definition =
arg
>>   staging: rtl8723bs: rtw_btcoex_HaltNotify() -> rtw_btcoex_halt_notify=
()
>>   staging: rtl8723bs: rename rtw_btcoex_RejectApAggregatedPacket()
>>   staging: rtl8723bs: rtw_btcoex_LPS_Enter() -> rtw_btcoex_lps_enter()
>>   staging: rtl8723bs: rename rtw_btcoex_LPS_Leave to rtw_btcoex_lps_lea=
ve
>>=20
>>  drivers/staging/rtl8723bs/core/rtw_ap=2Ec        |  2 +-
>>  drivers/staging/rtl8723bs/core/rtw_btcoex=2Ec    | 10 +++++-----
>>  drivers/staging/rtl8723bs/core/rtw_cmd=2Ec       |  4 ++--
>>  drivers/staging/rtl8723bs/core/rtw_mlme_ext=2Ec  |  2 +-
>>  drivers/staging/rtl8723bs/hal/hal_btcoex=2Ec     | 12 ++++++------
>>  drivers/staging/rtl8723bs/include/rtw_btcoex=2Eh | 11 +++++------
>>  drivers/staging/rtl8723bs/os_dep/sdio_intf=2Ec   |  2 +-
>>  7 files changed, 21 insertions(+), 22 deletions(-)
>>=20
>> --=20
>> 2=2E54=2E0
>>
>
>LGTM, so for the patch series:
>
>Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>
>Best regards,
>Luka Gejak

One note:
For the future cleanup series, feel free to squash identical logical=20
changes into a single patch to keep the commit history concise=2E It's=20
up to Greg if he wants v2 but logic is sound as is=2E
Best regards,
Luka Gejak

Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5FE146A66
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 04:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777265193; cv=none; b=VnKCWqRjeCFX1GZBufivDPcExPf6duKOqc4hIR6N8ylRLj/hmcCSTHrD1YIFDfuIMJMaoGIEhEHNsj3hoTK1CSwPKpSJYcRUQxBKif/zgd8wU7tpAgINGsD85ZCwb8AApx3ZywQdHBqBCEGTLfrAj8ynx5XfBkv+mqCjbwi9U7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777265193; c=relaxed/simple;
	bh=ymQzzTXU46CucK/a7x9lRay3A40d4LadTemvb4g9EPY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bFKD1dfLJ7KWlvUMTE548gl2mIsNZpiRk/fR3IIUt0AxvImjfDst/Y7OKlnAoK5mAWZephvIA2ZZSvM9B6Gbyp9c9Oqy+P5gocNMZeclqjoiDT2HEjEMROLBXATRB4S5OoMBv3XD7tsUeDNuRS9zxw51k6I58z8lX6zkHZpikmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vQFYA4XN; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vQFYA4XN"
Date: Mon, 27 Apr 2026 06:46:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777265188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7udLf9/cWDk8V6A/V9H3pIGttl8hwSXmCGYzOr0iNjA=;
	b=vQFYA4XNDLYnMgy+NBewKMNtDIr3IUmeDW5nyQy3dFK05wo90hbY5/olcM59Gv3mc5DMpB
	1q9f62xIJP/oaJ2UYdc4K9SdPiBxktwb2dikuTilken7+uh8J3z7CwE9DwH0atxmtmOkq6
	k5UiO+96NJfjIqp0cSFK3zQ/QM1wsnE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_03/11=5D_staging=3A_rtl8723bs=3A?=
 =?US-ASCII?Q?_os=5Fdep=3A_fix_spacing_around_operators?=
In-Reply-To: <2026042621-italics-landfall-82b9@gregkh>
References: <20260413101432.158925-1-luka.gejak@linux.dev> <20260413101432.158925-4-luka.gejak@linux.dev> <2026042621-italics-landfall-82b9@gregkh>
Message-ID: <0502E78E-FD9C-4344-90D9-2F108AABE0B7@linux.dev>
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

On April 26, 2026 10:04:54 PM GMT+02:00, Greg Kroah-Hartman <gregkh@linuxfo=
undation=2Eorg> wrote:
>On Mon, Apr 13, 2026 at 12:14:24PM +0200, luka=2Egejak@linux=2Edev wrote:
>> From: Luka Gejak <luka=2Egejak@linux=2Edev>
>>=20
>> Fix spaces around operators in the os_dep directory to adhere to the
>> Linux kernel coding style=2E This resolves multiple spacing warnings
>> reported by checkpatch=2Epl=2E
>>=20
>> Signed-off-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>> ---
>>  drivers/staging/rtl8723bs/os_dep/sdio_intf=2Ec | 2 +-
>>  drivers/staging/rtl8723bs/os_dep/wifi_regd=2Ec | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf=2Ec b/drivers/s=
taging/rtl8723bs/os_dep/sdio_intf=2Ec
>> index d0feb28b7043=2E=2E95523c3a508b 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf=2Ec
>> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf=2Ec
>> @@ -77,7 +77,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
>> =20
>>  	sdio_release_host(func);
>> =20
>> -	return err?_FAIL:_SUCCESS;
>> +	return err ? _FAIL : _SUCCESS;
>>  }
>> =20
>>  static void sdio_free_irq(struct dvobj_priv *dvobj)
>> diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd=2Ec b/drivers/s=
taging/rtl8723bs/os_dep/wifi_regd=2Ec
>> index f9c4d487badf=2E=2Ece835802c442 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/wifi_regd=2Ec
>> +++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd=2Ec
>> @@ -93,7 +93,7 @@ static int _rtw_reg_notifier_apply(struct wiphy *wiph=
y,
>> =20
>>  static const struct ieee80211_regdomain *_rtw_regdomain_select(struct
>>  							       rtw_regulatory
>> -							       *reg)
>> + * reg)
>
>What just happened?  How was this generated?  What tool did you use?
>
>And this series is way too big=2E  Please break it up into smaller parts
>per patch=2E
>
>thanks,
>
>greg k-h

Hi Greg,
I used vscode's find and replace and I think when I clicked a shortcut
to replace all I might have mistimed it and it registred enter=20
instead=2E And space between * and reg is introduces by same feature,
which is my mistake for not catching before sending=2E I will fix it and=
=20
split this series into multiple ones=2E
Best regard,
Luka Gejak

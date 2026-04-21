Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888863D9021
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782755; cv=none; b=bP0FBJ5Lt01ausaF5sKC6C5f5C9H8DARWTsJQz+6opklvYiyglNcWnkYu+rLmQ6s/ViCYWWIkKXjHDtRce1paPUMYu3WItqILiidB8mXsi9ZNvzAPe/F0/kuu5hRvJafRrus68f5tafArM7B72KmYR35Ykh8T4B3GcRvgZXnssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782755; c=relaxed/simple;
	bh=Dtt4THOgjFVw0sFtPayj2uV4nHtMVTWM1Rbp/27W+Rw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jJS5XySI8ktwmm2K/0nosFWyl7ryo/7xY1I7XV1tXHp7qpelHbGCfHIhM+26P89w7J4kFEFuEwZzuPGA8voVfjfzczqyO1CtQ2BVPPgnaav/L4Vovx35GDge2KqgRRxdyOL5gbtPNb5j2+PMkC77DmMFBHLs8OffVP++lCpx96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Roaikc59; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Roaikc59"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776782751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGTmfRWSyPLw11nEtewLuYnyjRmm5Fw7g8OhmCLzhBc=;
	b=Roaikc59IKXWFSp7ggQBPq1x7D6jkOfSah1ZVTOYV+Pah4aizpb8BeTTe9Psyd4Nle3hhv
	T8SxchPZpvDHW6b8hLTZIENXnYJ8jziDXoF64SwnO6ov9HJad+7TEmFK5uEBF4dDvF4RQs
	OGH5GHfI8nm1dbLq33T5mts3vWHStsk=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:45:32 +0200
Message-Id: <DHYWWV3C21GL.49H4UGWXU0JW@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Luka Gejak" <luka.gejak@linux.dev>, "Alexandru Hossu"
 <hossu.alexandru@gmail.com>, <gregkh@linuxfoundation.org>
References: <20260420140807.152739-1-hossu.alexandru@gmail.com>
 <DHYWSUFIWZIM.3C0KFC5EYNHB5@linux.dev>
In-Reply-To: <DHYWSUFIWZIM.3C0KFC5EYNHB5@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Tue Apr 21, 2026 at 4:40 PM CEST, Luka Gejak wrote:
> On Mon Apr 20, 2026 at 4:08 PM CEST, Alexandru Hossu wrote:
>> HT_caps_handler() iterates pIE->length bytes and writes into
>> HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
>> HT_caps_element).  Because pIE->length is a raw u8 from an over-the-air
>> 802.11 AssocResponse frame and is never validated, a malicious AP can se=
t
>> it up to 255, causing up to 229 bytes of out-of-bounds writes into
>> adjacent fields of struct mlme_ext_info.
>>
>> The parallel function HT_info_handler() already carries the correct guar=
d:
>>
>>   if (pIE->length > sizeof(struct HT_info_element))
>>           return;
>>
>> Apply the same pattern to HT_caps_handler().
>>
>> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
>> ---
>>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/st=
aging/rtl8723bs/core/rtw_wlan_util.c
>> index 6a7c09db4..b75e7f4f8 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
>> @@ -934,6 +934,9 @@ void HT_caps_handler(struct adapter *padapter, struc=
t ndis_80211_var_ie *pIE)
>>  	if (phtpriv->ht_option =3D=3D false)
>>  		return;
>> =20
>> +	if (pIE->length > sizeof(struct HT_caps_element))
>> +		return;
>> +
>>  	pmlmeinfo->HT_caps_enable =3D 1;
>> =20
>>  	for (i =3D 0; i < (pIE->length); i++) {
>
> Hi Alexandru,
> this fix has been made already by Greg HK therefore this patch is=20
					^^^^ *KH (Kroah-Hartman)
> unnecessary. You can see his patch at [1].
> Best regards,
> Luka Gejak
>
> [1]: https://lore.kernel.org/linux-staging/2026041408-grill-mahogany-d1e3=
@gregkh/


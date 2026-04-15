Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B75313AF2
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250557; cv=none; b=AuJAteeGrWNxpkrrfoOO9wV/IWm3wTlsZfzSqAxKg5wAgjqElaiJBgoviUTM/py2EkUbBlVRJ3Hvp55/CcKu7hCcXGlIqUWCR1KUP8Up9vVdes/a1r/PIiRCUt+A+EAh/CiRFgGN8EZuHlQidIpOG+BHvATLsQl6Et3V20pkRxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250557; c=relaxed/simple;
	bh=6ZA2LcSk3QReERFIlOsuFJ0xn3JrVBgbFbT8X+w75Cs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AjzcCks25cACiz4jiw8GJ2MEYh1a+jS/7AwYsJCznDoSnCOpm4asZ09thzWgVp2YyYZ0s8/fSZ/Hbmz8OC8uEf8Ab6Eu+0xXMAjQ/9SDQPalignP56BZe4reJ7RggVamAGDE9C0tChNeMiKTUUw1ET9rABIbUpZUVBwTPvOCJHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gEwwa1xK; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gEwwa1xK"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776250553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fPLefkgOLZaU5Vrj9t+NYCjOZkZjnCgC8OJdP8PSA+g=;
	b=gEwwa1xK1kon4vxC10jYEPEeFqdMQWcmBsUu9dDf5j4+GADPqZYaBNmySRvAwPTcMWM3LQ
	/rLMxbYWWjAKbIpX4gFh0jD9YkPzo8TW+jxN4B9DsCEtSEW6XEgHtoMWQAUjDK4aZtGwGM
	JbicM5Ayy221JgxwxFjJYAZWCW7Dxr4=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:55:48 +0200
Message-Id: <DHTO9P2GULIP.2VT8AWTTKPL8W@linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix remote heap information
 disclosure in issue_assocreq
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Dan Carpenter" <error27@gmail.com>, <luka.gejak@linux.dev>
References: <20260415050302.9934-1-luka.gejak@linux.dev>
 <ad9TKjTLxDRwDyIy@stanley.mountain>
In-Reply-To: <ad9TKjTLxDRwDyIy@stanley.mountain>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 15, 2026 at 10:58 AM CEST, Dan Carpenter wrote:
> On Wed, Apr 15, 2026 at 07:03:02AM +0200, luka.gejak@linux.dev wrote:
>> From: Luka Gejak <luka.gejak@linux.dev>
>>=20
>> When building an association request frame, the driver copies the
>> ht capability ie using the attacker-controlled pIE->length from the
>> ap's beacon. If the ap provides a length greater than the size of
>> struct HT_caps_element (26 bytes), it causes an out-of-bounds read
>> of the adjacent heap memory (HT_info and network structures).
>> This uninitialized or sensitive memory is then transmitted over the air,
>> resulting in a remote heap information disclosure.
>>=20
>> Fix this by clamping the length passed to rtw_set_ie() to the actual
>> size of struct HT_caps_element.
>>=20
>> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
>> ---
>> ---
>> Changes in v2:
>> - Refactored rtw_set_ie() alignment to follow "open parenthesis" style.
>> - Allowed the line length to exceed 100 characters for better readabilit=
y as requested by Greg KH.
>>=20
>>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/sta=
ging/rtl8723bs/core/rtw_mlme_ext.c
>> index 5f00fe282d1b..08e597bc0345 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>> @@ -2954,7 +2954,9 @@ void issue_assocreq(struct adapter *padapter)
>>  			if (padapter->mlmepriv.htpriv.ht_option) {
>>  				if (!(is_ap_in_tkip(padapter))) {
>>  					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_ele=
ment));
>> -					pframe =3D rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length,=
 (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
>> +					pframe =3D rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY,
>> +							    min_t(uint, pIE->length, sizeof(struct HT_caps_element)),
>> +							    (u8 *)&pmlmeinfo->HT_caps, &pattrib->pktlen);
>
> You're being conservative and trying to work around the invalid
> pIE->length, but in the case where the original code corrupts memory,
> we're allow to just give up and return a failure.
>
> There are two other cases where we trust pIE->length in this function
> and those need to be fixed as well.
>
> regards,
> dan carpenter

Hi Dan,
should I keep my approach as is or just return failure. I will fix other=20
cases as well with whatever approach you consider correct.
Best regards,
Luka Gejak

Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDAB2556E
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777185454; cv=none; b=N/vcJleHm55tMWmQ8vgpd01F9Vh7whTBZCYKpDPA7KXa1ngq10VN6eMQLW8LUsyBpkXPkZVb13LsXD0Q4K1dx5gcoCvakoFW4UwUqbQNeuvRq9oJ4lBjBPKG+xm6vJLew5/LDQ+HOdKZTOUw0Wszt34XkT+pFnYZ4RhVsPNyvlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777185454; c=relaxed/simple;
	bh=wA0UfChtgFBemMBe/qRd2meulQcifWV6dncZbDmxMhU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qLkrS20j6PRn4YGorqZcOLYSmfiv2o9r2pQ7IH1bf9EoP7HvEvijvmK0xsAztXmTHgLnOjNGqEFfOqlmirimapc/u2BXc/4gLVsTlNpmEesNgs1wA3GCxiDOLc7YSHsPv8G7X0A40F0VpvKxx+rg45omVpBL/sSGnY/WKSiqav4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vPE6DGKG; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vPE6DGKG"
Date: Sun, 26 Apr 2026 08:37:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777185451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kev6ubV9APQzqxB4V6W3mzEhhkl76/zRxq/jH1U+Ozk=;
	b=vPE6DGKGa/0AVmc7U3Tf7gNLCioHe/+fR/7qyg8jQtnp4o5GxDHPYRRZ6KT2a9xw7ymeVR
	dgI+ef5Tb2q7oc5kH4tTKo3vzmWP4QRMZ3LBZpHg9ibFJszcKu1Rfk9ebwI4V7uqYUHd5T
	m2cS8qvvrB68Rpiz1zAkRsbBOdicy1k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Salman Alghamdi <me@cipherat.com>
CC: gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 luka.gejak@linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: rtw_mlme: fix line length warnings
In-Reply-To: <87fr4itpqk.fsf@cipherat.com>
References: <20260425165733.289919-1-me@cipherat.com> <DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev> <87fr4itpqk.fsf@cipherat.com>
Message-ID: <74615568-5FCA-4674-BE30-EEB48165E662@linux.dev>
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

On April 26, 2026 4:33:23 AM GMT+02:00, Salman Alghamdi <me@cipherat=2Ecom>=
 wrote:
>> glad to see v2, just one thing before inline reviews of the code=2E You=
=20
>> don't have to state what did you do to make lines shorter than 100=20
>> characters, because we can read the diff and this commit message is too=
=20
>> long for cleanup patch=2E
>>
>
>Understood=2E Will keep it shorter in v3=2E
>
>>>  }
>>> =20
>>> -struct wlan_network *_rtw_find_same_network(struct __queue *scanned_q=
ueue, struct wlan_network *network)
>>> +struct wlan_network *_rtw_find_same_network(struct __queue *scanned_q=
ueue,
>>> +					    struct wlan_network *network)
>> 					    ^^^^^
>> This is still not aligned correctly=2E Please do it like:
>> struct wlan_network *_rtw_find_same_network(struct __queue *scanned_que=
ue,
>> 					    struct wlan_network *network)
>>
>
>Will investigate and fix the alignment issues in v3=2E
>
>>> @@ -462,10 +470,12 @@ static void update_current_network(struct adapte=
r *adapter, struct wlan_bssid_ex
>>>  		&pmlmepriv->cur_network=2Enetwork,
>>>  		&pmlmepriv->cur_network=2Enetwork);
>>> =20
>>> -	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmep=
riv->cur_network=2Enetwork, pnetwork, 0))) {
>>> +	u8 *ie =3D pmlmepriv->cur_network=2Enetwork=2Eies + sizeof(struct nd=
is_802_11_fix_ie);
>>
>> You should declare u8 *ie inside the if statement to reduce its scope a=
s
>> much as possible and if left this way it will declare it even if=20
>> condition is false=2E
>>
>>> +
>>> +	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
>>> +	    is_same_network(&pmlmepriv->cur_network=2Enetwork, pnetwork, 0))=
 {
>>>  		update_network(&pmlmepriv->cur_network=2Enetwork, pnetwork, adapter=
, true);
>>
>> Put u8 *ie =2E=2E=2E here, under update_network=2E
>>
>
>Should variables always be declared at the nearest enclosing scope
>where they're used, or at the top of the function?

Generally nearest scope, but in this case you should declare u8 *ie=20
inside the block and after update_network(), because by doing that you
ensure the pointer is initialized with the freshest data=2E It also=20
prevents the variable from being used elsewhere in the function where=20
it might be invalid=2E

>
>>> -		rtw_update_protection(adapter, (pmlmepriv->cur_network=2Enetwork=2E=
ies) + sizeof(struct ndis_802_11_fix_ie),
>>> -								pmlmepriv->cur_network=2Enetwork=2Eie_length);
>>> +		rtw_update_protection(adapter, ie, pmlmepriv->cur_network=2Enetwork=
=2Eie_length);
>>>  	}
>>>  }
>>> =20
>>> @@ -600,12 +610,16 @@ static bool rtw_is_desired_network(struct adapte=
r *adapter, struct wlan_network
>>>  	desired_encmode =3D psecuritypriv->ndisencryptstatus;
>>>  	privacy =3D pnetwork->network=2Eprivacy;
>>> =20
>>> +	u8 *ie_ptr =3D pnetwork->network=2Eies + _FIXED_IE_LENGTH_;
>>> +	u32 ie_len_val =3D pnetwork->network=2Eie_length - _FIXED_IE_LENGTH_=
;
>>> +
>>>  	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
>>
>> Again you should move two variables declared above here, inside if=20
>> statement=2E Additionally, calculating ie_len_val outside the check is=
=20
>> risky=2E You should ensure ie_length is actually greater than=20
>> _FIXED_IE_LENGTH_ before performing the subtraction to prevent an=20
>> unsigned underflow/wrap-around=2E
>>
>
>Should the guard be a simple early return if ie_length is smaller
>than the offset, or is there a preferred pattern for this?

Sure, you can go with early returns=2E

>
>>> @@ -1072,10 +1113,13 @@ static void rtw_joinbss_update_network(struct =
adapter *padapter, struct wlan_net
>>>  			break;
>>>  	}
>>> =20
>>> -	rtw_update_protection(padapter, (cur_network->network=2Eies) + sizeo=
f(struct ndis_802_11_fix_ie),
>>> -									(cur_network->network=2Eie_length));
>>> +	u8 *ie =3D cur_network->network=2Eies + sizeof(struct ndis_802_11_fi=
x_ie);
>>> =20
>>> -	rtw_update_ht_cap(padapter, cur_network->network=2Eies, cur_network-=
>network=2Eie_length, (u8) cur_network->network=2Econfiguration=2Eds_config=
);
>>> +	rtw_update_protection(padapter, ie, (cur_network->network=2Eie_lengt=
h));
>>
>> The original code had a potential buffer over-read here by passing the=
=20
>> full ie_length with an offset pointer=2E Since you are refactoring this=
=20
>> line, please fix this bug, in a separate patch, by subtracting the=20
>> offset from the length and ensuring the length is actually large enough=
=20
>> first=2E 1/X of the patch series should be bug fix, 2/X should be this=
=20
>> cleanup=2E Don't forget to add Fixes and Reported-by tags=2E Check if t=
his=20
>> bug is present in stable tree and if so add Cc: stable@vger=2Ekernel=2E=
org=20
>> as well=2E
>>
>
>Should this bug fix be in the same patch that will fix previously
>mentioned subtraction underflow(s)?

No, bug is a separate patch that goes first in the series as it was=20
already there=2E Your subtraction check should be added when you add the
variables as they are directly related to them and we don't want one=20
patch to fix the other one=2E Also how would you add the checks, if=20
variables don't exist yet=2E Bugfix patch should only fix the bug,=20
nothing else, and then next patch will introduce variables while=20
fixing long lines=2E

>
>>> @@ -1684,7 +1764,9 @@ static int rtw_check_roaming_candidate(struct ml=
me_priv *mlme
>>>  	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=3D mlme->=
roam_scanr_exp_ms)
>>>  		goto exit;
>>> =20
>>> -	if (competitor->network=2Erssi - mlme->cur_network_scanned->network=
=2Erssi < mlme->roam_rssi_diff_th)
>>> +	long rssi_diff =3D competitor->network=2Erssi - mlme->cur_network_sc=
anned->network=2Erssi;
>>
>> You are declaring a variable (rssi_diff) after executable code again=2E=
=20
>> All declarations must be at the top of the function=2E Additionally, wh=
y=20
>> use long here?
>>
>
>The type of rssi in struct wlan_bssid_ex is long so I matched it=2E
>Will double check and correct if needed=2E
>

You should always double-check :)=2E

>Cheers,
>Salman Alghamdi=2E


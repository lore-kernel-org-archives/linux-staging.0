Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B20678F2E
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 02:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777170818; cv=none; b=Ne2spPho31IZnOmzvFDlSFCIs/kQ0aCSW4g0601NjDJTG8z/ScgDniERgABWShb7EZ+gSWAr78qWSdyZ3dRwkI/mlGuoCCHzkHYhwZKsqix10sIZU8zU/Q3rvPWAQ4AdW3Pv94zSJM8JR//wlH9LsnsAlffs9JUbaACdJQaRzkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777170818; c=relaxed/simple;
	bh=2twiJ2ksWr/ll7QEfDtiDHXiDkz8ZvS3xfDlJqfe7kk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FtCCjyP2v0hz82ajXBD5TJhxbRK4afqphpRRc4NQyMUH7yAs0UXNv9ta9sgIEJInBXOftweebrANI2p29VdWFbvsiSOkUw2i5nLvUq1KUWwOljZTGVotGF1omLuLPANXNEfEt+dhfDl6BtJ2/+FMXqxq3myYrmxiKzJanFadxNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=bs2O4XVt; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="bs2O4XVt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6707C84D0B;
	Sun, 26 Apr 2026 05:33:25 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777170808;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=KzHW8x0KTORfARP+3qu1M0DUjAmBHen9lZfViuNc3+w=;
	b=bs2O4XVtLmN4jSfXQJ3kpBf/lD7cFozor25iT5OXNOSwT+pijn9rT+I4k96SFf0iu29Z2d
	PHPOhgWgHSoo8U1e7jo+zPhP9gM6DjWFze5zbcD73VJSDHINvAzuXCaboUaCjEhYb4trnE
	ApzQh5P9mBT8JgAtTHocQ6N7F8fQf7x1PbzhVooiPPLcKj6DtMBO/jbHzeSgRJgIf/xbOq
	jAPeHFGicNPYfaFOU8elYDdGZiD3oe+s2y/NCg8mxUsXveeUTDvL1TYGjlZLYiHqMc0wLI
	FCp9d9yUBV81JmyV4GlbxJFT9eIQoFDIWbZ3aAYEef2zxnJSl/KfiQPTNO13sF/3kPKEK8
	5pmMURgD4xaQn6QcZwzRDH7qQNbPHTscFOILzobpkeb6qDEX/1BeY2xa2iF7uw7HTfjWGg
	IjcTVbsmtSijkGyIP8fYFJYwo1vhIctuJE8+8s1202LwYkL2whEcQeUQnjH4Klp1+BpPLO
	pwDuVbIDx2agwrHQgSMOmKeezNvbwlbjdx+YZILzjRBKNQ+AigZSRErfIK39lWr4gNcUEi
	sX3fJI1DdLgCeIyZZcwYQo50z+bpdhQHW68wM2dS9aaKZ0nTb1kdRkdJR3m9MctY0a0PpZ
	TsEB7J0/DZwTiAfL2Dmq03mOGTW+eNHi5FLD8YB1WrAJCP5aFLa4s=
From: Salman Alghamdi <me@cipherat.com>
To: "Luka Gejak" <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: rtw_mlme: fix line length warnings
In-Reply-To: <DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev> (Luka Gejak's message of
	"Sat, 25 Apr 2026 21:12:16 +0200")
References: <20260425165733.289919-1-me@cipherat.com>
	<DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev>
User-Agent: mu4e 1.14.0; emacs 30.2
Date: Sun, 26 Apr 2026 05:33:23 +0300
Message-ID: <87fr4itpqk.fsf@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

> glad to see v2, just one thing before inline reviews of the code. You 
> don't have to state what did you do to make lines shorter than 100 
> characters, because we can read the diff and this commit message is too 
> long for cleanup patch.
>

Understood. Will keep it shorter in v3.

>>  }
>>  
>> -struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
>> +struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
>> +					    struct wlan_network *network)
> 					    ^^^^^
> This is still not aligned correctly. Please do it like:
> struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
> 					    struct wlan_network *network)
>

Will investigate and fix the alignment issues in v3.

>> @@ -462,10 +470,12 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
>>  		&pmlmepriv->cur_network.network,
>>  		&pmlmepriv->cur_network.network);
>>  
>> -	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
>> +	u8 *ie = pmlmepriv->cur_network.network.ies + sizeof(struct ndis_802_11_fix_ie);
>
> You should declare u8 *ie inside the if statement to reduce its scope as
> much as possible and if left this way it will declare it even if 
> condition is false.
>
>> +
>> +	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
>> +	    is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0)) {
>>  		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
>
> Put u8 *ie ... here, under update_network.
>

Should variables always be declared at the nearest enclosing scope
where they're used, or at the top of the function?

>> -		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
>> -								pmlmepriv->cur_network.network.ie_length);
>> +		rtw_update_protection(adapter, ie, pmlmepriv->cur_network.network.ie_length);
>>  	}
>>  }
>>  
>> @@ -600,12 +610,16 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
>>  	desired_encmode = psecuritypriv->ndisencryptstatus;
>>  	privacy = pnetwork->network.privacy;
>>  
>> +	u8 *ie_ptr = pnetwork->network.ies + _FIXED_IE_LENGTH_;
>> +	u32 ie_len_val = pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
>> +
>>  	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
>
> Again you should move two variables declared above here, inside if 
> statement. Additionally, calculating ie_len_val outside the check is 
> risky. You should ensure ie_length is actually greater than 
> _FIXED_IE_LENGTH_ before performing the subtraction to prevent an 
> unsigned underflow/wrap-around.
>

Should the guard be a simple early return if ie_length is smaller
than the offset, or is there a preferred pattern for this?

>> @@ -1072,10 +1113,13 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
>>  			break;
>>  	}
>>  
>> -	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
>> -									(cur_network->network.ie_length));
>> +	u8 *ie = cur_network->network.ies + sizeof(struct ndis_802_11_fix_ie);
>>  
>> -	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
>> +	rtw_update_protection(padapter, ie, (cur_network->network.ie_length));
>
> The original code had a potential buffer over-read here by passing the 
> full ie_length with an offset pointer. Since you are refactoring this 
> line, please fix this bug, in a separate patch, by subtracting the 
> offset from the length and ensuring the length is actually large enough 
> first. 1/X of the patch series should be bug fix, 2/X should be this 
> cleanup. Don't forget to add Fixes and Reported-by tags. Check if this 
> bug is present in stable tree and if so add Cc: stable@vger.kernel.org 
> as well.
>

Should this bug fix be in the same patch that will fix previously
mentioned subtraction underflow(s)?

>> @@ -1684,7 +1764,9 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
>>  	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms)
>>  		goto exit;
>>  
>> -	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi < mlme->roam_rssi_diff_th)
>> +	long rssi_diff = competitor->network.rssi - mlme->cur_network_scanned->network.rssi;
>
> You are declaring a variable (rssi_diff) after executable code again. 
> All declarations must be at the top of the function. Additionally, why 
> use long here?
>

The type of rssi in struct wlan_bssid_ex is long so I matched it.
Will double check and correct if needed.

Cheers,
Salman Alghamdi.

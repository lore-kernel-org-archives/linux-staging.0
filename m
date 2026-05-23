Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3401A6836
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553950; cv=none; b=XLwAVZmCFKLe8JlfsaVhdU0RSIRfyZBYgJjp+kt0E8DR96sv23wTqSR2BZ2A+MAnnk+Dlw5iBIu1vOJeEAq/0oCkTeWhYyTF+Y3Q8Ubb3t6ZOQfsEpbFcBc6PAgdPmX25CGiaAg0wfhK3QqtfYFhS5k+lVm+8YGNocFxut7cPaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553950; c=relaxed/simple;
	bh=Z/HVvTp6bqeMXElqfXJMQx4Qn8o/8xX7lEdmUSvDFMU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DxCjsszMix+WCWVr+7ur0uJoW3HbcbRd6ZgT19mURhD1jKKsIMFxW3cdhUCaUdwhKoEhL8+dqpMYeC9u89yQSJRM4hhiLMNG7vPkwTcY/XlsANo6byYpSSysz34t6Exbmmvr9bWaXD+0691RM5fpmWznYJ36OM9GhjDH11DL/rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C9AORopB; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C9AORopB"
Date: Sat, 23 May 2026 18:32:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779553945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XPpBMNYf+uBqXA5a79fqc+GgHVjilTO/Qdq9uXK2cug=;
	b=C9AORopBVxMs4VAZys4RbOh04zs1m0BSF6jeq1L+DOzbrvGg/0fiWO0srYIEecYSFBsVt9
	jQJDYw7ZOuiYW7kQd0fbivFwX7v+hp4+x8iKNmsY3sPluaNI97zOPjxK+sMujQNqGWwjUx
	qXUI48VyrrwkhaCRwjI0SMdh5Z63lLY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7=5D_staging=3A_rtl8723bs=3A_fix_r?=
 =?US-ASCII?Q?emote_heap_info_disclosure_and_OOB_reads?=
In-Reply-To: <2026052313-magnetism-platinum-7ee6@gregkh>
References: <20260523131331.69768-1-luka.gejak@linux.dev> <2026052313-magnetism-platinum-7ee6@gregkh>
Message-ID: <8973C298-B4EF-4DE0-97EB-A6F11BF565DC@linux.dev>
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

Hi Greg,
On May 23, 2026 3:44:58 PM GMT+02:00, Greg Kroah-Hartman <gregkh@linuxfoun=
dation=2Eorg> wrote:
>On Sat, May 23, 2026 at 03:13:31PM +0200, luka=2Egejak@linux=2Edev wrote:
>> From: Luka Gejak <luka=2Egejak@linux=2Edev>

=2E=2E=2E

>> Also fix three additional issues discovered during review:
>> - Missing free of pmgntframe and its xmitbuf before jumping to exit
>>   in the WLAN_EID_VENDOR_SPECIFIC lower-bound checks=2E
>> - In is_ap_in_tkip(), add missing lower-bound checks for the RSN and
>>   vendor-specific IE data accesses (pre-existing bug)=2E
>> - Move rtw_buf_update() before dump_mgntframe() to avoid a potential
>>   use-after-free of pwlanhdr, which points into the mgmt frame buffer
>>   (pre-existing bug)=2E
>
>When you say "also" that implies you need to break this patch up into
>smaller pieces, right?  Please do so=2E
>

Well, I just addressed sashiko comments on my patch, so I thought to=20
keep it one patch as it was review of if=2E

>>=20
>> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
>> Cc: stable@vger=2Ekernel=2Eorg
>> Signed-off-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>> ---
>> Changes in v7:
>>  - Address new sashiko comments=2E
>>=20
>
>That does not say _what_ you did, only that you did _something_=2E  Pleas=
e
>be more specific=2E

"Also" part is what was changed due to sashiko's request=2E Should I=20
move it here, provide link to sashiko or write it here completely=2E

>
>thanks,
>
>greg k-h

Best regards,
Luka Gejak


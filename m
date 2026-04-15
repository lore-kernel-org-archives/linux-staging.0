Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3D381AE0
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776270511; cv=none; b=rNZGem2DwYEnZD+FRWmwXOV5tJh6FshztV/0OecQkJVgFhhPbL2+raPTPdTR3fgg2tPjKrVl0vMZCVzZYd+RZ2l44O1mOHV/5k/c2+LR2/aZBY7D4BGy92ThHqYiRwSOz/0nj5cJNPAU8z8cozvKXgykuOSnO/CTSAC64Tma66M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776270511; c=relaxed/simple;
	bh=9GBoOOITMQa2fyjCto1zNDkcQPLgaJLL6KLp+M7kj1g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=HJAJ9Dlzhk4sGuBbuqbu/mqj/IkqPikVbw/RwbMIsMt1RrioqUR3jeQ2Xtp8J3qabWANG4RrpBvl4QiNUpts1uftCLlY/2bl78MiQojTx5V2nCG2f61T3a190Ltsrw2TnzTfUBSFOx2kX4HTtF4LPP5v6yLJLyeM6ZpXh/nH7WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kfe7T6L6; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kfe7T6L6"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776270507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8PgfiG/0TSrkBQUiiZXkE0m+DMzRJoQ/EVS3TGspjp8=;
	b=kfe7T6L6rIJ+VSs3lOTnAdYNo9DFqdssAfF1ktRyDR3pyNuiQ+j4K7Q2c45xvFU/vKw2E4
	tnZ6WfVEyvJdKaa/2hfmKTytTLzd3+lXvPHi0vkNud3hcq3SKnCBQ8B/NLqqMFxrScqaZj
	GwJr6qWgiFDncFel9dM6nZZrB6EeEmo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 18:28:18 +0200
Message-Id: <DHTVC9Z8IKUA.2TKCBWTRY9F6T@linux.dev>
Subject: Re: [PATCH v3] staging: rtl8723bs: fix remote heap info disclosure
 and OOB reads
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Dan Carpenter" <error27@gmail.com>, <luka.gejak@linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
References: <20260415133726.23515-1-luka.gejak@linux.dev>
 <ad-Xnciuuz6wqAVq@stanley.mountain>
In-Reply-To: <ad-Xnciuuz6wqAVq@stanley.mountain>
X-Migadu-Flow: FLOW_OUT

On Wed Apr 15, 2026 at 3:50 PM CEST, Dan Carpenter wrote:
> On Wed, Apr 15, 2026 at 03:37:26PM +0200, luka.gejak@linux.dev wrote:
>> From: Luka Gejak <luka.gejak@linux.dev>
>>=20
>> When building an association request frame, the driver iterates over
>> the ies received from the ap. In three places, the driver trusts the
>> attacker-controlled pIE->length without validating that it meets the
>> minimum expected size for the respective ie.
>>=20
>> For WLAN_EID_HT_CAPABILITY, this causes an oob read of adjacent heap
>> memory which is then transmitted over the air (remote heap information
>> disclosure). For WLAN_EID_VENDOR_SPECIFIC, it causes two separate oob
>> reads: one when checking the 4-byte oui, and another when copying the
>> 14-byte wps ie.
>>=20
>> Fix these issues by adding explicit length checks and returning a
>> failure if the length is insufficient. For HT_CAPABILITY, also clamp
>> the length passed to rtw_set_ie() to the struct size.
>>=20
>> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
>> ---
>> Changes in v3:
>> - Switched to fail-fast handling for malformed IEs in issue_assocreq().
>> - Fixed HT capability path to use structure-sized output length in rtw_s=
et_ie().
>> - Updated commit message to reflect all oob read cases.
>>=20
>> Changes in v2:
>> - Refactored rtw_set_ie() alignment to follow "open parenthesis" style.
>> - Allowed the line length to exceed 100 characters for better readabilit=
y as requested by Greg KH.
>>=20
>>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/sta=
ging/rtl8723bs/core/rtw_mlme_ext.c
>> index 5f00fe282d1b..3d44bc36532d 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>> @@ -2929,6 +2929,9 @@ void issue_assocreq(struct adapter *padapter)
>> =20
>>  		switch (pIE->element_id) {
>>  		case WLAN_EID_VENDOR_SPECIFIC:
>> +			if (pIE->length < 4)
>> +				goto exit;
>
> Oh huh.  I was more thinking about an upper bound, but yeah we need a
> both.  Anyway, what should the upper bound be?
>
> regards,
> dan carpenter

Hi Dan,
You are completely right, an upper bound check is necessary here as=20
well. If the attacker provides a length that exceeds the remaining=20
buffer size, the driver will read past the end of the received packet.=20
I've added the upper bound checks at the beginning of the loop to ensure
both the ie header and its payload strictly fit within the remaining=20
pmlmeinfo->network.ie_length. I have included this along with the=20
lower-bound checks in v4.
Best regards,
Luka Gejak

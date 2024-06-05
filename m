Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4618FC6B
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717581779; cv=none; b=Btj7MyEvCPmlBDHxHEg5IPS9QQo8wJ8rHlX1d2k1Xr80TW+eeZYzlaXsLgGIHdnci1HHy2UYFWva1jTVNv0x/rPlqHe2BEYxOfhQmjREe/fPUxvzwe6xHYj3+elWyJR5J4Vh2jHG+hMU7Yh19YRT3cQZQhASELD6keaEVonFr6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717581779; c=relaxed/simple;
	bh=0RwbECn8vcjlTtm7BxJQTuls9p4CwH2DYz5zJSvpESE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBNayQrZ93CsgLYgzaMwESJenGuh3LEhnIaqaC0yDn7OlL8u2+W1nafjxKH79ZsefiPm1w3g96IX/VPDD7+sj//9YE1OwWn5n1DEE9e3UecrdyeMhc4o8/bL/FJXHUZDBkRSHvCdEirXoNuuY0w++/EA13h30cpClfVuAvvUenA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=PoBWlTMO; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PoBWlTMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717581762; x=1718186562; i=wahrenst@gmx.net;
	bh=F/AW18Z/Du+YBfpGsTCFCEyHYtS3tCQhUz5kBxSHiXA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PoBWlTMOisME9QUYgwWz8t6+Ft6KaCHTJX42EVKdNrX97DR/i+c/6vIDjrH7puKI
	 P0XnaVw56+Maz3A7BDzjmcDgRIi9TBIKeBsifq8x1epUzgojseI7AHmBEW0O8FJPg
	 RyPwCYZDEE6Ki044GYtN9onu82Y/Y9ZvYVOjupgOg1IQI5VGvKuJ3oajyEX8/xLhJ
	 T0Tx/kFiat+0CR3WAY5WyCWgRrfZY1YGZzN6/lgjM/kbk+V1JuKTJxXpPXZt9d9JU
	 s8E0N9LKi2LuO9gxX+qlp/da0lf8BW+wmcICaXx2qSreiF6mHMkPJAOoOJs85e8sA
	 W9f6qy1XLuqk+YGRNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mFY-1sR4Vq02Wa-01370F; Wed, 05
 Jun 2024 12:02:42 +0200
Message-ID: <d780ef1e-a712-4e83-aa0d-72c123b2e654@gmx.net>
Date: Wed, 5 Jun 2024 12:02:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] staging: vchiq_arm: Drop obsolete comment
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-3-wahrenst@gmx.net>
 <20240605065253.GD879@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240605065253.GD879@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:11K8rj5L6hASJ6cWjSZWiVz5/xVBxjy73rlv7+arbn5oDFYYmBN
 VdRtKiOkdW9HvOjVnTXH2VfgvqsQtFRbhqL7Q4+U4MDccQFTbYMhlOzloybit3UI2GvlaDn
 1jG27SbnlJEkVQzq8qarHwVCik/Y3O9z2jcb+qIxM7tvpuYpC8uN9DHM1WPsK5kN43eRdcS
 ksTmkKgGaoPUnkahHvWLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lC2YQoiKEXA=;z42pL0YPOqokUBwFaVGSVrbKHDD
 K1epyXunWPP18QYVua26TI7r3nwxCusRllOJrmbwcsK0VC+p8QjqMwSOMXK1qT8mDgR7b9rY5
 R66kAdZPkI+cX4t3vOBkBG6+SdibtJL3MBHlhbE67dSoajOjFvaYEPf1D4JgxvF/4Q47xBRfd
 YHwG1iNm5/DpuVsM5i/gHkSceBlYSnwE3XJlmaN0NiZo1nPAJp+xeTXNfbMlYnYOYiJVn+um1
 MCtcDB3YX5bLvpfhcujwt2WUhsyOtMq+44hNsMmFsWuXsfaC/hAisM8PKy3wqqo/LaxNv5L8b
 ZZZ0SCuR2WsawKKE9Rg8BSmgUajgeIBNDPeaYgeXZy/AaIdIdYdgFUS0rFQl8W9ryfq8Nt+rx
 qKiZxNgBoHHt8lqIC7Xfh1td3J2ae2w7hxaEkU/VgP01gmkwr3t4oCzY0KpIPe9AP+qXNQine
 6a+dsKlCD24isbbdVVYFoz29a1Z//0kgP7kPFDLPwL/5gkM/7qdmvLgZtSCIJvhiIW/qSXaC3
 Ud9EEr5ozTGTnDM55Q/vE6a6nzdCo4mlZlsWPEfOBy8Dj157wMk+oTovtvs5U6rhFkRaB3nCz
 Ixhb70NbFIBI6aU/02e4Js7izyMN+/6vRuOcvT/fIirYjg5XKyHr+u4ZAqJ3BlClKJBI8Y2Bh
 6DgXPgGPSpz37U4lRpWhlJNhxsZQldbo5DAKsPQcjHTM3hF6WrM83O3qOxwpunvD6KGxyQG+z
 p5gYPo/JnobIzppfiF9mAZRGs9jZCUIJu4l73U/oPqb8rxiPBd3cTl40ZCK/9xtwTECtNRSKS
 c9iRQjRQ/wiGTOAyyxZcwiVBIwvbCa7kI+LWv9HBOpvWo=

Hi Laurent,

Am 05.06.24 um 08:52 schrieb Laurent Pinchart:
> Hi Stefan,
>
> Thank you for the patch.
>
> On Tue, Jun 04, 2024 at 07:28:55PM +0200, Stefan Wahren wrote:
>> The BUG_ON has been replaced with WARN_ON. So we can drop the
>> comment.
> Note https://lwn.net/Articles/969923/ :-)
>
> This being said, I think the comment can be dropped, regardless of
> whether or not we drop the WARN_ON() later.
thanks i wasn't aware of that article. I think, we can address this in a
separate series and try to replace WARN_ON() with dev_warn() in cases it
makes sense.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ar=
m.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index e2f4aa00cb70..515cdcba043d 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -1451,7 +1451,6 @@ vchiq_release_internal(struct vchiq_state *state,=
 struct vchiq_service *service)
>>
>>   	write_lock_bh(&arm_state->susp_res_lock);
>>   	if (!arm_state->videocore_use_count || !(*entity_uc)) {
>> -		/* Don't use BUG_ON - don't allow user thread to crash kernel */
>>   		WARN_ON(!arm_state->videocore_use_count);
>>   		WARN_ON(!(*entity_uc));
>>   		ret =3D -EINVAL;


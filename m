Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2C190065
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717581884; cv=none; b=YCZ3iyiHCYfBssKpZSkbA6JinHN7C4IZGg47MV8KAJxLuF5IqG4fbHLwRYGhs2pDzWW1sbROoDGtXwjwFZqNTPUrAOHCV/4BlNtqnaP+aOfqujdpr33b9Z5t05SU4Ay+8o6s3hy20S5FE3PJ0eF4FvqgYDcBlABVM88eLHM0RL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717581884; c=relaxed/simple;
	bh=xTFognh04HvUrPUYh4+V50EUqH/ny5mKgPDzvpfQjtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFcw+rXRifkOmPxFgRS0Wvhzc4ITtzmqpw8vCO6JjCZCy5Fa7h7bv/cTc91pWym7EHzztRY4mZD/6yije2/ICBPVBTtIUrlm3WxFk7En7wuVF5HDFhTPTUZp1QkpuyKVfd1eFUWs4UXCiCJdWLFUhaNOsDBYDB/vt1yEbUDcFhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=TgR5dyRM; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="TgR5dyRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717581872; x=1718186672; i=wahrenst@gmx.net;
	bh=GgWQaDzhqorlyn91Z2eZ4O5KCpBAslMNBTy9jXa135o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TgR5dyRMJ/Ptm+pHBxjSpAQLg+oVVOCRpI6vkvfeZG/o8qG2Q7RapRTtxgvz2nUd
	 ATNJ21uD+klPVgqaUFqXwG0/6aMKKWUHDpvrFrcyIXgGFxOsTSiNI4uE6CxjJsdmf
	 VbMD/k4lGGJx8C+877Jj3LOczCtuDC2rranHWUsweiak5gMfESGYH3p2KdnIYmX/l
	 FjmWeXDzFx+Kg1YPToxfmEl1qKWi/6QVGwaRcJj5wBkjpmpnCE2LcQkv4484B0pNM
	 FJ2GMq0lmlQdo5Ye31k40C9/IrO4JL1zUNYp3AkCx55L52gWYKC8689n6RiKHXm13
	 UCHICLe0JOQeGEturg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatRT-1sr9X11NHP-00cPW2; Wed, 05
 Jun 2024 12:04:32 +0200
Message-ID: <e4efe70d-45ac-472e-bc0f-89fb158a903c@gmx.net>
Date: Wed, 5 Jun 2024 12:04:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] staging: vchiq_arm: Replace variable ret with
 status
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-2-wahrenst@gmx.net>
 <20240605065134.GC879@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240605065134.GC879@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ijQJtxuunKO3wIcMYt1QbxPIehvy11D158aQExoPZ9gVzTIaUTQ
 x0fHr+2AWSgVWJAf/nD3u23J0UGmfJ/0ZIZk2TU+n03YBWSrMudartYUZVSm82VaMkrrI0H
 P2RuIFAtFE2EY1E8UmCxQ3gz+jieY0pAfXN0IXujEabfaQv75PCOhcIi5xsQjIrgO865Iz+
 TyTgYuHxBu/NMy5Qh6P8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+Fs4Ds31Kns=;iYsRAm94ojcKS/wDX8zsNuw7HUH
 QNHFhMiLAV22yLvxKbZFWW7wCbUKh9IkcQzScUiFk+FXgwRj7KvnUgc0fvbYwXfnQD8A/YYE3
 JvGulQFOEnYpwU896+sF+OSLVjmJNZi+ZAwfDGeLHHaLzQGF5XtrKop7NSmFhv8PWgP4+U13Z
 1P1YW0P2U98teVGieRtOKduIXNWjNvLWtZ0uV8L5OzsU1R/F3pDHSzCc8jI2E0zwGm3UVJ6Qo
 I7XzyPyX2L0YCfqZfd1GlwY0BwQ2b0ROQokHNk36w6RDqxsZxQTT35rRVLYiGOf3tRZYg/CFB
 bW2XopMzzJq9yMiR6cMNxZcc1VoJQbWse1BQFbIFFvY057E4Vuq4GV/iM4K1WpsMOUGdKDFQ+
 4RLZIhNBJlMN+HBcooYjIzC0RC1AOClgD13HkG/NOQc7NMoyX3e5c6LaQiw60ED7zaTtDQwSA
 Jf3DSJHeIZlcz6etP9jF3BT76DBpfyPth/Nt6ILFiEg7i2EoQNXHww1n2L11FnowBYqrvwuou
 dXMdhGYo5HKjc8OoBxys+W5hqHmsWBD196O/Gw6rHpnDTg19nTuHGbvBVhKxjGEQrIeivG69r
 TQP8vFgXtsw0yAbprpw9FPN7F4BdN5VFyQhS40GBM9RlTq861RzDghjGu5D3l30th/JcDhpL0
 7qDrzyfMiEPtlxBVrVjYDCrKEuEwO5bO867wdtudPLPlYc1CnmXiClQoMvv7LwIUJc7PAXcF0
 s0ryCUwnnBuWa0lrdY/PaAnOxvxe7jnzo/FqkTFwCP26gEUn0Zqgjzi87U3e5xN3KdrFpKOWC
 nhaDkSQUXtZbtR2viYwBTnq3t6cHvH4V9iTNvmhgiLGps=

Hi Laurent,

Am 05.06.24 um 08:51 schrieb Laurent Pinchart:
> Hi Stefan,
>
> Thank you for the patch.
>
> On Tue, Jun 04, 2024 at 07:28:54PM +0200, Stefan Wahren wrote:
>> The variable ret is just storing the result of last function
>> call like the variable status. So replace ret with status
>> and make a consistent use of this variable.
> I would have gone the other way around, and replaced 'status' with 'ret'
> as the latter is more commonly used for this purpose in kernel code. I
> know it will generate more churn, but I think the result will be more
> maintainable.
i will look how many of the existing code is affect, because this is not
the only function.
>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++---=
-
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ar=
m.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 69daeba974f2..e2f4aa00cb70 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -1298,7 +1298,6 @@ vchiq_keepalive_thread_func(void *v)
>>   	int status;
>>   	struct vchiq_instance *instance;
>>   	unsigned int ka_handle;
>> -	int ret;
>>
>>   	struct vchiq_service_params_kernel params =3D {
>>   		.fourcc      =3D VCHIQ_MAKE_FOURCC('K', 'E', 'E', 'P'),
>> @@ -1307,9 +1306,10 @@ vchiq_keepalive_thread_func(void *v)
>>   		.version_min =3D KEEPALIVE_VER_MIN
>>   	};
>>
>> -	ret =3D vchiq_initialise(state, &instance);
>> -	if (ret) {
>> -		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n", __f=
unc__, ret);
>> +	status =3D vchiq_initialise(state, &instance);
>> +	if (status) {
>> +		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n",
>> +			__func__, status);
>>   		goto exit;
>>   	}
>>


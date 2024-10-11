Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302D804
	for <linux-staging@lists.linux.dev>; Fri, 11 Oct 2024 11:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645451; cv=none; b=TFVfJqenk8lajMzqSO/eeob2Oy4UsPirFOJQJXkBbo7C0am5PdL7My8tsqPTqf4eor8CfhLPY4R1V/6FCr5qJs6jHvfRXBqHi/w+k1FtIK8BzoFmBFMGu5w42NGwAGQGYYiLlkRiQITJIui2Jb8zhF2pHINm3ju58Ap07WlFLqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645451; c=relaxed/simple;
	bh=RHr6yDEw8/1qc1o/DsJp16snVytM8QEtWm0ra09XPRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAH/VNL2SrqjiSsUyRbfC9UDowyYNmJzR/ampm8FRSqPN+G52nbp+0s7en9KhZ6CMTvWAuhPHsHwNXuNMubfbSANwHmPxruOdFwABxHFkCtR3wzXaW5oC8s5a9v9N8BTLizCyJDNu0LAzhzALBhW0VDq394EYTarFZSF3wtGLqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=VbJV91sM; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="VbJV91sM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1728645440; x=1729250240; i=wahrenst@gmx.net;
	bh=RHr6yDEw8/1qc1o/DsJp16snVytM8QEtWm0ra09XPRM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VbJV91sMbVlg/nWOlmp2v32L2VMrGeOdjM3YH8YnaR+W/0cDUhV44bITpzP66sQJ
	 /d4P0/TJGtb78GBQTcEqZNzf79heozwLlO1VyxxD7M7Q5vnMqTuQsh3+q6N+Ct6Pd
	 /w528YU6J8UQ1XJ7kpra5ztpl348Nr4SQVpjkDyCY0vqbkkJcI7G5E2/eZo6Y0AG/
	 MBVfEQxfklrzoy7dPRFaV/DuhUgQVKTVNO8dH/YtJ9uNd/woVHLTR/KNjG0b+8CSI
	 ugo3HD4EYfwwgvtl4aIYKkteF8blR+D60WWrnTemaArsMslJD+XJ5T1p7D8nQP/i6
	 9veG/+L27DF/8lk3Xw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFzx-1t8shJ2gEf-00Ezhv; Fri, 11
 Oct 2024 13:17:20 +0200
Message-ID: <6ed9b6ae-e59c-4b22-9320-75c1a5ed83bd@gmx.net>
Date: Fri, 11 Oct 2024 13:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vc04_services: TESTING: Adjust ping test
To: Umang Jain <umang.jain@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20241011100119.111399-1-wahrenst@gmx.net>
 <628861ca-6cda-4f2a-983d-98150e547674@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <628861ca-6cda-4f2a-983d-98150e547674@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a43sR6vIC+YsgAjS3f6lJrbN1VwgJRLFLILMOV/NFjy5yY21ibC
 hC8lwwLYDAHU0VrrqC2BYeRgNyl1ciO9l9yIEn6NMWAhM40CfDjbGBDHYQwbXrGUPMQ7AAo
 QPwW53qdgxFgj9GIhCzPLJDHitaR2rQv732ex6T9AFrZmQ6mHwED8M+I+s8mHirjoz3o200
 T7f4YMxi97ptfyrCYyDpg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FxWYhxVkefQ=;ZkLt2n7P6y+Q3MfAIDraoLSoAmi
 G8b9W0pPrtBr98yJMgF22fRK9qv3rwA00lKYm6tiDIl71I8OiivJkiknyVfMZR6Yb4n3RvjMk
 LYXQ7E4NSqI8FK071Wv2HgteTCoMkF/bG+kEFAc5V9XXFlO0LQ8aMAemovWsURnwR5AfOJvFl
 gmaXGbU43jmWxQoeivHchoKQBTzkN/PeWpP1skACBkOuINLRjuOqqoxaY9FhE2cYjA0T+mD/S
 KobdGgugESc1WsiDGyNlix/3AZjpmD6wMHwMEJDKQ4oCL/EUr+X+l3cfaEMt0eihISvBvFF2I
 g+2ZDbGoLIMisLWDibAyWV2HY0Chkh0jFCFx3P3M52l9cgX6yTP0hk2DeB5/JA0QzS2Iw76sR
 q+Vdr2KZI7DpC5x/S96aCBVGtUQCQSnwmWGxpPn0jIUq2jIAbBPyCPn5m18xPB46LMguKT0kI
 q/+JslttvIaD9bJEYEbkPQqN/luNx76xTH+a9tF+3TgclqtT50MCutwz2Qd1QY5SIq6yKDDfs
 ifId1VjBtXPUsPeUTc3+Hz3F9/og3SNDT8SblK9t76uRgw6w/aLB3gB5ymnpLDN2dnVW7Goww
 4BLgPHM11r7+BcgrakXALWzdyPm7cEuszI8smvWOPH3CIYBZYF43kMcf6+dC8I+QPGpO0cjF0
 Zd53PQU86dGTTJcZyLPB255PgnufdBQTok7DAth/yZyFhGMhhf2cfdnYGpEhBYr/lm8PU7x6p
 pZ+mYAU9PVve85xAmsQCuoGaXTQysxVUlCWD5bd5R5asNVVejZIXd2oQaTf1WGkDDz1qqpJE6
 9SQHcCtWqlEIJoSldf7VKErA==

Am 11.10.24 um 12:02 schrieb Umang Jain:
> Hi Stefan,
>
> Thank you for the patch
>
> On 11/10/24 3:31 pm, Stefan Wahren wrote:
>> Recent tests on Raspberry Pi 3 B Plus have shown that one
>> iteration is not enough to discover issues reliable. So
>> switch back to the defaults (1000 iterations).
>>
>> Link:
>> https://lore.kernel.org/linux-staging/c7e302b6-fc62-4754-ab1d-7c2771ccc=
f60@gmx.net/
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>
> I've been using this for all my testing for recent patches.
Thanks, I still have the hope we are not the only one working on this
driver :-D
>
> Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>> =C2=A0 drivers/staging/vc04_services/interface/TESTING | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/TESTING
>> b/drivers/staging/vc04_services/interface/TESTING
>> index 273952dc9d85..c98f688b07e0 100644
>> --- a/drivers/staging/vc04_services/interface/TESTING
>> +++ b/drivers/staging/vc04_services/interface/TESTING
>> @@ -52,10 +52,10 @@ Here are the most common kernel configurations:
>>
>> =C2=A0=C2=A0 * Ping test
>>
>> -=C2=A0=C2=A0 Command: vchiq_test -p 1
>> +=C2=A0=C2=A0 Command: vchiq_test -p
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 Expected output:
>> -=C2=A0=C2=A0 Ping test - service:echo, iters:1, version 3
>> +=C2=A0=C2=A0 Ping test - service:echo, iters:1000, version 3
>> =C2=A0=C2=A0=C2=A0=C2=A0 vchi ping (size 0) -> 57.000000us
>> =C2=A0=C2=A0=C2=A0=C2=A0 vchi ping (size 0, 0 async, 0 oneway) -> 122.0=
00000us
>> =C2=A0=C2=A0=C2=A0=C2=A0 vchi bulk (size 0, 0 async, 0 oneway) -> 546.0=
00000us
>> --
>> 2.34.1
>>
>
>


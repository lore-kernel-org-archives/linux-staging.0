Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F132F2351
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968894; cv=none; b=svWzQU8HuKS9NENXs03KkgrvKb+k3Fza5+v+4YUw9KY8hFlQ+WCEdYX6E7RZ7LcpBtnRKVE/MScziJ9spVE7FztO0TYXsAktqZoo3dAsMU3VMG4Hvc3KzO16C9zAzygIsu2kuHhx/38sJP4FoM2NVWmm4VCWLJ0IyzsxCJ1cHj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968894; c=relaxed/simple;
	bh=rqjc0TkzIFYP1B2IJmJA4zk0wCGTI3E9vy/yPGZQOlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t6E9fBnOUmJW1+llrTFPOrevICYZu+5wXFd1gXy6xac9igpSum2B4py+EBPsRRVhj/8s7heqkOiMpwkw8y7InOZq+a4sY3rJtLqyif/zRMYcrKgj2ehpXqFIIcI5OGFVokhRaoYl6XLQIFAmUulH8MrAuovO6/e7syp5HlWDoAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Tzlx7DDX; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Tzlx7DDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1750968884; x=1751573684; i=wahrenst@gmx.net;
	bh=rqjc0TkzIFYP1B2IJmJA4zk0wCGTI3E9vy/yPGZQOlE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Tzlx7DDX51bL3Nw9wuDpI2V4b9DySnKbRJzavAMOZixEzSwky6n1HXjOf0qIyWPH
	 kmARt3jTquRkoIOdqnGdfNKaUglhNgDfGfQL8MCmAqjeklYNKRdo62JpgjCq9jOGH
	 XoWrPU4gBvxipJpLyBVOm9StP1+y/gbQkwFjGBX0YyQuGc2kBKTrnV/wIMI5xTV3d
	 1B609Vlap+uJoKT8Esec79TFKhdBoscEL/wMUjz3puOHZXMbvWmjrlokdd4W4hK5g
	 v4FQz/JH4XZRryUc8oP+xHvG3drM5Xx3SzBDMkwAlP9SeUjY7DNzI4WXDNKIIxMVG
	 iuUPQOsH7KVicfvxDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD6W-1v070L3wRu-00g2xd; Thu, 26
 Jun 2025 22:14:44 +0200
Message-ID: <7314139e-93fb-4abb-acac-0a07454d8d26@gmx.net>
Date: Thu, 26 Jun 2025 22:14:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <maira.canal@usp.br>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
 Ojaswin Mujoo <ojaswin98@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250309125014.37166-1-wahrenst@gmx.net>
 <20250309125014.37166-5-wahrenst@gmx.net>
 <ba35b960-a981-4671-9f7f-060da10feaa1@usp.br>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <ba35b960-a981-4671-9f7f-060da10feaa1@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SmYQw8hdg1Ty0jZIb7Tntvn36ZoitGugz4yb4xijlzpfFdxPZJW
 pBSkQos+1p2hs94+2KWas/51CgtoVlrG+v2CJJRwiEJhUzkMqGCZi6PmJIwBI7OHa05uRCa
 UoBj/7myXle41vjLw4X/vKsZU84C4TnddkLKAowyj5Gep7RWXHFm42KDfG08DTM1dBd77MF
 Zqr9OLz6x5w2PIjPs+nMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6YP4dDwB7Vo=;KWj5GlcPCKa6Kj+GdGVQlEoyI9F
 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

Hi Ma=C3=ADra,

[add Arnd]

Am 26.06.25 um 20:22 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 09/03/25 09:50, Stefan Wahren wrote:
>> Creating the keep-alive thread in vchiq_platform_init_state have
>> the following advantages:
>> - abort driver probe if kthread_create fails (more consistent behavior)
>> - make resource release process easier
>>
>> Since vchiq_keepalive_thread_func is defined below
>> vchiq_platform_init_state, the latter must be moved.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>> =C2=A0 .../interface/vchiq_arm/vchiq_arm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 69 +++++++++----------
>> =C2=A0 1 file changed, 34 insertions(+), 35 deletions(-)
>>
>
> After this patch landed on 6.12 stable, I started to observe the
> following warning in Mesa CI [1]:
Is this also reproducible with 6.15.x or mainline ?
>
> 20:07:07.830: [=C2=A0 242.653532] INFO: task vchiq-keep/0:85 blocked for=
=20
> more than 120 seconds.
> 20:07:07.835: [=C2=A0 242.660404]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No=
t tainted 6.12.34-v8-+ #13
> 20:07:07.843: [=C2=A0 242.666173] "echo 0 >=20
> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 20:07:07.852: [=C2=A0 242.677126] task:vchiq-keep/0=C2=A0=C2=A0=C2=A0 st=
ate:D stack:0=20
> pid:85=C2=A0=C2=A0=C2=A0 tgid:85=C2=A0=C2=A0=C2=A0 ppid:2=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 flags:0x00000008
> 20:07:07.854: [=C2=A0 242.690734] Call trace:
> 20:07:07.857: [=C2=A0 242.693191]=C2=A0 __switch_to+0x188/0x230
> 20:07:07.858: [=C2=A0 242.697010]=C2=A0 __schedule+0xa54/0xb28
> 20:07:07.859: [=C2=A0 242.704889]=C2=A0 schedule+0x80/0x120
> 20:07:07.859: [=C2=A0 242.712581]=C2=A0 schedule_preempt_disabled+0x30/0=
x50
> 20:07:07.860: [=C2=A0 242.721437]=C2=A0 kthread+0xd4/0x1a0
> 20:07:07.861: [=C2=A0 242.724606]=C2=A0 ret_from_fork+0x10/0x20
>
> If I revert this patch, I no longer get those warnings. From that, I was
> wondering: is it possible that in some scenarios, we might never
> actually get to the connected state and therefore, we wouldn't wake up
> the kthread that we created when we initialized the state?
Sure we communicate to the VideoCore and there might be reasons the=20
connection fail. I'm not aware that a missing wakeup cause a hanging task.

Best regards
>
> [1] https://gitlab.freedesktop.org/mairacanal/mesa/-/jobs/78940369
>
> Best Regards,
> - Ma=C3=ADra
>
>> diff --git=20
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=20
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index 0c7ea2d0ee85..64f9536f1232 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -280,29 +280,6 @@ static int vchiq_platform_init(struct=20
>> platform_device *pdev, struct vchiq_state
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> -int
>> -vchiq_platform_init_state(struct vchiq_state *state)
>> -{
>> -=C2=A0=C2=A0=C2=A0 struct vchiq_arm_state *platform_state;
>> -
>> -=C2=A0=C2=A0=C2=A0 platform_state =3D devm_kzalloc(state->dev,=20
>> sizeof(*platform_state), GFP_KERNEL);
>> -=C2=A0=C2=A0=C2=A0 if (!platform_state)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> -
>> -=C2=A0=C2=A0=C2=A0 rwlock_init(&platform_state->susp_res_lock);
>> -
>> -=C2=A0=C2=A0=C2=A0 init_completion(&platform_state->ka_evt);
>> -=C2=A0=C2=A0=C2=A0 atomic_set(&platform_state->ka_use_count, 0);
>> -=C2=A0=C2=A0=C2=A0 atomic_set(&platform_state->ka_use_ack_count, 0);
>> -=C2=A0=C2=A0=C2=A0 atomic_set(&platform_state->ka_release_count, 0);
>> -
>> -=C2=A0=C2=A0=C2=A0 platform_state->state =3D state;
>> -
>> -=C2=A0=C2=A0=C2=A0 state->platform_state =3D (struct opaque_platform_s=
tate=20
>> *)platform_state;
>> -
>> -=C2=A0=C2=A0=C2=A0 return 0;
>> -}
>> -
>> =C2=A0 static struct vchiq_arm_state *vchiq_platform_get_arm_state(stru=
ct=20
>> vchiq_state *state)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (struct vchiq_arm_state *)state->=
platform_state;
>> @@ -1011,6 +988,39 @@ vchiq_keepalive_thread_func(void *v)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> +int
>> +vchiq_platform_init_state(struct vchiq_state *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vchiq_arm_state *platform_state;
>> +=C2=A0=C2=A0=C2=A0 char threadname[16];
>> +
>> +=C2=A0=C2=A0=C2=A0 platform_state =3D devm_kzalloc(state->dev,=20
>> sizeof(*platform_state), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!platform_state)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +
>> +=C2=A0=C2=A0=C2=A0 snprintf(threadname, sizeof(threadname), "vchiq-kee=
p/%d",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state->id);
>> +=C2=A0=C2=A0=C2=A0 platform_state->ka_thread =3D=20
>> kthread_create(&vchiq_keepalive_thread_func,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (void *)state, threadname);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(platform_state->ka_thread)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(state->dev, "couldn=
't create thread %s\n", threadname);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(platform_sta=
te->ka_thread);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 rwlock_init(&platform_state->susp_res_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 init_completion(&platform_state->ka_evt);
>> +=C2=A0=C2=A0=C2=A0 atomic_set(&platform_state->ka_use_count, 0);
>> +=C2=A0=C2=A0=C2=A0 atomic_set(&platform_state->ka_use_ack_count, 0);
>> +=C2=A0=C2=A0=C2=A0 atomic_set(&platform_state->ka_release_count, 0);
>> +
>> +=C2=A0=C2=A0=C2=A0 platform_state->state =3D state;
>> +
>> +=C2=A0=C2=A0=C2=A0 state->platform_state =3D (struct opaque_platform_s=
tate=20
>> *)platform_state;
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> =C2=A0 int
>> =C2=A0 vchiq_use_internal(struct vchiq_state *state, struct vchiq_servi=
ce=20
>> *service,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 enum USE_TYPE_E use_type)
>> @@ -1331,7 +1341,6 @@ void vchiq_platform_conn_state_changed(struct=20
>> vchiq_state *state,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 enum vchiq_connstate newstate)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vchiq_arm_state *arm_state =3D=20
>> vchiq_platform_get_arm_state(state);
>> -=C2=A0=C2=A0=C2=A0 char threadname[16];
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(state->dev, "suspend: %d: %s->%s=
\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state->id, get_c=
onn_state_name(oldstate),=20
>> get_conn_state_name(newstate));
>> @@ -1346,17 +1355,7 @@ void vchiq_platform_conn_state_changed(struct=20
>> vchiq_state *state,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_state->first_connect =3D 1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock_bh(&arm_state->susp_res_loc=
k);
>> -=C2=A0=C2=A0=C2=A0 snprintf(threadname, sizeof(threadname), "vchiq-kee=
p/%d",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state->id);
>> -=C2=A0=C2=A0=C2=A0 arm_state->ka_thread =3D kthread_create(&vchiq_keep=
alive_thread_func,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (void *)state,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 threadname);
>> -=C2=A0=C2=A0=C2=A0 if (IS_ERR(arm_state->ka_thread)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(state->dev, "suspen=
d: Couldn't create thread %s\n",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 thr=
eadname);
>> -=C2=A0=C2=A0=C2=A0 } else {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake_up_process(arm_state->=
ka_thread);
>> -=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 wake_up_process(arm_state->ka_thread);
>> =C2=A0 }
>>
>> =C2=A0 static const struct of_device_id vchiq_of_match[] =3D {
>> --=20
>> 2.34.1
>>
>>
>
>


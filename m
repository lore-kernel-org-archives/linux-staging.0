Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E354A00
	for <linux-staging@lists.linux.dev>; Sun, 13 Jul 2025 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752437987; cv=none; b=YMsShAUWorrWj/Q4sq8vN1U8ZwIOqfBEtiafqJ0vIb/nXv5sM7KGi/1axuQCyvbOM9RvXJCvEOg6IT2wPP+wqpKuZb1ebSkTgfOoRUHkdYClcQTvPiKyEZQnazOii/OoZg/Zkrb7Bxt23eLZ4y9Bs0a+hO7smXxaQUTMPXQJI50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752437987; c=relaxed/simple;
	bh=rR4BOuPRP6ScSpYlub+XUnZ9NMO7d6eiQ22EVSWqMmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMq2d3fNlsG3fbKi6MA+nvKrLKBK/MxOFhGgUKsOrUgja+/TjvsZob14yeoB+1GGxaa6RDrwE4fs9TFe7bD4pvCXeCefNCb+M4fH3lnkcyv94+HYEBdTqlawacJB/Qi+hiyIjihBRliz0F9NzPxL+iWvtR4H2dbL9Um0ODh8Gn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=mbwDnYxn; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="mbwDnYxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752437960; x=1753042760; i=wahrenst@gmx.net;
	bh=rR4BOuPRP6ScSpYlub+XUnZ9NMO7d6eiQ22EVSWqMmQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mbwDnYxnF8JpwNkn8hUaO9kFSxcZ9N3AFLCGCIktScPFlo3fC8PRSCAEZLHcbvgi
	 b7O1kbiDJqK1YodeLjd/6bCXkVgIa4GYR41Wikt3Y5gAYSuM4tgQxt9e7sbUg/QW5
	 7uVyVtFTvunXd2Qo7AWkjY9IemMga7AkrAdt+KfkokC3i3MbVSk/bf+b/V9UCxcbu
	 /fXsF3QnlggTLYdj8FwI3D4HCcTlNbU0uogQgKzs/tYLv6A5q9plrxWoTGTxTdqc3
	 xO+CS1wJbBktriq6o0bN+Bd6Zxv9wwad1O2m5MBfpny7G/7KJrDjSaEYLe398f6k+
	 Of8jlrz+OWB7TSqR5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvLB-1u9vVa4029-00Lk4a; Sun, 13
 Jul 2025 22:19:20 +0200
Message-ID: <398c8df8-2490-445c-8a64-472cb37399e5@gmx.net>
Date: Sun, 13 Jul 2025 22:19:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Revert "staging: vchiq_arm: Create keep-alive thread
 during probe"
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <maira.canal@usp.br>, stable@kernel.org
References: <20250711154031.24178-1-wahrenst@gmx.net>
 <20250711154031.24178-3-wahrenst@gmx.net>
 <4f5b18b8-ff3c-40a2-8e3b-19757f57d79c@igalia.com>
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
In-Reply-To: <4f5b18b8-ff3c-40a2-8e3b-19757f57d79c@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kdttMxT7HJPt9iow6VkVOzkIn3WxNrtCuAq+qayCQK1RVUxigoi
 n53hNhxPd1bbgxva5970Zii/DEtyVwvoxgrq2NMuFCISJo+Y37LxQfUL6wCHSQbO0wo/gzd
 sjPnpuwTSHpLTzJr4DwAXWykg0ULpl8ypLQdP0PxJmG6QzA/uPawgd6jUtqdQL8r4V/S8r2
 /lSMPKG/m1zyua91Y2gXg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QumdlOxwuwc=;zYy/endgMgoTMQ52ryCNXoFoznV
 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
 PteQs=

Am 13.07.25 um 20:40 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 11/07/25 12:40, Stefan Wahren wrote:
>> The commit 86bc88217006 ("staging: vchiq_arm: Create keep-alive thread
>> during probe") introduced a regression for certain configurations,
>> which doesn't have a VCHIQ user. This results in a unused and hanging
>> keep-alive thread:
>>
>> =C2=A0=C2=A0 INFO: task vchiq-keep/0:85 blocked for more than 120 secon=
ds.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not tainted 6.12.34-v8=
-+ #13
>> =C2=A0=C2=A0 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this=20
>> message.
>> =C2=A0=C2=A0 task:vchiq-keep/0=C2=A0=C2=A0=C2=A0 state:D stack:0 pid:85=
=C2=A0=C2=A0=C2=A0 tgid:85 ppid:2
>> =C2=A0=C2=A0 Call trace:
>> =C2=A0=C2=A0=C2=A0 __switch_to+0x188/0x230
>> =C2=A0=C2=A0=C2=A0 __schedule+0xa54/0xb28
>> =C2=A0=C2=A0=C2=A0 schedule+0x80/0x120
>> =C2=A0=C2=A0=C2=A0 schedule_preempt_disabled+0x30/0x50
>> =C2=A0=C2=A0=C2=A0 kthread+0xd4/0x1a0
>> =C2=A0=C2=A0=C2=A0 ret_from_fork+0x10/0x20
>>
>> Fixes: 86bc88217006 ("staging: vchiq_arm: Create keep-alive thread=20
>> during probe")
>> Reported-by: Ma=C3=ADra Canal <maira.canal@usp.br>
>
> If possible, could you use my Igalia e-mail instead (mcanal@igalia.com)?
Sure
> I mistakenly sent the e-mail reporting using my university e-mail.
>
>> Closes:=20
>> https://lore.kernel.org/linux-staging/ba35b960-a981-4671-9f7f-060da10fe=
aa1@usp.br/
>> Cc: <stable@kernel.org>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>
> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> Best Regards,
> - Ma=C3=ADra
>
>> ---
>> =C2=A0 .../interface/vchiq_arm/vchiq_arm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 69 ++++++++++---------
>> =C2=A0 1 file changed, 35 insertions(+), 34 deletions(-)
>>
>> diff --git=20
>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c=20
>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> index cdf5687ad4f0..6434cbdc1a6e 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -280,6 +280,29 @@ static int vchiq_platform_init(struct=20
>> platform_device *pdev, struct vchiq_state
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 +int
>> +vchiq_platform_init_state(struct vchiq_state *state)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct vchiq_arm_state *platform_state;
>> +
>> +=C2=A0=C2=A0=C2=A0 platform_state =3D devm_kzalloc(state->dev,=20
>> sizeof(*platform_state), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!platform_state)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
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
>> =C2=A0 static struct vchiq_arm_state *vchiq_platform_get_arm_state(stru=
ct=20
>> vchiq_state *state)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (struct vchiq_arm_state *)state->=
platform_state;
>> @@ -988,39 +1011,6 @@ vchiq_keepalive_thread_func(void *v)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 -int
>> -vchiq_platform_init_state(struct vchiq_state *state)
>> -{
>> -=C2=A0=C2=A0=C2=A0 struct vchiq_arm_state *platform_state;
>> -=C2=A0=C2=A0=C2=A0 char threadname[16];
>> -
>> -=C2=A0=C2=A0=C2=A0 platform_state =3D devm_kzalloc(state->dev,=20
>> sizeof(*platform_state), GFP_KERNEL);
>> -=C2=A0=C2=A0=C2=A0 if (!platform_state)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> -
>> -=C2=A0=C2=A0=C2=A0 snprintf(threadname, sizeof(threadname), "vchiq-kee=
p/%d",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state->id);
>> -=C2=A0=C2=A0=C2=A0 platform_state->ka_thread =3D=20
>> kthread_create(&vchiq_keepalive_thread_func,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (void *)state, threadname);
>> -=C2=A0=C2=A0=C2=A0 if (IS_ERR(platform_state->ka_thread)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(state->dev, "couldn=
't create thread %s\n", threadname);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(platform_sta=
te->ka_thread);
>> -=C2=A0=C2=A0=C2=A0 }
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
>> =C2=A0 int
>> =C2=A0 vchiq_use_internal(struct vchiq_state *state, struct vchiq_servi=
ce=20
>> *service,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 enum USE_TYPE_E use_type)
>> @@ -1341,6 +1331,7 @@ void vchiq_platform_conn_state_changed(struct=20
>> vchiq_state *state,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 enum vchiq_connstate newstate)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vchiq_arm_state *arm_state =3D=20
>> vchiq_platform_get_arm_state(state);
>> +=C2=A0=C2=A0=C2=A0 char threadname[16];
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(state->dev, "suspend: %d:=
 %s->%s\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state->id, get_c=
onn_state_name(oldstate),=20
>> get_conn_state_name(newstate));
>> @@ -1355,7 +1346,17 @@ void vchiq_platform_conn_state_changed(struct=20
>> vchiq_state *state,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_state->first_connect =3D 1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock_bh(&arm_state->susp_res_loc=
k);
>> -=C2=A0=C2=A0=C2=A0 wake_up_process(arm_state->ka_thread);
>> +=C2=A0=C2=A0=C2=A0 snprintf(threadname, sizeof(threadname), "vchiq-kee=
p/%d",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state->id);
>> +=C2=A0=C2=A0=C2=A0 arm_state->ka_thread =3D kthread_create(&vchiq_keep=
alive_thread_func,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (void *)state,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 threadname);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(arm_state->ka_thread)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(state->dev, "suspen=
d: Couldn't create thread %s\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 thr=
eadname);
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wake_up_process(arm_state->=
ka_thread);
>> +=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> =C2=A0 =C2=A0 static const struct of_device_id vchiq_of_match[] =3D {
>


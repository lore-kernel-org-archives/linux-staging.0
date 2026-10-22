Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672448;
	b=p4izzID8ndPwcOBsIJe7ll17kBtKoehuvnu9cqdlnyWZywCqDu0hN2coA+MGO/LyWFxM
	 y9PYVn6vC3CqJln95kOuqMMeln4ARdfFS+vala51LnsvdwG+Qh16aJ64SPjwIPf5DtV7Z
	 HT1IdmHcqoIRfP6RWLqT0Bl0qZQ4GoUda6d/iq5nf0VuXOn8mQTfOVaTIUT2Au7dovW1n
	 zJGDUy+432V4ygu61i4XhRr+ho8QcFUaIMs8+pcK/NS1KeCdls4JlMSpEqtIBwFgVdz+6
	 0KuM8UVgJAtQy/cFmduV9wYB0WJ8YG3vM3d0NM3UsnFo94R5tks4xHuFFdV9xKtzIgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=ph48Qm9iGb22I3wDUUf/zfhln2f9Ac0X++6elG0lMmg=;
	b=1wTSNouMT5eOjB2EOWoRoTxvSefZV/sfYMONjzzWrqBnABk+wQUCxZgutYO28tXAFty3
	 Q7wbGkr6688ktljjU4n1RP6bJU8ipxzlPBkHQ29PKqBygtsMAG27aZ1IgmPgsEF5nXdXQ
	 gU2OIPea7ohI9KwHwZ80DktFEUEHgApEg+wZt2S5dqNNhY0ugCzJDEZC9sodwdahi7qrn
	 ku95mYERbkMaqKkmhL6TxuFlJFchZh9VkPC18D9bSSnoPvarMl+DnA060eIMsZWYB9M98
	 hrl/SWb85k/RsSmXbA2cd9AryT+4XyubXKvU4hc7S6wo4JhPkq1FaN84A7lN2E6wswQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kl+M13Wc;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35A1606A31A
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 12:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35A1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kl+M13Wc
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dee593f18so1490214f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 05:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792672446; x=1793277246; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ph48Qm9iGb22I3wDUUf/zfhln2f9Ac0X++6elG0lMmg=;
        b=Kl+M13Wc4vb8wv4LKJycITfA2lkAw18zDpoU2SUuHDugTzR1B33h78kS1X+rAdjhqv
         gvNSRT6qw4XSYqaMMXOZogxtnaBfk78jl+cYccE1mzgc8EPPQ6K2stSLBkjI1CF5mfUn
         W+2QrTgqGMZT2HtpiSHL+wO2xEck7lhEK/zHVZQdewplgKFbH0eBZNwg6YzPvclw/yPI
         mWkPoeCPNYBKzZZfKyvahUpanpKx8aRL6m2Tgx2IZ9Dav7tivLOQb7+7LGahZBc6qZMd
         nrwTrS0aubAQG5e9P9vZMweWnLWx2rYaugedFh2OhYipVfLu5XDDC7Hc2lK483cowO/3
         ZiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672446; x=1793277246;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ph48Qm9iGb22I3wDUUf/zfhln2f9Ac0X++6elG0lMmg=;
        b=WNvieS68wVvYTevR36vPqsAFsFimfSKvgFJ/m0QfKUCpoRyauL2j0xn0mGdbTl/eaY
         z/oDr5fCLviEXW+ulJNqNtbOy9ICz9ptHPzN3yHRrlt1uChPIHj3yxez97BH89B5qOJr
         EEfW0IWPn34biM2VrYX3sFc2oC0mhddkOemawBhKtyVG+3NzbIf2b8+6Tonmfvhvl1G/
         Fa1Kt4InMmYOf5ok4CXptTSzfZgF/xtm8FTIVRXhSpIYAJtJQrDv5xirURRZoMLZ462M
         khI5fJVlTTs3s6MtCf/m4wV58MWNE8LRfWHoCNrDLYtNW5N7Gcb309uLwIjP/wyslg0O
         B6yQ==
X-Gm-Message-State: AFq9FYLzkxHOjt1KImlo32ux6xu1kzsLuAbxXxLd2jxubgDwRGvi8wVo
	zZk64iacJiS9Co4j9atFrHE0XREYYHXVDAoWSn8FHEaKgk+4KDLCeYG/
X-Gm-Gg: AYBFou2FaBXZfEn2mDCTU450GhbpTUEieX1ZYIDc6s1NTxIYk6OAk8WIAK+SQ3qn7Dg
	UqhV07Jax+oNxbaLcAzJbsDTLMEjx+IaQGOclullOuV+1i6RjFoT6bvHrhqP0XhvFhckM6CKaTq
	jRc+IXpEfJ5v+JOCg3fo7egsWBYGIiOEMdIXCCvM4eMQsF5n2eMvpnNPXVdjNOeMSfsTih74PKp
	oWbMFsqiivQNim1DbcXhuCswSRG0X6WIpPNXZkTL5RD081NcgYk6JOWBrYSEzlVfLOvf3vCYxbN
	5WzV/mIc25mJsYMCJF77qn0nbE/+AjKcqSyRov3GJyS5XkpO3J2WE3Nt/x2fHk2WAHPxReY/VS4
	uBU7a/YGTgy3l6TqxFOczjm8rtwt908gepjtku6DkUwt61j5IHnD/eiTYVWi14i8w1e8J/StROk
	TGaxkD8WQoGNu+829YPwX2Y5zhomh6xDePqt8MgHekDlA3YbGG9OnF7bymvLJZEgtuf4sh6jrlX
	UxxCwOR/HmFhzBDyl6kw4j9nMPqpm/ibQa9zBiwccv7ek8xIKswGrZsk/+p
X-Received: by 2002:a5d:6f04:0:b0:48d:f3a4:610b with SMTP id ffacd0b85a97d-48e264bba16mr11294954f8f.25.1792672445705;
        Thu, 22 Oct 2026 05:34:05 -0700 (PDT)
Received: from localhost ([147.161.188.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm12345451f8f.11.2026.10.22.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:34:05 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 14:34:04 +0200
Message-Id: <DMBDCFV76Q2H.1AJ64YOEIOWU7@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: rename
 rtw_setstaKey_cmdrsp_callback()
From: "Linus Probert" <linus.probert@gmail.com>
To: "Ahmet Sezgin Duran" <ahmet@sezginduran.net>, "Linus Probert"
 <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261022122234.443631-1-linus.probert@gmail.com>
 <2fd90a2c-a2ab-41ab-bcd1-02831b4e01ca@sezginduran.net>
In-Reply-To: <2fd90a2c-a2ab-41ab-bcd1-02831b4e01ca@sezginduran.net>

On Thu Oct 22, 2026 at 2:31 PM CEST, Ahmet Sezgin Duran wrote:
> On 10/22/26 3:22 PM, Linus Probert wrote:
>> Renames rtw_setstaKey_cmdrsp_callback to rtw_setstakey_cmdrsp_callback
>> in order to conform to kernel code style.
>>=20
>> Found using checkpatch.pl
>>=20
>> Signed-off-by: Linus Probert <linus.probert@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_cmd.c    | 4 ++--
>>   drivers/staging/rtl8723bs/include/rtw_cmd.h | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/=
rtl8723bs/core/rtw_cmd.c
>> index 9fc62cb1ae01..81aef5ffe685 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
>> @@ -34,7 +34,7 @@ static struct _cmd_callback rtw_cmd_callback[] =3D {
>>   	{SET_AUTH_CMD, NULL},
>>  =20
>>   	{SET_KEY_CMD, NULL},	/*20*/
>> -	{SET_STA_KEY_CMD, &rtw_setstaKey_cmdrsp_callback},
>> +	{SET_STA_KEY_CMD, &rtw_setstakey_cmdrsp_callback},
>>   	{SET_ASSOC_STA_CMD, &rtw_setassocsta_cmdrsp_callback},
>>   	{DEL_ASSOC_STA_CMD, NULL},
>>   	{SET_STA_PWR_STATE_CMD, NULL},
>> @@ -1876,7 +1876,7 @@ void rtw_createbss_cmd_callback(struct adapter *pa=
dapter, struct cmd_obj *pcmd)
>>   	rtw_free_cmd_obj(pcmd);
>>   }
>>  =20
>> -void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cm=
d_obj *pcmd)
>> +void rtw_setstakey_cmdrsp_callback(struct adapter *padapter,  struct cm=
d_obj *pcmd)
>>   {
>>   	struct sta_priv *pstapriv =3D &padapter->stapriv;
>>   	struct set_stakey_rsp *psetstakey_rsp =3D (struct set_stakey_rsp *)(p=
cmd->rsp);
>> diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/stagi=
ng/rtl8723bs/include/rtw_cmd.h
>> index 75a774f8c4f3..9b801a61b69b 100644
>> --- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
>> +++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
>> @@ -593,7 +593,7 @@ void rtw_joinbss_cmd_callback(struct adapter  *padap=
ter, struct cmd_obj *pcmd);
>>   void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_=
obj *pcmd);
>>   void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct =
cmd_obj *pcmd);
>>  =20
>> -void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct c=
md_obj *pcmd);
>> +void rtw_setstakey_cmdrsp_callback(struct adapter  *padapter,  struct c=
md_obj *pcmd);
>>   void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struc=
t cmd_obj *pcmd);
>>   void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct c=
md_obj *pcmd);
>>  =20
>
> This driver is going to be deleted in the next release, have a look:
>
> https://lore.kernel.org/linux-staging/7e53bd59b7b146caabebeca4347674c7@re=
altek.com/
>
> Regards,
> Ahmet Sezgin Duran

Ah, no. I had missed that apologies and thanks for the info.

// Linus

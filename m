Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B7017FD
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724632960; cv=none; b=Tudy8BYFgq90WHXFUz0aOxdLliGuFaCowTqbxQNKeQAzovfEYWE8YEUfPErrKGZU0UCHwjZihwMYpmAy5vW9X43QoAoHBZj328UDB+/XtJrRENxmnLR/+473bA9xEtESTmW/xiALDupw5dr2ntt25cp86cp8Te5HmIvEcUI+EIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724632960; c=relaxed/simple;
	bh=dRrFyLibUX2s1c2Q5YvYvEou9Jt+u7PSjsVGlx6ERl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mMCj9CvwqDqOcesq0Vld9Zen+dOV12lQc0LLd0IPJXyFn2IO8YljCbTT4D9XRsJyHL9LmhhF+NYkzw1iTuFDD59TlWyLlJlQokIBaSlAHaZdviszwcRhVJMI9U9CeOeFXIMskloO50/3Q7FVreqknEBBQmHf6L6wdMgvVo2OuVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqQBedSh; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqQBedSh"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5befd2f35bfso4383118a12.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724632958; x=1725237758; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eTKOsv1W3Txl3mLD3qHMeGT5uYDW0uAn0LWfSNHb39g=;
        b=TqQBedShfizLzdWdCKIem7h3ctsKHoAJXrKDMzHFH//9vAEkYLnl0y34q/vgoXSZNx
         F038QOASbL3nmKGT23Riny742L7CMNSUyOwgRPjQygx/i8YPW9Q796ACqShRLxLFs+tW
         aC+oVcpdo5P6Q32r1T2BrpbXOLj2P1zGqVBafJtnGXo+i3abjxG42wrXwtZDRKxEGILH
         IUSK92I1/BH4a+tsB78pk2vbpRUp0dfKZ0bqk94By+S5s1Gjh58qb40JFxCfFkrXfGcG
         9QrIhb3smJCY/WcJmRehIvQhxX8W83cjN/pkkjSH69DM3Pr8Jvqf0E//SpFqsZUSjAdD
         qIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724632958; x=1725237758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTKOsv1W3Txl3mLD3qHMeGT5uYDW0uAn0LWfSNHb39g=;
        b=HBmOob5FlFdAmCvb8ST+b/iYdA4i+pOmhgNmJtK7Aq3EFugWy4r6tCnmLD5t7WEZZX
         BYRuS+A3zDA6DApeCcfucFCOxTQmzAgM5K8o1+IokCBg8T/1pcbZPibK39m4q0Cds7Ps
         RFByFsDVGz9BwvfckSPjeUE1CJX66yhiD0oC3CW5A+WZhUxueYu2AHFdHxocHEXVRuED
         9JcWUItdE8ogwSlQl7KRMEseLvj7pL8RhzO5R7kpMPueKB4Agg6+E8eQ2PYo8luXrGc+
         ut22HjowdEy2+6VCP0zTbNGSss881cAWGRyIb/U7qQiPuI5egtrMO4L5wKOoYys1oxE7
         23UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqKQWy5hZkqfkeK9e2h1gOW9e6yL7goI3nDO/VMnjkbFVRQ4AXHvwOkN9lepRaf8UOQ3dn26Ssnqm2akpB@lists.linux.dev
X-Gm-Message-State: AOJu0YxcSjerTp5Z49N94oYL+IoRV2bPN/rlPKdTgQ1dFNEdcOZUF00I
	qSgQLZnWpscCTqEUMZxfkUzXeJM/jxAVEZHVEz+ZMsWC76V/sZPa
X-Google-Smtp-Source: AGHT+IGKSbzY/T503e7BF47y+O/i2UF18xes1Ww4aU6CENcTvwTjd5LesvywQlb0mE/fBYQFx1yA5Q==
X-Received: by 2002:a05:6402:3895:b0:5a1:c496:2447 with SMTP id 4fb4d7f45d1cf-5c089175af2mr5360187a12.21.1724632957339;
        Sun, 25 Aug 2024 17:42:37 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8562:c260:909a:b5d5:f661? (p200300c78f2a8562c260909ab5d5f661.dip0.t-ipconnect.de. [2003:c7:8f2a:8562:c260:909a:b5d5:f661])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3ea610sm5079443a12.51.2024.08.25.17.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2024 17:42:37 -0700 (PDT)
Message-ID: <a289cd79-4d48-4ae7-b45d-8b8da756e373@gmail.com>
Date: Mon, 26 Aug 2024 02:42:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Fix multiple assignments in
 rtl_wx.c:529
To: Alien Wesley <alienwesley51@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240825214612.49254-1-alienwesley51@gmail.com>
 <324c34e3-3471-4cbe-aa6d-b14244ca48eb@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <324c34e3-3471-4cbe-aa6d-b14244ca48eb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/26/24 00:43, Alien Wesley wrote:
> Sorry folks, this was supposed to be a v2.
> [PATCH v2] staging: rtl8192e: Fix multiple assignments in rtl_wx.c:529
>> Separated assignments for pairwise_key_type and group_key_type
>> in order to silence the following checkpatch warning.
>>
>> CHECK: multiple assignments should be avoided.
>>
>> ---
>> Changes in v2:
>>      - Removed two spaces in front of "=".
>>
>> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
>> ---
>>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c 
>> b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
>> index 47f1adf30ab4..67c4793e0fc1 100644
>> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
>> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
>> @@ -526,7 +526,7 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
>>       mutex_unlock(&priv->wx_mutex);
>>       if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
>> -        ieee->pairwise_key_type  = KEY_TYPE_NA;
>> +        ieee->pairwise_key_type = KEY_TYPE_NA;
>>           ieee->group_key_type = KEY_TYPE_NA;
>>           rtl92e_cam_reset(dev);
>>           memset(priv->rtllib->swcamtable, 0,
> 
> 

Hi Alien,

please make a v3 with correct subject.

Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp

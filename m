Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435D1EB490
	for <linux-staging@lists.linux.dev>; Thu,  1 Aug 2024 05:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722491254; cv=none; b=hzotbYMOVc5+bzQ7UBklkhopZcc8WJnSlA1NLZS2WxXSDaI8qqEEPY7Mb7idil2EjfuLvVv2KECQ6zm1rYWZWvGm6T5ryCWCoA+yTnaxGSojF29s99GhUKgsLP6ziHG/WPy9YBuMlXE8Fgui1I38s5JluXqZ4GgKiCKxzkLRhfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722491254; c=relaxed/simple;
	bh=f+S7BZPM6Xg5KqQJRqmHxX+Gqio3PKUNMvLwlIlibT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=sf4pK/xk4QEDw55VweR4VFzvA8xRnmDfweUv17mzLNFtx3R9LmcC3q/mf8/qtRj8K0BrE+DK/slviez8DnP1tvFZ+H7E9KHJsEP8HmyBFYC9pYtXg8Gn1gaHqr0BR32ntNZSPvTW4z1363Qpv0djXF6e+QrPmgIbEeNBwiNkkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eK3CzGwm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eK3CzGwm"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7a9e675a78so81007166b.3
        for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 22:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722491251; x=1723096051; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h75mYsQwpcVx1+pn5BOg6IvXWO045QlfJAGrJrEcU6s=;
        b=eK3CzGwmgkPsBbIQp8zQckrHoTxbJMtNEdwQtxJf7AC+qW/dds5ZTSSulUppm3qy1u
         sbZCVBxUF1KuBHcVfD3Fk1MhH/v9cuMgORc0Wq42oxPbfVv+x6XBpD8FCiuXJ4GF5lnr
         11M+zN0p0or3G+7ZUgzKgyxrkTh+ihK/Qf1F7k1IaKDtQI+mfFJ3fGdjnW8AbK43IIkn
         +i2tVO37KN4E6y3agd2hufwh5YsFLzPSeX6Ix1B16IipxIUaU82YpCBTjrh1mlmaRWGq
         S7d8XKD+5XCv0vR4LmHbgbktefIsdgN194oi6fqcU7rm19twzKXp+3NXq4l57Ovtvt4f
         E9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722491251; x=1723096051;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h75mYsQwpcVx1+pn5BOg6IvXWO045QlfJAGrJrEcU6s=;
        b=mGkv5qecUM2v64jbqciPn6J/Btx+6tMQeHZ1sioQa3wJYb4MJHQKD6NeiFsG9RbtWo
         Ikn2UnHS77O3GmghuxzsdKSNVDyc8IYANDNvyN+IosNKGtqoj2kSeDbFn2D3MnJzqLEc
         NtyTZJVheYZQ382ow0YwAH1YTVWNNSgyCxPcyTNMMDDYeJLE1dkTqbQpZXUqCFyBvNKQ
         B1QI6wLxTplnBFb0lyNruuvKiol3wAkwgXMPeO8RnbSwuBpbU9IWMPRncWDvvWSYtNST
         4ATFgIHvB2SIufcl18LDsz0u0FJvNL/0cUNpcbtqkwerzJ1lBuhv/ruf6m6FFS/7fN0r
         BsBw==
X-Forwarded-Encrypted: i=1; AJvYcCXGti07Aovk1+1rfKma6gz4U/piPq/sTAj7vlGujczkqEUR/qNS95tcsD3DDZ5iHhZUVHAmgtXiBKa8XiAT@lists.linux.dev
X-Gm-Message-State: AOJu0YyZt+oziKqxPyr+gI9Eb+ced4YCSzZPozgqJOQIIIoWZw4Ls+PL
	chJiTZfhhh7+6MBrRtnwwkes+8gJs+HCWOuDGVzpaAqIh9USaNn0
X-Google-Smtp-Source: AGHT+IE6BMB5xFdd7X7wDrr6BN2cvvXd8XkQ/dTe9DrabMQ0F3ei5nDMKUEGhkpF+mCfVfPZMiD6xw==
X-Received: by 2002:a50:96d2:0:b0:5a1:6ed5:19aa with SMTP id 4fb4d7f45d1cf-5b6fe72af2emr378687a12.1.1722491250984;
        Wed, 31 Jul 2024 22:47:30 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8500:57d2:826:6de3:1237? (p200300c78f2a850057d208266de31237.dip0.t-ipconnect.de. [2003:c7:8f2a:8500:57d2:826:6de3:1237])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac64eb7c0fsm9569091a12.62.2024.07.31.22.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 22:47:30 -0700 (PDT)
Message-ID: <20fad314-6b8f-429a-bb39-921ece6e46ab@gmail.com>
Date: Thu, 1 Aug 2024 07:47:29 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: rtw_mlme_ext: replace spaces by tabs
To: =?UTF-8?Q?Santiago_Ruano_Rinc=C3=B3n?= <santiagorr@riseup.net>
References: <20240730080531.991195-1-santiagorr@riseup.net>
 <800efa55-1765-48ea-8648-f9a6739342b6@gmail.com> <ZqrAgXs7qbt3RVaD@voleno>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 helen.koike@collabora.com, ~lkcamp/patches@lists.sr.ht
In-Reply-To: <ZqrAgXs7qbt3RVaD@voleno>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/24 00:53, Santiago Ruano Rincón wrote:
> Hello Philipp,
> 
> El 30/07/24 a las 21:18, Philipp Hortmann escribió:
>> On 7/30/24 10:05, Santiago Ruano Rincón wrote:
>>> Fix checkpatch error "ERROR: code indent should use tabs where possible"
>>> in include/rtw_mlme_ext.h:388.
>>>
>>> Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
>>>
>>> ---
>>> I am (mostly) a newcommer. Could you please tell me if there is anything
>>> wrong with this patch? Thank you!
>>>
>>> checkpatch reports a warning in line 387:
>>> "WARNING: line length of 135 exceeds 100 columns"
>>> Should I fix the warning in the same patch, or should I send a second
>>> patch to fix it?
>>> ---
>>> ---
>>>    drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
>>> index 5b8574f5a..720aeeb00 100644
>>> --- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
>>> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
>>> @@ -384,8 +384,8 @@ struct mlme_ext_priv {
>>>    	unsigned char default_supported_mcs_set[16];
>>>    	struct ss_res		sitesurvey_res;
>>> -	struct mlme_ext_info mlmext_info;/* for sta/adhoc mode, including current scanning/connecting/connected related info. */
>>> -                                                     /* for ap mode, network includes ap's cap_info */
>>> +	struct mlme_ext_info mlmext_info;	/* for sta/adhoc mode, including current scanning/connecting/connected related info. */
>>> +						/* for ap mode, network includes ap's cap_info */
>>>    	struct timer_list		survey_timer;
>>>    	struct timer_list		link_timer;
>>>    	struct timer_list		sa_query_timer;
>>
>>
>> Hi Santiago,
>>
>> it could be two patches or one. You are only allowed to do one thing at a
>> time. So it is also a little depending on your description. The way you
>> describe this it is more like two patches.
>> If your description would be like:
>>
>> Insert line break to comment, that exceeds 100 columns, to improve
>> readability.
>>
>> It would be OK to correct the indent as well.
>>
>> If you send in a second version of this patch please use a change history.
>> Description from Dan under:
>> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>>
>> In case of questions feel free to contact me directly.
>>
>> Thanks for your support.
>>
>> Bye Philipp
> 
> Thanks a lot for your explanation. Much appreciated.
> 
> Greg has added the commit to his staging-testing branch. So I guess
> the only choice to fix that warning (a CHECK, actually) now is through a
> separate commit.

That is correct.

> Maybe several warnings/checks of the same type in the same file could be
> handled together in a single commit? 

Yes you can fix several issues in one commit if they are of same type. 
Example: Missing linebreaks

But is it worth the effort to fix
> them (when they are non-ERROR), or does it represent more work for you?

If you consider checkpatch warnings and errors it is more complicated. 
We want to fix all errors and warnings when it makes sense. Sometimes 
checkpatch is wrong. Finally you always need to judge if your patch is 
an improvement for readability.

Example:
Checkpatch warnings about not needed brackets in logical statements are 
most likely to be wrong. Reason is that the readability for those 
logical statements is extremely lowered when omitting the brackets.

I cannot respond to you alone as Greg insists on all mails to be on the 
mailing list.
https://lore.kernel.org/linux-staging/001101dae31f$d5ef44d0$81cdce70$@samsung.com/T/#m83a1aac71249e9d6b658bc5e4a7190c757d3547e

Thanks for your support.

Bye Philipp




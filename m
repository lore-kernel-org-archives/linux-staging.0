Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAB832B128
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 20:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395634; cv=none; b=JeJ8zyFYsThTMkB/Ip3Yrn+6OtDXywOJKwiQeBmJSljMQbZ9oz5wLOvapJokr1FPb5NLJg8ZHYFs3mDhDFhqenMPQ3owhjRCtP8NVeIROGl0PRRU0UdJ1wfGFFhs3N+hxGkN8TS2VAFtXdT58H8eqbnjlQvmwdryx9iRXhsEf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395634; c=relaxed/simple;
	bh=UZhzVfAtMvI8pKiKWy09aLgc4+1J+pdbpLKFPTFAmPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMG1NdHq8vwAX2ayYNc2QlQl/SXaSyLGnZ8yKqkOTJ4qJ9F/LTM6IsqWwVAizE0oJNEgCoXZ0GnH1Bfq/5PUQkoX0eEV4f+nNJrr+qUmu+uyVLT4artgkntlInElSbvRGggNEQywDatxaqAe1yrvLrHvsn7lxemGvEejfiA/LOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=XMDJzuKF; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="XMDJzuKF"
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 95D9881201;
	Thu, 21 May 2026 23:33:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp) with ESMTPSA id iXaDPr1gR8c0-UFxBHwQL;
	Thu, 21 May 2026 23:33:46 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779395626;
	bh=+sny/3yESSmgkHp6IZHa2mRvO2o419R4duiSBtsH004=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=XMDJzuKFkf00u3SqdHu40D0+59rWfQHEZpuiETNdZV2/1flEEVJgkt7oJ5Kks1rcm
	 dcHPPEGLx0H/7JA6Ah1IEyTbzydAu65yZBtjCkz/JjExpHwx/4vgXp6SlZ8KRvpnkv
	 iz3shp66As/9rcpuefhl/V42S8ty40eCHoUBgZr0=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <8c739c37-d94f-4fc1-82a7-9575f85236d2@sezginduran.net>
Date: Thu, 21 May 2026 23:33:43 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: sm750fb: add const to g_fbmode array
Content-Language: tr
To: =?UTF-8?Q?Diego_Fernando_Mancera_G=C3=B3mez?=
 <diegomancera.dev@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
References: <20260521142655.24408-1-diegomancera.dev@gmail.com>
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260521142655.24408-1-diegomancera.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Replying an off-list email:

> To: Ahmet Sezgin Duran Subject: Re: [PATCH] staging: sm750fb: add
> const to g_fbmode array
> 
> Hi Ahmet,
> 
> Yes, I have verified the changes. I compiled the module using make
> M=drivers/staging/sm750fb/ and it compiled successfully without any
> errors or warnings.
> 
> Regards, Diego Fernando Mancera Gómez
> 
> On Thu, May 21, 2026 at 1:52 PM Ahmet Sezgin Duran
> <ahmet@sezginduran.net> wrote:
>>
>> On 5/21/26 5:26 PM, Diego Fernando Mancera Gómez wrote:
>>> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
>>> ---
>>>   drivers/staging/sm750fb/sm750.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
>>> index 89c811e0806c..8f533f3b1b42 100644
>>> --- a/drivers/staging/sm750fb/sm750.c
>>> +++ b/drivers/staging/sm750fb/sm750.c
>>> @@ -21,7 +21,7 @@
>>>   static int g_hwcursor = 1;
>>>   static int g_noaccel __ro_after_init;
>>>   static int g_nomtrr __ro_after_init;
>>> -static const char *g_fbmode[] = {NULL, NULL};
>>> +static const char * const g_fbmode[] = {NULL, NULL};
>>>   static const char *g_def_fbmode = "1024x768-32@60";
>>>   static char *g_settings;
>>>   static int g_dualview __ro_after_init;
>>
>> Did you compile these changes?
>>
>> Regards,
>> Ahmet Sezgin Duran

Please reply emails using `Reply All` and avoid top posting.

> Yes, I have verified the changes. I compiled the module using make
> M=drivers/staging/sm750fb/ and it compiled successfully without any
> errors or warnings.

Can you make sure that you had enabled the related module?

Regards,
Ahmet Sezgin Duran

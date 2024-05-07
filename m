Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6857462
	for <linux-staging@lists.linux.dev>; Tue,  7 May 2024 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715104151; cv=none; b=smLPwOITb/XGJ6A8DnzYTPIDULWYagqNUnFCbS8l1dFL3FwbdUHWNFRGuP8ipU/etpL80WRW1N2nHU6MW76+HDdakIV/FFJcKnyjHMUJh8u091SiY6dcqtB/jaWEgqGyrUmr+Ehl0jhLkx51flMsM+iaf0RE7Wvk6kWeUp/nwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715104151; c=relaxed/simple;
	bh=pwh4kKnyJTvJNbrZR87w9WNS7/BMALHW64bn1krHADg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sEBN9pgf75m2EcQohOA2/ksTYI6Y6XuBfcw80IcqLvNy6zPihPgZtjKpLfRRMLVE8VOtBCanZdu/ZVVktiUSf8k+pphzGhZ8n21SaMPqaE+bLZVGPIMhz9youQ/6uawoTFHvejZcMTaNe+Jz8w4JYv3sSqV49Ccr4Bfmvklk6gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXQ2o2fw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXQ2o2fw"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59a0906a7aso97472866b.1
        for <linux-staging@lists.linux.dev>; Tue, 07 May 2024 10:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715104148; x=1715708948; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KzNsGk04Aj/iaOaD0uQRj7sJlFSLSEs6o0qY1ztONQ=;
        b=lXQ2o2fwELYMQ+LgOK52zFg13h3bZr4JdboY4zBclV210doQl32LyydIXVR7pgeHDU
         i3oDcDQHMLseunVTirfzgfmlV5z1l2ZfeBoGbm5gmiQ0GgWAA9DSP7Kei0VWLaCkHS2n
         ehEEnYEydvLSiv86xFtHXnzbow4UJovEFnxKLq+tzonI4AkJtS34t7Iz7mkwdPpGG1gf
         gjpMsgXUKtf9Cs3Mfj42jKD0z0hFDWbAd7qKvaGbiHgyVSo0T9ODJnSRTIaSUSjfGIxv
         qBVNSeIKc2yK1iBlEqRs35lnSAX3GuKOpEd3avX4NE6dF4bhr0ZDD9s24ktzI2ZnSmte
         R4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715104148; x=1715708948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5KzNsGk04Aj/iaOaD0uQRj7sJlFSLSEs6o0qY1ztONQ=;
        b=wJiuNJEZ8weBWtEofrKUmImRn9YpCJShwonXE7310bGUT+YW6+CBUeSbOFVfOi7QxJ
         ee+UIl95EBBRPMHk5mDPbQfnHgyYaB9Nf8d5CPEHL6i6xgTqbdd6U5TrYyXH8N4TB4/6
         eOXCh3WyHCVkzbtB6zk8gyexAcT9Z9ByLsQzyprL/XnMdizDs62xg1RJ+QUOQ8v1fIKC
         F7fuL+FDhOUhzq2Axg1QZesDB9IMHBgLak0Jkuqum0l/GnblEkRyawLUMFbXhOFH8san
         poxHtv5OpDqD/6g877f19VEu8fSnC5A500zoTbZzP7hrFr9brweRlr1tY9DnMcCmP0Ik
         DhQA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ubDLFdhVMoSVMGqoVe1AfTEvxFR25jxlJuJDQPzLg65Q3d/bySmdySz74ZRb4S+QnN69pvK/GcW8PwHOa7vMIUUjT848OsXXLBEing==
X-Gm-Message-State: AOJu0Yyv1eCwfitfNOV2umH4Vbq8YFsK6fA77H6tZ5Lwde0IUahR9K14
	h9bdAY+QO5saPEI2rzmEimOcC7IL870KvVcu3QYCqIbQ72nG8XzpjqiO+A==
X-Google-Smtp-Source: AGHT+IE5DMX+XI/tzZLisS11tES8cNFOzvMrHLvepHpBfRDTKb+hpqZQWQrvtTKVVJucSTr7rAL40w==
X-Received: by 2002:a05:6402:401e:b0:572:65f7:eed0 with SMTP id 4fb4d7f45d1cf-5731d91696bmr355648a12.0.1715104148260;
        Tue, 07 May 2024 10:49:08 -0700 (PDT)
Received: from [192.168.0.104] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id fj20-20020a0564022b9400b00572336c900asm6554848edb.74.2024.05.07.10.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 10:49:07 -0700 (PDT)
Message-ID: <42016d13-b69c-400a-98a6-f34db6dd3e06@gmail.com>
Date: Tue, 7 May 2024 19:49:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging:rtl8192e:fixes unnecessary braces
To: Chen shuo <1289151713@qq.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <tencent_1423E8EA63C9C00B49636738FF1050480C06@qq.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <tencent_1423E8EA63C9C00B49636738FF1050480C06@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/24 14:13, Chen shuo wrote:
> This patch fixes the warnings reported by checkpatch.pl
> for braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Chen shuo <1289151713@qq.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index e3ed709a7674..1862a9899966 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -1640,9 +1640,8 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
>   	if (stats->Length < 24)
>   		stats->bHwError |= 1;
>   
> -	if (stats->bHwError) {
> +	if (stats->bHwError)
>   		return false;
> -	}
>   
>   	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
>   	stats->RxBufShift = (pdesc->Shift) & 0x03;


Hi Chen,

Please make your "Subject" line more unique. Consider that we may end up
with having dozen of commits like yours, all of them referring to
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file or function to make it more unique.

Also typically we use space after : and driver name in the subject.

It is not required to add the name of the tool who found this. Much more 
important is a good description __why__ this change makes sense...
For example:
... to shorten code.
... to improve readability.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Feel free to contact me direct for further questions.

Thanks for your support.

Bye Philipp


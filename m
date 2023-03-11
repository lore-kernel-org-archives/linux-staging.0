Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1037B;
	Sat, 11 Mar 2023 12:50:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so5098744wmq.2;
        Sat, 11 Mar 2023 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678539043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2VdX4B2dld6wqCG5ZYqlFsLHmtCsviZq3SzvbHDBPs=;
        b=ZfYzmvLpq056KSe0wR6z4s3lzk4PhtaVkXSEToFZYVD2Yj760N7KNPhkJgqfv4m18L
         Xu0lAVTfbJt35TthbdG6zWvBUT5p1F1EzO7WsYmS7TgHvZmtKjjKkHVT2dw4u45+92ej
         Gm9RjAkkPRK6RtlDqgr/MOxUB+0lWAyWyRwS3yy7n+l5dpxSe2ODI3XF2q1PV4Agab26
         UWcALghrZIYngj6OKxgNp7l4+fN0Dm0douW7eN//mOY6KOHwQPwH9l5dhKU9ndfsK/Ha
         +5whzgXkAUaI49XXG+Xl1f4OwCZ2LQMylEkpDCM+VIHoF+ebqcsBvWV5dFqcGV0ttOZC
         yi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678539043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2VdX4B2dld6wqCG5ZYqlFsLHmtCsviZq3SzvbHDBPs=;
        b=Q12SMVo7PwL6e5aB+3B1TxHj9aIvn5PQwfb7EK1N4pmJi99ZOnTWAE37lW1WaUkrPr
         xiZ5u1SDf/ighSdECnltyIvajMtdCwRizz2FPAHs7rDtekryKBPl9ibu3zs0tOPgEWEG
         EtHEpc8MvsjG4bi+bB8JhnXVhDVENaSH7UgjZ5iJJmE+agaJXADwS8pULqOMQh5mO5pV
         FVB0FzcDsDHXgvNH8q0TyR1faNDwvmpNpcGFSnkrUV1WoUZRzlxE8Xe2TKlSY4eZdDXb
         tir2yzsBa8GqD1F01XiFbG9fVMAENbV7aJphYf6qq5tAC61n1kN0B6qUZN7SDIrVLCLs
         UfsA==
X-Gm-Message-State: AO0yUKVCb+FoyfsI2m0O0Jz+1Inx7OPD7VV2BIXezy0H/yFzAooqOVC3
	1Kgl3wpPKe/dbJ7Qy9rvwKpw7rwWCSNlnQ==
X-Google-Smtp-Source: AK7set+DiHVrKM3fDR7GG4dpN6xZ67nadAC84Vqy3UVBeouj5FR1ozUtQTmdo+/DFkAKzt4C0RHmhQ==
X-Received: by 2002:a05:600c:5009:b0:3eb:39c9:ecb0 with SMTP id n9-20020a05600c500900b003eb39c9ecb0mr5630622wmr.8.1678539042876;
        Sat, 11 Mar 2023 04:50:42 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id d21-20020a1c7315000000b003dc521f336esm2771887wmb.14.2023.03.11.04.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 04:50:42 -0800 (PST)
Message-ID: <7590a38f-4be2-b237-71db-6b5bc620d9de@gmail.com>
Date: Sat, 11 Mar 2023 14:50:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] staging: greybus: Fix Alignment with parenthesis
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <ccd27442c1ad9a33b0b7564176fa68f7b153fa20.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110956591.2802@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303110956591.2802@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١١‏/٣‏/٢٠٢٣ ١٠:٥٧, Julia Lawall wrote:
>
> On Fri, 10 Mar 2023, Menna Mahmoud wrote:
>
>> Fix " CHECK: Alignment should match open parenthesis "
>> Reported by checkpath
> The log message could be better, to explain what you have done and why.
> The word "fix" doesn't express any of that, and should be avoided if
> possible.
>
> julia
got it, thank you
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
>>   drivers/staging/greybus/fw-core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
>> index f562cb12d5ad..0fb15a60412f 100644
>> --- a/drivers/staging/greybus/fw-core.c
>> +++ b/drivers/staging/greybus/fw-core.c
>> @@ -110,7 +110,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>>   			}
>>
>>   			connection = gb_connection_create(bundle, cport_id,
>> -						gb_fw_download_request_handler);
>> +							  gb_fw_download_request_handler);
>>   			if (IS_ERR(connection)) {
>>   				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
>>   					PTR_ERR(connection));
>> --
>> 2.34.1
>>
>>
>>

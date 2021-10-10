Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1872C80
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 11:02:13 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id e7so8051735pgk.2
        for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:cc:subject:content-language
         :to:references:from:in-reply-to:content-transfer-encoding;
        bh=mGt9AjRyz59TKgLh09y9NCFfjgPuJll6eNqrTFHEAzw=;
        b=P8XtbNXAFvT1qDgRluJ3jMCie2isFNR6WZD79lKOdqcphRLa2g9ihFMtk1GZ8DcMYI
         IS4eblrL3XuNwYblQGkjzVdVvB+oRImzEhCydaSXP77oi3U+c5KNvQhU83Paumo2ReOA
         BxmOexVPl6o/Ot9KoseSDgUHUN6VnbwuFWXJ0jqkoi6j/67kgEklVK/HcHVibnPn4he1
         +388Q7rBEQdXfY9v1kCbDHmbXWI/sLMwDk4w1HJRqqVWuH678OyBBm0Lz9remLblPDxv
         0EmMIsZ+M+hBJi/VDDbmLtUCKdkyp3QUpwQyEplFDhxYvwUejc0briWDtP4LdxIH+yc7
         93HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:cc
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mGt9AjRyz59TKgLh09y9NCFfjgPuJll6eNqrTFHEAzw=;
        b=4fmo/PCxuU7AXxi7hoafta3dFkBa3FkOXk0HQjB6iD4BTBybTSzvO3FnsfTBPXPpkF
         1T/18WFz+C5z25wojVsd4lQfgRMt3IML4qWlIdO+Cd1Ynw6DhkVkYwBq/Cz954PuApb1
         DsKnFNwvwbctcPDhBACOVnBTb8nAIvh2tcOb9JRHRXnztMzKpeOhfX+gCLvbkkVfhfeg
         FnX3arwAkl5O4Y5IBoX+aG69GXxyuZ7z+mIaO9GaJ2x2L3KVdtLSiEtQh6V+EgwAldZe
         Ve/dXSJg+YHfLnUOtHef45eWsrylQUzzXAtbIUkS+vnWgtCQAYZZ5w2naG7kb7095Y5D
         7HVA==
X-Gm-Message-State: AOAM533cKw3WJRyPFVItTnE1BUUVbem4vTorXhQNBrlMUUg9kqgSaniu
	Mccb4BRbT5YAncB4ShoPED4=
X-Google-Smtp-Source: ABdhPJy930qii06q21V5rCtyuW9c0etlhTpXJyVEyPtZM8q5RW0ySqU1O/+IJNKeL7H8+EwB0DJKvA==
X-Received: by 2002:aa7:9285:0:b0:44c:caf5:341 with SMTP id j5-20020aa79285000000b0044ccaf50341mr17327648pfa.1.1633863733066;
        Sun, 10 Oct 2021 04:02:13 -0700 (PDT)
Received: from [192.168.1.6] ([223.230.43.197])
        by smtp.gmail.com with ESMTPSA id d22sm5073571pgi.73.2021.10.10.04.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 04:02:12 -0700 (PDT)
Message-ID: <9dca9f7e-f987-5be5-9523-7dd08c2b364e@gmail.com>
Date: Sun, 10 Oct 2021 16:32:08 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Cc: saurav.girepunje@hotmail.com, gregkh@linuxfoundation.org,
 marcocesati@gmail.com, dan.carpenter@oracle.com, lee.jones@linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: hal: remove if condition which is
 always false
Content-Language: en-US
To: Fabio Aiuto <fabioaiuto83@gmail.com>
References: <YWKXKGuA/Io9sEjf@user> <YWLFf1zPvK9gz+7+@agape.jhs>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <YWLFf1zPvK9gz+7+@agape.jhs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/10/21 4:20 pm, Fabio Aiuto wrote:
> Hello Surav,
> 
> thanks for your patch, see a comment below,
> 
> On Sun, Oct 10, 2021 at 01:02:56PM +0530, Saurav Girepunje wrote:
>> Remove the if condition which is always false. The last update on
>> variable max_rf_path is value 1. It's value is not changing after that.
>> So if condition check for value 2 will be always false only.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
>> index 392cc8a398f5..612575ba961a 100644
>> --- a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
>> +++ b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
>> @@ -106,12 +106,10 @@ static s16 odm_InbandNoise_Monitor_NSeries(
>>   	pDM_Odm->noise_level.noise[RF_PATH_A] = -110 + reg_c50 + noise_data.sum[RF_PATH_A];
>>   	pDM_Odm->noise_level.noise_all += pDM_Odm->noise_level.noise[RF_PATH_A];
>>
>> -	if (max_rf_path == 2) {
>> -		reg_c58 = (s32)PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBAGCCore1, bMaskByte0);
>> -		reg_c58 &= ~BIT7;
>> -		pDM_Odm->noise_level.noise[RF_PATH_B] = -110 + reg_c58 + noise_data.sum[RF_PATH_B];
>> -		pDM_Odm->noise_level.noise_all += pDM_Odm->noise_level.noise[RF_PATH_B];
>> -	}
>> +	reg_c58 = (s32)PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBAGCCore1, bMaskByte0);
>> +	reg_c58 &= ~BIT7;
>> +	pDM_Odm->noise_level.noise[RF_PATH_B] = -110 + reg_c58 + noise_data.sum[RF_PATH_B];
>> +	pDM_Odm->noise_level.noise_all += pDM_Odm->noise_level.noise[RF_PATH_B];
>>   	pDM_Odm->noise_level.noise_all /= max_rf_path;
> 
> If the condition is always false the whole block can be wiped out,
> why did you keep it? Did you change the logic here?
> 
>>
>>   	/*  */
>> --
>> 2.32.0
>>
> 
> thank you,
> 
> fabio
> 

Thanks for review Fabio.
It is changing the logic . I should be careful for this. whole block of 
if statement should also be removed.


Please ignore this patch.

Regards,
Saurav

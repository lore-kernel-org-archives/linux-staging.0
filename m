Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C072
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 17:00:44 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d5so11356040pfu.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bjCnpTmMk/HRFGYFZBty4la+9CytdreB3FPvUgm7mYA=;
        b=GFVQKt0Y6A2BgEVTITFDRw0hqTW8buNxHYiJ/MNqlx+Lujajo5QjX4bRi4ACDhTVnI
         hnqJzRo4NyaP0cP2AUNIrrgBG5EsEDIDWr870KEwkudizMizKNT58uqjtYuhwJ2/osRy
         fe3LJ0xeKdBkprR73iMxx+FzR5TX5SLhrN9NJ3ksz/FESY7xLTtxwor46GkfYKwbtQ+A
         MHvRv005gsP2n5MQTD5RK+RxvQVPpKn/m96Rsg70JvaWq6MEViosEnsEvJu5DHc5YCZp
         zjTd2h9iNysVVIaqilMoHf9KB74B4/XOjKEJUzMh5WSfuchfaLBrmFzXIlB15qbgi93N
         ZMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bjCnpTmMk/HRFGYFZBty4la+9CytdreB3FPvUgm7mYA=;
        b=o2jkERJGbz2HMf5UX5c5QWQMd9jtNt95Ocm8Cv59yI85AbZyobuOq25Sk5UVuKxbWB
         kbKVGVXk1wmo+UaF8QSUyATa9ISxk3L9iL+qJ9Y2NtVoJGC1IcdAfnGVDanejGSaJ7jI
         YVd8uzcX8KOZgMncaiimSZs77CkA2tZTbYk9mhsWIDaL8rJQoVbvZjgVPq1xARpFbbNP
         w5EBEo+mwgjGyaSh7h7Nxon9ZvE6DcepV082djUhWRW38au/8sGsCyZNf5gnIqxwjMkH
         C8AM81RDADAwtJEV2zdxmRCmbjBe/pFhRhUJCLIBc8LEUDcA/SA+hwnObYwwnSJ3+19t
         9Jdg==
X-Gm-Message-State: AOAM531kDi12iwbVWHwmM5yBTQm+Iy1/q4udJ5fbHKgKTqWdiz0CeX8Y
	aY09pfWzi2kO78LZfos1bjE=
X-Google-Smtp-Source: ABdhPJwouE59q8I1qzBB7xR+BVlQDpSR2rYzUizfnc0z7hI3FQ8kxC9M3zgmpIicBNIJkYfmBr+Ufw==
X-Received: by 2002:a62:6d86:0:b0:448:152d:83a4 with SMTP id i128-20020a626d86000000b00448152d83a4mr19760475pfc.38.1635181244232;
        Mon, 25 Oct 2021 10:00:44 -0700 (PDT)
Received: from [192.168.1.4] ([59.95.95.35])
        by smtp.gmail.com with ESMTPSA id ls7sm19681872pjb.16.2021.10.25.10.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 10:00:43 -0700 (PDT)
Message-ID: <e2020caf-1b0c-ce0e-3d94-d105be85ed38@gmail.com>
Date: Mon, 25 Oct 2021 22:30:39 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: r8188eu: core: remove goto statement
Content-Language: en-GB
To: Larry Finger <Larry.Finger@lwfinger.net>, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YXafzp5F8T7/+tk2@Sauravs-MacBook-Air.local>
 <7dc4eba4-c009-b8b7-bc08-5b608bdf86a0@lwfinger.net>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <7dc4eba4-c009-b8b7-bc08-5b608bdf86a0@lwfinger.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/10/21 8:45 pm, Larry Finger wrote:
> On 10/25/21 07:15, Saurav Girepunje wrote:
>> Remove the goto statement from rtw_do_join(). In this function goto
>> can be replace by return statement. As on goto label exit, function only
>> return it is not performing any cleanup. Avoiding goto will improve
>> the function readability.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>
Hi Larry,
 
> You need to read section 14 of Documentation/process/submitting-patches.rst to learn how to submit a revised patch. 
Resubmitting such a revision using the same subject line is likely to confuse reviewers and maintainers alike, if not patchworks.
>
This is original patch (v1). I haven't get any review comment for this patch.
 
> Larry

Regards,
Saurav 
> 
>>   drivers/staging/r8188eu/core/rtw_ioctl_set.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
>> index 2b54cdfa9d6e..411b06e135be 100644
>> --- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
>> +++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
>> @@ -51,7 +51,7 @@ u8 rtw_do_join(struct adapter *padapter)
>>               ret = _FAIL;
>>           }
>>
>> -        goto exit;
>> +        return ret;
>>       } else {
>>           int select_ret;
>>
>> @@ -78,10 +78,9 @@ u8 rtw_do_join(struct adapter *padapter)
>>
>>                   rtw_generate_random_ibss(pibss);
>>
>> -                if (rtw_createbss_cmd(padapter) != _SUCCESS) {
>> -                    ret =  false;
>> -                    goto exit;
>> -                }
>> +                if (rtw_createbss_cmd(padapter) != _SUCCESS)
>> +                    return false;
>> +
>>                   pmlmepriv->to_join = false;
>>               } else {
>>                   /*  can't associate ; reset under-linking */
>> @@ -102,8 +101,6 @@ u8 rtw_do_join(struct adapter *padapter)
>>           }
>>       }
>>
>> -exit:
>> -
>>       return ret;
>>   }
>>
>> -- 
>> 2.33.0
>>
> 

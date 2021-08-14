Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3652FAD
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 06:31:21 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso11181673wmj.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AtcXPH0QsKZK91gULvtuZyrVdm2c/ou4YyVO9R8Tjas=;
        b=PxDZJi6ym08BAMxJCJEzovKp9hlAwah97TMkUTz7/BxgMh4HQXjtMmEYsI2qi3I6nQ
         ht93C7HpPmAHK2HVBpAeryvv+fNb/JZ9u07iiUTTxl7GG2NFVpPNubA0B/B5X6DSOMuC
         3su9p4rBOoA3MkNjl+Tml9939F1afITOv9jvGsL7u9rab/9uIJvZBXH+TanemvQ1Qir0
         mbsK4e5rm9Nqx2/u5Q0O21HoV0VViCOi2npbMxy9wd9zhvVZQW6v/vT01yklGG16cy9f
         qeyqSD6j+Ri6kUwPhDURMZE5JX6VTX0cxaEazRCwWWk8Vg5LnpIS+WqAYOIRwClyBrtT
         v6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AtcXPH0QsKZK91gULvtuZyrVdm2c/ou4YyVO9R8Tjas=;
        b=leYAqGL7jCnsyYBKq4mFd3Sfkxr5x+IIlmtGx+QVZOhoT35L0atTtvi7I5xZB8f5Xm
         g8xMiTDsQIe79VoYYL2SJqtqAOEyIqVwagz/6JDHScT8M19LAkVTaXEoitjYcYuwnaJM
         c2wSdPZcWHs5vnjvuLzOuDWPnWZIjAgNPuAyeICLwbUkdeabhHdds0Adod69dqWahTXI
         1padjSSKrAGjd0TzA9FWNPeb0GQfQmBfkcFwWKxfKcgtxAJY6mulo9ulUpVFsJcyXSrC
         afu4ZpKxtwuSdhUoTUhyii1HEeTAylsKoX8iSCpUD1Sb/37iaP6S9ZkofRmcRZfQpZgX
         xBdQ==
X-Gm-Message-State: AOAM532j/ed5otHEZyUeF3JiDq+dKMRMOmg4zIu6c577alOF52f3ro4r
	r5Bu7k9Z9vpGApWTm9HCRkA=
X-Google-Smtp-Source: ABdhPJw4iWyxTuMXYHkD5xDsOxLCqNutJt5p1e2SMEjfQAL4FN6es8Ocl07DJV0NAqaVjgHLTnw5Og==
X-Received: by 2002:a05:600c:2159:: with SMTP id v25mr5983139wml.42.1628922679442;
        Fri, 13 Aug 2021 23:31:19 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::2571? ([2a02:8108:96c0:3b88::2571])
        by smtp.gmail.com with ESMTPSA id d4sm3788029wrc.34.2021.08.13.23.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 23:31:18 -0700 (PDT)
Subject: Re: [PATCH 0/4] staging: r8188eu: refactor Hal_GetChnlGroup88E()
To: Martin Kaiser <martin@kaiser.cx>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210813073109.25609-1-straube.linux@gmail.com>
 <20210813094401.y2d6wehhdtuvbvp4@viti.kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <036352c3-9ed7-b758-0abb-9423a6f248c8@gmail.com>
Date: Sat, 14 Aug 2021 08:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210813094401.y2d6wehhdtuvbvp4@viti.kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/13/21 11:44 AM, Martin Kaiser wrote:
> Thus wrote Michael Straube (straube.linux@gmail.com):
> 
>> This series refactors Hal_GetChnlGroup88E().
>>   - removes 5GHz code
>>   - changes return type to void
>>   - cleans up camel case naming
> 
>> Michael Straube (4):
>>    staging: r8188eu: remove 5GHz code from Hal_GetChnlGroup88E()
>>    staging: r8188eu: convert return type of Hal_GetChnlGroup88E() to void
>>    staging: r8188eu: rename parameter of Hal_GetChnlGroup88E()
>>    staging: r8188eu: rename Hal_GetChnlGroup88E()
> 
>>   .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 90 ++++++-------------
>>   1 file changed, 26 insertions(+), 64 deletions(-)
> 
>> -- 
>> 2.32.0
> 
> Hi Michael,
> 
> this series looks ok to me.
> 
> Acked-by: Martin Kaiser <martin@kaiser.cx>
> 

Hi Martin,

thank you.

Michael

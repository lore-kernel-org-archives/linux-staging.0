Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFFF72
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 17:18:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id ls18so3423516pjb.3
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IbuYUzyzR2NfoAmhq9teREBRNFXaM5sLqZfNr1gDcCw=;
        b=TrcFljLQlJUA71rdwkk+ukFi5+yijWlbu5qUDqlIdRpyn+eCuE1Vn5xUwiyo3YdBTx
         z8eCaEbLvlvv6qY+bcbiypwaBkhPPfcI+sfCgfpzw1pim9mnJNuf22pbTx1ejD6js961
         w5rxEUyN3ZaLBOir+0hEdmGj2KLQ/QW8DMkjYFXsPJMzylU4fcZLd76MaOYaRyLEPpWg
         6AJwG0rt6nOKR+9D9Iw3l8S2yPel0/BIsCg2LC3lHs8fQKq6CvwHCAB7qFhuioHc2V+9
         u+zy3FBu0DwgM6O6iX9olTW+UEk9RqK4CxDuL7Oy7NwEBDYJyVjwEX7BDN6mYyOcfRJw
         ibag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IbuYUzyzR2NfoAmhq9teREBRNFXaM5sLqZfNr1gDcCw=;
        b=1noONt18t4LsbhlbC30fxAKZ0gvWUl2BFge8gnvwSygZYiO0vVV/gMraQ3ALzS7ckN
         /urC1gfOwQnPACS0bxBthbV5OL2eJrNfoeuZSlcOGIJh9GWY602BFRMGB49mfR2265KQ
         Fl2P92/P46eI0XAkdFprMOFDcnySwmyGAGJB0kv8msgwGv0tLmkGRTZKFcm7WPGqOhMT
         43Z72M7VEeB7DSsFOSKjtr7i59urXGejElBylCo7JNvi+PY6pkMnFGS4wFXcoX90+8gS
         AOgJzKUls63pP7XIArN26FMmDLhaFvovMCALpFQyo6kcZNfQNU0GHVXLkfVHPpMEFHzz
         fVvw==
X-Gm-Message-State: AOAM530vmun2EGsn9Rj/dxYFFGy7AZHQLxPLGol3MIrqaC05MlCIWpXD
	jkHUVoztDZEaaw1HJz3zwqE=
X-Google-Smtp-Source: ABdhPJw5xdH8peKLPo6OE8Ox5LwLBxRYV8iAsWiT2BqOcAoP9wINrxn/voQXypOvcvOmKVZcSjqntw==
X-Received: by 2002:a17:90b:1c81:: with SMTP id oo1mr1272557pjb.97.1634923137614;
        Fri, 22 Oct 2021 10:18:57 -0700 (PDT)
Received: from ?IPV6:2001:4490:4409:eb7d:758a:6a46:39c:b254? ([2001:4490:4409:eb7d:758a:6a46:39c:b254])
        by smtp.gmail.com with ESMTPSA id t28sm10301594pfq.158.2021.10.22.10.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 10:18:57 -0700 (PDT)
Message-ID: <4354b890-28df-6f0e-d206-9b31307e48dd@gmail.com>
Date: Fri, 22 Oct 2021 22:48:50 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: simplify the return
 statement
Content-Language: en-GB
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, ross.schm.dev@gmail.com,
 marcocesati@gmail.com, insafonov@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YWhBQF4yUH0/r53A@Sauravs-MacBook-Air.local>
 <13289545.LovHZTAFgE@localhost.localdomain>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <13289545.LovHZTAFgE@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/10/21 2:45 pm, Fabio M. De Francesco wrote:
> On Thursday, October 14, 2021 4:40:00 PM CEST Saurav Girepunje wrote:
>> Remove goto statement where function simply return value without doing
>> any cleanup action.
>>
>> Simplify the return using goto label to avoid unneeded 'if' condition
>> check.
>>
>> Remove the unneeded and redundant check of variable on goto.
>>
>> Remove the assignment of NULL on local variable.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>
>> ChangeLog V3:
>>
>> 	-Remove goto statement where function simply return value
>> 	 without doing any cleanup action.
>> 	-Remove the assignment of NULL on local variable.
>> 	-Replace the goto statement added after the memcpy on V2.
>> 	 with return 0 statement.
>>
>> ChangeLog V2:
>>
>> 	-Add goto out after the memcpy for no error case return with
>> 	 ret only. On V1 doing free, which was not required for no error
>> 	 case.
> 
> You still don't explain why you changed v1. You had freed resources on 
> success path. 
"On V1 doing free" I will add more information on changelog.
That was not allowed because you introduced a change in the 
> logic and a huge bug. Therefore, in v2, you are not merely changing something 
> that "was not required". Instead you are changing something that is not 
> permitted.
> 
> Thanks,
> 
> Fabio
> 
> 
> 
Thanks Fabio for review.

Regards,
Saurav

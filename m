Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704522F50
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 14:56:40 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id bh17so4812123ejb.8
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rlY4KHSQuSWJ6+c5NPPa6AObOciU4SZOuy8LXluxVrg=;
        b=j2dztHvM+ou/RPadGfgGmoGDsQVrNAezyM2BwMa8TnIksZPHmH4ztCZYVNyh98wZBI
         KdvJmTCfMW09uUny7vOzBwuFFdFqGQuiMzI52x9cfxl4F/+4Opx5mAjnhu7fDZSFW8TF
         WkIsE7epHxsZ8+zxFLqPT4nL5av1+K3o7C6FCnX5fcKdyYt5TtdzvXck4LbH0gKxbUc+
         SOKn+iWWMA4Hd5WAZdQfkbIdofj9CtElpApI3A2JgJxxk7vtk5wn5M/MUu8C6FykxpPg
         iCoE7Uhj+s93Wse3FPlbJK/T6HKM1ZroXRvkJi2BA23QiEFEVNpmBPuBtbxkq9D4JKzu
         FTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rlY4KHSQuSWJ6+c5NPPa6AObOciU4SZOuy8LXluxVrg=;
        b=hH9Zeghnn9VwHPemz/ID+zBhP5uNl5aXvhL7mZlBUAK2DHzCd0AqSvhmCL8uzZ+wTd
         WQRT7xJcZwQc2thJZ6Bns7v9PJ7IwWYVxF/luxYpb8qPLn6kuG1zfRCBYoCZHJ1RAyf6
         sO5UpkocgQWkv6uK3Xk1XngHKa5MxylwhKASX//bjqUuYqAg57d/DSZuC7hb1octiSJ4
         huYFx0HmF881RJ4VDUFn06eYbN1t97uyAyjVAdYSnT3QY+wEjgzb5wcMFQe1daahc+ns
         aRgpekdBGdyb1M8grfhNaSOfHjGcGZlrxyhVyy+7qYXSj+p/zfmUjRGC5RR5bmNCTyCj
         N76g==
X-Gm-Message-State: AOAM532TmeqxmPsVqyPxj4jH+jLHdcDhCB26pWrlWJqsbrVUwJ8IhBxa
	8SKYhn4G98bcjgJXPKQtJNw=
X-Google-Smtp-Source: ABdhPJy3sEcLDR4B3Kd8dpO4zY04GaCQ++ce6gaGLezsna6AFa2rk5W7BBxQ122G6DAt+byOAv8i0A==
X-Received: by 2002:a17:906:6a1a:b0:6e1:87a:151f with SMTP id qw26-20020a1709066a1a00b006e1087a151fmr8518916ejc.715.1649256998471;
        Wed, 06 Apr 2022 07:56:38 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906648700b006e7f08fe590sm3542760ejm.198.2022.04.06.07.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 07:56:37 -0700 (PDT)
Message-ID: <9d80845a-0ccb-b94f-a9c2-84559dcc0adc@gmail.com>
Date: Wed, 6 Apr 2022 16:56:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] staging: r8188eu: use round_up() instead of RND4()
Content-Language: en-US
To: Joe Perches <joe@perches.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220406061859.9011-1-straube.linux@gmail.com>
 <20220406061859.9011-2-straube.linux@gmail.com>
 <e56d9ca89544ad015c6cfabaf2859027c0dd50e5.camel@perches.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <e56d9ca89544ad015c6cfabaf2859027c0dd50e5.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/22 11:54, Joe Perches wrote:
> On Wed, 2022-04-06 at 08:18 +0200, Michael Straube wrote:
>> Use in-kernel round_up() instead of custom RND4().
> []
>> diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
> []
>> @@ -63,7 +63,7 @@ void rtw_wep_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
>>   				arc4_crypt(ctx, payload + length, crc.f1, 4);
>>   
>>   				pframe += pxmitpriv->frag_len;
>> -				pframe = (u8 *)RND4((size_t)(pframe));
>> +				pframe = (u8 *)round_up((size_t)pframe, 4);
> 
> Perhaps use PTR_ALIGN
> 
> 				pframe = PTR_ALIGN(pframe, 4);
> 
> etc...

Sounds reasonable, I'll send v2 soon.

Thanks,
Michael


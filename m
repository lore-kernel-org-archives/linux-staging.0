Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E572
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 04:28:13 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id iq11so4349474pjb.3
        for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 21:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gv78xz17ZsXRpFTbBnwWITsSEOMIBRoa9DJii1PCRs0=;
        b=oOgFDmadWvgeyAtFLJNk9XUqyYuNs6m8qOhYSw02HDDK6YDDZ0N6k3sw/s0aI1NhEz
         hGuewXeznWT+7GGeojwNULBYh0hVq0Nj+WpsbabVniao3fI4LupjsQlDQsd9sxR3i1se
         B1pZCGDALNQ0yG5XO73EVm5Nxz9osmK4o8B0NX1fgJnw6RT5Ijh/8EoozSyDFlDO+kWr
         9BvdLIDqHR93pzIJoRdITei0PcYc+shc+nDJtLXi0Mgq3MqRvsgf9xO1mLYIH761Ets8
         x+EDs7Q1oChUxbPsgGSLVQd55KTF2JDLg1wN9BZvDBT0dBhC/0iTaQXrJiCz68dw2axQ
         s3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gv78xz17ZsXRpFTbBnwWITsSEOMIBRoa9DJii1PCRs0=;
        b=IWaCUiVrSnG3XLS6niPxhsiQsVAinks+haE9k2cYYF3N9cyvFhSOqbOW2RzdRquEZQ
         dRoW6T7mq5HBtEUAqp1PLV3ykA2BE0NB3FcxTFjFa2VV9qOBKLR/SHwL/vCFb2jdkGCm
         v4pH8H/ITVB7eLstR3D5lxBnUMsxuM3ooew6CmVRdT9I9H5S6yr29WfWp9RbYIAJvJNw
         C0oNbwMol9kQ4jGsx4UbmHnuM0rGd+Wji3st7fQ/cD6bq3BTWLUCbgugGcrNjoKVYxct
         75vwrgmaSgSBn0dANDkD/P5VsfYiSJ/vZoBWKZujdwulkOZSLLdbFxbQ6qaKoILsg5yP
         6kkw==
X-Gm-Message-State: AOAM533vfGXRoWVpr8IP3Shevj4V46OgBEDmJKXqfMT5H90Sj1t/lMI3
	AmZHTF6nzjv4yyn2jXO/2cU=
X-Google-Smtp-Source: ABdhPJz7Tutrdo7gHbAbRXGsyCcLGMBxM10G2PfreR1Z/pb812Dfs8u3wWOdaxQPo6qUofrersYyAA==
X-Received: by 2002:a17:90b:1bd2:: with SMTP id oa18mr35240318pjb.164.1635740892316;
        Sun, 31 Oct 2021 21:28:12 -0700 (PDT)
Received: from [192.168.1.2] ([59.95.88.136])
        by smtp.gmail.com with ESMTPSA id d12sm13468752pfl.141.2021.10.31.21.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Oct 2021 21:28:11 -0700 (PDT)
Message-ID: <7f406b96-fbfd-bd3e-182b-3ca8b3056635@gmail.com>
Date: Mon, 1 Nov 2021 09:58:03 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: r8188eu: os_dep: remove the goto statement
Content-Language: en-GB
To: Joe Perches <joe@perches.com>, Pavel Skripkin <paskripkin@gmail.com>,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YX7cCtVss2RWOJ/a@Sauravs-MacBook-Air.local>
 <f26b4aec-c0a1-8c93-b34e-8b1a36ac81b3@gmail.com>
 <bc976b72692512f33ae90183f588af38a06a2aa1.camel@perches.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <bc976b72692512f33ae90183f588af38a06a2aa1.camel@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/11/21 12:47 am, Joe Perches wrote:
> On Sun, 2021-10-31 at 21:43 +0300, Pavel Skripkin wrote:
>> On 10/31/21 21:10, Saurav Girepunje wrote:
>>> Remove the goto statement from rtw_init_drv_sw(). In this function goto
>>> can be replace by return statement. As on goto label exit, function
>>> only return it is not performing any cleanup. Avoiding goto will
>>> improve the function readability.
> []
>>> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> []
>>> @@ -480,48 +480,34 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
>>>   {
>>>   	u8	ret8 = _SUCCESS;
>>
>> Btw, this variable can be removed completely then. It's used only for:
>>
>> ret8 = rtw_init_default_value(padapter);
>>
>> with your patch applied, but rtw_init_default_value() always returns 
>> _SUCCESS.
>>
>>> -exit:
>>>  	return ret8;
>>>  }
>>
>> And just `return _SUCCESS;` here.
> 
> And maybe one day s/_SUCCESS/true/ and s/_FAIL/false/
> with appropriate conversions to bool
> 
> 

Yes this is another improvement possible on this function.

Regards,
Saurav

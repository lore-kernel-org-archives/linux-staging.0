Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BF620F8
	for <linux-staging@lists.linux.dev>; Sun, 26 Mar 2023 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679836402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDmH+gmU6zt3mD2nO7zm/sbyoPAN9cTAbp6KyhpDGG0=;
	b=MkajaCkV9OruJSk8cJQeEg6DQUJfcRQNzVVWzsWc8ii3OkAxs9PoOTMlRU4j3pwfS8CcPG
	oZePL04NRUO26QlehD9DJCgGTE09LPBGaVfPdasGEChS+zv7OM4WP66dErF1+9gUvluWkl
	zOmmKmXD/nsgD23a7cIp8nFkdNqfrbU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-CIQI2KqRMXuQxGP0JMBQJw-1; Sun, 26 Mar 2023 09:13:19 -0400
X-MC-Unique: CIQI2KqRMXuQxGP0JMBQJw-1
Received: by mail-qt1-f198.google.com with SMTP id u22-20020a05622a011600b003dfd61e8594so4206769qtw.15
        for <linux-staging@lists.linux.dev>; Sun, 26 Mar 2023 06:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679836399;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDmH+gmU6zt3mD2nO7zm/sbyoPAN9cTAbp6KyhpDGG0=;
        b=cvdRPCXP3b8JijlL3siq/uRn8ZahMUA5RDMVrmPwk1a2tFf7c4APlKjfmnLH0UEIP1
         0TkGKPrnRPLUMQVm5w8+c95KUN+p8gjgO+3EUtJR7MDN67QPD4ZCdZTcfYf3au9Mnuz1
         APBdQqB7JfJ1Fjfof1x4lRuIqtUKaHDxW7NBgf82PzZETakmG53hcXZfzXeM7C9DYbeI
         qwE3lWezzkm5IGvmz2iNNQLojIDA/EdLmTN9wL8lzLH7qAgfQZCQs0x2KeVIMRWIfV7s
         hVjRYWG9We0oOc4kRLU72BYua9olrfdUsYBXAU/41hiSyqo+WHtwVfyTwPR1VF+hpkBW
         7pDQ==
X-Gm-Message-State: AAQBX9fKHZExiuhfEFB+TsntaI1UylC56qRbp9YKAVWhALww3OeDh4YP
	bbQa0b8qgl1Rva3lZW1iGRurOlYIPWRBAcqhIQtJA9iQu3tH8X7+pv43c+U/SDMWsHB0BWzOMMY
	x3VbPtLteodXXRRNJ8E6TGl/lUg==
X-Received: by 2002:a05:6214:5298:b0:574:8ef8:89d1 with SMTP id kj24-20020a056214529800b005748ef889d1mr14088080qvb.5.1679836399161;
        Sun, 26 Mar 2023 06:13:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350YGMIRnpMhkJ0DNPjZQOKnhKTlK+sAN401/0FukvSY0TT97gcoNhnlOu64nMTLVx/tksR/V/A==
X-Received: by 2002:a05:6214:5298:b0:574:8ef8:89d1 with SMTP id kj24-20020a056214529800b005748ef889d1mr14088053qvb.5.1679836398910;
        Sun, 26 Mar 2023 06:13:18 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m2-20020a0cee42000000b005dd8b93459dsm2181105qvs.53.2023.03.26.06.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 06:13:18 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: remove unused pHalData variable
To: Greg KH <gregkh@linuxfoundation.org>, Nam Cao <namcaov@gmail.com>
Cc: nathan@kernel.org, ndesaulniers@google.com, artur.bujdoso@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230326122321.1352337-1-trix@redhat.com>
 <ZCA+vIjUFHZFUFPC@nam-dell> <ZCBArurFCc7Pae+T@kroah.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <8a2746a0-57e0-621b-7db9-2719554d050b@redhat.com>
Date: Sun, 26 Mar 2023 06:13:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZCBArurFCc7Pae+T@kroah.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/26/23 5:55 AM, Greg KH wrote:
> On Sun, Mar 26, 2023 at 02:46:52PM +0200, Nam Cao wrote:
>> On Sun, Mar 26, 2023 at 08:23:21AM -0400, Tom Rix wrote:
>>> clang with W=1 reports
>>> drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:23: error: variable
>>>    'pHalData' set but not used [-Werror,-Wunused-but-set-variable]
>>>          struct hal_com_data *pHalData;
>>>                               ^
>>> This variable is not used so remove it.
>>>
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>   drivers/staging/rtl8723bs/hal/hal_btcoex.c | 4 ----
>>>   1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
>>> index e36f8c369a04..0cb2adcc1f78 100644
>>> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
>>> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
>>> @@ -1179,10 +1179,6 @@ bool hal_btcoex_IsBtDisabled(struct adapter *padapter)
>>>   
>>>   void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType)
>>>   {
>>> -	struct hal_com_data *pHalData;
>>> -
>>> -
>>> -	pHalData = GET_HAL_DATA(padapter);
>>>   }
>> If this function doesn't do anything, does it not make more sense to
>> just remove this function entirely?
> This function is already removed in linux-next, so it doesn't matter :)

My patch is against linux-next from tag next-20230324

Tom

>
> thanks,
>
> greg k-h
>


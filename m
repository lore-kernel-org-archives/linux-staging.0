Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C870
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 17:37:12 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id k25so6156459oic.4
        for <linux-staging@lists.linux.dev>; Mon, 03 May 2021 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1t1KFawxYQnhUD83BXZON5c+I9V+6Zm5vY5OwXhyWio=;
        b=kA5Kuz7NATBEr8XwwT8JD+RGGvAQ5TGvjuTr9YOBmGqJasqgukewX0AhaQKXLGgjMg
         /iMEC4zweiCWDjmfCuseq+UeugkRUSN05I3DxnVNoIfh6CXWTBC5de8EiUnE1oBtCSKR
         kkGJYkVZ++HOnlOJhtyQF1wez4smdPHk7ZvSUun0+AOyb74yA6XdY7g/x3NcV2qHw4sA
         xIypnPvH5L9Fsr0bk/xPkwWwG6VOeTZiq/3sMiLuYLoeSsvx8BHRi9lMRlrXJrMIpjNM
         qFfIHxUJi7SxypwqmEh9DAgWgIANiRcFoldj3lA5FM/Rm+n/mzALumHmkINw8mnY6d02
         WGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1t1KFawxYQnhUD83BXZON5c+I9V+6Zm5vY5OwXhyWio=;
        b=Cjp+odBOidDfl7GeF/AUQr6Piz5WXvvc0NVou2qAFTn9DaJW7fl3ai+h2d52kr69AW
         sP41rCPIX6egxMfmbOjwoIRHtvDTWZEfI8ES/Or2Lxgbl850OeodUcu86DgQAJmu1g9W
         weza+t9hctSArzBfKrGA8BZP0nGvfWjlWBkYBxhL4A0cQmf4dc4GGYOvtp+CXBcRZGQH
         pqs9lMkKTkqFV0wz5nCIL61zmme8oDPFwlF+NDs3miyfUM/ILwvpA+qfLa+uof3AEZxI
         A5MNecIKUe3uCytMg5Lez274kTPNguSq8bMYDe7T+cy68h/Z7DbhOZaJ0T5BFVDRdARp
         Tyzg==
X-Gm-Message-State: AOAM533QyEJwRfbfWVSRmWRYxjgR9qS4N8qFT5qisTwYV3Xs2dabqqlO
	Xrs2hRhgmlMHSEdRBYxATFY=
X-Google-Smtp-Source: ABdhPJyp3wlyDlW4UUKIwWYd8l9YfM1NC1KgaDjlaiLDTq3BB4YMrQJd35a/4q2fRpFNW0JftaLy8w==
X-Received: by 2002:aca:4c58:: with SMTP id z85mr2894675oia.46.1620063431457;
        Mon, 03 May 2021 10:37:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p189sm95372oif.31.2021.05.03.10.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 10:37:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Use list iterators and helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210428173301.149619-1-linux@roeck-us.net>
 <YJApQTRSEWUuR4qd@kroah.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c317df15-1414-3765-1040-4938a9a48776@roeck-us.net>
Date: Mon, 3 May 2021 10:37:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YJApQTRSEWUuR4qd@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/3/21 9:48 AM, Greg Kroah-Hartman wrote:
> On Wed, Apr 28, 2021 at 10:33:01AM -0700, Guenter Roeck wrote:  
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
>> index 85663182b388..9cb2c7a112d2 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
>> @@ -124,11 +124,8 @@ void kfree_all_stainfo(struct sta_priv *pstapriv)
>>  	spin_lock_bh(&pstapriv->sta_hash_lock);
>>  
>>  	phead = get_list_head(&pstapriv->free_sta_queue);
>> -	plist = get_next(phead);
>> -
>> -	while (phead != plist) {
>> -		psta = container_of(plist, struct sta_info, list);
>> -		plist = get_next(plist);
>> +	list_for_each(plist, phead) {
>> +		psta = list_entry(plist, struct sta_info, list);
>>  	}
>>  
>>  	spin_unlock_bh(&pstapriv->sta_hash_lock);
> 
> 
> This chunk didn't apply to my tree as someone else cleaned something in
> this function.
> 
> But that doesn't even really matter as this function does nothing at
> all!
> 

You are correct. Weird.

Guenter

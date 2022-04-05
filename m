Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A27C
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 09:07:22 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id bq8so25260597ejb.10
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kJSjygeoIUEg15KEgznSTxJtmLSlX3j99Gbfk4k6bTw=;
        b=BndCpHbRsWd6v9wYTuGwTQqEPbjP9eHNrRdtXrSGV8fG9UcpEcQ/yBmITbPMTE4+qm
         sd6oJWbX1cCsjwY4F1Zmbei5RtCpG0eoriiJbERYskO8uAWG5dlcDnrtWhjAKvCDoZ9u
         lmIaOv2I9muviE18eVTGJ10lQhNx6gE1arefCmnKLIXDoSaS/cvb+DxGhJCK8ZySH7lP
         9eXGOIlDWyeyDCDmyuStxkgBcG/06bJMGSN/aI30KG6h7s1/TCvR473Fs6Q/c2xWepL5
         YQNJaocsIHdlEDjig/56mixNPFNePdh0sbIzBj0g/MkffXf1EOx3u5Ipk8QQvkvau86f
         8ERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kJSjygeoIUEg15KEgznSTxJtmLSlX3j99Gbfk4k6bTw=;
        b=lnuvyMqqnWfaR0mom69b8e7Jp7VePTN1JP4GjqUHKFmkHvpu/UZm9iOW2ZBEBpO/vp
         AoWxebPdUFHbyWF039PJ/1JH5rm00Ygf/s7lv9cxvi5OuqVJKSkVW24czT5QV5vOKenh
         6PcXfaan2YbYlWjY6/FuEQRl5oTiNx0caWV5t9c+KgRU/y172Ri/t7ypYSK9aqTAyLWt
         axKbVRL5P9KoBguOEeCV4kwbIzx2xpg8GXiBRUv3ObIB3BO5ebZyhz5zhTTJRsRUuUJa
         J3t5vxCcC3mzy96mGYTaiTR5Uim5Yq9woIVRwOYc8zTTrT1mUv49LZ9mSCDGHXJuuWoH
         2pnQ==
X-Gm-Message-State: AOAM531hW1J4pOmToCrXVonkg+nSGpnHpeAKhUqwkD2F21KmEgJZn0WF
	ht8rBYc19GQLJ0YlIeJukCo=
X-Google-Smtp-Source: ABdhPJw9/2/4/0IARD1YEes9d1GNkT6ZQG5MG5TlQjfRSVS5zf4flLb6Q+lHMSGG8wYs+xRWXowjTA==
X-Received: by 2002:a17:907:96a9:b0:6e0:db4a:ba8d with SMTP id hd41-20020a17090796a900b006e0db4aba8dmr2536171ejc.87.1649149641139;
        Tue, 05 Apr 2022 02:07:21 -0700 (PDT)
Received: from [192.168.0.151] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id q15-20020a1709060e4f00b006cdf4535cf2sm5314719eji.67.2022.04.05.02.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 02:07:20 -0700 (PDT)
Message-ID: <5420967d-5007-8ca7-7a8d-124b9ad96905@gmail.com>
Date: Tue, 5 Apr 2022 11:07:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] staging: r8188eu: remove HAL_DEF_IS_SUPPORT_ANT_DIV
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220403165255.6900-1-straube.linux@gmail.com>
 <20220403165255.6900-2-straube.linux@gmail.com> <YksBcUBXbgzXmEBO@kroah.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YksBcUBXbgzXmEBO@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 4/4/22 16:32, Greg KH wrote:
>> +bool support_ant_div(struct adapter *adapter)
> 
> That's a very odd function name to add to the kernel's global namespace
> :(
> 
> Pleas emake it more obvious what this is for, with the driver name as
> part of the prefix?
> 

Looking again at this I notice it can be made a static function in 
rtw_cmd.c.

I'll rework the series and make the function static with a more
descriptive name.

thanks,
Michael

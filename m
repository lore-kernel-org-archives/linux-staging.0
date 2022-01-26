Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2F52C82
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 10:58:55 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id c15so15079536ljf.11
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 02:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1LeqebZU7zO4zLSZoctAnk7wyNMl3wrQ0G0u2lAdEIE=;
        b=QAnj/Dypm31c4y4zxJDpUoK5Lj4T7DxxJu1M8ciX88f4ABcyGjADkFyDfSltgU20r6
         jyy2p8yHku3UkdssU1ixjb9Y+kBwnFJXum325aigZSo2FwysrAmQsXJssYOJN3Kz9jBN
         Xbif0kHCxBirvHwGAa9rSBxJAJgNq2GAnIOzYyFQKoH4aPRDtGWZlst2eUeQ0EfpRO1g
         eUDq5Xbp7J+ZPryFS+WzdZChj5sE/DcQQl2sWxMFoLUaDoISM55hC1J3Od/kImOomb0D
         jv8xiTd4Gmyd3HdMobPCcvkmsJYp4iGigZVJ6mQlb+Cn3nydXAu6hzBax8wxqtWHSewy
         +uNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1LeqebZU7zO4zLSZoctAnk7wyNMl3wrQ0G0u2lAdEIE=;
        b=h44Q905jbj9u2FL3cqW8QvwKv6REniNpxhc7+JNQvOBe375QmnGCZGVzSo9yz9zc9V
         vI/dY/3SJ39fW/8IqBAlZqVL44ZX+IEDVMHo9G+db/V8HAtjyT8leyheyBOFaT/6wTOv
         lUAlmU+ei/yqily2YigERA5mEQOjiUCt5vsImIgWEFpJd7OZXmAl91DrnpiHCgmnGbU7
         zRgTjsUt1L5Cr0+fGK+suC7ctvj5PCISuwowj2k9lOIRbc/uyDjp4RrtLJCpsWT6BdJ9
         tPkb4v67u8EvCq8m55DFoG9WPcFzicIKh501IjZJvR8U7vw1zDRTlTxxXzVLqdcCXjlt
         c9Bg==
X-Gm-Message-State: AOAM530P6FIz6rXDDbN+dsw1+V5iExmmlrIGzpmWClInrnzUNDH8V2/U
	BbE/TyYy2g5i+OU/clCy+fc=
X-Google-Smtp-Source: ABdhPJyMTAs8GAKP5D3ETY+f1IKIgihQgJmZLxSKX9MnjRVH5IrXBGMXeaRTzei+yLv662cHawRIcg==
X-Received: by 2002:a2e:9e87:: with SMTP id f7mr18184273ljk.353.1643194733881;
        Wed, 26 Jan 2022 02:58:53 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id y23sm1421921lfb.2.2022.01.26.02.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 02:58:53 -0800 (PST)
Message-ID: <b6da2cde-b489-0b9d-819f-c36cd64f9531@gmail.com>
Date: Wed, 26 Jan 2022 13:58:52 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/10] staging: r8188eu: remove DBG_88E calls from
 os_dep/ioctl_linux.c
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Phillip Potter <phil@philpotter.co.uk>, dan.carpenter@oracle.com,
 Larry.Finger@lwfinger.net, straube.linux@gmail.com, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <20220124224415.831-7-phil@philpotter.co.uk>
 <a681a562-eb41-9dc8-703a-5b235c15a3a1@gmail.com> <YfCgQbFxfVZXw9Fg@equinox>
 <b5bbe488-ac43-fd89-7c65-36bfa9c903a6@gmail.com> <YfEm4t+fhO4I2uDW@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YfEm4t+fhO4I2uDW@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 1/26/22 13:48, Greg KH wrote:
>> IMHO the best thing you can do is to leave these reads and leave a comment
>> like "hey, please remove me and test". One day useless reads should be
>> anyway removed, since ideally rtw_read family must get __must_check
>> annotation + normal error handling.
> 
> No, if these were never getting called in normal operation, there's no
> need to add them back.
> 

I guess, I was not clear, sorry. I mean leave reads that were called 
during normal operations, but used only for printing debug info. (As 
Phillip has already done in v1)

Reads inside R88_DBG() and other debug macros of course should be 
removed, but other places seems dangerous without good testing. There is 
al least one place with following comment:

> 			/* Although lenc is only used in a debug statement,
> 			 * do not remove it as the rtw_read16() call consumes
> 			 * 2 bytes from the EEPROM source.
> 			 */
> 			u16 lenc = rtw_read16(adapter, REG_PKTBUF_DBG_DATA_L);

There is a chance that other places have same problem, but don't have a 
comment above it. That's why I suggested to leave all these "debug" 
reads and leave a comment for further work. It will help to easily spot 
them in future and remove or leave them with explanations why.




With regards,
Pavel Skripkin

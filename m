Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44E81840
	for <linux-staging@lists.linux.dev>; Sun,  2 Jul 2023 13:01:56 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso34402245e9.2
        for <linux-staging@lists.linux.dev>; Sun, 02 Jul 2023 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688302915; x=1690894915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zzka9CnRuiGxtiFqL9JgKk46K47spIoim848zQhRx/I=;
        b=b1WNUNT4oTwKh77H5nT3jfqCE3yGRMR6EkAhEAFqi7jR/T1jTcluVilYz655Q0pIYX
         T2+nS0EnBCIcSSafc/OxQJqxPWnGwo/JC6P82Lk9Y+ViWTeTIaVmFbB1YsyrSArw55Jp
         Q7EzB3uerrUwVEzqSXYRtc1Hx75rNfVpJAO+Yed1N5X5PhwnNJfvuoajZAZddgo589/9
         PqorW4chq2JgOvNZaWYMjFQISh+CFw/Ln+QEMnujnKV72B1XldfUSU76VI+6G39hvJOs
         coOn32UVkkeyRyID1QqcL6Ao82nPtI+qhfOVXnJgbPlxM8inX6eahd0mnV3MBG1w1nin
         Zg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688302915; x=1690894915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzka9CnRuiGxtiFqL9JgKk46K47spIoim848zQhRx/I=;
        b=J1+qVA/t5KUl136Q8IHHz7K7Rx3bb/rBjCFMVVOyMqrYI9tiJEJLiF3iBgktGzNund
         DzR7/XBqk1UzW0KK/7aPG0HE3J+2xR66wkraf6E1R2m8QwUhZzhnNxd1X1Uh8tHOTDAq
         1r70uD4dDY/B7PYr++QHAmHBpHaPo3Nt8w/epF+oT0pAZkTRZErbc1xJrOKMQMI26PMl
         23cz95gPEAtx8exKQbLmKoCRk2IAP3Q3tr4OEF9cvEoUPIvLlB8+zjZ6zE9mtoc4DnBq
         F18eOyISpJPprCf6lOY6sq1LPZSE3BdYPwBSrWpmz2V3TPh46/hqfO/UJ8Q5+2ShpDAh
         /SAQ==
X-Gm-Message-State: AC+VfDyULuDNCtPjt5HX4TOHo2xjZKVZgn009m7UioRa9kYTFRIrLRxs
	2Ai5pxqYhTlLoq6HifEP+OY=
X-Google-Smtp-Source: ACHHUZ57l2NYdjFz6gnbDv5RtxHSLeNECuh+UmIbNVUXxycz4UEWnF6Th5b5Yk8FZNtDi4ojGzHT9g==
X-Received: by 2002:a05:600c:2213:b0:3fa:e92e:7a7b with SMTP id z19-20020a05600c221300b003fae92e7a7bmr6995851wml.15.1688302914474;
        Sun, 02 Jul 2023 06:01:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8? ([2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8])
        by smtp.gmail.com with ESMTPSA id y17-20020a1c4b11000000b003f90a604885sm24277641wma.34.2023.07.02.06.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 06:01:54 -0700 (PDT)
Message-ID: <ae400e28-0cd4-cdf8-811d-843e62cd4a95@gmail.com>
Date: Sun, 2 Jul 2023 15:05:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230702080324.120137-1-rgallaispou@gmail.com>
 <2023070254-embark-subplot-4dd4@gregkh>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=c3=abl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <2023070254-embark-subplot-4dd4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 02/07/2023 à 14:02, Greg Kroah-Hartman a écrit :
> On Sun, Jul 02, 2023 at 10:03:24AM +0200, Raphael Gallais-Pou wrote:
>> Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
>> ultimately causes the module to an early exit at probe time.
> 
> So this doesn't work at all today?  Has it ever worked?  What commit
> does thi fix?

I tested again with only a tweak in my device-tree. The early exit in 
the driver's code is caused by a missing field. So regarding this 
particular driver the macro works.

It resolves to set spi_driver.id_table = NULL, which yields a warning in 
__spi_register_driver(). So I guess this patch only fixes a warning.

> 
>> In addition the MODULE_ALIASes can be dropped.
> 
> Why?  When you say "also" or "in addition", that's a huge hint it should
> be a separate patch.
I did not find any reference to those aliases in the kernel, which led 
me to remove those.

If you think they are still necessary, I'll split them in an upcoming v2.

Thanks for your insights,

Raphaël
> 
> thanks,
> 
> greg k-h

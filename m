Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3492574
	for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHbnWYQB"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6c10f098a27so728851b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698675046; x=1699279846; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Enm+nI8vfFGiUthTB80mGNT7rimsxWeKkqRRBI7bSko=;
        b=NHbnWYQBF++20sxEeQMFhNM4IoywOy+9CYp0wIkmeY4YOew5sN5je8USDd0BitdsR3
         797hr6Kp/YBPtrz+l4JMdZ06HzFkAtrkM216ljcygPsBIuVaspzkpQlu9OR/03xuI3vG
         8/2LHNTLtC28SjNNb5rsU1bmgMl3TchHzU7a6T8CGYr6FJk29qJneZ5L5zBCsl3mRIqm
         XTtEY3eCN58scTLUMLG2ydomDjoxix1UhsCvyuJHJrgBu1Ks+TRts8Gj9HtO7VJvHAfM
         Yjlz7zDN9VVjc6gH1rBqshwrMi9atLzUYYg5Coc+qr54I3l0GGPrEG1FqVJkLQ13198l
         OoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698675046; x=1699279846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Enm+nI8vfFGiUthTB80mGNT7rimsxWeKkqRRBI7bSko=;
        b=gQt8tAPlaHMJvfpcGOPpX7d8/DTsmBW0CgTDdtO39yGapAxWBb9lH1J43Ck7nfF/yL
         QkzO56QlGVkvuHlxEOrbJPR6djQWr3rayfxMwRXCiHIpq1xgNklkLzPMDCPCwrJjXuOl
         OCE+yZCiyEJl2IQz5IaeWgNFz3WYWhfIlNTixsGm5QB+5GXMZ9yPwIWbl/tWaVQI5+9U
         U9uNPbNo/EdnyKBlE9VEGwDsQZ6k7/znrjWGw0GXefLiKSKLsM7yXq1wjlHBaVwdzA1g
         Q37HaZAyaDU7eAWVduDQFD+VcnIiZAxVVk8sbxRijg8gSM+zADRb30sMF4IoRi2y+KH7
         U8pg==
X-Gm-Message-State: AOJu0YxKEmQ27/XRnaHdhEHXze4lQ8O14CDgSXYGGVw5kl2aYJyWH6gm
	c4Fq6v8IRp6dG3B58puPASs=
X-Google-Smtp-Source: AGHT+IGQlArupjZC+r3H8N3aevLYQL83XIEvWWZyh9gykT9xdv3T+xUJV/U2Xt5Ux60qL9WQ7pTLPw==
X-Received: by 2002:a05:6a00:248d:b0:6bd:b7c5:f776 with SMTP id c13-20020a056a00248d00b006bdb7c5f776mr8536444pfv.8.1698675045592;
        Mon, 30 Oct 2023 07:10:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s24-20020a62e718000000b00694ebe2b0d4sm5925479pfh.191.2023.10.30.07.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 07:10:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <28f8b88b-4709-4254-a184-5fbbc1f7273f@roeck-us.net>
Date: Mon, 30 Oct 2023 07:10:42 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] staging: octeon: remove typedef in enum
 cvmx_helper_interface_mode_t
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Oliver Crumrine <ozlinux@hotmail.com>, colin.i.king@gmail.com,
 sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
 geert@linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <cover.1693236450.git.ozlinux@hotmail.com>
 <PH7PR11MB7643DEB4401AA83A0578087CBCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
 <32e9ad3c-191e-4dd1-b1cc-07f7b93c3f28@roeck-us.net>
 <2023103049-daybed-abstain-bad9@gregkh>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <2023103049-daybed-abstain-bad9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/23 23:24, Greg KH wrote:
> On Sun, Oct 29, 2023 at 10:17:21AM -0700, Guenter Roeck wrote:
>> On Mon, Aug 28, 2023 at 11:39:07AM -0400, Oliver Crumrine wrote:
>>> Remove typedef in enum cvmx_helper_interface_mode_t, and rename all instances
>>> to cvmx_helper_interface_mode
>>>
>>> Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>
>>
>> In linux-next:
>>
>> Building mips:cavium_octeon_defconfig ... failed
>> --------------
>> Error log:
>> drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
>> drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status' isn't known
>>    204 |         struct cvmx_pip_port_status rx_status;
>>        |                                     ^~~~~~~~~
>> drivers/staging/octeon/ethernet.c:205:37: error: storage size of 'tx_status' isn't known
>>    205 |         struct cvmx_pko_port_status tx_status;
>>        |                                     ^~~~~~~~~
>> drivers/staging/octeon/ethernet.c:205:37: warning: unused variable 'tx_status' [-Wunused-variable]
>> drivers/staging/octeon/ethernet.c:204:37: warning: unused variable 'rx_status' [-Wunused-variable]
>>    204 |         struct cvmx_pip_port_status rx_status;
>>        |                                     ^~~~~~~~~
>> drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
>> drivers/staging/octeon/ethernet.c:801:22: error: variable 'imode' has initializer but incomplete type
>>    801 |                 enum cvmx_helper_interface_mode imode =
>>        |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/octeon/ethernet.c:801:49: error: storage size of 'imode' isn't known
>>    801 |                 enum cvmx_helper_interface_mode imode =
>>        |                                                 ^~~~~
>> drivers/staging/octeon/ethernet.c:801:49: warning: unused variable 'imode' [-Wunused-variable]
>>
>> Bisect points to this patch. Bisect log attached.
>>
>> As usual, my apologies for the noise if this has already been reported
>> and/or fixed.
> 
> It has not been reported, thanks for it, I'll go revert the offending
> commits.  And I need to figure out how to build this driver better, I
> get no build-failures from anyone for it when stuff like this happens,
> odd...
> 

This is kind of chronic. One really has to build mips:cavium_octeon_defconfig
to find Octeon related problems. The all{mod,yes}_defconfig builds don't build
that code.

Guenter


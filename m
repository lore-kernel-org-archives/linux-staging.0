Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05AF7B;
	Sat, 11 Mar 2023 14:57:33 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t15so7589929wrz.7;
        Sat, 11 Mar 2023 06:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GC6gxLkSt5uTZ0ymTf46wy5yL9s9aDluG3wBqWBs5Ao=;
        b=mwrsq1VcC7yLQT2peO2jhfVyQfYoiHwH/7siU/J2z79i1jFLG4uz/471lo1ufUlIxf
         We0Vk2fyJoJoAPmlkC8+S/7rVPLKc5WTVkSBjUNmw2TrTVEssuZF81WrVVEgi04tDTbZ
         EcuPZdbhDBjMJzQWeSKV0gHqK+KlEL02TW6xgXA6k5clPzSqUKHIo/d331SlI+GUXrDd
         UyhlCgvpyEuNAa/D2FkDOoG0XjZ3kuIjQvA9CZWLI1JqujotyAxFxJpMnFWFd67PB78O
         5cBKSPKafMskDRL6iA2WjzjHSA0WeZhitgr+e8Hc7zNcPoiDCAYQ4h1w9g/vJSYy6JKX
         fqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GC6gxLkSt5uTZ0ymTf46wy5yL9s9aDluG3wBqWBs5Ao=;
        b=IwKkK7MLli3/KN9mqS7JHRNOIIJgNbmhQg9QNY5uUmssqSzT2QK2tKE6EgMSu4ec5J
         i51+ZZYEib+t9Tnf3dwuIIFMgmPz4mEjGr5LU+bms6vv9paVk/rmo0jzz+t0TAeU0H7k
         gGZQ3Q4gFttkc2TZFo+tI7w/C8Dbpolnse73ZsxTqeA08rr0v6MQJMiBPq1S+pvPIn72
         +IZwFpggdqkqOQNS0mDCwrz4HhmxRlj/dMG3Vbhlcg8Cy37Lh6l47IS9iOfQBI7FcwLl
         LRVck7b3Tibe4FWoLBL6lskcEJIJj5JqODw0patPDNrP52Ox9j2zC61cVtr4TtHykzmA
         CAvg==
X-Gm-Message-State: AO0yUKVljCHpRyRzTHWh+o7dR7hHOgGgpoVDRHwx6FEWwlb5irpKNWy3
	Z/SCee+GdxETgSsA/58IVl4=
X-Google-Smtp-Source: AK7set/Q3Vr4JzSplTmjuQ/xbzBkpAmKAmEVXbj4GktdLASUu6uqDjE9uVWntvD/iu2IJncPWvOsfQ==
X-Received: by 2002:a5d:4e85:0:b0:2c7:1aaa:2b49 with SMTP id e5-20020a5d4e85000000b002c71aaa2b49mr20838137wru.23.1678546652156;
        Sat, 11 Mar 2023 06:57:32 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id j28-20020a5d6e5c000000b002c551f7d452sm2520623wrz.98.2023.03.11.06.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:57:31 -0800 (PST)
Message-ID: <59077252-02e4-dd43-77b5-2d2cfd114762@gmail.com>
Date: Sat, 11 Mar 2023 16:57:29 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
 vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
 <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
 <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١١‏/٣‏/٢٠٢٣ ١٦:٢٣, Dan Carpenter wrote:
> On Sat, Mar 11, 2023 at 04:06:51PM +0200, Menna Mahmoud wrote:
>> according to Alex feedback
>>
>> " I think this type of alignment is not a major problem,
>> and alignment isn't done this way in general in this
>> driver, it's probably OK to keep it that way. - Alex "
>>
>>
>> ,I won't resubmit these patches, right?
> Yeah.  Find something else to fix.
>
> I feel like in outreachy and similar that people send a first patch and
> then they get a bunch of different feedback.  And it's like checkpatch
> is complaining and it's staging code so probably the code is actually
> ugly in a way.  But often it's better to abandon the project instead of
> getting obsessed with it.  Zoom out a bit.  Find something else where
> it's obvious how to improve the code from a readability perspective.
>
> People are giving you feedback to help you and not because they are
> about that particular line of code.  They won't care if you work on
> something else instead.
>
> regards,
> dan carpenter


Got it, thanks Dan.


>

Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EE1DA9A;
	Fri, 10 Mar 2023 19:29:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id j3so4154580wms.2;
        Fri, 10 Mar 2023 11:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678476596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PScVdSvo964dji84f+E3c8q8Z3D10XU3FUFbEIQL5M=;
        b=I1tFubY34VdYvbiaMV6bMVJtb+FgxjqTDUFjZcWqCVsSj6b7usEequMVu12dLvOGi3
         842MaXs0TRyMTB03cbqbQqYHypR7Pt8S9dsCRZUrPNlql7C2J/PmeaOdMcHAt/QjFdOn
         xUX62FvPezXjz1KRUFDHBmeHDN7JUwgkUrtdeiDuOww/imSHUDouML+u/39dwvLRjUaQ
         eM589F4AuS/j6Ayycg0cF5umIoKDtKw4oh7CSGug0rCp7Zx+TKhl9kuMXrs2ZjGSpjaJ
         h4ueWtA4SPeDsmpZWl7x6kHldrCC3pLKFRpOmcqTtiPIWQMzLvdw0tdjJUGjNFbO3L21
         Ohew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678476596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PScVdSvo964dji84f+E3c8q8Z3D10XU3FUFbEIQL5M=;
        b=oNi+wpisO+itEIdW7wG1KVr1OzIVSytHVyhyYS7lsM2FTcWGuAHyUAeRrs+XEG41yR
         kmJr/ZJVnFB32cJpw0GyoqGohR5zuZOIRrQ7FzQz+KfyXjRVRueIuH2w8oeSs+/SM5lp
         pOQHf8HZcRhJhuornQnBOQhoSbquNdw9WE4jLtPk3085t6ntxMzVjU0iWvXLkiw/WJNq
         l7fIgJVQdi4qD8c65nCARcSvhPWujU9pgdhAE8pb5YJyFSa697xiJrkbooG7iemP5/pW
         fyK0AZI4JAi1nF7dAZ4YGSzsU+P+Ql5G73dg60D+PlLVr4zagCmfvRvAEbrALRNCZk/P
         Khzg==
X-Gm-Message-State: AO0yUKXj9fQZxXq+ZsXnaO8gRr8tyT0qMtmR18Hf671k9vO0P8zWk4KK
	RKqtNy51A5Hco+P0EbLPTiQ=
X-Google-Smtp-Source: AK7set9lLW35D4gGhOdmpXTFKA7pzUwguhXMnfH7b43QBIQVJlKKSGJNmPbghHrpx/fEUfucx5G4Zw==
X-Received: by 2002:a05:600c:1c1f:b0:3eb:2b88:8682 with SMTP id j31-20020a05600c1c1f00b003eb2b888682mr3988918wms.17.1678476596185;
        Fri, 10 Mar 2023 11:29:56 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c198a00b003dc4480df80sm820581wmq.34.2023.03.10.11.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 11:29:55 -0800 (PST)
Message-ID: <9cb2b3c4-f047-3028-885b-6554c7600e3d@gmail.com>
Date: Fri, 10 Mar 2023 21:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
To: Alex Elder <elder@ieee.org>, outreachy@lists.linux.dev
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <6ed4616d-03e7-f055-cd25-934e69d253df@ieee.org>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <6ed4616d-03e7-f055-cd25-934e69d253df@ieee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١٠‏/٣‏/٢٠٢٣ ١٨:١٦, Alex Elder wrote:
> On 3/10/23 9:51 AM, Menna Mahmoud wrote:
>> Fix " CHECK: Alignment should match open parenthesis "
>> Reported by checkpath
>>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>
> Is this (and your second patch) the only place(s) where
> this issue gets reported?

> yes, after fixed them i got 0 check.

> I think this type of alignment is not a major problem,
> and alignment isn't done this way in general in this
> driver, it's probably OK to keep it that way.

Okay, thanks.

  -Menna

>
>                     -Alex
>
>> ---
>>   drivers/staging/greybus/fw-core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/fw-core.c 
>> b/drivers/staging/greybus/fw-core.c
>> index 57bebf24636b..f562cb12d5ad 100644
>> --- a/drivers/staging/greybus/fw-core.c
>> +++ b/drivers/staging/greybus/fw-core.c
>> @@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>>               }
>>                 connection = gb_connection_create(bundle, cport_id,
>> -                        gb_fw_mgmt_request_handler);
>> +                              gb_fw_mgmt_request_handler);
>>               if (IS_ERR(connection)) {
>>                   ret = PTR_ERR(connection);
>>                   dev_err(&bundle->dev,
>

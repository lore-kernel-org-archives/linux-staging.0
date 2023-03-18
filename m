Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9EDA4D;
	Sat, 18 Mar 2023 08:51:04 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id u5so7626667plq.7;
        Sat, 18 Mar 2023 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679129464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bovk15UMlVAcSGthg5cURoe0MyXmWN6RteeHHI98a0g=;
        b=NZyo/rLE1N+4/FGAgnjQyf6xm8QYgK+ThSJcyP1JopEM+phGvM3QgFkuukBP9z/k8/
         zVg6ZF+JC5nc3theQSIgJFuJx+Ys4WirYs8vlKPQvHUyw3EeYM/mOEPTgfDcq8NTaksY
         5ddA/bk3DkOGSLA+oHbDY5al0darJYTrzUOn4k6FbIWGwNdc/N6+ojP53OqQDqs1nsaK
         wFOUjd2ebqrxfqXswGmh/gIP+F3DTMvbUk3oudOBEtSvWJOYiPV8lH06iCqj3Ws9yPJQ
         53/88VCD1evt50DUiZeBmZYY7yEvWc6lpek3ahL8CU2nWgBc8BBlSk0HbnyoB2TahxtR
         LZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679129464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bovk15UMlVAcSGthg5cURoe0MyXmWN6RteeHHI98a0g=;
        b=JmgRbNsfG1LhoaGKMEovuzTLAoL2PU+oIR93CaNmwc2+UFNvC63rylwWcfsrCIishZ
         78d8J/tB8qfSp4p5T03NJhaxZIoVfRVP2jrVqyBkDggXeRBbZ/NhgELzrrRlbX6TDMAK
         kFSOXfNaw10tN9xcQoMkwot5JTzZYD1ATefK8S8GfuFxB9Bo/5V8PPGAkDmLmMojOAaT
         xAMhMfJIpwjyZrcSbdnE1pEKABCNcT5lu4LuiqKsM48UKgYEkFCwHSt5u0zNsiQZyudf
         dcAEGkDPmYtylH5vcR9uKxiYjityCC1mhw1Mg5p29gwmh0Cd5gbkD1PpmKUoELldijNl
         LVSw==
X-Gm-Message-State: AO0yUKVe8vjZuBLyPB1HCuCWv+k2eiDW7skZoO+Kid8JV5/gVSEyo8+t
	K3LSLBzRjF3bdKpW6HlHuVw=
X-Google-Smtp-Source: AK7set9aZI4dMxgz6zsPDQe+IXpHSm0HhwbdMcTyjBAzqeWeW3T/xhkqCcw7IgVkhmuMXCAQKqSrKQ==
X-Received: by 2002:a17:90b:3908:b0:237:9cc7:28a6 with SMTP id ob8-20020a17090b390800b002379cc728a6mr11502934pjb.26.1679129463718;
        Sat, 18 Mar 2023 01:51:03 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-29.three.co.id. [180.214.232.29])
        by smtp.gmail.com with ESMTPSA id ay16-20020a17090b031000b0023c8a23005asm2345368pjb.49.2023.03.18.01.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 01:51:03 -0700 (PDT)
Message-ID: <adb3e640-752a-0b93-f91b-d9198b270fe4@gmail.com>
Date: Sat, 18 Mar 2023 15:50:57 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
To: Ira Weiny <ira.weiny@intel.com>, Kloudifold <cloudifold.3125@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZBHlycBoZ0JRwHZm@CloudiRingWorld> <ZBKDddHeKlWohA0T@debian.me>
 <641548b142559_28ae5229425@iweiny-mobl.notmuch>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <641548b142559_28ae5229425@iweiny-mobl.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/18/23 12:14, Ira Weiny wrote:
> Bagas Sanjaya wrote:
>> On Wed, Mar 15, 2023 at 11:35:37PM +0800, Kloudifold wrote:
>>> Subject: [PATCH v2] staging: sm750: Rename functions from CamelCase to snake case
>>
>> If I only see the subject above, which functions are renamed? I have
>> to see the actual diff if the patch description doesn't answer that.
>> In this case, I think the proper subject would be `[PATCH v3] staging:
>> sm750: Rename sm750_hw_cursor_* functions to snake_case`.
> 
> No.  The oneliner is a brief overview.
> 
> It is perfectly appropriate to have to look at the diff to see what was
> done.  The commit message is to state what the problem was and how it was
> fixed.
> 

OK but I prefer to be more explicit in the subject and the description
so that I don't have to guess :)

-- 
An old man doll... just what I always wanted! - Clara


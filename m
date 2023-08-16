Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B1BC8D3
	for <linux-staging@lists.linux.dev>; Wed, 16 Aug 2023 08:58:55 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4ff72830927so4906024e87.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Aug 2023 01:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692176333; x=1692781133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTJkrXWbhfgYd8DHDtHDl47GwVqiYFhKhamj/qCPvn4=;
        b=a6YXgb6myyUCewac4NuR//I1Nu5M0mSXpsPQXW3vk2CiRdpIZEFF8EBhwbJzwpPrFs
         U1icSO97/91wcLjQe6zhUyJWqhaeIQ6Vd1hcKq412ZadkZOcMSQOnDpYv7XS7UuHOTje
         YjP0RoTOtpevYStL6ibD2390J5j7PBxOk04HN5SkLpnjmWIMNex/GqPbJ+uhOwwFzi21
         v5lDK9tEJTxVcR3w1xal8+TCCus2gV700t2Gm63PDRugjZK7cl/BjCJNMsvtq2rb8oS/
         B9fTAZTOIyZpkYh+oYcp/g2tti6v1HP9vDdQpc26JI3aPmuQp9KFln4g0pLX0FDyv4Yo
         eJ6Q==
X-Gm-Message-State: AOJu0YyL0lPvFNks485Ncpk/EbDZJd+uwwD2xyocDjHjUVcRloceWa4z
	wlbN/hdO74k/sJeZOHfN+Jc=
X-Google-Smtp-Source: AGHT+IHd2vfqi2Alc5nJPaoOZNy/cYIYAP1J0s3YddftE1EP8JVnXPTjpfbmz5Y7DL6Eg+tNanhnhg==
X-Received: by 2002:a05:6512:554:b0:4fe:7e7f:1333 with SMTP id h20-20020a056512055400b004fe7e7f1333mr1072406lfl.6.1692176333013;
        Wed, 16 Aug 2023 01:58:53 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id b3-20020aa7df83000000b005233609e39dsm7998716edy.30.2023.08.16.01.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 01:58:52 -0700 (PDT)
Message-ID: <00de3273-9433-138d-b659-826457e6a008@kernel.org>
Date: Wed, 16 Aug 2023 10:58:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 34/36] tty: gdm724x: convert counts to size_t
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 Nathan Chancellor <nathan@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <20230810091510.13006-1-jirislaby@kernel.org>
 <20230810091510.13006-35-jirislaby@kernel.org>
 <20230815172247.GA1690054@dev-arch.thelio-3990X>
 <937e14c1-d884-0b6e-595a-e8aaa3d09025@kernel.org>
 <bdbdfdaad3a842d2837ac9d15ef2ab25@AcuMS.aculab.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <bdbdfdaad3a842d2837ac9d15ef2ab25@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16. 08. 23, 10:40, David Laight wrote:
> From: Jiri Slaby
>> Sent: Wednesday, August 16, 2023 7:47 AM
>>
>> On 15. 08. 23, 19:22, Nathan Chancellor wrote:
>>> On Thu, Aug 10, 2023 at 11:15:08AM +0200, Jiri Slaby (SUSE) wrote:
>>>> Unify the type of tty_operations::write() counters with the 'count'
>>>> parameter. I.e. use size_t for them.
>>>>
>>>> This includes changing constants to UL to keep min() and avoid min_t().
>>>
>>> This patch appears to cause a warning/error on 32-bit architectures now
>>> due to this part of the change, as size_t is 'unsigned int' there:
>>
>> Right, this is my brain fart thinking ulong is the same as size_t
>> everywhere. No, size_t is uint on 32bit.
>>
>> I will fix this -- kernel build bot seems to be slow -- it didn't find
>> the issue out in my queue, nor in tty-testing.
> 
> 'Vote up' my patches to minmax.h that make this all work.
> Then it won't care provided both values have the same signedness.
> (or, with patch 5, are non-negative 31bit compile time constants.)

Oh yeah, that [1] looks great. Why should one care in min(4096, 
sizeof()) after all…

So what's the current status of those?

[1] 
https://lore.kernel.org/all/b4ce9dad748e489f9314a2dc95615033@AcuMS.aculab.com/

thanks,
-- 
js
suse labs


Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96DD7C;
	Mon, 20 Mar 2023 18:27:40 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id o12so50441329edb.9;
        Mon, 20 Mar 2023 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679336859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GL/gMKYjQsk9fh4rVL/eijfW2qYZr4TjJI+SyTkgTQ=;
        b=kkmRSq3gBgb5sUjkL1a9g8K75iOgtwzUfCYpQ3HwSEabl+x0Mv+tmBALDtc3qDJhob
         RpyzbiHrpNalaNp5228hmPqGZEHnSpJRG+02EijRhQ2Y82yl9YKs2FoWghB/Sm004FAb
         +OBlUqhNxyBc7c4cdT4cSzMb17EevBEYa7Tc2jYqsF1NKW/P9JkOjgbzR21NLu6ZiCni
         I3c+VGAC7N2SWXaePmAC5lQqE6/MqOF4Tc0OHDyzdCeicUpC8Tj1yHQghSARLYNJWZAg
         RF+7B6oGrdE4M/PQerXCl8TYnoCWTuMsaJCCUOYYm7qmZJvWrVTBaxnKgVPX7lTvHH9E
         ifQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679336859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9GL/gMKYjQsk9fh4rVL/eijfW2qYZr4TjJI+SyTkgTQ=;
        b=j6Vht23z3TNMlqmOqHJGrGL4lePmG9sgFkdj3iLrcXH40yf4BSYDGzaUmdMjzi2wN4
         2CeP5PL5ihLY+nKemCU1AxR83LJhuJiwjx6Brs99iKYRTyeqtq2U1A2BGP5HP+CSOh7f
         dZMxGlSqZEv3Cs9VsalBqTplPQ/qo+88Mq5rxYbmb0eDXoRvIY7TnRdtnxyAeGwEFwNg
         kfoJnWj4w8ZHV7rKRnzBlAozsN25oPNHKgyt6phEIPjKhDoVEj1uVhTszM7M6sOzayRH
         zZ05RsjETJ8Vh+auaHE+OjBKtJ7BOx+Wih8Y6YIcuwXEcG6/Tw/kSKRGvpYaxMVPVPAH
         Jx/A==
X-Gm-Message-State: AO0yUKXYcO4wZUN06l/ybCE0I1PwWOwJ1rGdUzBdgEuWy7SaEZPC9L6L
	0WzFrK/dL9jBRTsjWW5DNyM=
X-Google-Smtp-Source: AK7set98Opt3EVAa4aOpB9ZtlHknIMZG0/gsytg7ShGrmg5/8kmpBsWS1GpzH5IZ4F7pmuh4iGcGiw==
X-Received: by 2002:a17:906:2807:b0:8e1:12b6:a8fc with SMTP id r7-20020a170906280700b008e112b6a8fcmr56113ejc.4.1679336859045;
        Mon, 20 Mar 2023 11:27:39 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id u27-20020a50951b000000b004bf999f8e57sm5254282eda.19.2023.03.20.11.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:27:38 -0700 (PDT)
Message-ID: <2d991001-0d31-988b-fbfd-c6c2452adcc0@gmail.com>
Date: Mon, 20 Mar 2023 20:27:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] staging: greybus: use inline function for macros
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Julia Lawall <julia.lawall@inria.fr>
References: <20230320103258.6461-1-eng.mennamahmoud.mm@gmail.com>
 <ZBh+3W4eTL9IMW3n@kroah.com>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <ZBh+3W4eTL9IMW3n@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٢٠‏/٣‏/٢٠٢٣ ١٧:٤٢, Greg KH wrote:
> On Mon, Mar 20, 2023 at 12:32:58PM +0200, Menna Mahmoud wrote:
>> Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
>> static inline function.
>>
>> it is not great to have macro that use `container_of` macro,
>> because from looking at the definition one cannot tell what type
>> it applies to.
>>
>> One can get the same benefit from an efficiency point of view
>> by making an inline function.
>>
>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
>> change in v2:
>> 	remove newlines added in previous patch.
>>
>> change in v3:
>> 	fix the patch to be against Greg's tree.
> I am lost in a twisty maze of patches from you for the greybus code that
> all seem alike but are different :(

I am sorry for that.

> Can you send a patch series of the latest changes you have made, as I
> really don't know what is, and is not, the latest versions at all, so
> I'm going to have to drop them all from my review queue right now.


Sure, I will.

>
> thanks,
>
> greg k-h


Thanks,

Menna


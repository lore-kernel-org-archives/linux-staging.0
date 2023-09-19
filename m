Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE788836
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 19:31:57 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c4194f7635so1317115ad.0
        for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695151917; x=1695756717; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjsN1SvSzM74FCs+epYa3vF7No0rymKrcXSLojQ1y0s=;
        b=PT/fiJTr4BDOWbolMWqOQuazU10N69Lcm7uTV+sXH72mxy6cRJ+nPPgJCnW8xWuoc7
         Qyq6vzeZjhPhzXT2ONMeiUunTgITXPOFD/JwPC4s/f15VIZc6ewP8NoYDwrQkw7VzKR/
         Hbmya6+pNUR98RRjpOHew15CBvw4l0VFR/4gwGX/IkZnmmfzL+vHylla+MhW1AUrd0oi
         771fVC7Pk10r7tY95EQ8h7rWQJ81OVJc41N/iCGNnfl+mSuHtMXRpR2bhXMD+oaIXH0C
         8vnIlPpPCCSWERjmDvs28rOIz1KeU50yBry1N9K9FFIBdiLDkaq0rLScFBR0CopRhzO0
         1ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695151917; x=1695756717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjsN1SvSzM74FCs+epYa3vF7No0rymKrcXSLojQ1y0s=;
        b=us6yIXvfXhFctemw+42nfDNapb/WZ9J5Kb3hbK4tjvvep7zWhl7JEKpMuqinWLQ2ep
         blW+Mr/AWPPQYvxQ7s9AR0BusUdapu3UgNhrALZcEMcb3u6xHyaSyDXIMX3pN/TVDQ//
         fUDGu1crt5i5hcT4GcHF/oSJOUibXdKJ3fxPAYV1ZsON9D5zePJjwKbJXtgnXk1TZ47U
         6VJ6xHtRBfPJ0fJItX+9SqoYJQpizppFF8Nv86IAnoJs19wNHrMa1nbwmx0qqNfADM8U
         dZ6JbfR1a6j+9HkSIIKSAy5AvMY56PrFptfykQGsBafLp9c0RejBVt9k4oJiMLKbuZmU
         M1+Q==
X-Gm-Message-State: AOJu0YxJ6N4r5RwvfFduNpGhG/p6OTeHeuGYfBNI3+Y4xfkg04drqo4t
	1ktIGQCpPavxLj9mkgxckks=
X-Google-Smtp-Source: AGHT+IEHDDuWl6hsVpOsfQ9/JE/vnkvU73VZnh0N/Tcc3CorV3mRj3eL1GifHFVn+prkrVS/GHpHZg==
X-Received: by 2002:a17:903:2283:b0:1b6:a37a:65b7 with SMTP id b3-20020a170903228300b001b6a37a65b7mr4769859plh.23.1695151917051;
        Tue, 19 Sep 2023 12:31:57 -0700 (PDT)
Received: from [192.168.31.134] ([117.243.68.251])
        by smtp.gmail.com with ESMTPSA id ji22-20020a170903325600b001c1f0b3e900sm6909509plb.229.2023.09.19.12.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 12:31:56 -0700 (PDT)
Message-ID: <1fadd651-2e2d-8fd7-3f39-8d3b31921951@gmail.com>
Date: Wed, 20 Sep 2023 01:01:51 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] staging: rtl8723bs: hal: Fix codespell-reported spelling
 mistakes
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230917134940.2746-1-bragathemanick0908@gmail.com>
 <CAHZF+VZVBkRP6D4xJEhoqKmr9MbjNFJ8A0NZXSwDEMFJhqBc-w@mail.gmail.com>
 <2023091949-drove-goatskin-3627@gregkh>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <2023091949-drove-goatskin-3627@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20/09/23 00:35, Greg KH wrote:
> On Tue, Sep 19, 2023 at 09:31:48PM +0530, Bragatheswaran Manickavel wrote:
>> Gentle reminder !
> of what?
>
Sent this remainder for considering my patch.
>> On Sun, 17 Sept 2023 at 19:19, Bragatheswaran Manickavel <
>> bragathemanick0908@gmail.com> wrote:
> You sent this 2 days ago, for a spelling fix?  Please relax, there is
> obviously no rush.
>
> greg k-h
>
Actually, this was my first patch mail. Just want to make sure, the way 
I sent the patch and other things are fine. Anyway thanks for your response

Thanks,
Bragathe


Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B32C9D
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 11:29:39 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id k2so11311510lji.4
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 03:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lXCjgDqxO2g5OSHyeldrqqbpR4oerLqwrkcB+ct4YlI=;
        b=aDslnebTX9uAhOxIQg1fT+KgOaPiyH9l62P5GNXf3JNN+QI0/pjDsMD19gZ7ymbdLw
         CwF3HnGAOxcBfg/7KWoc3Rs/9Wwrk7fqDAHSCDlgO/ci3oC79mJA2j54f04K/jZgnN1y
         xEARMQCbHDeq6GTCLaJ12brHf/Cm8Iw7SeOa+nk/IV34OltrRzu7wrirLh/4Y7szu3H6
         V5I96yjn8+RKIeZTx3Yk+ZJtWOmevgehSYc8ibXOeB9OqUAhGrfV5Q/XposwpTZDd0qv
         TAHwuSNGDo1BHz7ZzB63UcK/G5nIkNb1TEc1OsbGx0ZGY07E/XWzhIYkLMffcRoDNGyv
         1V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lXCjgDqxO2g5OSHyeldrqqbpR4oerLqwrkcB+ct4YlI=;
        b=xLlzK27dC7Nl2aw6O1DInQ4sg90PCNIkHcCAd4LB/ADXV6cpe0sh1LV+BAJlhfbIkC
         hEVHnXZvtpq7gevjtln/S9g7qTn33R59c6P68Zr30HsiK/lLHkmvxEOALmqsTJR/my0H
         D0MEAms7MAQTw3uRp1ibIjTJnrNYmRZ4TDNAWj5/59OiRoDrVhk1rRVKCWvyh2MWQGTD
         H8fuv6gV6eSe4ba6xYVej/CyZrymRtKwHDpddcccuaUzJID7H3gyI1H4B5D0RN+lpWtx
         4gyU1vnvQnsYJtgqOoF72Y1pz1UfJsIkAYQar68gl6zXW51NLLpB7nJI+fhLLoz+JZAV
         /gWw==
X-Gm-Message-State: AOAM532Ig38JDFxXBmrU7Nefi0E5LB8Pxez+GTzw/UbrsClpkrEerv/G
	bSwkF+THyFxVQAH3aft8u3I=
X-Google-Smtp-Source: ABdhPJyuJP+Olz1wrmPJMDGdDS3oe4Shxt5hPDFK9dKRl612inDiorE9nTFYUneeEDb/u0brjxzNkA==
X-Received: by 2002:a2e:700d:: with SMTP id l13mr24198891ljc.219.1638617377723;
        Sat, 04 Dec 2021 03:29:37 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id b6sm762407ljr.103.2021.12.04.03.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 03:29:37 -0800 (PST)
Message-ID: <e64fe951-8e57-4c28-5451-71872247c57a@gmail.com>
Date: Sat, 4 Dec 2021 14:29:32 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] staging: vt6655: remove unused variable byMinChannel
Content-Language: en-US
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Karolina Drobnik <karolinadrobnik@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 =?UTF-8?B?QWxkYXMgVGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
 Lucas Henneman <lucas.henneman@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211204103053.3934783-1-alb3rt0.m3rciai@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211204103053.3934783-1-alb3rt0.m3rciai@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/21 13:30, Alberto Merciai wrote:
> Remove set but not used variable byMinChannel.
> 
> ---

Signed-off-by: is missing :)



With regards,
Pavel Skripkin

Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D77F
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 17:29:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t1so7319424wmi.4
        for <linux-staging@lists.linux.dev>; Mon, 07 Nov 2022 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xkR0EU5MF5krvYFbRD8gmAbuCphspKLMpA2k8o/icr4=;
        b=jSV89Nd7BOcmUAVxEDddbuNTIYUCBXZutjnld8k4uAuTk1pp9sn+3pw3Joc1NASBoj
         4nVR3LJtXBrpaPW+Cs/OU3xoHH8Qj3HfJ+VRHRBInFLo5QAj2kiOtKR/VXoJTvqYsMd+
         99yUhXBdVs6C5VpVwJLzl2NUdmE5pWId+MP6y0qxgEOPgH3dmLt/40OUyBxPU3JZ/atz
         Sd+2aE/nprLxPxFw1H4Qy0mycrAKfFYpaXbpdFdSzUJXm9KnFcOQosDiMHDpoZ54NdRe
         FbQ5eRq0hhQfqljmkvR4icco1gzyvCgz4mSug1vcSwW4uYOlBI+qhNS1Wo68EB6Kac/d
         1o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkR0EU5MF5krvYFbRD8gmAbuCphspKLMpA2k8o/icr4=;
        b=pDpaEzmlH4JnWUBV7X0+gnynYbGCvwt25dp3N/kImibBFzz7BnBxDwgOmcXTVV9gGt
         2sx8r8ROdPxRUBF0YYrwZG4/SC9XuQkObYeuAu+keDkiK07uSRPGS+rP89A4toQ82Oo5
         2RpSe1JI75yhp4zSOtxONhE8JSph6kBASTxo++No/WQ3k2RI8IqLkO1F4TmXBETAuQAC
         BuSQpNSjvrd4WiHVqaYPxjv+pegv7Tu+KZOaKzMcscQgy4UdVZNeuT4FgchU/qA+5m2E
         1zi30cj1U9FHgqtPbJipmoPw1/WSVyfhR979c/J0dVoegMwk5uTb/gjZIq42cR6VnN5a
         du/Q==
X-Gm-Message-State: ACrzQf0O/oaDo4DzGEg3PG3ioZAIZgfToIGa9SKbZlx+v93E5KQMz8/O
	SWF6atLlLKccpUbK95rZfP3dbQ==
X-Google-Smtp-Source: AMsMyM59E4kUPCWhlqtaCDaCwUhPCvbjXQd61lqCiTFlXO9OHbwPcQvIUzUroZ3V1idre5W77pTe4Q==
X-Received: by 2002:a05:600c:31a2:b0:3cf:8a86:cf1c with SMTP id s34-20020a05600c31a200b003cf8a86cf1cmr17606048wmp.113.1667842172024;
        Mon, 07 Nov 2022 09:29:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:64c8:555c:905:adc6? ([2a01:e0a:982:cbb0:64c8:555c:905:adc6])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6604000000b002366fb99cdasm7715664wru.50.2022.11.07.09.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:29:31 -0800 (PST)
Message-ID: <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
Date: Mon, 7 Nov 2022 18:29:30 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: patches for staging:media drivers
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <Y2eSCZJNWn6DzCUu@qemulion>
Organization: Linaro Developer Services
In-Reply-To: <Y2eSCZJNWn6DzCUu@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/11/2022 11:52, Deepak R Varma wrote:
> Greetings to all.
> My name is Deepak R Varma and I was part of the recent Outreachy internship
> round. I learned during this program that patches for the media drivers were
> prohibited to be included in the Outreachy effort due to lack of bandwidth for
> the maintainers to respond on those.
> 
> The Outreachy round is now over but I am continuing to work on code improvement
> and changes. I would like to know if it is okay for me to now identify
> opportunities in the media drivers and send patch proposal for your kind
> consideration. I intend to send couple of Coccinelle identified code
> improvements as patches.
> 
> Please let me know.

I won't say no but since the media maintainers will need to apply them,
the problem is the same.

Neil

> 
> Thank you,
> ./drv
> 
> 


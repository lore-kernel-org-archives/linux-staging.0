Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E502E63C3
	for <linux-staging@lists.linux.dev>; Thu,  7 Sep 2023 12:49:13 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe4f3b5f25so2647465e9.0
        for <linux-staging@lists.linux.dev>; Thu, 07 Sep 2023 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694090952; x=1694695752; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hn2uDmjOOXu6fIxxN8+ualmECQ/DiaKNpRYaCI67NFc=;
        b=X4HErM12LKOYKPfIw0t2DZ9rYMZzo0+KR17OiITYSUw0mnftZIeLmhS8BQ7E8hC2Tw
         xzhdNl5ATTTFXh742gfpMWrcdRwQXc5eGm9QrpeR9jSM3aMqAAy0TAujz+zfAmaMJyet
         XLsHnPLzAY4zPYCjCU2Md5l1Zsl0rU4mfaRCDOQHL0JeuwyNQxr+3ADPNoU0LNfi6Yxr
         ePZv3FsNgIzAu9EWm4gAOTuCjL+e24b2YUFJXr1ZKZQBxkop5sltx0VeK8Y0Kk7h1M4v
         Pd2UxiyKK7V6KcOVNsM8UXG4VD13ZrY5vHycouGFnndwzxgSO2EJEbpGr2URLb8JEEcq
         6eSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694090952; x=1694695752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hn2uDmjOOXu6fIxxN8+ualmECQ/DiaKNpRYaCI67NFc=;
        b=k9v9WqYayaj0/uJ0m/oMYp40XyyfZpxrECfxaxITcGp9wKLfm5LCNiIB6SB8WUwSR5
         +YaEuZB8CLSMIWeJrwOBA91of4kj2RKhOtBHRZ1RQNusXEDXSRn5ifHE/wecLyHk9BeP
         6SfdzKUB84o+/E/V8Lz7vIvi10pDbhnP24U38wkk21WnQgkc9RS3cg/xyEfYQZ44YxTc
         Ils0mpfuUZfpRSa7ys5ZGJ1BsrqR6lbIsmmA0f+OZMYuurDMdvybUWkkojTcvmoJgv+Q
         hTFpIBB0kCrTABqv7PE3wacmFusgt7DMIgQqMH5FSNJqHkoBZaUJCy6ttnrbukGdt+SB
         A2KA==
X-Gm-Message-State: AOJu0Yz8PEhD1lWkL3B20B7Z+S+VEPDbxHZzTsxJv/N/cewKwfzxc/DJ
	xN/uKiN7zsjA2AfTO3l8zvE=
X-Google-Smtp-Source: AGHT+IFnHGLb3wX8hiYQ6tqvPReQabYj+GoY6alyacmcc5c8OcdRZufgIb42eLrUhf90NY6IY9RlHg==
X-Received: by 2002:a05:600c:1c8f:b0:3fe:21a6:a18 with SMTP id k15-20020a05600c1c8f00b003fe21a60a18mr15226116wms.3.1694090951606;
        Thu, 07 Sep 2023 05:49:11 -0700 (PDT)
Received: from [192.168.0.102] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id u3-20020a05600c210300b003fe601a7d46sm2406390wml.45.2023.09.07.05.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 05:49:11 -0700 (PDT)
Message-ID: <f872ed00-f474-b217-ed78-8612242d448b@gmail.com>
Date: Thu, 7 Sep 2023 14:49:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] staging: vt6655: array names updated as per kernel
 coding guidelines
Content-Language: en-US
To: Pavan Bobba <opensource206@gmail.com>,
 Forest Bond <forest@alittletooquiet.net>,
 Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZPnA0Pra2HK30nBu@ubuntu.myguest.virtualbox.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZPnA0Pra2HK30nBu@ubuntu.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/23 14:23, Pavan Bobba wrote:
> Below array names updated as per coding guidelines:
> 
>     1.byVT3253B0_AGC4_RFMD2959
>     2.byVT3253B0_AIROHA2230
>     3.byVT3253B0_UW2451
>     4.byVT3253B0_AGC
> 
>     Conversions performed:
>     a.type encoding info dropped from names
>     b.names replaced by snakecase
> 
>     Issue found by checkpatch
> 
> Signed-off-by: Pavan Bobba<opensource206@gmail.com>
> ---
>    v1 -> v2: 1.subject name modified to more meaningful detail
>              2.name of the tool added in body of explanation,
> 	      which found this issue

Hi Pavan,

you did not fullfil what Greg wrote:

- You did not write a descriptive Subject: for the patch, allowing Greg,
   and everyone else, to know what this patch is all about.  Please read
   the section entitled "The canonical patch format" in the kernel file,
   Documentation/process/submitting-patches.rst for what a proper
   Subject: line should look like.

The issue is that hundreds of patches could have this title: "array 
names updated as per kernel coding guidelines" Make it more unique.

Rename CamelCase variable starting with byVT3253B0_

Always consider that Greg reads a lot of patches per day.

Bye Philipp

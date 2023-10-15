Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C327A79F4;
	Sun, 15 Oct 2023 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlVyVLJX"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53e9aeacb66so177055a12.0;
        Sun, 15 Oct 2023 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697386246; x=1697991046; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFlAKwPdiVPZC4+5an3YYYk82elgh71XEl/RX5OSmnQ=;
        b=NlVyVLJXGPz4t6sAgvCWDHON5p/ifpiW/I3uhmpiXFj+pmt+BmwFfbz+IgdBA+zmgT
         Dg9wk6ySJL6jHZ2fj2eImSTOXCHvZXoMqJEgWvBSca6BJHSJ4gfO4YfKVy5e5QY1h4fF
         piRpbF8g7bNYmELGuXX8pcZc4gB8nXLkDonUUw8itewCg1J0eyGslaWylII1IDU2dhDJ
         V1VitGRMURBby72xRNLxLg4klGSM24i+p0AdTwF0PE2HKyJfnp/5q7UfkKVvgFO7A+u0
         inDf/uHH9NlP4Z8tSRSKoo8yNNXXcXVBwZkAkBUBPLWagisPgnEjCvGM8kF1C3pGZs0/
         SPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697386246; x=1697991046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFlAKwPdiVPZC4+5an3YYYk82elgh71XEl/RX5OSmnQ=;
        b=GEcM0Z/v4/mFLOjac1wRn2WHkVDb0dNd3tVS9nQ8UBqZ2O2GlmJhR5A0/V79K45O1B
         yUe1yQwHkjY5p1UdR2hxl6+F6XyDHyFnXmSbQkQkWDHYt549a+om5gt9nbPPA2brdzVK
         Ozsf/IRL6PX4VjHl59tLrhqwgCVSNs40baA7IqE+ul1GcPXSSoaRIuCg8NncNN6OnW1+
         altIjWmARF01E2BnXOai75G2NRf9CIOLeA42+0AgI9qaRQZk6lJZ3jW5FWYCbY+1Ne30
         asm9SUX/cPzKQSobhnlaohZXgezpg5OBw+ngTJ71kePrGWtwn9XxmAmhq1UTkzWJ1nHn
         Loig==
X-Gm-Message-State: AOJu0YxjIcTSEzEEmMRjWG87W1t7IcPS2bZ+2v+llcvhcIn+aEj7C5TW
	qlOblsyEvXZuyxMXeV1cDg4=
X-Google-Smtp-Source: AGHT+IFHDujuMay6WLdWcRvNEQ8/IZ3uIbParwsg2fx/ggiSx2fG0J7+iHNFvq53BrzaBmGYgrMdbQ==
X-Received: by 2002:a17:907:7249:b0:9c4:409:6d42 with SMTP id ds9-20020a170907724900b009c404096d42mr522714ejc.3.1697386245758;
        Sun, 15 Oct 2023 09:10:45 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id my46-20020a1709065a6e00b009ad8796a6aesm2431624ejc.56.2023.10.15.09.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 09:10:45 -0700 (PDT)
Message-ID: <b5ac8e9f-f733-46bf-bff0-79556f0bd280@gmail.com>
Date: Sun, 15 Oct 2023 18:10:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] staging: rtl8192u: Mute checkpatch error
To: Julia Lawall <julia.lawall@inria.fr>,
 Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
 <bfe99c7a-f01f-4ae3-a17d-1e5887a5121f@inria.fr>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <bfe99c7a-f01f-4ae3-a17d-1e5887a5121f@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/23 17:52, Julia Lawall wrote:
> "Mute checkpatch error" is not very informative.
> 
> julia
> 
> On Sun, 15 Oct 2023, Gilbert Adikankwu wrote:
> 
>> Align descendant arguments to the open parenthesis as per the "Linux
>> Kernel coding style" in Documentation/process/coding-style.rst
>>
>> Mute the following checkpatch error:
>>
>> CHECK: Alignment should match open parenthesis
>>
>> Gilbert Adikankwu (6):
>>    staging: rtl8192u: Align descendant arguments
>>    staging: rtl8192u: Align descendant arguments
>>    staging: rtl8192u: Align descendant arguments
>>    staging: rtl8192u: Align descendant arguments
>>    staging: rtl8192u: Align descendant arguments
>>    staging: rtl8192u: Align descendant arguments
>>
>>   drivers/staging/rtl8192u/r8180_93cx6.c     |  4 ++--
>>   drivers/staging/rtl8192u/r8190_rtl8256.c   | 16 +++++++--------
>>   drivers/staging/rtl8192u/r8192U_core.c     | 20 +++++++++---------
>>   drivers/staging/rtl8192u/r8192U_dm.c       | 24 +++++++++++-----------
>>   drivers/staging/rtl8192u/r819xU_firmware.c |  4 ++--
>>   drivers/staging/rtl8192u/r819xU_phy.c      |  2 +-
>>   6 files changed, 35 insertions(+), 35 deletions(-)
>>
>> --
>> 2.34.1

Hi,

this driver is about to be removed.

Have a look at:

https://lore.kernel.org/linux-staging/20231014211051.GA29518@matrix-ESPRIMO-P710/T/#u

Thanks

Bye Philipp

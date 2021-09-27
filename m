Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D712F80
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 15:40:18 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z24so80245097lfu.13
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7uZ+gRol/KIudEZLw050U1sUe4rvi6xJlQLIYjTorQM=;
        b=rL77yan5j9TgD01AEbbvHMzXYMfKv4dJ26BM4zP8IZ6+cYTvwMuBGNfRQNDgT3Vzex
         FvKQUR6kkwiGaWS3YX3PuKuzKCjqUZA/1JTOtA/NMrNf7MzJxTXh9PB/SUx5RFdf5j5v
         vKtH6iN3iIxJogpizrlG0WYQMZfruwlFZloIxakBRsyQZ8dp2FWYE1XNuah5bcGiHHeN
         pJL/uLYuj8HUHG6ecfHIMiF74aIM1QTyi9+v07MM/c8HfztymCExC4sw8pdEeKArKFaF
         Acy4Lz3Q6W5Ksg2voyH0oTeyCHijuaah5Rle+Cr2nPjawOYm+lTXJ2YJfSkG8ZDAZdCn
         iWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7uZ+gRol/KIudEZLw050U1sUe4rvi6xJlQLIYjTorQM=;
        b=WLdZtfw24bHMHQUDd5zU6J7zSeXU6qmOdQpD+05EL9H2LUILkNpFoo0yzUABFKoDoI
         uGbhjvMNJIi/dZ1cUjPi1rmh0GciP11tLcyBvYGNjzwDdBGI3Ve6AUQNhUATkUYKQMyV
         8jbuTQNghRn+PFAwfhNfvmgv9uwY9jpQSysWwJuDp+5RiUWFwSBWIPg5VhmBXAGol2zt
         jHnXKzP/NQpA8rQR0EAkmMQU0PWrmxRwNNb2163xIoIiZs7kryAzEje9aiq7rE0FXoCt
         yBZgBxIHPwO2bqyK/X8T3vLA+yEgA34ZnyRhQbhVyl9qAYkKXQMjd/7+QV8NgE7KJb5l
         UaLw==
X-Gm-Message-State: AOAM532fo59D5zb8bNmwh9geOCZmTsxdG02YsptvcyI4VHcTTlFX2WnQ
	VWU5oItvuqGgs166KQbVUeznTw==
X-Google-Smtp-Source: ABdhPJzghrKub0OezplaDpxg3KRDVv3kVAzRjV6EiLmXpfkTimU7SUxOcd+xcDA9Cc5G16NdaS3K2w==
X-Received: by 2002:a05:651c:21b:: with SMTP id y27mr547301ljn.106.1632757215039;
        Mon, 27 Sep 2021 08:40:15 -0700 (PDT)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id a11sm1635394lfo.5.2021.09.27.08.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:40:14 -0700 (PDT)
Subject: Re: [PATCH] staging: most: dim2: force fcnt=3 on Renesas GEN3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210921165130.24178-1-nikita.yoush@cogentembedded.com>
 <YVHjQ95lbDjvVR73@kroah.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <17e51208-18b9-56d8-e8e3-2e40d6e94438@cogentembedded.com>
Date: Mon, 27 Sep 2021 18:40:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YVHjQ95lbDjvVR73@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

>> +	dev_fcnt = pdata && pdata->fcnt ? pdata->fcnt : fcnt;
> 
> Please use a real if () statement here and do not bury real logic in a
> crazy line like this one, as that is all but impossible to maintain over
> time.

The same source file already uses the same form of conditional expressions several lines above:

 > ret = pdata && pdata->enable ? pdata->enable(pdev) : 0;

 > dev->disable_platform = pdata ? pdata->disable : NULL;

Shall I use real if statement for my expression while keeping those as-is? This looks ... strange.
Or shall I convert all conditional expressions to if statements?

Nikita

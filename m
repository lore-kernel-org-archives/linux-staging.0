Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C077C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 11:44:54 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r10so2186641eda.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IZLmfYYiHMASMGiAaySluaKm3Ejc/bYH6rI1Fy0LecM=;
        b=pkHFF8vKDj0+bhl66MmU7CW3T++RKKps8T9B0LNFT0LjtxsV2/VWWxR7nF2BYj8kF/
         3BCIL4Dq8VPQbwilS9qWko4juT4O06Fq10ypwMkPKFxecmp4D3GcNYVxTBR+H/Sa+l0K
         qW6poCDQtwbqHtSiyZSKq5YvxVffCkqfkcrJMElwvr+8x++TjM15/hRNmwAhAysFPTDC
         L1UxxCAKXA8ugt6QyMc51q1qfpjQqXfoDZXZ7JCQJ7u0V4j4E+z+rUAifSdWKG5yt7Cl
         r0QKgoHu4jQkzIeDLPiOBsdGtuMC3FVM6jauv8VpLaAm5unZCq0rcwiEnwOINcFH64pm
         Q8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IZLmfYYiHMASMGiAaySluaKm3Ejc/bYH6rI1Fy0LecM=;
        b=yH9HUTGoBD4j9lFFp9RUnxyKEvQTd6M9cIs47ZmGIAQPlWXAo0KXGqwbLbJ8Lbq4XC
         2gY2M3s/XUA54K7+6dW/FsPO4DS6pCD9l9U4EKZ1YkBwVp3WBTL6KRXKWlmL4hfhAFFl
         EKL/IDlEgbFJQNoviyb9+XhNtrdNTejk+BwVT0mVsIFhRGpJtK2i+iUgYr/jAVXLM4bu
         ewwIhLlNGJ4bsf4l6BplKrtuyC5/haXlu6EWKmxu5fVjJ5UyeejkuyagLmabZy1YAwtR
         3mByfTJ5b9jK7S7f8uiF1SnCj6SKFHspU9rSLgQBye39G2hxC7YnV2ohuqGDg87cD3Ln
         A1mg==
X-Gm-Message-State: AOAM530cWQfS1h1V5xlYheOsC2+YVD93661FHyYw4Esb+f5evVq6zt2I
	eRmH37BkniS9tF0aGFgQF7I=
X-Google-Smtp-Source: ABdhPJyebQIFACE7Zr/M6pV2MjsfmyEJEUN7XCMOOuJn14VZOlfBnhcMR2wstjmC10ZaJ+3T97Q0Hw==
X-Received: by 2002:a05:6402:1a54:b0:41c:cddb:3142 with SMTP id bf20-20020a0564021a5400b0041ccddb3142mr952751edb.106.1648986293319;
        Sun, 03 Apr 2022 04:44:53 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b006db075e5358sm3095226ejc.66.2022.04.03.04.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 04:44:52 -0700 (PDT)
Message-ID: <6250c266-f00b-6062-9864-ef78d5c4a04b@gmail.com>
Date: Sun, 3 Apr 2022 13:44:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: how to handle nested mutex under spinlock
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <356c24cf-625b-eea2-2c04-ce132d881cac@gmail.com>
 <942bbcb6-725d-9b47-5dfe-f105d30ea6b7@gmail.com> <7365301.EvYhyI6sBW@leap>
 <3097543.5fSG56mABF@leap>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <3097543.5fSG56mABF@leap>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/22 13:24, Fabio M. De Francesco wrote:
> [PATCH 5.10 67/99] tty: n_hdlc: make n_hdlc_tty_wakeup() asynchronous
> https://lore.kernel.org/lkml/20211220143031.649396763@linuxfoundation.org/
> 
> I hope it helps,
> 

Thank you for the link. :)

thanks,
Michael

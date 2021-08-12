Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F009168
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 16:51:59 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id r5so11303482oiw.7
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3nZhQBQZAFuZeyMMh9wAk0QRVnEl4mK3J5oxqpsPDGA=;
        b=s44o90YdwWv47AUg9xZNd+Q1YhF9J/90SzniZZIOLTAw2mhEr3imCqGbgnQ2r9VJF0
         XRjp89OCwbrLpRTaESbByW9lUndobbcnxxV2bKGnxCUtgxwOnXsKDNVElxSNy4HbTUDP
         w9hJy9th8Ax/Eufq8/E7YaO1+b7LDTpiCzA1nIOuLwdczmeOOihq76m1+dvCdM+aeJZU
         07tK4v3FccaPmZybaVLfYGy5vhMUaRGpsnbtWSHjhtLBerURt1Bsy1uIWC4G2/z6eDzx
         JQ+f41I9UZ//xoovNLJvGGEle/q63fYoferhXG/me0PQcxhxJfTnf7miMEgLBLQplObS
         LOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3nZhQBQZAFuZeyMMh9wAk0QRVnEl4mK3J5oxqpsPDGA=;
        b=EsJtl1GN/GOh+A6kmxlYlJRnpj2y/FpE6oFpj6IMUXiXt81GJS5aiT0gqwAC+wEE0f
         W12N5Eg3QOki/stvv/Pr1F0H7SjSByncs8vb/Iw4xZVllAvCCsyTiVjoWgg1sRmNzHl5
         yBiOHjXY/ahxyMo7yTj5JOsOlfGEfmVP2bffGO+AtMFG++SnsfoIFBDGQc8nAfN2OsPP
         GZHewDerp1cspnOFSCfCa+FKFJCzpE1pKiuVwjjNSLwhsHO9s8pbJ62U6g/ClyyYNn/p
         awgP56KWPfRT7f+8Wk7fZ3u/WTxSRmPcqYMLBghrdSmSA1BNZEoXfv/tZYzmzRzb6t5Z
         ThRg==
X-Gm-Message-State: AOAM5308nffxYhC2dG/trRFgM1EP1/w2Z0k0+usJbA7o9F+EYw1EsqDp
	UBwB/jsFr7Q/SA/3Yin8EdQ=
X-Google-Smtp-Source: ABdhPJz28+uja9Jx05gFq3wV0qI/AUpOEgCmsPRXN39vcPrrGRgh/R8G/+44iGp8LRFdvmytuF/T2w==
X-Received: by 2002:a05:6808:10c8:: with SMTP id s8mr4150838ois.92.1628787118660;
        Thu, 12 Aug 2021 09:51:58 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id bi18sm748321oib.54.2021.08.12.09.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 09:51:58 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove cfg80211 residuals
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com, Phillip Potter <phil@philpotter.co.uk>,
 Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210812132725.18404-1-fabioaiuto83@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <c2abe840-98b4-cddd-e427-2243d456ec19@lwfinger.net>
Date: Thu, 12 Aug 2021 11:51:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210812132725.18404-1-fabioaiuto83@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/12/21 8:27 AM, Fabio Aiuto wrote:
> remove cfg80211 implementation residuals:
> an headeer file and build condition in Kconfig
> file.
> 
> Signed-off-by: Fabio Aiuto<fabioaiuto83@gmail.com>
> ---
> Dear Greg and Larry,
> I thought that cfg80211 had been implemented.
> Should we add a TODO file telling developers to
> do it in the near future? Is that a condition
> for mainlining r8188eu? If so please drop this
> patch and sorry for noise.

I thought so too, but something has gone very wrong. Please hold off on this 
patch until I figure out why cfg80211 is not being used.

Larry


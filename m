Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572632C80
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 19:26:41 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id u11so26111921lfs.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hDKuMfuKHvXYCTyzBwpWdg5jQKTZxGpBuUokF1nO3Q4=;
        b=nj9HWKNpIZleFk1RQQmlsEbl8qp/bXe6In22jB+l0Y32548ymztNaDBz5yoOQJKna+
         LDRn8cb7Lw0lJbLZKoFmQx/1QVErKcuz2DjaQGlQP6VpwaIe5PSOuYUKPITjJzDlIk47
         M2GHqJ3AtMyfa4/2VS1Wc2rpmFhDu7uGq7mA/fqLNJ2MprkwFpDzhVGQLSAKfsv635og
         AV8VYKzxW/2D2m5C0YNYy6AoVKJq0bcTBRzbrHyk6nuLsDM8S7XR9LL6VgjSi5N2o75q
         6+oU94WtpianAaTkaTMPU8NiSHv4fIm9TVomyNMfX9LgRcf6iMSL4ZAmqLhK4asVH97B
         fDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hDKuMfuKHvXYCTyzBwpWdg5jQKTZxGpBuUokF1nO3Q4=;
        b=ThzsAp5p/180VjV5gdM04kEGsPD/yIbmCMHbaZtxQ6PzMNRKzFBYgUTMvNUXcMlAsX
         KvEtX+OKUmcHY+aJB7O5rcBFkygMTbiAbXJOiwkE1LLDTJU4eWErBtVjOwiDcA+xJvSH
         sJMN8vEBV0opj7zJU2/3cGxV/dIcbUHATW9RBcg6l31nToc2PK+OUIWDkyY2TqBGYHSG
         gt88xjNRmk8/dtARpDe85DaztM2SMu1YTITUL2MpMkX2T3Z3S14TVh/qeffLqztRMalc
         D+OtFoXmuQlBHUHYA2Z4fS5+K134IcbFgnlnYc6Vtn9l0Pmzskz+t5mN7EjYUIOmA/Nm
         FG0Q==
X-Gm-Message-State: AOAM532hhWEeyf7G1Bw6eBKIuH+7WIaZ1wyDoJCiAv/LVGaO2PfRb88L
	n45eQHQkSreOKMt9lZNZ1vY=
X-Google-Smtp-Source: ABdhPJzFljNEZFYH+bYFXMHEjeLy4vH0h+0lzfcX5JY20/pySDIgyYybdPDQjI5fL/fl1uAy6ShBBA==
X-Received: by 2002:ac2:5fee:: with SMTP id s14mr60852218lfg.537.1636226799276;
        Sat, 06 Nov 2021 12:26:39 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.245.207])
        by smtp.gmail.com with ESMTPSA id q10sm1236140lfu.68.2021.11.06.12.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 12:26:38 -0700 (PDT)
Message-ID: <4f40be0c-1989-fd36-2d40-2e896d8d944f@gmail.com>
Date: Sat, 6 Nov 2021 22:26:35 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>
Cc: linux-staging@lists.linux.dev,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>,
 Michael Straube <straube.linux@gmail.com>
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
 <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
 <510e2388-41ea-bf66-16ee-eb282cc41405@gmail.com>
 <5ed4c9f0-111a-7a13-1426-2f9f26b9937a@gmail.com>
 <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CABtXzjSOXiZW5J3-k-jkFS3N9p9k_X=F2JrvJc9_T+By8FJc8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/21 16:21, Zameer Manji wrote:
> Hello All,
> 
> Pavel, I believe we have different hardware since my lsusb
> output shows
> 
> ```
> Bus 003 Device 002: ID 0bda:8179 Realtek Semiconductor Corp.
> RTL8188EUS 802.11n Wireless Network Adapter
> ```
> 
> Where your device has a different id/name. Maybe that's the root
> cause?
> 
> Phillip, the last release that worked for me was the 5.14 release.
> 
> Setting debug=9 set produces the following extra output. I am
> not sure how to interpret it.
> 

My device is TP-Link TL-WN722N v2/v3 RTL8188EUS. I see, that Larry has 
cooked a patch, so I hope it will work for you :)

We need to review code better to prevent accidentally regressions

Thanks for bisection and your report



With regards,
Pavel Skripkin

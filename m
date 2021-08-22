Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16E93FC3
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 16:26:14 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id k5so32534027lfu.4
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eEylF64YOOVNfoffZ3hjmQbtnSTwkThkMzn2D+PAOPI=;
        b=nLFGt87n8+HppeUjS4jTpzr7IC4wOi66Q3mKgZw3kxMOdw6DhvL8TfuFE+E7cyXJj1
         Z8m25nI4mNlTN/n2NwFaptCSoGj6V4neUbdRuis0p080Rtyq2H4F0b0+PwWAVJDlTCia
         TXg7MjO7dLNp9K6CKo52skliU1GM0IsDiimdELGUSJrKXalDgzKArY55kXhMjSvHlKaj
         hlDPjzv2Ozm66HB0GlbadGLwwIjv7tPmUCKjjB4TEA5SrVCje2lnLMpemHFBp37/x6b2
         pnZoZGFcG0IjY/sQ9Vs9yIKAapmYe5oFpqWL1Y8UsHIsymMW3T6Tit+efyR8yfrpZig8
         RQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eEylF64YOOVNfoffZ3hjmQbtnSTwkThkMzn2D+PAOPI=;
        b=VO5zAU9st/zBMvxCfMTdYJyZ0zOg5klGwDsNGkjeQg7DCdtduofR1lqZ9sCsvi0OQx
         TqukEK4lDJhZN71P5rvXs5Tj1nEn91TcOc0PJK2h68+Gt2K6icfEOLcDvbEJFTLLD/aJ
         +tbzYQGp5OeQz92SmYp9qZj6iI/yumrvu0ZAYIiAyhomJSXv2kZNSOy94DbX/dxy/UJV
         lRSdrEhMmNV5JgaugAR0MOKvj+GkWVfvtzVlynNBZ9iRyrO4WA1gC2OrJLR9nzRAOJCH
         Wq2JOTb9pRrO7qBZBE6hhrG380OeNM0v9R7BaDPPSNSRire+gkQB+GF3a4vT3p/uDoo8
         IbbA==
X-Gm-Message-State: AOAM5301zTM5o8zaYsjnpo5ZlUHkONIzMim1dHfzLLlGzMoQ3dXJr1HZ
	ymvqcLp2GCjfYvwRxLYw/1E=
X-Google-Smtp-Source: ABdhPJz4rl5KjpE2SIpnNQBBjngwjwTs5xOWz6OmTfTvx/V8anJps+gDTZvAV98S1arD9I2KSk/eNA==
X-Received: by 2002:a05:6512:ac4:: with SMTP id n4mr21915783lfu.475.1629649572874;
        Sun, 22 Aug 2021 09:26:12 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id u12sm1227539lfq.173.2021.08.22.09.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 09:26:12 -0700 (PDT)
Subject: Re: [PATCH RFC v2 0/6] staging: r8188eu: avoid uninit value bugs
To: Michael Straube <straube.linux@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, fmdefrancesco@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
 <cover.1629642658.git.paskripkin@gmail.com>
 <44fc34ec-6bbe-9cd0-0c51-78836bad7e0c@gmail.com>
 <d479bf75-f031-136c-3967-16127ed26868@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <9809a91e-c524-9c6b-67e3-8a9c9b91628e@gmail.com>
Date: Sun, 22 Aug 2021 19:26:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d479bf75-f031-136c-3967-16127ed26868@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/22/21 7:05 PM, Michael Straube wrote:

> Hi Pavel,
> 
> My one is a TP-LINK WN725N (not sure, but I guess v2).

Wow! I found this one in my city, thank you!

> You could also have a look at the device table in os_dep/usb_intf.c
> 

Yep, but I wanted to hear from driver reviewers/maintainers about what 
they use to test. I guess, some devices could be broken or not unwieldy 
to use. Thank you for recommendation, will buy one in few days :)



With regards,
Pavel Skripkin

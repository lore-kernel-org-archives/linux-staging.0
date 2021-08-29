Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E83FC2
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 15:04:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j17-20020a05600c1c1100b002e754875260so7673981wms.4
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dx6YBc7me/tNxvWQQhiRH8PX3cEFwDzBP2xfLMTDAbo=;
        b=kMJeKSGuVXUzAC2feI9RJPBmrnkQlr0o3IIXUIqSllXLz+cCY/0Rn663qBZXKe6B1O
         fOnm3Fah6T0BNcO/ll0wGo83e2KUKLa4o+kG/uQI4j8WPc2Q0obtgriySqd+ygEm5dG2
         tKmAdaBqyeU3U4+wzsRIWF7Ae3zTTFo4QF9jZXzCXjr3zbdfTo5dbJ0FDI/yNIlVWycQ
         AofWeiY+luCwHrwviUyjiB1Q61XsAiK4iPPaxg5+hno2QRhDUGnxnb5LnK4dAYrC5pBb
         oDwa+iLGOls1Tfwkrx7S/ToPja3Aag+5Uv2SxV5mUWCWL2qrvGr/HEMLQo/udPo7n/8H
         HgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dx6YBc7me/tNxvWQQhiRH8PX3cEFwDzBP2xfLMTDAbo=;
        b=EYZ9aLWeExUpvd8AqobSQHI1BmPU6MC2I02KW8qGaoA0717FOc1mBhToZor1aHiMM5
         zBYg1d7mA/ciuRJMeJJILglpK9+H3SsoXboTIDAWopIDYocbZlYmYIVtc6aXgtlOYqYe
         b81zQgwZAyKDliylKcU8dOj+xRhootEF7xE0dcKQa3cxVbEfpN1Bhwtbo6wIMm6yAnxG
         MaPoUXcPcXV7hoQTsG0DpKd/Oyj+9Y3Q175dJ0AA1phQaydCHDuckpavWVCbWK7STj3b
         bVK2ZpdQMcXHi4h4WZ7ZOH1k13p9pJYKBDnmr/u8kv33LITcDNEUu7+KVw6eovLxsLhJ
         9DLg==
X-Gm-Message-State: AOAM532JfiKk+PqpSyKCaGM753mK+FsfxPeDlPjnUw9nJu9aOTF6LWxS
	Dxi6bEUjD4EB2vL6vfDkRG0=
X-Google-Smtp-Source: ABdhPJxbo/RS6HSasHPE2utTSn9O0bQvJtekD7CsR6csw19GXYGgq7pTzh31rlc1gic4CsmXY38Taw==
X-Received: by 2002:a05:600c:22c3:: with SMTP id 3mr4644512wmg.133.1630249444276;
        Sun, 29 Aug 2021 08:04:04 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::16fa? ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with UTF8SMTPSA id r20sm13119780wrr.47.2021.08.29.08.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 08:04:03 -0700 (PDT)
Message-ID: <3f63d7e1-0eb4-21c0-49eb-262cdadf0e87@gmail.com>
Date: Sun, 29 Aug 2021 17:04:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH 0/3] staging: r8188eu: cleanup c2h_handler code
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: fmdefrancesco@gmail.com, Larry.Finger@lwfinger.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210828212453.898-1-phil@philpotter.co.uk>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210828212453.898-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/21 23:24, Phillip Potter wrote:
> This small patch set cleans up the c2h_handler code in the HAL layer
> of the driver. In r8188eu, this field of struct hal_ops, is not even
> used, so dependent code has always returned _FAIL. For this reason, we
> should remove this function pointer field, and the wrapper function
> which checks it. This is done in stages by this set, and helps get
> the driver closer to the pointer where the HAL layer is
> deleted/integrated as necessary and no longer a separate entity.
> 
> Phillip Potter (3):
>    staging: r8188eu: remove c2h_handler field from struct hal_ops
>    staging: r8188eu: simplify c2h_evt_hdl function
>    staging: r8188eu: remove rtw_hal_c2h_handler function
> 
>   drivers/staging/r8188eu/core/rtw_cmd.c     | 23 +++-------------------
>   drivers/staging/r8188eu/hal/hal_intf.c     |  9 ---------
>   drivers/staging/r8188eu/include/hal_intf.h |  4 ----
>   3 files changed, 3 insertions(+), 33 deletions(-)
> 

Thanks for your patches Phillip. Looks good to me and I've built and
runtime tested this series with Inter-Tech DMG-02, so...

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael

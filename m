Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC52C85
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 18:39:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r10so11610542wra.12
        for <linux-staging@lists.linux.dev>; Wed, 06 Oct 2021 11:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C5j6gIA1b8ePCYuZs/fRrcTl474BqZvsLpDMgivFPTc=;
        b=eMc7erGqAsArHnHro5uxw6FkWtPXMGgdhckYWOORIUjwHhEpLdH4GzAOI+0daofj5S
         4vTBASYwXNWj7vcfWYCHOBmi8SolWNSu6d2osH6Yt4yDo9BcS5vidGe0EZwaPMgQNmOY
         nenSaKRCdofVL9JQ6Bm6Xb5OWhUaGatBajCD1JVZ89NW1QOGZ19fueqA4TfoLdRwvlSE
         Mcr7nD+aAdbJnJczWM516n974DYVdNv/N8C63MO4Gw0tw+JHWbFICQo84zjMM01N32Ii
         S90TiCLxizpKiRyDNk9Y2I24aUu7EhC0WOLuCrbRGjOw0LL2Tvb4TPTilRNx+zB3QrLC
         SE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C5j6gIA1b8ePCYuZs/fRrcTl474BqZvsLpDMgivFPTc=;
        b=rVyEkF5RqM+MnlGUuvf8ScSFr1awBMn2SCPs6D0xHIx1h6g2Wjukl+5txcQxQzV/3Z
         UKfiR//eYc7Hqe8HNSxKWf0vpqvAAMv7bdsowBg7mJCrK1q59kcrKxdraZcstD7yHaCO
         rWUQ/Hb7Wh/taXe8D9SuWIfTn1Jwe4gxlsiTF/Ac/Zxzg+/KI8GOyekoUjgfu81WfHye
         eDm3hzkb58N7F7eFvubYjRibfLK9ZSKS1qe8p9iGtB5YWcTdT6YyBhTC569SzBfjndBj
         hZO5g3ueZA3hDf5V2/Jh+G2r5PkSRXMB0XCFLG5vAYpw3CjXZhaCedzizXr7+J5QXeBg
         qY2g==
X-Gm-Message-State: AOAM531urv0qt0K6drOaatayuMsyP/kSVfVYk9TZ6jufLmyAEo29pGBi
	7APVvSkMRu0rp0S14eLWCimXIW0POtE=
X-Google-Smtp-Source: ABdhPJyYHMBq4cKuzyRFnzbxPFTlNfHvjRoE2xRmQvpYKa0jfahIqhRGhMO4fafmYkDBv3/RKOk6Rw==
X-Received: by 2002:adf:9bce:: with SMTP id e14mr23811694wrc.353.1633545596502;
        Wed, 06 Oct 2021 11:39:56 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::f816? ([2a02:8108:96c0:3b88::f816])
        by smtp.gmail.com with ESMTPSA id t126sm5773113wma.4.2021.10.06.11.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 11:39:55 -0700 (PDT)
Message-ID: <15f5374a-c52c-434e-1d6c-78f1d6d3552b@gmail.com>
Date: Wed, 6 Oct 2021 20:39:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 0/3] staging: r8188eu: clean up PatchID / customer id
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211006090949.1694-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211006090949.1694-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/21 11:09, Martin Kaiser wrote:
> This series should be applied on top of the series I sent yesterday
> (starting with Message-Id: <20211005200821.19783-1-martin@kaiser.cx>)
> 
> Thanks,
> Martin
> 
> Martin Kaiser (3):
>    staging: r8188eu: hal data's customer id is always 0
>    staging: r8188eu: Odm PatchID is always 0
>    staging: r8188eu: merge two signal scale mapping functions
> 
>   drivers/staging/r8188eu/hal/odm.c             |  7 --
>   drivers/staging/r8188eu/hal/odm_HWConfig.c    | 65 +++++--------------
>   drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  1 -
>   drivers/staging/r8188eu/hal/usb_halinit.c     |  2 +-
>   drivers/staging/r8188eu/include/odm.h         |  2 -
>   .../staging/r8188eu/include/rtl8188e_hal.h    |  2 -
>   drivers/staging/r8188eu/include/rtw_eeprom.h  | 55 ----------------
>   7 files changed, 19 insertions(+), 115 deletions(-)
> 

Builds and looks good to me.
For all 3 patches:

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael

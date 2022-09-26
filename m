Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC1A468D
	for <linux-staging@lists.linux.dev>; Mon, 26 Sep 2022 20:27:21 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a26so16600651ejc.4
        for <linux-staging@lists.linux.dev>; Mon, 26 Sep 2022 13:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hlnrz4yCnvX1M7hPStALLLhNjhON2Run8LllG3n3u0g=;
        b=FwYk9nWMFGZT9RjTc2BcrFGikfbyKs1Wdc5OCBr3Ul8vUtW0Uinl/2WxKuX1NGa1aH
         7V01nwObDC5kQhgIPrW9pHZU874MKssNlBZgfOnk8QvpxLiPk/1pS4IaCmOY6qdP1N0t
         ii5mNm/agFrysSFErePQlNpx+YHf1eftvk8eqyEw7PSe6dcNA9KjTi/wncX7Y97qX7mC
         /IuIAO9+Tak79D5BAt10K3L17etLVEhT6T59IFReZ2GiCOWCf1bu/R+hWpQ9FvcNv9FU
         mr1YdQqm5wUgLuM8bGiNo3FODCj+2t3MCx7a9IMvVTvSOJ7Q6P3wNlbQkUdl6m1sU1/C
         uSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hlnrz4yCnvX1M7hPStALLLhNjhON2Run8LllG3n3u0g=;
        b=Ebggpjk4YUVHEtme72djj4k934LJRdjmk5msaqdX4/A5PPucG0aIGQtzMmzdyfSh4/
         9gbZGs0VXCE3koQ2XK5qNu7XGaJa9M924FoJnCHJGGSIPixvVL2XDa8MAXPMftd1dron
         1JBH3HukKosqU6BobuBY2vQycIVB1Xh3CqQtOmzsroiLhSRD8VKLEJUtkrwmqRW5C17H
         wem46XPsmW0hGwsVF3dKb+k9YMmqNHC/j/TWduQjz+KQn4YEo/Iq0Q/E8yt2mDEGhtBR
         AUHqni6hvpLw6KArri2k86NRpHbYYrZZMUwpmehLZiIiP/ZeM5zojEvoEA18n+5/l0uR
         BCCw==
X-Gm-Message-State: ACrzQf0B8cwqSldUoDcTI8k1JX6nfecGahvCpuyHGAkwlnaZBu33EFC9
	5KKi3Uc1TNkwO9tNNC9E+RM=
X-Google-Smtp-Source: AMsMyM6/Gs5TP5XodNNXW2Uc0XhOB9aaScjlfrznq+SqGA3d+Q5GtatXkNu9DfHLmac0yAvZqIi/kw==
X-Received: by 2002:a17:907:75e3:b0:77a:2378:91ba with SMTP id jz3-20020a17090775e300b0077a237891bamr19642832ejc.738.1664224039681;
        Mon, 26 Sep 2022 13:27:19 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id j1-20020a170906830100b0072b33e91f96sm8832547ejx.190.2022.09.26.13.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 13:27:18 -0700 (PDT)
Message-ID: <7849153c-f973-8a31-49ba-37e07e81a773@gmail.com>
Date: Mon, 26 Sep 2022 22:27:17 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: r8188eu: remove odm_RegConfig8188E.c
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220926173243.8767-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220926173243.8767-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/22 19:32, Michael Straube wrote:
> This series removes hal/odm_RegConfig8188E.c and its header
> odm_RegConfig8188E.h by making the functions defined in that file
> static.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (3):
>    staging: r8188eu: make odm_ConfigMAC_8188E() static
>    staging: r8188eu: make odm_ConfigRF_RadioA_8188E() static
>    staging: r8188eu: remove hal/odm_RegConfig8188E.c
> 
>   drivers/staging/r8188eu/Makefile              |  1 -
>   .../staging/r8188eu/hal/HalHWImg8188E_BB.c    | 50 +++++++++++
>   .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |  5 ++
>   .../staging/r8188eu/hal/HalHWImg8188E_RF.c    | 30 +++++++
>   .../staging/r8188eu/hal/odm_RegConfig8188E.c  | 89 -------------------
>   .../r8188eu/include/odm_RegConfig8188E.h      | 21 -----
>   .../staging/r8188eu/include/rtl8188e_hal.h    |  1 -
>   7 files changed, 85 insertions(+), 112 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
>   delete mode 100644 drivers/staging/r8188eu/include/odm_RegConfig8188E.h
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

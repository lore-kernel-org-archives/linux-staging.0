Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF585387
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 20:12:57 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id e13so981878edj.12
        for <linux-staging@lists.linux.dev>; Thu, 04 Aug 2022 13:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QYSwK07kFYzHOiq05oaaTeiTGf8E7cSSTShc3Z35lBI=;
        b=oYPswzpRQ8j5186pmGEAPZmY0GHoRqo5vI88nI3j3AC+yaQgLaJCVrcW03HDfUodnq
         RkWnnepiaAN5KEMhlv1hJJMu1F9fmj9qMXQ/+tPyDaT0KIsG1afxH1P0ZHLmxvnKjwf4
         X17shsq4aCMV3gKXDrGlts4a79oysHvVvbtbOo/GlKj4cErk1OdvGKdU9LgmAZj8p9ei
         YsZYet5GrBPEJvUQDbYYLRsIk04Ue/6tAgjVzFFVgiPdvxNetrtPYcdpBHLVz/3kJ9Rh
         kwABJnXKKaXu00bVU7bVkXq8L61k9lC7jd9MWgBQrgwj7LkizXs1DqkvxCecKO/F68vy
         igFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QYSwK07kFYzHOiq05oaaTeiTGf8E7cSSTShc3Z35lBI=;
        b=Uhp/J1ofuv9hZpmYbWz/fOCVCEGDmgINVRt8o66utNY11FrMfvEn3gLUuNcAb+TBlr
         /+QiUsiE54HJOnj71V2151ohIbQNpCPaUqJo72ta50kGSjj/+WSiwyCV7/qw4fmah5zH
         ImxoaD3c96DtSE6Olv+s7wHlLBilDgmqoaNdiuuKm6tZH3hQzVU/XrKGmwMgctq2Mawb
         2bKAQdOl3ZIy6zanqaXTzMcXaBZR8dmOOvXy5Hl5Oa9ZSayKbdLCYd7Z0tC5synkVqSp
         sSxik83qwrTr96O+tikBnv/S1T7W5XV1/LSoKyze0VVvyIagDlaWhlUsPdIc3MXTZoIB
         rZCQ==
X-Gm-Message-State: ACgBeo0/+wJZFr8ppJnEMQ72gMeBOtrTrLnSrADaxSIH7bYxJdYny2MK
	Ka0CGik8XFL0e2pj73dcw+c=
X-Google-Smtp-Source: AA6agR5X18L1PXXInZNRdf/HPlE0O/+hdC7bx/AQSVQkty4CikFF5AaTlfaNHNI8kYsDj+NyYcaTiQ==
X-Received: by 2002:a50:fb99:0:b0:43c:d008:d4f9 with SMTP id e25-20020a50fb99000000b0043cd008d4f9mr3614188edq.13.1659643975435;
        Thu, 04 Aug 2022 13:12:55 -0700 (PDT)
Received: from [192.168.1.103] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id g23-20020a170906539700b007306a4ecc9dsm706630ejo.18.2022.08.04.13.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 13:12:55 -0700 (PDT)
Message-ID: <b5301b5b-9f6e-f3a4-4d0a-a01cca29c940@gmail.com>
Date: Thu, 4 Aug 2022 22:12:53 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] staging: r8188eu: make some functions static
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220804105532.7532-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220804105532.7532-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/22 12:55, Michael Straube wrote:
> This series makes some functions static what allows us to remove the
> files hal/rtl8188e_xmit.c and hal/rtl8188eu_recv.c.
> 
> Michael Straube (2):
>    staging: r8188eu: make handle_txrpt_ccx_88e() static
>    staging: r8188eu: make rtl8188eu_{init,free}_recv_priv() static
> 
>   drivers/staging/r8188eu/Makefile              |  2 -
>   drivers/staging/r8188eu/core/rtw_recv.c       | 79 ++++++++++++++++
>   drivers/staging/r8188eu/hal/rtl8188e_xmit.c   | 22 -----
>   drivers/staging/r8188eu/hal/rtl8188eu_recv.c  | 91 -------------------
>   drivers/staging/r8188eu/hal/usb_ops_linux.c   | 14 +++
>   .../staging/r8188eu/include/rtl8188e_recv.h   |  2 -
>   .../staging/r8188eu/include/rtl8188e_xmit.h   |  2 -
>   7 files changed, 93 insertions(+), 119 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/hal/rtl8188e_xmit.c
>   delete mode 100644 drivers/staging/r8188eu/hal/rtl8188eu_recv.c
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

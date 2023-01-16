Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F976FB7
	for <linux-staging@lists.linux.dev>; Mon, 16 Jan 2023 19:33:04 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id mp20so23752199ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 16 Jan 2023 11:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ug3TuHPkO+KIpG8JXNG5RG+m82gr69xH0lG8Jt6Gbo8=;
        b=jOxclq+nQL67Hm+oetmxpr0VG1kI2kkIjW8rCej+YkPrt3XwoudPg3Ai3WmT68NnpM
         Pzu6OP2/ivBELEOYlHSR6VeX2XbGTH7nnaXhCmH9ReRb/SA3Q9U1XP12Ekjh0gvxgknR
         6jP8cRKMewEiu5ymSNCYUbtbBApBIeCtgwgArDG/JiMSsmI14JY8cKHEqyDVGBC1uGDL
         L4VJm9FTYoqZwvnyQb22vMfGR4cRCHLIu8kQLZPnXcbPMZnAbX1Y5iESU1xR7ijpsxAh
         fbpFyU4UBThe5QXg7nQIyL0CiMqoAv1px5uTCpCivLwBMFfzYdO8wOGAn1BHdwAoW8Xh
         bGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ug3TuHPkO+KIpG8JXNG5RG+m82gr69xH0lG8Jt6Gbo8=;
        b=p96ChbWC8yJr3jtFj+UYz2f0ueBFO5bEHEwWZpw4ayHqTLHXCCZZmQmPZbdhwz3nDD
         m0BYqEGba/+Y+rZkT7BqZiRl0IvPsp5z6lNWZKbCR5t6TP5rpTnS9ToRlgMuhxWz0K6Z
         W/Ty8ReZ3xmEBJpe1biUH72e6jRP/xEz6boog+vJZgh3c1eo8q4VlDyId7pr91ej5Xn/
         5GLfd9MpoR3Xy7JQdvAY6e8e18GoIeKD6iA+VTSTr2FfADp5wX3OANuFdVmBE2RecVSg
         3eHfpU2m8DJwwvzcEoRI2lpB+gxq8Ad+2HXEbWOnND+1ad6XkXrBd7E5VsQcviNOoKB7
         L55Q==
X-Gm-Message-State: AFqh2kpsQ5tc4VJaG7Tav26sH98yF1s16sKqXD0srEYOT6/l1yfaIgkX
	CTGZr6IhfE+RLS3acrDxBLU=
X-Google-Smtp-Source: AMrXdXuA6XoMVTibmB+ROe0ZlfEDwOQ5K+en01sIIlmIvkMXBZwj+9qeJ+MzRenwB2Ps4nw4eUz8Fw==
X-Received: by 2002:a17:907:8c07:b0:86e:2dd4:6656 with SMTP id ta7-20020a1709078c0700b0086e2dd46656mr29651ejc.6.1673897583015;
        Mon, 16 Jan 2023 11:33:03 -0800 (PST)
Received: from [192.168.1.100] (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id l10-20020aa7d94a000000b0048ebf8a5736sm11771799eds.21.2023.01.16.11.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 11:33:02 -0800 (PST)
Message-ID: <1940bef1-4140-7430-48a4-e1a54068dde6@gmail.com>
Date: Mon, 16 Jan 2023 20:33:00 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] staging: r8188eu: some error logic cleanups
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230115210734.18610-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230115210734.18610-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/23 22:07, Michael Straube wrote:
> This series converts some more functions away from returning _SUCCESS
> and _FAIL.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (4):
>    staging: r8188eu: convert PHY_MACConfig8188E() to common error logic
>    staging: r8188eu: convert phy_RF6052_Config_ParaFile() to common error
>      logic
>    staging: r8188eu: convert phy_BB8188E_Config_ParaFile() to common
>      error logic
>    staging: r8188eu: convert PHY_BBConfig8188E() to common error logic
> 
>   drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 35 ++++++++++---------
>   drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  7 ++--
>   drivers/staging/r8188eu/hal/usb_halinit.c     | 15 ++++----
>   3 files changed, 27 insertions(+), 30 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

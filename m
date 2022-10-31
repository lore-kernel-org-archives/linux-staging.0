Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283078F52
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 22:01:35 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id kt23so32781253ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 15:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHO3++iCZaM9dl+qOlhIzyeoPvBu+xAAp7dKYAWyoHk=;
        b=jS2WTs2+y11Y1213da7iIpPNmNbAIyuag1zHt2xBmLP9j3e9U8QqkUdrtmpTPWqkns
         o5OOzlXL1cytyPWtdE/kfR/JHxocrZdwy3J/sGKSNd3zfKCtCNLs1Dd4ap3sLDI5dTvx
         cwn2tL+IDstSXgVCvigsSLxafMABFLCnBIVMqUouAO44a+KZxO1LRamFP1OWbGNTUD/6
         AYpVRzbn9Mr8vhsO4W0BF0k1EBzOwO6r5uQE5/PXSwuswwxzFmjipKAhjlpQr9Oo8ZmV
         WyYlw9lmj/JAOyyRVVUcw+5Ir3sS3XgiEbw1OZdeMn5tCbNXJD5J4snD7W4tfv3598P/
         nDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHO3++iCZaM9dl+qOlhIzyeoPvBu+xAAp7dKYAWyoHk=;
        b=oDdweC5SB9ydERXsm2lnslVhY0x2srhTBCOyyf7HV6umxlPiT66kXkwfmflq6wkbNF
         50UmL01opCA501r45xFA6yQsAKS2joBZdDm2GT1c3xjv5+nVNDK5ZFqerTUEBRxHylL6
         DXk1KKn17HKL4r35hkGS0ulV40vOM/qDUg2WdB0eVdIPxUbxrm667La37eDBGcOcxHtJ
         tb8swk21np/070wD8Z5Tk36I6HCfNlu68/yvcbrVzcmA+wH8XxVDn4/FmkRvtAHbdPrR
         lTSE9qj9tuwgB3wRKe3rOPOII4lwts6TVuPYI8pcBZXt9xF6u+XlRrLQlsBK8blya9r5
         EhBQ==
X-Gm-Message-State: ACrzQf25lMhvjbjvejguyYk6PTtaF4CMXvr80IGO4vvJJDX5LYgWn9To
	DjL/XzD6AFq89ZJKgq8mOS4=
X-Google-Smtp-Source: AMsMyM5P6MmwqkKSPM9M+x1tK/wnVylg/gHshyeXVJE4B+AJeXbYWTSoxXevEvh4cePHeeD6R6vo9w==
X-Received: by 2002:a17:907:7704:b0:780:da38:4480 with SMTP id kw4-20020a170907770400b00780da384480mr15389478ejc.64.1667253693342;
        Mon, 31 Oct 2022 15:01:33 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id l7-20020a1709066b8700b007402796f065sm3454893ejr.132.2022.10.31.15.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 15:01:32 -0700 (PDT)
Message-ID: <8bfd6953-a083-5dfc-e333-b8f979e6fcd7@gmail.com>
Date: Mon, 31 Oct 2022 23:01:31 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] staging: r8188eu: clean up
 update_recvframe_phyinfo_88e
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221031205412.124871-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221031205412.124871-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/22 21:54, Martin Kaiser wrote:
> Here's three simple cleanups in the update_recvframe_phyinfo_88e function.
> 
> Martin Kaiser (3):
>    staging: r8188eu: use ether_addr_equal for address comparison
>    staging: r8188eu: use hdr->frame_control instead of fc
>    staging: r8188eu: use ieee80211_get_SA
> 
>   drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

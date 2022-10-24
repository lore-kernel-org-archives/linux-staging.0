Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9237B
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 05:33:45 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a67so27075227edf.12
        for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 22:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cncPzNhKHj3RYOK+yi0gfwTweMp4e49Izic1tzyj9aw=;
        b=lyVy9WcZQ7oju/Hdg/UskrapDqXlOYsHj14/fXklRTlYFcSXQNjjc3mlz20FCqFyLt
         liQlqPPEtlyGlp0soXNNYLuZW8Yz7KrEgYjfJ2s3TymAlOZ9Ov5TbdXuCAFVZ3ktkjNF
         UR/YmzyuXHOM5WO5s4vde+PePtvAdwDUpO6mHD+LRiUbjL1Osd6OHsuaccODZUz/hYvl
         7TY8iYbUlhyKbI8WqZs2nbfPFnqdFdLRYYjfQ0LRY0FK+JrCInuyR5fUWbqKW0ve1x9j
         bNHHUFtJnFbR9+DdNpzEy6gnLFNW5XvcNtkm7fl7JfmUu/qOBZHXap3KlZMeydeqSHml
         aQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cncPzNhKHj3RYOK+yi0gfwTweMp4e49Izic1tzyj9aw=;
        b=AaR7bnh8Mh0tEHsiDIpJu/KZHVjXpTrOCl8MQcVCPNL2jAx3QPKqJW7/Upc+vpopmO
         6fES9hJtzyAf/B6n8kYA5yewQJTANMfttdFpSEJqo3Z4IW74a8qfJEFDiKLwo6roBjRa
         OVLRS7FMjo76dcQTnk6fe6n77/GtugWyZLL7osB8HCGbzhl1xU2Yh6fkm+1rDGAlZ0oz
         0s26TeDZycDeMchfROztLMLsVQl590JO7dwySUMrJcQbc5NlVkt14TdzCAIDxrnB04DE
         rgmwEcZjlAWxXDHwkC+AE1mwkVWl4d4EIWvUDDzEA0FOi4sL1XHw3PtuqVpsQVcolygB
         IpfA==
X-Gm-Message-State: ACrzQf2y0mmkIOpNcN+b71L25K/x7VOytdJp0jsOzxsNMKdCQT/Inshw
	/RZDya69dgFi4o60bcHXw60=
X-Google-Smtp-Source: AMsMyM5rRNebOpsJ4gLnTd7+6E9mfjH6kkI3LVZowjkSr0E4zP6fX2JdaPe7NsLtPbmIRWeSGlnZzA==
X-Received: by 2002:a05:6402:3213:b0:461:dec8:336d with SMTP id g19-20020a056402321300b00461dec8336dmr1166660eda.221.1666589623947;
        Sun, 23 Oct 2022 22:33:43 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id e16-20020a170906315000b0073d7b876621sm14823823eje.205.2022.10.23.22.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 22:33:43 -0700 (PDT)
Message-ID: <e66da59e-6f52-04de-990e-383f58541c44@gmail.com>
Date: Mon, 24 Oct 2022 07:33:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] staging: r8188eu: some more small cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221023170808.46233-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221023170808.46233-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/22 19:08, Martin Kaiser wrote:
> Here's another series with simple cleanups in several places.
> Tested with EdimaxV2 on an arm32 system.
> 
> Martin Kaiser (5):
>    staging: r8188eu: use standard multicast addr check
>    staging: r8188eu: don't set pcmd_obj components to 0
>    staging: r8188eu: NetworkTypeInUse is not in use
>    staging: r8188eu: remove wait_ack param from _issue_probereq_p2p
>    staging: r8188eu: bCardDisableWOHSM is write-only
> 
>   drivers/staging/r8188eu/core/rtw_mlme.c       | 16 ----------------
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 18 ++++--------------
>   drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  2 +-
>   drivers/staging/r8188eu/include/drv_types.h   |  1 -
>   drivers/staging/r8188eu/include/wifi.h        |  5 -----
>   drivers/staging/r8188eu/include/wlan_bssdef.h |  9 ---------
>   drivers/staging/r8188eu/os_dep/os_intfs.c     |  4 ----
>   7 files changed, 5 insertions(+), 50 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

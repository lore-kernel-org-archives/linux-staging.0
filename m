Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187688F52
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 22:00:59 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id d26so32764537eje.10
        for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 15:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYmK8qj7euiKCTy77L+jTnVdwmHVwE99ZMrhhT9gdIQ=;
        b=PH2PsoGijRgnfGZ3bijqOzE8hgcu+jGABXBogjxVuXnQhPJHHH1fikvzydt6pFJ6V7
         Ky49+yWADDBa+bEVPa/ibd7jm4jgCvNxP1K3LHjuKkV8jDA/c+XkwjWtd7+kLXmP9e29
         P1mPcrDAaKrWzjlyucuHFQaJmvRO9HaKnfH1Fk445TmQ/WLn2lqpkeS2wcLi0OAVGzpz
         CkUEqxWwipbMfhnSEIQjpTiwJivIvV2bl70+F7QuGiMp+9vfqmdogcdJi9/rQbFgO+SM
         E6nQSR61Gf4Z9Kb21UW2qIYB4lLOK2Qz2/rh4JjbQgF5jERTGj5lhEcWTp6nCoD6UEme
         eqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TYmK8qj7euiKCTy77L+jTnVdwmHVwE99ZMrhhT9gdIQ=;
        b=UDdehpywMre9JI4F1EtK9m0c/s5hR3wtdSIFhJPtdonfl+ii8PNvwqqGEUv0VUMJ1b
         myeQ48FtH5/SeO5JblRkGwLs1iWCKNnP6LduUYDdBsUwk0KYFHYmY2J4mHn9TwZZt1Dv
         xNUudtW7fTMdTq/V6XdYfYlGapnHFv4PCNmCq9megv0qgFeH0pKGad2iS0cYA5wqdo05
         EQ6/5rrhjm6rLrccWoOkaWD5nstEhusYBDAjbR4NeAD68DhCw4w3IPYvh/TEXdr6Kn3E
         KiEEMrT+JzpntXux9s+V79IEJWtPjs0lAlu9Scey/zPIasA3fJj2+3TTxwSncNZl65EI
         Rk2A==
X-Gm-Message-State: ACrzQf0KmjpW1Jth3WzqaxQ29EkjenC3Zxm5kjZ0RWtCfWcXFrNEB2Q/
	oxsyzQSee1KOgb7oXkt8I28=
X-Google-Smtp-Source: AMsMyM4C7d4bA8v7ZFPNK9507ow2gzTi1GzZWQY11diWsBPM749ZVZRNa2Tt4VNgBNII2+X9mohBPw==
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id d1-20020a170906040100b0073daf730b78mr15708924eja.122.1667253657287;
        Mon, 31 Oct 2022 15:00:57 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402150e00b004610899742asm3692669edw.13.2022.10.31.15.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 15:00:56 -0700 (PDT)
Message-ID: <3fc39e22-c352-ecd0-3caa-b2376747b505@gmail.com>
Date: Mon, 31 Oct 2022 23:00:55 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: use ether_addr_equal in OnAction
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
References: <20221031205140.124682-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221031205140.124682-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/22 21:51, Martin Kaiser wrote:
> Use ether_addr_equal to compare two mac addresses in OnAction.
> 
> Both struct ieee80211_mgmt and struct eeprom_priv's mac_addr component
> are 2-byte aligned.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index e985fc5fc575..6679d4037d6b 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -3823,7 +3823,7 @@ static void OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
>   {
>   	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
>   
> -	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))
> +	if (!ether_addr_equal(myid(&padapter->eeprompriv), mgmt->da))
>   		return;
>   
>   	switch (mgmt->u.action.category) {

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

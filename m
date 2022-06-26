Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D87A
	for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 20:45:23 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id g26so15076485ejb.5
        for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 13:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MU7F2k/pm1hTOOKVBfeW26d42wVGtM9C99HlX+kZFUc=;
        b=hkq3xj3zWMBNeTameJYl3wMqU54AgmIuOvE3HLzpprHwrZFr6Ib+6ps76dD9Hu9KwD
         Wsx9gBPi+h2e6J0MNZBLGUpD8WS1MyTWgNNqRTyygId39CuJpjxq7kQSJyFVUMHS7Rou
         RmYgm3hKbEtePHGJmupQTUQcpVwVOCOZ0TQuKdmDPRpPdLYV2bq9JMe86rgzXlhc+pye
         LcOFTexFtvLFzoHsNaS3DLJMZqCELGQ6Xs2Wz9BfA82PEnbdYwGxCNGKvCP/GkdoIXqe
         MtCtr0amhso5kJTTtSN11TgeZX8HFwI4afhqn+6wY0/rdRVCmIyM8Vk8XEAjYZhWJRHD
         mNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MU7F2k/pm1hTOOKVBfeW26d42wVGtM9C99HlX+kZFUc=;
        b=xZFka3tZEFYXwh7IPp5YwfNquhysaOb6ANunxCyqo/LYBEy5wYmR9Ucoei69UexGiY
         BZ5moIU6TTWluOkRAKARwK/kQ/fmhOAPxhjzXPfjY6FrPOilz9hfSb/n7jwXL1hZCQKL
         GXIU+hzJJGMei9TGN7Lqy0foRST7fOgkwco/idVMMFDQFNdsmTJSuKfokoGW86RaF7Ev
         8P/DLlTVtMFJ5qcfmXsQKW0TVNUQPRr1AKPqxLVLB/qv6rwDC/ESR9NE+Bbcm67ssPjY
         NCJb6JS3Rqv92dMiyPazKy5s22ZDa3QE4vo/iK6m9o2gFqOuXpH142cWtDdljdvLG317
         v+0Q==
X-Gm-Message-State: AJIora90C5/8fmgF+StxRACjOKhp60AHevAx7BQK7tooEEVmj0h8Z4xt
	reExInbwLUbFsijhN0LkEE4=
X-Google-Smtp-Source: AGRyM1tud0SOqOYza3cGsDMjM6Pbh/rUJkYSqd5VKAKC7svI/bMC8Ru16aIOGSf8bO2lPwwlBti/hQ==
X-Received: by 2002:a17:906:7742:b0:708:ad9f:8e88 with SMTP id o2-20020a170906774200b00708ad9f8e88mr9498653ejn.735.1656276321829;
        Sun, 26 Jun 2022 13:45:21 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709062bc300b00722e3760558sm4081601ejg.100.2022.06.26.13.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 13:45:21 -0700 (PDT)
Message-ID: <4a6b8f5f-e859-5b19-a162-d4ff8d65490a@gmail.com>
Date: Sun, 26 Jun 2022 22:45:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: r8188eu: drop return value from
 receive_disconnect
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220626180734.287137-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220626180734.287137-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/22 20:07, Martin Kaiser wrote:
> The receive_disconnect function always returns _SUCCESS. None of the
> callers checks the return value. We can remove it.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 5 ++---
>   drivers/staging/r8188eu/include/rtw_mlme_ext.h | 3 +--
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index cce0575e93b7..fc6e06d7b5ca 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -6191,14 +6191,14 @@ void start_clnt_assoc(struct adapter *padapter)
>   	set_link_timer(pmlmeext, REASSOC_TO);
>   }
>   
> -unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
> +void receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
>   {
>   	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
>   	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
>   
>   	/* check A3 */
>   	if (!(!memcmp(MacAddr, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
> -		return _SUCCESS;
> +		return;
>   
>   	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
>   		if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) {
> @@ -6209,7 +6209,6 @@ unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr
>   			report_join_res(padapter, -2);
>   		}
>   	}
> -	return _SUCCESS;
>   }
>   
>   static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid)
> diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> index 71864733b1c0..56c0e584bb6c 100644
> --- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> +++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> @@ -468,8 +468,7 @@ unsigned int update_MSC_rate(struct HT_caps_element *pHT_caps);
>   void Update_RA_Entry(struct adapter *padapter, u32 mac_id);
>   void set_sta_rate(struct adapter *padapter, struct sta_info *psta);
>   
> -unsigned int receive_disconnect(struct adapter *padapter,
> -				unsigned char *macaddr, unsigned short reason);
> +void receive_disconnect(struct adapter *padapter, unsigned char *macaddr, unsigned short reason);
>   
>   unsigned char get_highest_rate_idx(u32 mask);
>   int support_short_GI(struct adapter *padapter, struct HT_caps_element *caps);

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

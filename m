Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B9D3FC1
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 08:00:47 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id d16so36070655ljq.4
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8FImCoo5pTAQJj0KEDdtKxhCXfoD+DFQjGxp2SXkatY=;
        b=vOs7yzPi4GDGVqi1TE9XSGGYi+4JMzhwe4u+WmsQTA/m8R2zb/arpQ/9y4aicRgWN+
         i3rchTUc1TJ7db4PiocnmRZkLRT0qBxImbKp2JXOOn5jkUZKvy+9XkLBK2LsUvn0ZRjg
         QuJOGwYR6ifl4qx9Nnw8WgfXOlbvISgaTWnXQq55wGd7AKAlEmq6ipmsLbrH1yXrmqzb
         9FZjlTWSfTVe03qTSQp6vcBM41LHCVgqlXMlOfqv+QZ9IoH4qYimg6CUt62xEDhTXNBy
         o8R104FLvStnu/Y/M+R1JshychQg+YaysOR2Ot961CDXPrMBsmmWH+wVExn5yQhnUmS8
         z4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8FImCoo5pTAQJj0KEDdtKxhCXfoD+DFQjGxp2SXkatY=;
        b=Y1sMzLGwZRM6rPMdOFcGjLsl+WWSZuj4r2jXhtrbDUkH8jUSt6V309xNMKF0EE6WGW
         2zQkwbFwbXrXo3AIqXEDI9bubzK7Rar7i1K79m33XdobIcmWPbHZNP7A2eAInB8+NLUT
         lS/GyuzEdKl1ghuh6VqzoiYToIOJxrCLULQ3IOKs5YebGM3KRtBKRJ2P6r7s1bL9qubN
         ++9UyFBwo8mZXliWmkgT9mOIfUrxOz20H82pgkDe1fwiHjpmvEUs/8xnPBcUGpejDWiU
         eyOabAepYvuVPT+RmGy9kVeYNWWXafzxe85t29WIuLiInNTNvE3fanY5aMYYLz8GoRBs
         ou2w==
X-Gm-Message-State: AOAM531UV+wt6ZDE41rweIuOpf/eFlTOXeX/dQBztGSrvOvKG8SJTG5n
	HXN+fms5V2KNrZdPu84io90=
X-Google-Smtp-Source: ABdhPJxRZ4Qfikupak4ek2kqdmjHxPDTupO7aC0eYmRgcSXzYv9iKoQL4n6wNhOs9vsFWedb7mj9kg==
X-Received: by 2002:a05:651c:118f:: with SMTP id w15mr30986601ljo.47.1629792046064;
        Tue, 24 Aug 2021 01:00:46 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id w3sm387870ljm.13.2021.08.24.01.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 01:00:45 -0700 (PDT)
Subject: Re: [PATCH linux-next] r8188eu: remove unneeded conversions to bool
To: CGEL <cgel.zte@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jing Yangyang <jing.yangyang@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
References: <20210824063443.59724-1-deng.changcheng@zte.com.cn>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <9558f8e0-2ba0-e0af-4e81-6223b1d3bef0@gmail.com>
Date: Tue, 24 Aug 2021 11:00:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210824063443.59724-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 9:34 AM, CGEL wrote:
> From: Jing Yangyang <jing.yangyang@zte.com.cn>
> 
> Found with scripts/coccinelle/misc/boolconv.cocci.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>


Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>


> ---
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> index 5325fe4..20dc4d4 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -3758,7 +3758,7 @@ int issue_probereq_p2p_ex(struct adapter *adapter, u8 *da, int try_cnt, int wait
>   	u32 start = jiffies;
>   
>   	do {
> -		ret = _issue_probereq_p2p(adapter, da, wait_ms > 0 ? true : false);
> +		ret = _issue_probereq_p2p(adapter, da, wait_ms > 0);
>   
>   		i++;
>   
> @@ -4890,7 +4890,7 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
>   	u32 start = jiffies;
>   
>   	do {
> -		ret = _issue_probereq(padapter, pssid, da, wait_ms > 0 ? true : false);
> +		ret = _issue_probereq(padapter, pssid, da, wait_ms > 0);
>   
>   		i++;
>   
> @@ -5605,7 +5605,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
>   		da = get_my_bssid(&pmlmeinfo->network);
>   
>   	do {
> -		ret = _issue_nulldata(padapter, da, power_mode, wait_ms > 0 ? true : false);
> +		ret = _issue_nulldata(padapter, da, power_mode, wait_ms > 0);
>   
>   		i++;
>   
> @@ -5728,7 +5728,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
>   		da = get_my_bssid(&pmlmeinfo->network);
>   
>   	do {
> -		ret = _issue_qos_nulldata(padapter, da, tid, wait_ms > 0 ? true : false);
> +		ret = _issue_qos_nulldata(padapter, da, tid, wait_ms > 0);
>   
>   		i++;
>   
> @@ -5839,7 +5839,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
>   	u32 start = jiffies;
>   
>   	do {
> -		ret = _issue_deauth(padapter, da, reason, wait_ms > 0 ? true : false);
> +		ret = _issue_deauth(padapter, da, reason, wait_ms > 0);
>   
>   		i++;
>   
> 



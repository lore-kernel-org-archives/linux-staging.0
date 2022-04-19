Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048171385;
	Tue, 19 Apr 2022 19:27:08 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id p10so31134646lfa.12;
        Tue, 19 Apr 2022 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lhlyNCLzJ6McMJUtv9VTMDlhizwAjxEKxLhqW8mvjg8=;
        b=SopT+69Xn63wAziS3TcdW2Qm1lTV+/qLNJX3k3gPKVzHHiPEPyBrlUJcsL+bA+c1kt
         +X52z/O9bMTR/wrFsHi1gakrNsfORvZFFVYzzFcmoEPRug0VXEl2Iw8brkytl+TztN05
         tmjiv0+uf6fLiAM7PYkTvVpDwNbDg2fVhEl4ieEJJLeRubz2bBDExDRiFTYGmYJyCsEh
         P3gvAnAjPZezZFMTzgrV1esWyBP6px8Q9GgtgYzfdRca0+Rm9CStqIh5OxQZBP8+cEVd
         BoGf+eiHXvbLTk9URBuN1FjP2mlpyAXVKO5niQ/MKiYuPhbSbgdYFg+j+wH5w23s2Bdg
         Gpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lhlyNCLzJ6McMJUtv9VTMDlhizwAjxEKxLhqW8mvjg8=;
        b=8QOUALdJAHYX7elI3ODS9wKi/44l/8oSyU2btpD24bW5YXG/q8C5bjZjqPSKZO4yI/
         xJw8PlK74jFFkg2dfeX8YsCB40M/AD2lbsmVGfudZeyMMekQ51UbECkxPynACZoBnZJz
         /Q6QVl7TA1mr8jMNfxUHrviFFQOEvsmP1ASoTAwyYJdED60FYes4wN/lDYTxGOH4c/1I
         RoE2F2Y+mu7caiwJNB7V0FYmBS282mjge9Gvd/qvQUB4vkOqBMP+C6vIbbIzPhVM7GOO
         NkoNrcsv4cirjsDkphqnhiij8g3438yLOw3tmc2XlNtJP0GzYpI6DqjLcqHp1+41iQhr
         vryw==
X-Gm-Message-State: AOAM5306AZMNfoPmZ6+Y1Qd1OjkYWXjugC7qIa+ehRRk9G958SIH115J
	UaRswvKB0+pKmpJyGAWBSAI=
X-Google-Smtp-Source: ABdhPJyG6Y2wM2dlef5vHBfqM+j2lOpiyejc/Vlsh69n+HFv187qrGImjua7LcKfLwi08QZ069kY0w==
X-Received: by 2002:a05:6512:318a:b0:471:8f3b:e2bd with SMTP id i10-20020a056512318a00b004718f3be2bdmr8179411lfe.129.1650396426859;
        Tue, 19 Apr 2022 12:27:06 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id s14-20020a2e2c0e000000b0024db3275cd4sm1034812ljs.12.2022.04.19.12.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 12:27:06 -0700 (PDT)
Message-ID: <32587233-0ff6-ed0f-b873-cd4f797005a9@gmail.com>
Date: Tue, 19 Apr 2022 22:27:05 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/7] staging: r8188eu: remove unused member
 free_bss_buf
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1650392020.git.jhpark1013@gmail.com>
 <3c5a510938ac395a13bb09c0de1868cce8ca3dd8.1650392020.git.jhpark1013@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <3c5a510938ac395a13bb09c0de1868cce8ca3dd8.1650392020.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jaehee,

On 4/19/22 21:19, Jaehee Park wrote:
> The free_bss_buf member of pmlmepriv is unused. Remove all related
> lines.
> 
> Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---

[code snip]

> @@ -55,16 +54,6 @@ static int _rtw_init_mlme_priv(struct adapter *padapter)
>   
>   	memset(&pmlmepriv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
>   
> -	pbuf = vzalloc(MAX_BSS_CNT * (sizeof(struct wlan_network)));
> -
> -	if (!pbuf) {
> -		res = _FAIL;
> -		goto exit;
> -	}
> -	pmlmepriv->free_bss_buf = pbuf;
> -
> -	pnetwork = (struct wlan_network *)pbuf;
> -
>   	for (i = 0; i < MAX_BSS_CNT; i++) {
>   		INIT_LIST_HEAD(&pnetwork->list);
>   

And now kernel will just boom here :)

I am sorry for not noticing that from the beginning, that's my fault. 
This pointer is used in very weird way, so let's come back to initial 
patch: just remove 'if' before vfree().

Refactoring that place is the separate task


I am again sorry for wrong suggestion,


With regards,
Pavel Skripkin

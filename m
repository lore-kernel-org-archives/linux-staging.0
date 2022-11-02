Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C722D27722;
	Wed,  2 Nov 2022 22:09:50 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id b2so732546eja.6;
        Wed, 02 Nov 2022 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FoYpqeiAYf2r3EAW7pQ60Og7hl59Eb2xrTJIoY03XVc=;
        b=boJl3z2xKdtqkQHOvzR9lNThkR//L7oV5BDNrvQASEJfMj9BIpacq+ZZdBeyycCNQS
         rfwZq0+48LKMjb23+ZxaGK+SnRfjNrk/dDCwA5VWZIDAdowOkqShT2+8Csy4wJh6EgEI
         Z/uIzUvpvwIdVbzjl5K456QSF9VyoS6s8HO3kb4oGJt4I2v89hKZxiexmeNEUsRxK/Yb
         JIowOj1XBS+oEugeVnv018PfV7feQzGTsPs+FrMuP3UMSogBozIVDVujqPUyJ8jfdodC
         GxGgs+CESQ5ASQjSZB85Pp9MkOng8cojIwxICXobHbLqWmJHAZM6tUsLfcK1BDbn8R/1
         9wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FoYpqeiAYf2r3EAW7pQ60Og7hl59Eb2xrTJIoY03XVc=;
        b=6U9Oc0kIZp8P50K212UurD99veekyxkuupLcueYiL95yyQOZpi3+y0zrJofCgZzMdG
         oUTJDaQKJMRYbBjhvFs53ewciFFTcGmyEaHRmOeDrXH9P52DBFybUk3b5WEiboso0ffy
         k80YAuO3Jn2yeqefNxqbq2wZEEDOXGwleOBK+jcko7yJbM4NHhXe9Ya8kD+F03SdduK5
         HF5sKwiI6+ySTE8FECn6E5nt1qYY4BCKkhrfIZc8pjiLV75KLGZY4wKDrhAH8ocGccX9
         dS0RcEGSVWgicZ2Hlup7ltxWlFVVtEqbJ7LbobOxoQGII21Wap8wINyNAjFtenteIofg
         M86g==
X-Gm-Message-State: ACrzQf0Xku1zM9dySxvUE5krBN/xahj5ZdwCE8/PUUN7u+I5csUc7m1Z
	Fec8fqOrjq1MOOjkaWtezno=
X-Google-Smtp-Source: AMsMyM71hD5jObLhyGqJQEZ/ylIuDkz+8GnztQMXvhlo9FmCurZT07qGrMa5/yvokp7tcQLpnnlbMQ==
X-Received: by 2002:a17:906:8473:b0:77b:efa8:50e4 with SMTP id hx19-20020a170906847300b0077befa850e4mr25707689ejc.250.1667426989048;
        Wed, 02 Nov 2022 15:09:49 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id rp7-20020a170906d96700b0078dd4c89781sm5936115ejb.35.2022.11.02.15.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 15:09:48 -0700 (PDT)
Message-ID: <e76c5fd4-442b-0f0e-73e8-c17acf11b471@gmail.com>
Date: Wed, 2 Nov 2022 23:09:46 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: remove unused struct declarations
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin
 <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Y2LYvhr74ng+xFbz@qemulion>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y2LYvhr74ng+xFbz@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/22 21:53, Deepak R Varma wrote:
> Some structures are only declared but have not been used anywhere
> in the code. Remove such unused structs. Issue identified as part
> of coccicheck report driven code investigation.
> 
> 
> Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>   drivers/staging/r8188eu/include/wlan_bssdef.h | 42 -------------------
>   1 file changed, 42 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/wlan_bssdef.h b/drivers/staging/r8188eu/include/wlan_bssdef.h
> index 831c465df500..ffeafa19ef26 100644
> --- a/drivers/staging/r8188eu/include/wlan_bssdef.h
> +++ b/drivers/staging/r8188eu/include/wlan_bssdef.h
> @@ -177,20 +177,6 @@ struct ndis_802_11_status_ind {
>   /*  MIC check time, 60 seconds. */
>   #define MIC_CHECK_TIME	60000000
> 
> -struct ndis_802_11_auth_evt {
> -	struct ndis_802_11_status_ind       Status;
> -	struct ndis_802_11_auth_req  Request[1];
> -};
> -
> -struct ndis_802_11_test {
> -	u32 Length;
> -	u32 Type;
> -	union {
> -		struct ndis_802_11_auth_evt AuthenticationEvent;
> -		NDIS_802_11_RSSI RssiTrigger;
> -	} tt;
> -};
> -
>   #ifndef Ndis802_11APMode
>   #define Ndis802_11APMode (Ndis802_11InfrastructureMax+1)
>   #endif
> @@ -279,34 +265,6 @@ enum UAPSD_MAX_SP {
>   #define NUM_PRE_AUTH_KEY 16
>   #define NUM_PMKID_CACHE NUM_PRE_AUTH_KEY
> 
> -/*
> -*	WPA2
> -*/
> -
> -struct pmkid_candidate {
> -	unsigned char BSSID[ETH_ALEN];
> -	u32 Flags;
> -};
> -
> -struct ndis_802_11_pmkid_list {
> -	u32 Version;       /*  Version of the structure */
> -	u32 NumCandidates; /*  No. of pmkid candidates */
> -	struct pmkid_candidate CandidateList[1];
> -};
> -
> -struct ndis_802_11_auth_encrypt {
> -	enum ndis_802_11_auth_mode AuthModeSupported;
> -	enum ndis_802_11_wep_status EncryptStatusSupported;
> -};
> -
> -struct ndis_802_11_cap {
> -	u32  Length;
> -	u32  Version;
> -	u32  NoOfPMKIDs;
> -	u32  NoOfAuthEncryptPairsSupported;
> -	struct ndis_802_11_auth_encrypt AuthenticationEncryptionSupported[1];
> -};
> -
>   u8 key_2char2num(u8 hch, u8 lch);
>   u8 key_char2num(u8 ch);
>   u8 str_2char2num(u8 hch, u8 lch);
> --
> 2.34.1
> 
> 
> 
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

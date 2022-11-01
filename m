Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED867B
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 22:07:44 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id d26so40566809eje.10
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 15:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsShDdmGa0grrRD1g2mF/83SuhjHV8rDIY0eEAKZRrA=;
        b=hsDl3TZT4VKq+2jijDnLHryvBmIZkT18GjdwWkTkIujYOpCZ4Y4o8NSXz4ON+d7ctb
         t20wvoAdXNLsnJ4hDq6ALpTrY2pCG7TVANWj3VeYllS3R67GBhjPuCTquklEzxLAIrFo
         wQ/A6ea9mzTAip0+UHa8Tid2nkjiVwT7A/+cXwKyZlABG48efrjY9k4Uu+2LDp7LVOWD
         fruJlgsCdtBFzFj5uIG6DXJh4yt6Kyz75x2ldLZATPuFuc49zGI6NCEYFre2jcxNnnLt
         70IvPZPXMiuyLHUniQ7Sh6YNT2I4sbLcu4RJmcT2gQTmdf5YXcFb9e/Wf3XjLO+5BW8i
         nwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsShDdmGa0grrRD1g2mF/83SuhjHV8rDIY0eEAKZRrA=;
        b=0YKR7c0GOPw4AehCnsfB7QxGgjpjoe8NeOzwZZQj5jFPqVo1V9rthIhdPB+ISJnWNM
         6KD205+EpCRDJMGPOegsYKGGfktaf9+YJuvacBa95ShXXXZ5Z2fXOOhEs6dvZia+v3LF
         MTFAiF6bms9JFoKESIg30uScwj3izjHtOiUIL+dyOw6Eg0MGpZUhJkLzuXBF7CptbHQY
         tLU7NEkmZvlvK3hWprzcQQfJbLOG5OCUEBEo7UGyhRq5aVvPAfQPOznS5Zy6LA5FBaD5
         ShQO+d9lFfQNik31/yTlwk9L3uT4UGyT5yhDj3rU6PiweG20Vm4PDRsIndQ8pvmvTCiS
         fwpA==
X-Gm-Message-State: ACrzQf2JzjYxNmB3CNGUiVopofHODv21TIZRZC0dIw/iMkq45vPM/tbN
	BwF3SEHnFgwBRtl5TCqMjk8=
X-Google-Smtp-Source: AMsMyM4mSnmfS5fWp8bvXroTKvFiH6z94K45BOHauWbEnUhQk4F0XU9zNy0cFEbKWY7oD5K7U5cFdA==
X-Received: by 2002:a17:906:36d1:b0:76c:a723:9445 with SMTP id b17-20020a17090636d100b0076ca7239445mr19762592ejc.548.1667340462822;
        Tue, 01 Nov 2022 15:07:42 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b885:c7c8:ee47:4872:331d? (p200300c78f2ab885c7c8ee474872331d.dip0.t-ipconnect.de. [2003:c7:8f2a:b885:c7c8:ee47:4872:331d])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906768300b0079e552fd860sm4604163ejm.152.2022.11.01.15.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 15:07:42 -0700 (PDT)
Message-ID: <f391a7cd-e57a-0643-1ba1-c859bf2f83a6@gmail.com>
Date: Tue, 1 Nov 2022 23:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] staging: rtl8192e: space formatting fixes in rtl_cam.c
Content-Language: en-US
To: Jerom van der Sar <jerom.vandersar@gmail.com>, gregkh@linuxfoundation.org
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <7d001a49-4e45-fda2-15fe-b05f2c340eaa@gmail.com>
 <20221101215246.4442-1-jerom.vandersar@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221101215246.4442-1-jerom.vandersar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/22 22:52, Jerom van der Sar wrote:
> Fixed a few coding style issues in rtl_cam.c such as double blank lines
> and lack of spaces around binary operators. Some other warnings still
> remain. These issues were found by scripts/checkpatch.pl.
> 
> This patch helps clean up the rtl8192e driver in staging, making it
> easier to read and maintain.
> 
> Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>.
> ---
> Changes in v2:
>    - Reverted some formatting fixes to make the diff easier to review.
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> index 41faeb4b9b9b..d5aaf24a0ddb 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> @@ -17,7 +17,7 @@ void rtl92e_cam_reset(struct net_device *dev)
>   {
>   	u32 ulcommand = 0;
>   
> -	ulcommand |= BIT31|BIT30;
> +	ulcommand |= BIT31 | BIT30;
>   	rtl92e_writel(dev, RWCAM, ulcommand);
>   }
>   
> @@ -40,7 +40,6 @@ void rtl92e_enable_hw_security_config(struct net_device *dev)
>   		SECR_value |= SCR_TxUseDK;
>   	}
>   
> -
>   	ieee->hwsec_active = 1;
>   	if ((ieee->pHTInfo->iot_action & HT_IOT_ACT_PURE_N_MODE) || !hwwep) {
>   		ieee->hwsec_active = 0;
> @@ -104,10 +103,9 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
>   	else
>   		usConfig |= BIT15 | (KeyType<<2) | KeyIndex;
>   
> -
>   	for (i = 0; i < CAM_CONTENT_COUNT; i++) {
>   		TargetCommand  = i + CAM_CONTENT_COUNT * EntryNo;
> -		TargetCommand |= BIT31|BIT16;
> +		TargetCommand |= BIT31 | BIT16;
>   
>   		if (i == 0) {
>   			TargetContent = (u32)(*(MacAddr+0)) << 16 |
> @@ -152,7 +150,6 @@ void rtl92e_cam_restore(struct net_device *dev)
>   
>   	if ((priv->rtllib->pairwise_key_type == KEY_TYPE_WEP40) ||
>   	    (priv->rtllib->pairwise_key_type == KEY_TYPE_WEP104)) {
> -
>   		for (EntryId = 0; EntryId < 4; EntryId++) {
>   			MacAddr = CAM_CONST_ADDR[EntryId];
>   			if (priv->rtllib->swcamtable[EntryId].bused) {


WARNING: Unexpected content after email: 'Jerom van der Sar 
<jerom.vandersar@gmail.com>.', should be: 'Jerom van der Sar 
<jerom.vandersar@gmail.com>'
#14:
Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>.


I cannot apply your patch.

Bye Philipp




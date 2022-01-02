Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472CD168
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 21:44:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id h15so39815122ljh.12
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 13:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FMeedJAM/soUFft4dLwmEecukljurYLI/Ey+pp0EcD8=;
        b=o4xoodImPAky4S+E99OQAsZLmM7glmo90i5nznhNt9fNe35KpdFpmUfN+jiQ0mvLON
         HRpOiQqx6lOuvmPGPU4tr6Ml4ITr0ttmFpHUNCDvU0AX8lffhl7D/r+Pd1lz5BnWuHY2
         feGmHDNaf4obqR/lGE7lAVnxkLIhjZSlZOD82vnoj2dpTZllSFWaVMf0mMsNUsIIqY/d
         P0Y+P0NwSwfPJkrfCf3DTVC4DLkQR93qIfnSVBijcyffEjrwc4Jex/ZsjuGKHKxiTG7Z
         lDTLWAVM8Jj1GEdmcw4WNMfqyjzXhHFDH9mLn+AqtXSofm5OS8SHqiBWiQIR1b3cMjyW
         H8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FMeedJAM/soUFft4dLwmEecukljurYLI/Ey+pp0EcD8=;
        b=tyAIXzMVK/Pn0Y+ZpTfkKlBrvDE3b9pAwFwKqL5uWEwlFKyBhm7dZI580lIyt6UyUC
         GzkcNJtU4Ird0eD38DHRuYHTWjVGxypvQEviYLraoRFZSFuMNiSoJ6VA+SQ+swXOAaMd
         PX5+TmLDmmyTe3t1OKvtSYGbea6tfMuvpoNSRvYYZTUjPCfnJzG9nNaUD4H19moEFtVO
         g+20mQhfGHI1GEoKhLjdWrDPHJTclbcQ4q2stGpApb1s4dakJVLGQ85oVYZx2faJCnm5
         HCOuB56Qdrag1KIjAn2yxjkfJMK1wxKM/Y7FXQ2sKVX9D7BUiq4tDbiiiw7cRwm2gmOv
         CvDQ==
X-Gm-Message-State: AOAM531ZvBnx69duSOedRwZqSkZUOUGYbkHme5rAQ+JKvwkNxZdy//YW
	FHEZ7ZmV3WIRvmC4eBTSpuE=
X-Google-Smtp-Source: ABdhPJwWWGBrUDZA8W7z0CJAjMI9vIe+DXEUHcSgH2jJ/EpegvLIJ0MqC0o9vZLaJi86Yh142AizZg==
X-Received: by 2002:a05:651c:12c9:: with SMTP id 9mr36811289lje.474.1641159853363;
        Sun, 02 Jan 2022 13:44:13 -0800 (PST)
Received: from [192.168.1.11] ([217.117.245.177])
        by smtp.gmail.com with ESMTPSA id 8sm3245140ljf.123.2022.01.02.13.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jan 2022 13:44:13 -0800 (PST)
Message-ID: <6d33d346-b797-aeb3-8b1b-64332e05fb87@gmail.com>
Date: Mon, 3 Jan 2022 00:44:12 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 5/5] staging: r8188eu: turbo scan is always off for
 r8188eu
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220102175932.89127-1-martin@kaiser.cx>
 <20220102175932.89127-6-martin@kaiser.cx>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220102175932.89127-6-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/2/22 20:59, Martin Kaiser wrote:
> Turbo scan is always disabled. Remove the TurboScanOff variable and
> related checks.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 21 +++++++------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
> index 0b982cc7c86f..6e0231099986 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
> @@ -87,28 +87,21 @@ rtl8188e_PHY_RF6052SetCckTxPower(
>   	struct hal_data_8188e *pHalData = &Adapter->haldata;
>   	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
>   	u32 TxAGC[2] = {0, 0}, tmpval = 0, pwrtrac_value;
> -	bool TurboScanOff = false;
>   	u8 idx1, idx2;
>   	u8 *ptr;
>   	u8 direction;
> -	/* FOR CE ,must disable turbo scan */
> -	TurboScanOff = true;
>   
>   	if (pmlmeext->sitesurvey_res.state == SCAN_PROCESS) {
>   		TxAGC[RF_PATH_A] = 0x3f3f3f3f;
>   		TxAGC[RF_PATH_B] = 0x3f3f3f3f;
>   
> -		TurboScanOff = true;/* disable turbo scan */
> -
> -		if (TurboScanOff) {
> -			for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
> -				TxAGC[idx1] =
> -					pPowerlevel[idx1] | (pPowerlevel[idx1] << 8) |
> -					(pPowerlevel[idx1] << 16) | (pPowerlevel[idx1] << 24);
> -				/*  2010/10/18 MH For external PA module. We need to limit power index to be less than 0x20. */
> -				if (TxAGC[idx1] > 0x20 && pHalData->ExternalPA)
> -					TxAGC[idx1] = 0x20;
> -			}
> +		for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
> +			TxAGC[idx1] =
> +				pPowerlevel[idx1] | (pPowerlevel[idx1] << 8) |
> +				(pPowerlevel[idx1] << 16) | (pPowerlevel[idx1] << 24);
> +			/*  2010/10/18 MH For external PA module. We need to limit power index to be less than 0x20. */
> +			if (TxAGC[idx1] > 0x20 && pHalData->ExternalPA)
> +				TxAGC[idx1] = 0x20;
>   		}
>   	} else {
>   		for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {

Hi Martin,

thanks for your clean up work!


It's a bit unrelated to the patch, but I found it while reviewing this. 
It's in the same function rtl8188e_PHY_RF6052SetCckTxPower():

89: 	u32 TxAGC[2] = {0, 0};
...
92	u8 *ptr;
...
129	for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
130		ptr = (u8 *)(&TxAGC[idx1]);
131		for (idx2 = 0; idx2 < 4; idx2++) {
132			if (*ptr > RF6052_MAX_TX_PWR)
133				*ptr = RF6052_MAX_TX_PWR;
134			ptr++;
135		}
136	}


What is going on here? Code just checks and writes to random place on 
stack outside TxAGC array? I might be missing something, but it looks 
wrong...

Just wanted to share, since I believe your knowledge about this driver 
is much deeper than mine :)

thanks


With regards,
Pavel Skripkin

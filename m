Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E178F52
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 21:59:05 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id v27so19421334eda.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLh5w4dw99cth2pYg0unkJaNdj+Qh3WCd+DLAPd/pBs=;
        b=R26ruTSmLvdCBjoOwOBlKd9UVjaTtqmWxL5c8i+lNxONvfdhw/vj86CLpJC/o156JZ
         kmxnkI2bXcs/R5P5mluMzZPPjaiSqKR9wjVeYn8U5JwloI5DLOX+h+gTa5fXkVpgPBC3
         pf+ceMQEWEAwVKvW5l7JSjXeGok4Re1vvNy11N+s1BJBhZB7IZzkOlLFJWMbXqMKRg9F
         of1LWYcAwbD2SGocDN4beDMeIece9SEYhrSF9FmNAK9+sYMllvReUZh+nys2p77zfM+t
         qbN7lux3C3rRpbnKP+xAInXYc2DeGadFmcBh7/tLqKqOOHO9RtRmyv12L/QETauVN4w9
         6C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLh5w4dw99cth2pYg0unkJaNdj+Qh3WCd+DLAPd/pBs=;
        b=17jFc2+7d7dytSo8SF7rxuB+fKH40O1R3MATp+nIO5SY1K4NY6rj5HCgVIX0w7whz8
         EnKDzRPJz5FAOJuqFMWJEvAIp/t4KOF179rLcVhd8quuGzQB5AMgzbQHkrErcydiBbXz
         pYv9QBKnoc1X5MDkCkodAN6Mn8pxtPdj0iDNx4cfwkwS2z3HvqtN9GmH002+ucW1LFGT
         w7iADpk1NAJVvLsF593doEGX+QIb2LXF1qQC16DVZ/wQa2t8UCJkN/Mt8QQSOGQEn9nd
         57eExKs9HXetgq0NVKU4HBGBjRzYtSS1KXR8TWfKBs1i9ttaPseaCn/0DK/xmsVL6hC9
         3NOg==
X-Gm-Message-State: ACrzQf25C43IaDw5qUOcrx8OH6kRDe8vcRtujNsjNzwFsvW+aHKjkooW
	245S9cU2qEMO8p42MR/fx7Q=
X-Google-Smtp-Source: AMsMyM6qOq7PL0h583tpUee7cd+FX84Wn3i+EyvDC3Vu3jSI8Xn/e9DEoxszVXP2fixzXFHKuoZ4DQ==
X-Received: by 2002:a05:6402:524e:b0:461:fa05:aff8 with SMTP id t14-20020a056402524e00b00461fa05aff8mr15963504edd.283.1667253543544;
        Mon, 31 Oct 2022 14:59:03 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906308700b0077e6be40e4asm3487922ejv.175.2022.10.31.14.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 14:59:02 -0700 (PDT)
Message-ID: <07f09a85-8875-42e1-38d6-40f6626ad27c@gmail.com>
Date: Mon, 31 Oct 2022 22:59:01 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: replace ternary operator with min, max,
 abs macros
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221031153743.8801-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221031153743.8801-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/22 16:37, Michael Straube wrote:
> Replace some ternary operators with the min(), max() or abs() macros
> to improve readability.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/core/rtw_xmit.c      | 3 +--
>   drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 2 +-
>   drivers/staging/r8188eu/hal/odm_RTL8188E.c   | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 4f8220428328..bd6c1a401c59 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -476,8 +476,7 @@ static uint rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
>   {
>   	uint len;
>   
> -	len = rtw_remainder_len(pfile);
> -	len = (rlen > len) ? len : rlen;
> +	len = min(rtw_remainder_len(pfile), rlen);
>   
>   	if (rmem)
>   		skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, len);
> diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> index 60cdfcf80daa..622f95d3f2ed 100644
> --- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> +++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
> @@ -583,7 +583,7 @@ static bool phy_SimularityCompare_8188E(
>   			tmp2 = resulta[c2][i];
>   		}
>   
> -		diff = (tmp1 > tmp2) ? (tmp1 - tmp2) : (tmp2 - tmp1);
> +		diff = abs(tmp1 - tmp2);
>   
>   		if (diff > MAX_TOLERANCE) {
>   			if ((i == 2 || i == 6) && !sim_bitmap) {
> diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
> index dd9c8291f025..f3f4074d4316 100644
> --- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
> +++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
> @@ -199,7 +199,7 @@ static void odm_HWAntDiv(struct odm_dm_struct *dm_odm)
>   			Aux_RSSI = (dm_fat_tbl->AuxAnt_Cnt[i] != 0) ? (dm_fat_tbl->AuxAnt_Sum[i] / dm_fat_tbl->AuxAnt_Cnt[i]) : 0;
>   			TargetAnt = (Main_RSSI >= Aux_RSSI) ? MAIN_ANT : AUX_ANT;
>   			/* 2 Select MaxRSSI for DIG */
> -			LocalMaxRSSI = (Main_RSSI > Aux_RSSI) ? Main_RSSI : Aux_RSSI;
> +			LocalMaxRSSI = max(Main_RSSI, Aux_RSSI);
>   			if ((LocalMaxRSSI > AntDivMaxRSSI) && (LocalMaxRSSI < 40))
>   				AntDivMaxRSSI = LocalMaxRSSI;
>   			if (LocalMaxRSSI > MaxRSSI)
> @@ -211,7 +211,7 @@ static void odm_HWAntDiv(struct odm_dm_struct *dm_odm)
>   			else if ((dm_fat_tbl->RxIdleAnt == AUX_ANT) && (Aux_RSSI == 0))
>   				Aux_RSSI = Main_RSSI;
>   
> -			LocalMinRSSI = (Main_RSSI > Aux_RSSI) ? Aux_RSSI : Main_RSSI;
> +			LocalMinRSSI = min(Main_RSSI, Aux_RSSI);
>   			if (LocalMinRSSI < MinRSSI) {
>   				MinRSSI = LocalMinRSSI;
>   				RxIdleAnt = TargetAnt;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150


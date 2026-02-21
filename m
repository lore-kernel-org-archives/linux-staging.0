Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32932F363E
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771702895; cv=none; b=ReLI2ouwRFKUGUgvnmLdPAvpxtXaelJV7g5EgdH6Gqt2r8qNWjWWICWe9yvYclIR03EH6+0qMg9CaMnu9I2ptTPTwsXRR2nLJgWQoK7RnDBe/4kmAEz8aTVDWbv3rQomuTZQ64JRc4VrpsNfVV3cXKypgn74YCSG4HvrxWGnEbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771702895; c=relaxed/simple;
	bh=s/NhWQ/BZNgwGlXcy6rlt9jzd8X/tBBqLuXLibHmDnQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lkXgZAC3tjWJzRmn1OjZgcCiM+DwzhT9x6sixueo/8DjzPSskTa5a3FiYJG4Re/jCWMwSYBbSNeRdF5/VqEs5iEmqd/0IQzJoW8Ye4v9j2oXcZ+izZrWLOSSbHdHvmUvvHAgh0y13tJIQ3NsTKkEp3pqksymxW7xzdqJ0v0OBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYGMrWia; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYGMrWia"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb3e22435fso335540685a.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 11:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771702893; x=1772307693; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/Z7mWbSjCwfsui089qPreYKwsyhV3h/cGODjZaetHY=;
        b=gYGMrWiafuiPV/ARWCqY30ETYBhMzqpDTBN+kVvlehK8LTzY0Ztv5d1DGRSA9NCeqW
         NFWg6ZzKiFQ5darb8e7uZlfPf8pBpArtYuiTbDSC4wN5GAIcu53FvGpGJ4Zf+fkBHqVK
         U+E+teklfSg1Gc4kONZhx5S0oXPUXqy1bc4gi70ABAtpU0r+f7Hi7UIk+HaPssfV34JH
         gVcyRZIzuNrQ4zmg9mTvEVRBWMDWUkaPDfSQRmK5zQhJlaJo3Wua/4Fb96TzHISaq+4X
         2mpNjzH686cUzr5n2Z3umSGTRbsn627pEJKqXEkKdikM0OVyJKZnl2Y5AcHQ3JFTrFux
         pwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771702893; x=1772307693;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/Z7mWbSjCwfsui089qPreYKwsyhV3h/cGODjZaetHY=;
        b=UlCUa4cSIjx9nQvjQTp9pm2v3cqw+BGwJ/nyhZ7UnBES1xdxHDHf6s62puhNI1Me9u
         cmX/Xlk6zrjiqx2VpCqM3UKEka79hTDLWaUuIvXj6suvggePsX6rX5lSol54YepipHYZ
         IPmnW2yOlOE/AkWnyLt2p9Hpia/3JAYi4xYTeTF6W09Oz19hu5bXe+lrOrK7C0DLKadd
         AI+degeMPDDHF88P6sJLqJgMJyhaC9HX/gHx9KoknsD98LZDs9a7zNWGPk9CHrg9GNld
         LVTfcbY5bS2Ku/iraeCwd5lRa4m3yIsw/6y/WQpSehIjy7fkpuFN9dsQognTfK7Z/LNf
         CzJA==
X-Forwarded-Encrypted: i=1; AJvYcCUrjvv0CLR0d0exFi97J1T3T/+MugVLgJg20vuzAOWjjGbdc84BvqCai4h8gBCUmwiqCH21MvMR73wP2iNx@lists.linux.dev
X-Gm-Message-State: AOJu0YzQUFQb2pbx7b/gpFpAxlefGmm5ijHDCaTq4KoDdoGOEXU/BM2+
	gXKeT34Wr8kgn1fN5Ras8hyTTZARPcEP2U9JzHKYLNDNLzbUxD0BYOMC
X-Gm-Gg: AZuq6aK3cSN9JCA6NG0xcsh5ZjEV8uwUnoVyIIMFB3FpKdOVgHC45z8yvM0U/enc+Wb
	DINdAbfmNN37ejVEdG0HTRhBUbPs+Z2Rt+gUzw7C5oMaB8R0iaW2zMQkzRQNai81OgOdttPi2QF
	Yq5DZwqvLVBVpZZud3Folf8kPjdp9Yw6lQWf9a/HnGRoAnG5M62qgtSTgrAM6NOjkZKPVlSw1yx
	grnj0S9IA2GuPP3GP7EdEQjvFpZWhRCz2drpC9WxZwWaNOcd3Jtz0+Gj95zIydr8BRawBSdh+k8
	829VivLSjPOZsa4531TECFc8tYSVoBlAdJodcRSgFeGhf++Eurr5KM9nmFvL4l2Xyrg4zUwnBWu
	ZaOLFdsjJwgvBXtahtVxnAtRxlolKmoLrYgdUDL9BrauE58A9q00QwjPzRTez6XB/5JNrrDaxxW
	RaFMJmvTyMtR7NYD2Rqo44EFGFHVgDpbeJK6gGIUQ4x52ip9HCXw==
X-Received: by 2002:a05:620a:489b:b0:8a9:eb31:1033 with SMTP id af79cd13be357-8cb8c659a35mr560787885a.30.1771702892816;
        Sat, 21 Feb 2026 11:41:32 -0800 (PST)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0eb04csm292384985a.25.2026.02.21.11.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 11:41:31 -0800 (PST)
Message-ID: <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com>
Date: Sat, 21 Feb 2026 15:41:27 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: Re: [PATCH v2 01/11] staging: stl8723bs: Use common round_up macro
To: Priit Laes <plaes@plaes.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Archit Anant <architanant5@gmail.com>, Minu Jin <s9430939@naver.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Thomas Gleixner <tglx@kernel.org>, Yuvraj Singh Chauhan
 <ysinghcin@gmail.com>, JJ Strnad <strnad.jj@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Julia Lawall <julia.lawall@inria.fr>,
 William Hansen-Baird <william.hansen.baird@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
 Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Navaneeth K <knavaneeth786@gmail.com>, Artur Stupa <arthur.stupa@gmail.com>,
 Michael Straube <straube.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Ethan Tidmore <ethantidmore06@gmail.com>, Zhuoheng Li
 <lizhuoheng@kylinos.cn>, Michael Huang <tehsiu.huang@gmail.com>,
 Nino Zhang <ninozhang001@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 =?UTF-8?Q?Rog=C3=A9rio_Fernandes_Pereira?= <rfp2005@gmail.com>,
 Diksha Kumari <dikshakdevgan@gmail.com>, yingche <zxcv2569763104@gmail.com>,
 Khushal Chitturi <khushalchitturi@gmail.com>,
 Karthikey D Kadati <karthikey3608@gmail.com>,
 Akiyoshi Kurita <weibu@redadmin.org>,
 Erick Karanja <karanja99erick@gmail.com>, SeungJu Cheon
 <suunj1331@gmail.com>, Sun Jian <sun.jian.kdev@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-2-plaes@plaes.org>
Content-Language: en-CA
In-Reply-To: <20260221190628.50273-2-plaes@plaes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Subject has a typo. Please correct it.

How did you test this? The driver code appears largely AI-generated 
unless it has been validated on actual hardware, such as Pine64 Wi-Fi 
module or another board compatible with rtl8723bs considering these 
changes are not just indentation based.

Best,
Vivek

On 2026-02-21 3:01 p.m., Priit Laes wrote:
> Get rid of driver-specific _RND macro in favor of kernel one.
>
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>   drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 6 +++---
>   drivers/staging/rtl8723bs/hal/sdio_ops.c          | 4 ++--
>   drivers/staging/rtl8723bs/include/osdep_service.h | 2 --
>   3 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> index a1f2cbf2cf55..c5b172c2f839 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> @@ -232,7 +232,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>   				/*  check xmit_buf size enough or not */
>   				txlen = txdesc_size + rtw_wlan_pkt_size(pxmitframe);
>   				if (!pxmitbuf ||
> -					((_RND(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
> +					((round_up(pxmitbuf->len, 8) + txlen) > max_xmit_len) ||
>   					(k >= (rtw_hal_sdio_max_txoqt_free_space(padapter) - 1))
>   				) {
>   					if (pxmitbuf) {
> @@ -303,8 +303,8 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
>   					txlen = txdesc_size + pxmitframe->attrib.last_txcmdsz;
>   					pxmitframe->pg_num = (txlen + 127) / 128;
>   					pxmitbuf->pg_num += (txlen + 127) / 128;
> -					pxmitbuf->ptail += _RND(txlen, 8); /*  round to 8 bytes alignment */
> -					pxmitbuf->len = _RND(pxmitbuf->len, 8) + txlen;
> +					pxmitbuf->ptail += round_up(txlen, 8);
> +					pxmitbuf->len = round_up(pxmitbuf->len, 8) + txlen;
>   				}
>   
>   				if (k != 1)
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index c9cb20c61a2b..6bfb8c0e519c 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -401,7 +401,7 @@ static u32 sdio_read_port(
>   	hal_sdio_get_cmd_addr_8723b(adapter, addr, hal->SdioRxFIFOCnt++, &addr);
>   
>   	if (cnt > psdio->block_transfer_len)
> -		cnt = _RND(cnt, psdio->block_transfer_len);
> +		cnt = round_up(cnt, psdio->block_transfer_len);
>   
>   	err = _sd_read(intfhdl, addr, cnt, mem);
>   
> @@ -448,7 +448,7 @@ static u32 sdio_write_port(
>   	hal_sdio_get_cmd_addr_8723b(adapter, addr, cnt >> 2, &addr);
>   
>   	if (cnt > psdio->block_transfer_len)
> -		cnt = _RND(cnt, psdio->block_transfer_len);
> +		cnt = round_up(cnt, psdio->block_transfer_len);
>   
>   	err = sd_write(intfhdl, addr, cnt, xmitbuf->pdata);
>   
> diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
> index 955e8678dc26..404f81756b27 100644
> --- a/drivers/staging/rtl8723bs/include/osdep_service.h
> +++ b/drivers/staging/rtl8723bs/include/osdep_service.h
> @@ -78,8 +78,6 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
>   
>   }
>   
> -#define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
> -
>   extern void rtw_free_netdev(struct net_device *netdev);
>   
>   /* Macros for handling unaligned memory accesses */

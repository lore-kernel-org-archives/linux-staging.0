Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F125B0AB
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 04:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779425281; cv=none; b=mxra8UQdf4wmEaekJgrVeLMylZQA4VBtN5kYjV9eCn1e7qKb2FMBKUwxiVPBnaXkLzS2saWUIVPANxZLd57h0yvafHaSysp7ErX4VbMUbT+UiDmKNvxl9P1LzylTySWKbbgibuqr7ioBnWRt9VGtpUxSixHpojdkDuIWwJvRq5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779425281; c=relaxed/simple;
	bh=0QYMLecI5r6DweFOGBYu3tCeAYXHrgbv+LqF+Wz15fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhddoMWGPOEpMFwiLg2hqIIVi6qOpOIA8iiFZLku6Sb+BYgSMbqASD+ZZ7+iKZ1tMRLimdMx7/atWRP63USqvs4yJIY7QjOOEUFAfR8PePF8WgP7ukjFsKdYDZb0LiCPejW9kylymtkR+MnvW7FiT1dcLK7+D1Bnw9hS3UmIkKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=d7yuc9y1; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="d7yuc9y1"
Received: from mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:bb8b:0:640:6ac7:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 5CDB98120A;
	Fri, 22 May 2026 07:47:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net (smtp) with ESMTPSA id olLCT15dNW20-iRV3Cf4A;
	Fri, 22 May 2026 07:47:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779425273;
	bh=imwjUihfhKeml0YJLszYTBOHE0TdDhufFPkOb88d6bc=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=d7yuc9y1oiGqnY6HqpaU/6oPYS/1K+Smkpkr7ySZqUr2797TUyk2z3EDW1ZQH7dg/
	 B7S8wa62Lujx6pu2YcUBfDi38hk7dVAYm8UVKtbVg8MPscJYK0H3E3CHAroiwkOlHJ
	 dCVkWvwdXqreM6Ii3tp9WJ+Ft650w6izhj5s5ceM=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <dc2b1c4e-bcb6-4adb-93e4-9228af4eff2c@sezginduran.net>
Date: Fri, 22 May 2026 07:47:49 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: clean up if-else logic in
 odm_HWConfig.c
Content-Language: tr
To: =?UTF-8?Q?Diego_Fernando_Mancera_G=C3=B3mez?=
 <diegomancera.dev@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev
Cc: m.steinmoetzger@gmail.com, guojy.bj@gmail.com, straube.linux@gmail.com,
 error27@gmail.com, linux-kernel@vger.kernel.org
References: <20260521210523.133725-1-diegomancera.dev@gmail.com>
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260521210523.133725-1-diegomancera.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/22/26 12:05 AM, Diego Fernando Mancera Gómez wrote:
> ---
>   drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index c88d669cb086..2e47734a0ae9 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -228,18 +228,11 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
>   		odm_parsing_cfo(dm_odm, pkt_info, phy_sta_rpt->path_cfotail);
>   	}
>   
> -	/*
> -	 * UI BSS List signal strength(in percentage), make it good
> -	 * looking, from 0~100.
> -	 * It is assigned to the BSS List in GetValueFromBeaconOrProbeRsp().
> -	 */
> -	if (is_cck_rate) {
> +	if (is_cck_rate)
>   		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
> -	} else {
> -		if (rf_rx_num != 0) {
> -			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
> -		}
> -	}
> +	else if (rf_rx_num != 0)
> +		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
> +
>   }
>   
>   static void odm_Process_RSSIForDM(
> @@ -437,4 +430,3 @@ enum hal_status ODM_ConfigBBWithHeaderFile(
>   
>   	return HAL_STATUS_SUCCESS;
>   }
> -

You need to add a commit body explaining the reasoning for this changes.

It must also contain `Signed-off-by:`.

Regards,
Ahmet Sezgin Duran

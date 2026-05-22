Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D3C357CF3
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779427805; cv=none; b=l0qGHfUhUpBYkECtqdzuKruTLEmirjf3LvI4DwtOhBXG0CS/g61KXfLqUA90a6J7p6mhZld/RS+ndydPKAdmAGUhncoTf4XCeOKK93rD/3u/8yd2ICHSoyZ94oTnMhSpRqiuYjZyGRP2xGMPjPILAwqN/FXCJms6SY3aGBJKJV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779427805; c=relaxed/simple;
	bh=i+5KdPKtqNGHu6YNHv33Crb9v+pW2BkLPgThqbnBg8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwsIrcx17GLGpslczebcfNXVw1xgou+FHCzmBF5l5GcVcPOLhFTIxDBDDX/PnOMpEsdNEhbX2YtfFx3hevb6HFTzQpLF5X40dXdDugX8XpnQZRjZPolFWsekd+q9CR1EficFtwPMVI0YruVXaBHZt7w4IYnaSmu4hcdqYvMHY1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=lx1TpI8R; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="lx1TpI8R"
Received: from mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:bb8b:0:640:6ac7:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id A2A49C0D31;
	Fri, 22 May 2026 08:22:20 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net (smtp) with ESMTPSA id HMMWuG5dUCg0-Uc0kfQKa;
	Fri, 22 May 2026 08:22:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779427340;
	bh=Vu4dzvR4IQ9KYhSvWmiyqJfL5WicNO6/BraXPbgkmTQ=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=lx1TpI8RHBjfvwXLXSxKWWXPO3Dy/rcxqwJAM9q9HFgD2gu8VaiUHCp/VWH3C4ccO
	 UoQkbz9eD0fK/M9lbbvcQK0w6bvkxMwMEEcespbSV7rNGTdkv02C3j8ZjiXH5zIrNS
	 ifUjgwEF+hCJyBichGuc4+zSkxI261gaRomx6/rw=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <b3d89e1b-8403-49ee-821e-122a770c6cfe@sezginduran.net>
Date: Fri, 22 May 2026 08:22:17 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: clean up if-else logic in
 odm_HWConfig.c
Content-Language: tr
To: =?UTF-8?Q?Diego_Fernando_Mancera_G=C3=B3mez?=
 <diegomancera.dev@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev
Cc: m.steinmoetzger@gmail.com, guojy.bj@gmail.com, straube.linux@gmail.com,
 error27@gmail.com, linux-kernel@vger.kernel.org
References: <20260522050429.161273-1-diegomancera.dev@gmail.com>
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260522050429.161273-1-diegomancera.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/22/26 8:04 AM, Diego Fernando Mancera Gómez wrote:
> Refactored redundant if-else blocks to a cleaner else-if structure in
> odm_HWConfig.c and fixed indentation to use tabs as required by the
> kernel coding style.
> 
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
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

You need to add list of changes in your commit, as it's V2 right now.

> -	/*
> -	 * UI BSS List signal strength(in percentage), make it good
> -	 * looking, from 0~100.
> -	 * It is assigned to the BSS List in GetValueFromBeaconOrProbeRsp().
> -	 */
> -	if (is_cck_rate) {

Why remove comments? Any reasoning?
>   static void odm_Process_RSSIForDM(
> @@ -437,4 +430,3 @@ enum hal_status ODM_ConfigBBWithHeaderFile(
>   
>   	return HAL_STATUS_SUCCESS;
>   }
> 
You also removed a blank line, it's not related to your actual changes. 
It's usually advised to do one type of change in a single commit.

Regards,
Ahmet Sezgin Duran

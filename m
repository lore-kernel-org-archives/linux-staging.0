Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937A79DA4
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709493718; cv=none; b=uqVd10Xrt4kqq5Pc+a9FJoj+Xj4AX3xd1Ksw9D4LRx/Bz5k8JvzgIdL1o1vD2H5hHHJBgkVxWjMm1k092Xyd/8YBfWMsJsj2p1zoNPjD+9wSSiOGiEOyvxzonIDQIKiE3fP3VT+fAThpxeLmpbVPDwYANVCnLJjv2hN0DclZr+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709493718; c=relaxed/simple;
	bh=Z4ARjctXdInaTulfH0l39W/5hUBT3Mx6CnyDsRwi5AI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VOeWJV1yOyeQxxgDeaE2GnE2CON5RTuaThDyCCr9d65KIlNOV3lHztK87G6mUQk2mOptZCnwu5/FX6PxRubz7sqU4+h/lkkIOjO/H20nlcDVuQxoqhWq4Kdz02HgD06wRYeFqUzO+em1Ezmf2S1NiZlMEzaSkl9d7zCPF64WMFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/xydUUi; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/xydUUi"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51334491779so698000e87.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709493715; x=1710098515; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/48/JKby1GAL8JfgGJx3fO2g/mkSQ2r0j63ahzXbQY=;
        b=j/xydUUiySReelqn/jlkCKXH96NGtmbgYMPGnolV7GQgOT2JWNzxdCRbbL3v4E2uig
         0YWcKSzpjmGY6UlYs78cATdlPnBj+st+cxOImkBsIxkSFNPW/axXBAJEAmvJxAFljTE8
         RyRX0TOl5HcmYL2CyNID2QXmVoI5ETmwUlgBHw6ivc/Gg9ENw8wS9qaZIKFvT9fVdfwU
         38cE/A+1KbQ49FsglJyDsoTL1jy2pI6hNjsEQI0d5yKdb3EgVaxZ0iuLHUvie/3wCc2w
         FaYfylqo351xvEjYXbA/8RXrMzFGMlotptjku6fBmnqzMomyIWjtCuF3cG0dPL9GjGfW
         7WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709493715; x=1710098515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/48/JKby1GAL8JfgGJx3fO2g/mkSQ2r0j63ahzXbQY=;
        b=JfJOfrOfl6oFO0NunEy3y8di7+ZlfBtyqxxzeS9yDzRvcZ1Y9NdXJLxgAC8pA+w0Jd
         IcZuMVlWsrc8dmAaF0JEfwybLIgtgYHx9rogLitS9gEN8N2m/jxAWKmmmyGTdbO6O9IJ
         Og3VdPyakgKKba03E/kigKgYZ7UkzNv7knUZMRjZns4haMzZhkxtqWF0NtO+f56y3zdH
         nvYeZWYlhGLHC+1SpDaXMNcexKDuOxBTBd59jcYQM5aCtRTeRpAUGFGNttZUdW6AV6AP
         yZEGTE95LTNgfAjkuOtWxSpDgIZWmqhBYv7CizSuRftafaaFF9X82MV+gSH1yRjhqYWN
         jybw==
X-Gm-Message-State: AOJu0Yyp2FbVlBi32NcTEb06p8wivYS+NZGkf5zyi2hnJijwkSc/RT9T
	tL+tRGfy2yuAl9A0Zqof2U0tfFRTnOVa8kTS9IetZHHblt31Bl5V
X-Google-Smtp-Source: AGHT+IEdzvGOfJaJFfR6dGZMvCX4xDWmbnCege8hFqnLHxzPzMwPajFoJC8GzvkolyvM5Mem/j1Bxw==
X-Received: by 2002:ac2:4648:0:b0:513:2fcb:da02 with SMTP id s8-20020ac24648000000b005132fcbda02mr3710173lfo.2.1709493714917;
        Sun, 03 Mar 2024 11:21:54 -0800 (PST)
Received: from [192.168.0.101] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id cm29-20020a170906f59d00b00a3ce60b003asm4035741ejd.176.2024.03.03.11.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 11:21:54 -0800 (PST)
Message-ID: <2df748b9-9a7f-4ae7-b871-a4a9df9297f3@gmail.com>
Date: Sun, 3 Mar 2024 20:21:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Staging: rtl8192e: Declare variable with static
To: Ariel Silver <arielsilver77@gmail.com>, gregkh@linuxfoundation.org,
 yogi.kernel@gmail.com, dan.carpenter@linaro.org, straube.linux@gmail.com,
 garyrookard@fastmail.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240301153128.13974-1-arielsilver77@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240301153128.13974-1-arielsilver77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/24 16:31, Ariel Silver wrote:
> Fixed sparse warning:
> "'dm_rx_path_sel_table' was not declared. Should it be static?"
> As dm_rx_path_sel_table is used only in rtl_dm.c it should be static.
> 
> Signed-off-by: Ariel Silver <arielsilver77@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> index 92143c50c149..850ee6ae1f02 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> @@ -144,7 +144,7 @@ const u8 dm_cck_tx_bb_gain_ch14[CCK_TX_BB_GAIN_TABLE_LEN][8] = {
>   /*------------------------Define global variable-----------------------------*/
>   struct dig_t dm_digtable;
>   
> -struct drx_path_sel dm_rx_path_sel_table;
> +static struct drx_path_sel dm_rx_path_sel_table;
>   /*------------------------Define global variable-----------------------------*/
>   
>   

Hi Ariel,

I need to tell you that you need a change history. There is also the v2 
missing in the subject. Please make a v3 with change history.

Thanks

Bye Philipp

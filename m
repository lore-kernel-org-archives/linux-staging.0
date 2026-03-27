Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C937FF4D;
	Fri, 27 Mar 2026 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640344; cv=none; b=JxXiWu8V3zA5kXSblHgOX68IfFenn4p9oktozYcxq8Vtw7IqGVzpebJ5BehCR+03Sa00ataT0K0zetuKTehEnJze9Exn0LVRClX244pgc2sEetwXprd6z3gBplUuMWWPWVMTFvkGGHYMk3u+B1T14HcS6E37Ps3fnne4VafiUW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640344; c=relaxed/simple;
	bh=wxyw4UM4IGorWYCsVrvmvQZdqO+BT1gaGXvQMIaltFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuU1t165l3MeC2HwdR8pCxqo5KnL3DnjDdi2A/ELdpO7By63+mo6gP7YXCw2NhvpBBByfBHMigyZZk1QpYwSFTBQLNBYOVSrQ6x6BeVsf6bUuYPf9l9Ts/EWSW83IJBylLP7DVwd+hKfFPHN7Fn2P2rBGuJi4SVt+jC+01xTyJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLufeOlo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLufeOlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C659C19423;
	Fri, 27 Mar 2026 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774640343;
	bh=wxyw4UM4IGorWYCsVrvmvQZdqO+BT1gaGXvQMIaltFo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BLufeOloWxBHHxhYtnaLA543LLwIy/tZ4BTPNVanOnZyd86IyEhVSCbjJW/z5kLtC
	 B7ekkhTxR7n+Rh54RnCyrGaBhd5NP+kXRSd+bdjS2tGPeXtXpgGb1yXeNBSkJvV3Tv
	 HPo/ZDu15zfVrl1ZZxLvfHsqbLwnlqLND0JhO83NPC2GX9nJXrp8AhpATIhIxHp9lP
	 pjXZey4Izlm+4gM2DEqn3GdkaHNygJ+Zb9uhO3l3VSTldozqV/drV5x/q/KjW6T321
	 3yS32jYoMdDE3gs7TL68QN8BL+2mkPLHl3o6hLn6zkTTJBQDwuhRTMchBvsPUeuXzI
	 +cn4ZNiH3oiVA==
Message-ID: <0aa6fdc7-986b-4673-b687-e2db7c01e1f5@kernel.org>
Date: Fri, 27 Mar 2026 20:39:00 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: remove functions doing ftrace
 like logging
To: Adarsh Das <adarshdas950@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260201142415.83595-1-adarshdas950@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260201142415.83595-1-adarshdas950@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1-Feb-26 15:24, Adarsh Das wrote:
> Remove ia_css_debug_dtrace() calls which only log function entry.
> ftrace should be used instead.
> 
> Signed-off-by: Adarsh Das <adarshdas950@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  .../media/atomisp/pci/ia_css_isp_configs.c    | 26 -------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> index 38c9c62366d6..1dce9fa926ab 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> +++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.c
> @@ -18,8 +18,6 @@ int ia_css_configure_iterator(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -41,8 +39,6 @@ int ia_css_configure_copy_output(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -66,8 +62,6 @@ int ia_css_configure_crop(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -89,8 +83,6 @@ int ia_css_configure_fpn(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -111,8 +103,6 @@ int ia_css_configure_dvs(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -133,8 +123,6 @@ int ia_css_configure_qplane(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -156,8 +144,6 @@ int ia_css_configure_output0(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -179,8 +165,6 @@ int ia_css_configure_output1(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -202,8 +186,6 @@ int ia_css_configure_output(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -225,8 +207,6 @@ int ia_css_configure_raw(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -248,8 +228,6 @@ int ia_css_configure_tnr(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -271,8 +249,6 @@ int ia_css_configure_ref(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  
> @@ -294,8 +270,6 @@ int ia_css_configure_vf(const struct ia_css_binary *binary,
>  	unsigned int offset = 0;
>  	unsigned int size   = 0;
>  
> -	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s:\n", __func__);
> -
>  	if (!binary->info->mem_offsets.offsets.config)
>  		return 0;
>  


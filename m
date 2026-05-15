Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04577344020
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 05:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821299; cv=none; b=cUukogS5FWXjVQfPOmJh54C8boP32K48RfFg9Ks/gFGJWXWmAsBWIzdkIMjyp7E1zF8cU5thToRtcy7rxTPfhadD2litVr07VR8y7HOHA5+M2vCw6al3ePaT1kHNy1KMDwzkLlfCVFNvkV8L2Vs6U2JZtIEyvQ8Zc02Ig4Ldnvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821299; c=relaxed/simple;
	bh=DzbXi/jlkOVHwlHburr4UwvPtBpi81PXZhq/dvOzqWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekmmmy2hrCJwjuB5r5l1+84bshaU/2SqMgkfd+cpEVObG5xffHUWDrKTzv8Ulk0Hqh8QD9xFTnkTS6uXeamUa1DhvLJKPS8Lmu8Rn9bNQKnLxG+DfDMdIR2HLVOPOivpl8jBu/h3WO23lFEzVWeKLViYYzxSM6VLgcWFVvxmpwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=Bw9Y16cs; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="Bw9Y16cs"
Received: from mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:638c:0:640:aae5:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 12CE280C2B;
	Fri, 15 May 2026 07:54:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net (smtp) with ESMTPSA id JsEaklcQceA0-8Phl0hLN;
	Fri, 15 May 2026 07:54:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1778820862;
	bh=P9BEFTaw0CY3T+PHeGFMZEjQ90yKVcLClc+xVbINdX4=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=Bw9Y16csYIQZ9Zo4VVkhHoc8sWg9oWl8iXNPz8FKm5NKQUMzUNa3R7ZpKkkl9S5IF
	 3bDEBbJj44NsZNEbL4bOXyLHQEFm/kCMEtKVz1lcgWrEilVWAAhSF/MCQx8YF2xbOO
	 0YK2ep4htVT9AxHRvx7TDW6F0EP/bOnPRLg0xd+Q=
Authentication-Results: mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <8c518196-d5c5-448d-92ed-2e9ee3ad5522@sezginduran.net>
Date: Fri, 15 May 2026 07:54:19 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: sm750fb: rename CamelCase variables in
 sm750_hw.c
To: Rupesh Majhi <zoone.rupert@gmail.com>, gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260514223749.2321542-1-zoone.rupert@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260514223749.2321542-1-zoone.rupert@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/26 1:37 AM, Rupesh Majhi wrote:
> Renamed the following CamelCase variables to snake_case to comply
> with Linux kernel coding style:
> - pvReg -> pv_reg
> - pvMem -> pv_mem
> - initPram -> init_parm
> 
> Issue found by checkpatch.
> 
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
> ---
>   drivers/staging/sm750fb/sm750_hw.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index ce46f240cbaf..ce6a0d2ebbb5 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -49,19 +49,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>   	}
>   
>   	/* now map mmio and vidmem */
> -	sm750_dev->pvReg =
> +	sm750_dev->pv_reg =
>   		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
> -	if (!sm750_dev->pvReg) {
> +	if (!sm750_dev->pv_reg) {
>   		pr_err("mmio failed\n");
>   		ret = -EFAULT;
>   		goto exit;
>   	}
> -	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
> +	pr_info("mmio virtual addr = %p\n", sm750_dev->pv_reg);
>   
> -	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
> -	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
> +	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
> +	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
>   
> -	mmio750 = sm750_dev->pvReg;
> +	mmio750 = sm750_dev->pv_reg;
>   	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
>   
>   	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
> @@ -76,15 +76,15 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>   		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
>   
>   	/* reserve the vidmem space of smi adaptor */
> -	sm750_dev->pvMem =
> +	sm750_dev->pv_mem =
>   		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
> -	if (!sm750_dev->pvMem) {
> -		iounmap(sm750_dev->pvReg);
> +	if (!sm750_dev->pv_mem) {
> +		iounmap(sm750_dev->pv_reg);
>   		pr_err("Map video memory failed\n");
>   		ret = -EFAULT;
>   		goto exit;
>   	}
> -	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
> +	pr_info("video memory vaddr = %p\n", sm750_dev->pv_mem);
>   exit:
>   	return ret;
>   }
> @@ -93,7 +93,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>   {
>   	struct init_status *parm;
>   
> -	parm = &sm750_dev->initParm;
> +	parm = &sm750_dev->init_parm;
>   	if (parm->chip_clk == 0)
>   		parm->chip_clk = (sm750_get_chip_type() == SM750LE) ?
>   					       DEFAULT_SM750LE_CHIP_CLOCK :
> @@ -104,7 +104,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>   	if (parm->master_clk == 0)
>   		parm->master_clk = parm->chip_clk / 3;
>   
> -	ddk750_init_hw((struct initchip_param *)&sm750_dev->initParm);
> +	ddk750_init_hw((struct initchip_param *)&sm750_dev->init_parm);
>   	/* for sm718, open pci burst */
>   	if (sm750_dev->devid == 0x718) {
>   		poke32(SYSTEM_CTRL,

Did you create this patch from Greg's latest staging-testing branch?

Your patch doesn't apply. `pvMem` does not exist in the latest code.

Regards,
Ahmet Sezgin Duran

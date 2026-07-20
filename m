Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61C3CB543
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534469; cv=none; b=aIgD+9rDv0busHScetZSJt7GM/k2UjDUHg4/SiixUyyr3sTQqCwunOzUTf9wQKbWcLABVPX5brrsspDas9KyvzMP3+Jwi6sGoBmHWFX5LpXE0kDRFDJX3Ah4axHds/9I54LqU+853BPgjwC03vOIvMLrCgjcWs5tAuKGhtQwPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534469; c=relaxed/simple;
	bh=TCQHs+rArkoqijduLYw5wOiMiputSAl44AecWhYBsN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inyr7JfrwWKEMGdoQtpGyKioWS5X+8BpobpRvXN5dbUJuE/EXLSjH1m8SYIjnEWUTTkxU3U+RNm4JIRYW0dANX7Ira5L5w3B1bnG273A/buDUD9rRr0TbrUN6vp0efkz6qWVD/oe8q7cou67sujEuaIaLVWyrgHf2TEc7Nz0+e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=LzYXiiPS; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="LzYXiiPS"
Received: from mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3d46:0:640:8ea9:0])
	by forward500d.mail.yandex.net (postfix) with ESMTPS id 6F32081BE3;
	Mon, 20 Jul 2026 10:54:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net (smtp) with ESMTPSA id lsPAN91eGGk0-4cxjBAB8;
	Mon, 20 Jul 2026 10:54:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1784534091;
	bh=xZT4y8ftoTSX4hi6pZwDmuUTQ+yHour+L+LW6qHnlMs=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=LzYXiiPS9Kd3IsN/zYRdmtFtv/kqFEvSAXR5WEn4J61wW89lVIVtnBnKRp3zSnQ9m
	 dCOqP2XdrprtJjUKwaWlTorD/xfHfKMMyc5K1XYLYeeKff3zgGQ7yOVQFfOaEddtG9
	 Sqo3BW5T/YB1s2QP0GpYarZ7G8pWFEJFMmWt/78s=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <ff52daad-657b-4f46-9ef6-bb2194a6c221@sezginduran.net>
Date: Mon, 20 Jul 2026 10:54:46 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: sm750fb: rename pvReg to avoid CamelCase
To: Olivier Tanoh <olivier.tanoh19@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260720074804.29657-1-olivier.tanoh19@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20260720074804.29657-1-olivier.tanoh19@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 10:48 AM, Olivier Tanoh wrote:
> Fix checkpatch.pl warning regarding the use of CamelCase:
> CHECK: Avoid CamelCase: <pvReg>
> 
> Rename the struct member pvReg to reg across the driver to
> comply with the Linux kernel coding style.
> 
> Signed-off-by: Olivier Tanoh <olivier.tanoh19@gmail.com>
> ---
>   drivers/staging/sm750fb/sm750.c    |  4 ++--
>   drivers/staging/sm750fb/sm750.h    |  2 +-
>   drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
>   3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 89c811e0806c..c5f43a364437 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
>   	 * must be set after crtc member initialized
>   	 */
>   	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
> -	crtc->cursor.mmio = sm750_dev->pvReg +
> +	crtc->cursor.mmio = sm750_dev->pvreg +
>   		0x800f0 + (int)crtc->channel * 0x140;
>   
>   	crtc->cursor.max_h = 64;
> @@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
>   	sm750fb_framebuffer_release(sm750_dev);
>   	arch_phys_wc_del(sm750_dev->mtrr.vram);
>   
> -	iounmap(sm750_dev->pvReg);
> +	iounmap(sm750_dev->pvreg);
>   	iounmap(sm750_dev->vmem);
>   	pci_release_region(pdev, 1);
>   	kfree(g_settings);
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index d2c522e67f26..39471d7f2696 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -97,7 +97,7 @@ struct sm750_dev {
>   	unsigned long vidreg_start;
>   	__u32 vidmem_size;
>   	__u32 vidreg_size;
> -	void __iomem *pvReg;
> +	void __iomem *pvreg;
>   	unsigned char __iomem *vmem;
>   	/* locks*/
>   	spinlock_t slock;
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index 34a837fb4b64..d1f021e31a96 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>   	}
>   
>   	/* now map mmio and vidmem */
> -	sm750_dev->pvReg =
> +	sm750_dev->pvreg =
>   		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
> -	if (!sm750_dev->pvReg) {
> +	if (!sm750_dev->pvreg) {
>   		dev_err(&pdev->dev, "mmio failed\n");
>   		ret = -EFAULT;
>   		goto err_release_region;
>   	}
>   
> -	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
> -	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
> +	sm750_dev->accel.dpr_base = sm750_dev->pvreg + DE_BASE_ADDR_TYPE1;
> +	sm750_dev->accel.dp_port_base = sm750_dev->pvreg + DE_PORT_ADDR_TYPE1;
>   
> -	mmio750 = sm750_dev->pvReg;
> +	mmio750 = sm750_dev->pvreg;
>   	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
>   
>   	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
> @@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>   	return 0;
>   
>   err_unmap_reg:
> -	iounmap(sm750_dev->pvReg);
> +	iounmap(sm750_dev->pvreg);
>   err_release_region:
>   	pci_release_region(pdev, 1);
>   	return ret;

Does not apply to Greg's staging-testing branch. `pvReg` was already 
renamed to `mmio` before.

Regards,
Ahmet Sezgin Duran

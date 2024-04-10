Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14441552EF
	for <linux-staging@lists.linux.dev>; Wed, 10 Apr 2024 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712746096; cv=none; b=JJR6f7U96xbIr+ZEUTXhoWTUzgbPchdo9PPYa2j9VFOuzW+aCd+uhc34amd/oiGDZRdt/Yn91pphDEn5GFcXRHTk90+b3fitj0GLNRyMao4hNNtRoxgcVaGYs4gxqH+EAuBc3LAbn6hy5CDrAjOCiQC6PBrTr8tzvAnN8jn9fbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712746096; c=relaxed/simple;
	bh=3Yb1ghpPTQ86XpldcVJrb9JNr752HZfwLU+Be/0ePOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAsjM6Wd0F56I+A9wLFpT0R1BirK08ZENLXObUAzynj+Rb32C2o1kG/Ijw4BInI58utSUhbQNGf3aGYp79n0+DsBVK3u2u+BHJBGMNq1S4h7Tfy8pKhxfBdQ34ttASwjLzsyIhEVr94gfPh2y5VJ+HD1j6oNMjteCHUaRabRAeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wy1jXUpZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wy1jXUpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712746093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3VI9T4uivNjRj5++S1JJ33tXKS8Bk1Y/4/7XhHNepY=;
	b=Wy1jXUpZXbYQO8ah+PKVTQ68x1prfTOBYibiJRMWpwbewahC9gK5AiGgQI60jPO1jHQVpX
	xAmj206zyJFScEot0ZX9Ljh1xtYMCNdSewM1aMaOaGHpzYk603z2+8vOdzOc5bsjkidWUE
	zZd8ifEPwrf51UIqt3/QDs0WLDxhTxY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-ql9gFLkxP8iOCyz4XbVbjQ-1; Wed, 10 Apr 2024 06:48:12 -0400
X-MC-Unique: ql9gFLkxP8iOCyz4XbVbjQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a51ca921462so199184966b.1
        for <linux-staging@lists.linux.dev>; Wed, 10 Apr 2024 03:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712746091; x=1713350891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3VI9T4uivNjRj5++S1JJ33tXKS8Bk1Y/4/7XhHNepY=;
        b=K9tj6DgfWZ8oU7KHGXav69widLknZcTxfgv6hiooF/Amyri8/wIL4gOlT/8yDHGZVV
         XiwnTXgdjdzfKygFiiC+nypOYEVI9txK0WguiUMTVs9ilW2/XEWcDh2rKm53tNyCZpre
         +eSBHwqUQqq/jDq1jKeHioOCvBgVMrfKvVxMQc6CEUcCek5fyz9iVw39SOydKqgE2pVt
         PoAVMg8CMX5VK0LCMNOVKJe/GRKPhBeouiAdAa3a9oyKCRHahf9BhyOjVEVyln7pjP3n
         injPP+tuhz99s0fjn/LsXoMl5ORZt/0t2c8A7Rai9eSbBQoZONqYkBDG5TKC9Nn8XmkD
         e60A==
X-Forwarded-Encrypted: i=1; AJvYcCWfsfW5jgUuDwK7lppknirY2ZZwYoylWK/dKKhWTo/bP8OhJDpu7WaIk+9MDTGqVsYF0Qay5c01J4pGb1ZlxSCUErfHynSRTVN1eGQANg==
X-Gm-Message-State: AOJu0YzMEVDGEKOp7bJKZwpWtnZ0lFvIglsj/Axxby7f2yhWokMwQ+m+
	Ufrs+WZ8XvmRT55IKEBVgoWYNkOB0AzYDOuHOad9GtvKbnX6Jfrscr+MBdDyy68Vf2iR8LH1IZ4
	9/teWEDxqVz+oS74RH1q2oQNMr8V8iKfb80qoeF+7q2ge7dn01VkY5tP6VshsfvE=
X-Received: by 2002:a50:8a84:0:b0:56d:c722:93a3 with SMTP id j4-20020a508a84000000b0056dc72293a3mr1740109edj.21.1712746091321;
        Wed, 10 Apr 2024 03:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0AVH2rE/fy4MIBSvrtzt9zQf1zOiezMHKpxPj3u+E8iYjX4bJ6t8tKVOrC8dvkLrwFtFHXg==
X-Received: by 2002:a50:8a84:0:b0:56d:c722:93a3 with SMTP id j4-20020a508a84000000b0056dc72293a3mr1740099edj.21.1712746090984;
        Wed, 10 Apr 2024 03:48:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fe10-20020a056402390a00b0056e4556834csm4964425edb.66.2024.04.10.03.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 03:48:10 -0700 (PDT)
Message-ID: <38dd4c60-e951-4951-bbad-90116af4603e@redhat.com>
Date: Wed, 10 Apr 2024 12:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: atomisp: Get rid of PCI device ID hack
 check
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240402204447.294280-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240402204447.294280-1-andriy.shevchenko@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 4/2/24 10:44 PM, Andy Shevchenko wrote:
> Always check exact PCI ID match and drop hack checks.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  .../media/atomisp/pci/atomisp_internal.h      |  3 +-
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  | 40 +++++++++----------
>  2 files changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> index bba9bc64d447..e6a090d9f310 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> @@ -49,14 +49,13 @@
>  	(((isp)->media_dev.hw_revision & ATOMISP_HW_REVISION_MASK) == \
>  	 ((rev) << ATOMISP_HW_REVISION_SHIFT))
>  
> -#define ATOMISP_PCI_DEVICE_SOC_MASK	0xfff8
> +#define ATOMISP_PCI_DEVICE_SOC_BYT	0x0f38
>  /* MRFLD with 0x1178: ISP freq can burst to 457MHz */
>  #define ATOMISP_PCI_DEVICE_SOC_MRFLD	0x1178
>  /* MRFLD with 0x1179: max ISP freq limited to 400MHz */
>  #define ATOMISP_PCI_DEVICE_SOC_MRFLD_1179	0x1179
>  /* MRFLD with 0x117a: max ISP freq is 400MHz and max freq at Vmin is 200MHz */
>  #define ATOMISP_PCI_DEVICE_SOC_MRFLD_117A	0x117a
> -#define ATOMISP_PCI_DEVICE_SOC_BYT	0x0f38
>  #define ATOMISP_PCI_DEVICE_SOC_ANN	0x1478
>  #define ATOMISP_PCI_DEVICE_SOC_CHT	0x22b8
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index f736e54c7df3..4f414b812408 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1238,7 +1238,8 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  	const struct atomisp_platform_data *pdata;
>  	struct atomisp_device *isp;
>  	unsigned int start;
> -	int err, val;
> +	u32 val;
> +	int err;
>  
>  	/* Pointer to struct device. */
>  	atomisp_dev = &pdev->dev;
> @@ -1266,8 +1267,10 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  
>  	pci_set_drvdata(pdev, isp);
>  
> -	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
> +	switch (id->device) {
>  	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
> +	case ATOMISP_PCI_DEVICE_SOC_MRFLD_1179:
> +	case ATOMISP_PCI_DEVICE_SOC_MRFLD_117A:
>  		isp->media_dev.hw_revision =
>  		    (ATOMISP_HW_REVISION_ISP2400
>  		     << ATOMISP_HW_REVISION_SHIFT) |
> @@ -1420,28 +1423,25 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  	 */
>  	atomisp_css2_hw_store_32(MRFLD_CSI_RECEIVER_SELECTION_REG, 1);
>  
> -	if ((id->device & ATOMISP_PCI_DEVICE_SOC_MASK) ==
> -	    ATOMISP_PCI_DEVICE_SOC_MRFLD) {
> -		u32 csi_afe_trim;
> -
> +	switch (id->device) {
> +	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
> +	case ATOMISP_PCI_DEVICE_SOC_MRFLD_1179:
> +	case ATOMISP_PCI_DEVICE_SOC_MRFLD_117A:
>  		/*
>  		 * Workaround for imbalance data eye issue which is observed
>  		 * on TNG B0.
>  		 */
> -		pci_read_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, &csi_afe_trim);
> -		csi_afe_trim &= ~((MRFLD_PCI_CSI_HSRXCLKTRIM_MASK <<
> -				   MRFLD_PCI_CSI1_HSRXCLKTRIM_SHIFT) |
> -				  (MRFLD_PCI_CSI_HSRXCLKTRIM_MASK <<
> -				   MRFLD_PCI_CSI2_HSRXCLKTRIM_SHIFT) |
> -				  (MRFLD_PCI_CSI_HSRXCLKTRIM_MASK <<
> -				   MRFLD_PCI_CSI3_HSRXCLKTRIM_SHIFT));
> -		csi_afe_trim |= (MRFLD_PCI_CSI1_HSRXCLKTRIM <<
> -				 MRFLD_PCI_CSI1_HSRXCLKTRIM_SHIFT) |
> -				(MRFLD_PCI_CSI2_HSRXCLKTRIM <<
> -				 MRFLD_PCI_CSI2_HSRXCLKTRIM_SHIFT) |
> -				(MRFLD_PCI_CSI3_HSRXCLKTRIM <<
> -				 MRFLD_PCI_CSI3_HSRXCLKTRIM_SHIFT);
> -		pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, csi_afe_trim);
> +		pci_read_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, &val);
> +		val &= ~((MRFLD_PCI_CSI_HSRXCLKTRIM_MASK << MRFLD_PCI_CSI1_HSRXCLKTRIM_SHIFT) |
> +			 (MRFLD_PCI_CSI_HSRXCLKTRIM_MASK << MRFLD_PCI_CSI2_HSRXCLKTRIM_SHIFT) |
> +			 (MRFLD_PCI_CSI_HSRXCLKTRIM_MASK << MRFLD_PCI_CSI3_HSRXCLKTRIM_SHIFT));
> +		val |= (MRFLD_PCI_CSI1_HSRXCLKTRIM << MRFLD_PCI_CSI1_HSRXCLKTRIM_SHIFT) |
> +		       (MRFLD_PCI_CSI2_HSRXCLKTRIM << MRFLD_PCI_CSI2_HSRXCLKTRIM_SHIFT) |
> +		       (MRFLD_PCI_CSI3_HSRXCLKTRIM << MRFLD_PCI_CSI3_HSRXCLKTRIM_SHIFT);
> +		pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, val);
> +		break;
> +	default:
> +		break;
>  	}
>  
>  	err = atomisp_initialize_modules(isp);


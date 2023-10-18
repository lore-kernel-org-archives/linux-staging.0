Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894698C1A;
	Wed, 18 Oct 2023 07:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="JeXn9jna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vcu3uAf4b7wXHM90ULwgxygy6I2chzudc/2fybRwZY0=;
  b=JeXn9jnaVB4JSNDYOZh2uAhfNq8UgLIlxRUdRdEt109VFnhwdv6I1UIY
   fbO1AshPtuU3HOeXd241kNV0nVqT3NCKSNipgDv42/TIDXfDk0qxklF++
   L22x/MGNSB2ZneMRtgbUbENfVknnkLiZ1pH0TeJxgiu9/IsmvSKxoJy/4
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,234,1694728800"; 
   d="scan'208";a="131817840"
Received: from dhcp-138-246-3-50.dynamic.eduroam.mwn.de (HELO hadrien) ([138.246.3.50])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 09:27:37 +0200
Date: Wed, 18 Oct 2023 09:27:37 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Calvince Otieno <calvncce@gmail.com>
cc: gustavo@embeddedor.com, outreachy@lists.linux.dev, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Martyn Welch <martyn@welchs.me.uk>, 
    Manohar Vanga <manohar.vanga@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix coding style - remove
 CamelCasing
In-Reply-To: <ZS+HyqwvyVyfzGXs@lab-ubuntu>
Message-ID: <cb55a015-4c2b-b72-dcd-af7f8c7380@inria.fr>
References: <ZS+HyqwvyVyfzGXs@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 18 Oct 2023, Calvince Otieno wrote:

> This patch addresses coding style errors identified by checkpatch. The
> changes include converting camel case names in constant variables to
> UPPERCASE. These changes align with the coding style guidelines.

Did someone suggest this?  It looks like the lowercase e might be related
to something in the device documentation?

julia

>
>
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/vme_user/vme.h        | 12 ++--
>  drivers/staging/vme_user/vme_fake.c   |  8 +--
>  drivers/staging/vme_user/vme_tsi148.c | 88 +++++++++++++--------------
>  3 files changed, 54 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
> index fbcbd0204453..0b40859fee23 100644
> --- a/drivers/staging/vme_user/vme.h
> +++ b/drivers/staging/vme_user/vme.h
> @@ -33,13 +33,13 @@ enum vme_resource_type {
>  #define VME_SCT		0x1
>  #define VME_BLT		0x2
>  #define VME_MBLT	0x4
> -#define VME_2eVME	0x8
> -#define VME_2eSST	0x10
> -#define VME_2eSSTB	0x20
> +#define VME_2EVME	0x8
> +#define VME_2ESST	0x10
> +#define VME_2ESSTB	0x20
>
> -#define VME_2eSST160	0x100
> -#define VME_2eSST267	0x200
> -#define VME_2eSST320	0x400
> +#define VME_2ESST160	0x100
> +#define VME_2ESST267	0x200
> +#define VME_2ESST320	0x400
>
>  #define	VME_SUPER	0x1000
>  #define	VME_USER	0x2000
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index ae802d6dda7e..0e02c194298d 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -1108,8 +1108,8 @@ static int __init fake_init(void)
>  		master_image->address_attr = VME_A16 | VME_A24 | VME_A32 |
>  			VME_A64;
>  		master_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
> -			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
> -			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
> +			VME_2EVME | VME_2ESST | VME_2ESSTB | VME_2ESST160 |
> +			VME_2ESST267 | VME_2ESST320 | VME_SUPER | VME_USER |
>  			VME_PROG | VME_DATA;
>  		master_image->width_attr = VME_D16 | VME_D32;
>  		memset(&master_image->bus_resource, 0,
> @@ -1135,8 +1135,8 @@ static int __init fake_init(void)
>  			VME_A64 | VME_CRCSR | VME_USER1 | VME_USER2 |
>  			VME_USER3 | VME_USER4;
>  		slave_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
> -			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
> -			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
> +			VME_2EVME | VME_2ESST | VME_2ESSTB | VME_2ESST160 |
> +			VME_2ESST267 | VME_2ESST320 | VME_SUPER | VME_USER |
>  			VME_PROG | VME_DATA;
>  		list_add_tail(&slave_image->list,
>  			      &fake_bridge->slave_resources);
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index d549c22da534..859298aa1313 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -551,14 +551,14 @@ static int tsi148_slave_set(struct vme_slave_resource *image, int enabled,
>
>  	/* Setup 2eSST speeds */
>  	temp_ctl &= ~TSI148_LCSR_ITAT_2eSSTM_M;
> -	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
> -	case VME_2eSST160:
> +	switch (cycle & (VME_2ESST160 | VME_2ESST267 | VME_2ESST320)) {
> +	case VME_2ESST160:
>  		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_160;
>  		break;
> -	case VME_2eSST267:
> +	case VME_2ESST267:
>  		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_267;
>  		break;
> -	case VME_2eSST320:
> +	case VME_2ESST320:
>  		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_320;
>  		break;
>  	}
> @@ -569,11 +569,11 @@ static int tsi148_slave_set(struct vme_slave_resource *image, int enabled,
>  		temp_ctl |= TSI148_LCSR_ITAT_BLT;
>  	if (cycle & VME_MBLT)
>  		temp_ctl |= TSI148_LCSR_ITAT_MBLT;
> -	if (cycle & VME_2eVME)
> +	if (cycle & VME_2EVME)
>  		temp_ctl |= TSI148_LCSR_ITAT_2eVME;
> -	if (cycle & VME_2eSST)
> +	if (cycle & VME_2ESST)
>  		temp_ctl |= TSI148_LCSR_ITAT_2eSST;
> -	if (cycle & VME_2eSSTB)
> +	if (cycle & VME_2ESSTB)
>  		temp_ctl |= TSI148_LCSR_ITAT_2eSSTB;
>
>  	/* Setup address space */
> @@ -673,22 +673,22 @@ static int tsi148_slave_get(struct vme_slave_resource *image, int *enabled,
>  	*size = (unsigned long long)((vme_bound - *vme_base) + granularity);
>
>  	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_160)
> -		*cycle |= VME_2eSST160;
> +		*cycle |= VME_2ESST160;
>  	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_267)
> -		*cycle |= VME_2eSST267;
> +		*cycle |= VME_2ESST267;
>  	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_320)
> -		*cycle |= VME_2eSST320;
> +		*cycle |= VME_2ESST320;
>
>  	if (ctl & TSI148_LCSR_ITAT_BLT)
>  		*cycle |= VME_BLT;
>  	if (ctl & TSI148_LCSR_ITAT_MBLT)
>  		*cycle |= VME_MBLT;
>  	if (ctl & TSI148_LCSR_ITAT_2eVME)
> -		*cycle |= VME_2eVME;
> +		*cycle |= VME_2EVME;
>  	if (ctl & TSI148_LCSR_ITAT_2eSST)
> -		*cycle |= VME_2eSST;
> +		*cycle |= VME_2ESST;
>  	if (ctl & TSI148_LCSR_ITAT_2eSSTB)
> -		*cycle |= VME_2eSSTB;
> +		*cycle |= VME_2ESSTB;
>
>  	if (ctl & TSI148_LCSR_ITAT_SUPR)
>  		*cycle |= VME_SUPER;
> @@ -895,14 +895,14 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,
>
>  	/* Setup 2eSST speeds */
>  	temp_ctl &= ~TSI148_LCSR_OTAT_2eSSTM_M;
> -	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
> -	case VME_2eSST160:
> +	switch (cycle & (VME_2ESST160 | VME_2ESST267 | VME_2ESST320)) {
> +	case VME_2ESST160:
>  		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_160;
>  		break;
> -	case VME_2eSST267:
> +	case VME_2ESST267:
>  		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_267;
>  		break;
> -	case VME_2eSST320:
> +	case VME_2ESST320:
>  		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_320;
>  		break;
>  	}
> @@ -916,15 +916,15 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,
>  		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
>  		temp_ctl |= TSI148_LCSR_OTAT_TM_MBLT;
>  	}
> -	if (cycle & VME_2eVME) {
> +	if (cycle & VME_2EVME) {
>  		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
>  		temp_ctl |= TSI148_LCSR_OTAT_TM_2eVME;
>  	}
> -	if (cycle & VME_2eSST) {
> +	if (cycle & VME_2ESST) {
>  		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
>  		temp_ctl |= TSI148_LCSR_OTAT_TM_2eSST;
>  	}
> -	if (cycle & VME_2eSSTB) {
> +	if (cycle & VME_2ESSTB) {
>  		dev_warn(tsi148_bridge->parent, "Currently not setting Broadcast Select Registers\n");
>  		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
>  		temp_ctl |= TSI148_LCSR_OTAT_TM_2eSSTB;
> @@ -1100,11 +1100,11 @@ static int __tsi148_master_get(struct vme_master_resource *image, int *enabled,
>
>  	/* Setup 2eSST speeds */
>  	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_160)
> -		*cycle |= VME_2eSST160;
> +		*cycle |= VME_2ESST160;
>  	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_267)
> -		*cycle |= VME_2eSST267;
> +		*cycle |= VME_2ESST267;
>  	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_320)
> -		*cycle |= VME_2eSST320;
> +		*cycle |= VME_2ESST320;
>
>  	/* Setup cycle types */
>  	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_SCT)
> @@ -1114,11 +1114,11 @@ static int __tsi148_master_get(struct vme_master_resource *image, int *enabled,
>  	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_MBLT)
>  		*cycle |= VME_MBLT;
>  	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eVME)
> -		*cycle |= VME_2eVME;
> +		*cycle |= VME_2EVME;
>  	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eSST)
> -		*cycle |= VME_2eSST;
> +		*cycle |= VME_2ESST;
>  	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eSSTB)
> -		*cycle |= VME_2eSSTB;
> +		*cycle |= VME_2ESSTB;
>
>  	if (ctl & TSI148_LCSR_OTAT_SUP)
>  		*cycle |= VME_SUPER;
> @@ -1406,14 +1406,14 @@ static int tsi148_dma_set_vme_src_attributes(struct device *dev, __be32 *attr,
>  	val = be32_to_cpu(*attr);
>
>  	/* Setup 2eSST speeds */
> -	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
> -	case VME_2eSST160:
> +	switch (cycle & (VME_2ESST160 | VME_2ESST267 | VME_2ESST320)) {
> +	case VME_2ESST160:
>  		val |= TSI148_LCSR_DSAT_2eSSTM_160;
>  		break;
> -	case VME_2eSST267:
> +	case VME_2ESST267:
>  		val |= TSI148_LCSR_DSAT_2eSSTM_267;
>  		break;
> -	case VME_2eSST320:
> +	case VME_2ESST320:
>  		val |= TSI148_LCSR_DSAT_2eSSTM_320;
>  		break;
>  	}
> @@ -1428,13 +1428,13 @@ static int tsi148_dma_set_vme_src_attributes(struct device *dev, __be32 *attr,
>  	if (cycle & VME_MBLT)
>  		val |= TSI148_LCSR_DSAT_TM_MBLT;
>
> -	if (cycle & VME_2eVME)
> +	if (cycle & VME_2EVME)
>  		val |= TSI148_LCSR_DSAT_TM_2eVME;
>
> -	if (cycle & VME_2eSST)
> +	if (cycle & VME_2ESST)
>  		val |= TSI148_LCSR_DSAT_TM_2eSST;
>
> -	if (cycle & VME_2eSSTB) {
> +	if (cycle & VME_2ESSTB) {
>  		dev_err(dev, "Currently not setting Broadcast Select Registers\n");
>  		val |= TSI148_LCSR_DSAT_TM_2eSSTB;
>  	}
> @@ -1504,14 +1504,14 @@ static int tsi148_dma_set_vme_dest_attributes(struct device *dev, __be32 *attr,
>  	val = be32_to_cpu(*attr);
>
>  	/* Setup 2eSST speeds */
> -	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
> -	case VME_2eSST160:
> +	switch (cycle & (VME_2ESST160 | VME_2ESST267 | VME_2ESST320)) {
> +	case VME_2ESST160:
>  		val |= TSI148_LCSR_DDAT_2eSSTM_160;
>  		break;
> -	case VME_2eSST267:
> +	case VME_2ESST267:
>  		val |= TSI148_LCSR_DDAT_2eSSTM_267;
>  		break;
> -	case VME_2eSST320:
> +	case VME_2ESST320:
>  		val |= TSI148_LCSR_DDAT_2eSSTM_320;
>  		break;
>  	}
> @@ -1526,13 +1526,13 @@ static int tsi148_dma_set_vme_dest_attributes(struct device *dev, __be32 *attr,
>  	if (cycle & VME_MBLT)
>  		val |= TSI148_LCSR_DDAT_TM_MBLT;
>
> -	if (cycle & VME_2eVME)
> +	if (cycle & VME_2EVME)
>  		val |= TSI148_LCSR_DDAT_TM_2eVME;
>
> -	if (cycle & VME_2eSST)
> +	if (cycle & VME_2ESST)
>  		val |= TSI148_LCSR_DDAT_TM_2eSST;
>
> -	if (cycle & VME_2eSSTB) {
> +	if (cycle & VME_2ESSTB) {
>  		dev_err(dev, "Currently not setting Broadcast Select Registers\n");
>  		val |= TSI148_LCSR_DDAT_TM_2eSSTB;
>  	}
> @@ -2359,8 +2359,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  			VME_A64 | VME_CRCSR | VME_USER1 | VME_USER2 |
>  			VME_USER3 | VME_USER4;
>  		master_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
> -			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
> -			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
> +			VME_2EVME | VME_2ESST | VME_2ESSTB | VME_2ESST160 |
> +			VME_2ESST267 | VME_2ESST320 | VME_SUPER | VME_USER |
>  			VME_PROG | VME_DATA;
>  		master_image->width_attr = VME_D16 | VME_D32;
>  		memset(&master_image->bus_resource, 0,
> @@ -2384,8 +2384,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		slave_image->address_attr = VME_A16 | VME_A24 | VME_A32 |
>  			VME_A64;
>  		slave_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
> -			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
> -			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
> +			VME_2EVME | VME_2ESST | VME_2ESSTB | VME_2ESST160 |
> +			VME_2ESST267 | VME_2ESST320 | VME_SUPER | VME_USER |
>  			VME_PROG | VME_DATA;
>  		list_add_tail(&slave_image->list,
>  			&tsi148_bridge->slave_resources);
> --
> 2.34.1
>
>

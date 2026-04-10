Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C13E1D1F;
	Fri, 10 Apr 2026 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775845654; cv=none; b=hdFw9St3t2wv6YCNh+bXiJSsCTcMnDax8PrBLIwqWgavpOoLP9hXDy6tsWwRTD4p3Y/DOyqR/zSnKwrpY2p+ru/yHO2/iarKIydEwwY/vifC+/VBKPIdLDwP0iVLueNRr8QGzW0kEo2Am8wxL2n4dgdp0T5V86uOHrnz2Nv9R74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775845654; c=relaxed/simple;
	bh=zc2BoEuQjTzAu4XEnVqT396jbx8g4XtTY2bQ4aVTQEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiTr7bxgd7SxQIaRV1nrWyqhP158D86JmaoV4/04oWeDNdDOoDXk7PH36xkYE0f3+KKnoQ/cm3mVIgKXXWRNnkbE1VJ8+0O7gltEN+xUrQWcPcCI7UaZiC4y7WhUCEZ1bnSVqm042KGDVj9fXRl1jAZHg+K0a7g+yFJRaP58BrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeDlLxiZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeDlLxiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022BBC19421;
	Fri, 10 Apr 2026 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775845654;
	bh=zc2BoEuQjTzAu4XEnVqT396jbx8g4XtTY2bQ4aVTQEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BeDlLxiZKK8LQqVpScE7tA9RIoQrRYKrwyuj+g/TZtjlY+qSKaFbIuVGUjAdyvG61
	 zuBaZ5LAE80xK8y+m92rQN+hiqQ+iea1jql3D1I8LCfUiboeGiuxNuhs8SybVGcSyh
	 CHfa+fVHO2zpR15AnzfCKrUnAwei7+h+KJvES2SnI8RUbCj1Tb3zTlELvLjeLrKnpI
	 0QdjOaXe8Vybe25wrue/r9/2CcPj/Q+aG67NGDVQU+gs3Ew74vhYMr8ezdrlKcwCJr
	 0rpGQmJ1K827ca1ysqsISw2ZirjIxi3jszHaogqP/UKNM2yg7b5uJqxnKhotZICLMf
	 xDv89nLC6A/Vw==
Message-ID: <2b2c2a78-04eb-439b-a4eb-ec8c8ad410be@kernel.org>
Date: Fri, 10 Apr 2026 20:27:30 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: avoid ACPI package count underflow in
 gmin_cfg_get_dsm
To: Mohamed El Harake <mohamedharake2006@gmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
 gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20260409214158.3248-1-mohamedharake2006@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260409214158.3248-1-mohamedharake2006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Apr-26 11:41 PM, Mohamed El Harake wrote:
> From: Mohamad El Harake <mohamedharake2006@gmail.com>
> 
> gmin_cfg_get_dsm() iterates over ACPI _DSM package elements as
> key/value pairs using obj->package.count - 1 as the loop bound.
> 
> If package.count is 0, the subtraction underflows and may lead
> to out-of-bounds access.
> 
> Use i + 1 < obj->package.count instead.
> 
> Signed-off-by: Mohamad El Harake <mohamedharake2006@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index ba61cc28fac1..cca91c6d71a5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -113,7 +113,7 @@ static char *gmin_cfg_get_dsm(struct acpi_device *adev, const char *key)
>  	if (!obj)
>  		return NULL;
>  
> -	for (i = 0; i < obj->package.count - 1; i += 2) {
> +	for (i = 0; i + 1 < obj->package.count; i += 2) {
>  		key_el = &obj->package.elements[i + 0];
>  		val_el = &obj->package.elements[i + 1];
>  


Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4246F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 09:13:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 702BF6157F;
	Wed, 24 Mar 2021 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616577192;
	bh=RUzX/nbmq3RGqHMtGfALSfCQu+1aN6qyVwAbUtdZfeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDbCVYJGerr6v35Ir/fH9j2vZdextEWxuCLxhUVSm4B9jy+mzdQ9mZo4EAqGZe05X
	 IfYt++jxQw1nXgDX3YFfJ3qhzNwbPaUFDJXxD16hXdu/qXsLM1YZ9+ASceCZWaAg+L
	 aqnHHMz/gEcuTIUYi/HbUTf3uF6E2KgecxRSRMAc=
Date: Wed, 24 Mar 2021 10:13:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhichao Cai <tomstomsczc@163.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zhichao Cai <caizhichao@yulong.com>
Subject: Re: [PATCH] drivers:staging: NULL check before some freeing
 functions is not needed.
Message-ID: <YFsCpTIneSZyj3t/@kroah.com>
References: <20210324084126.895-1-tomstomsczc@163.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324084126.895-1-tomstomsczc@163.com>

On Wed, Mar 24, 2021 at 04:41:26PM +0800, Zhichao Cai wrote:
> From: Zhichao Cai <caizhichao@yulong.com>
> 
> Fixes coccicheck warning:
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c:390:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/sh_css_params.c:1579:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/sh_css_params.c:3010:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4269:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4630:2-7: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c:159:4-10: WARNING: NULL check before some freeing functions is not needed.

Please break this up per-driver.

And provide a real changelog text.

thanks,

greg k-h

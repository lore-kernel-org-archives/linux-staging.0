Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DFD72
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 06:44:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0C8161107;
	Fri, 26 Nov 2021 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637909097;
	bh=8bHYPzUATkfZh13noPGKgSogQzn8/Taz/tcz+JwjBlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCvlJscHSV9W9DpueHnLKTrrXUQYnx6VnqWnRfCkvIZUNG7FU40SFnmNuNzr6OFeM
	 5LNriIe/7CPeLCw1JHIV8rBjgilE5MpK6u6WMuSGUK3mx/uFsivPh1oej4FqhCYjiv
	 gvdfLuW56dqqMM90M8Mgb3rqRakMi1/arrsHV6Qo=
Date: Fri, 26 Nov 2021 07:44:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 2/3] dt-bindings: staging: Add the binding
 documentation for ZHOUYI AI accelerator
Message-ID: <YaCCZOGRxj7EtEou@kroah.com>
References: <20211126021904.32325-1-caihuoqing@baidu.com>
 <20211126021904.32325-3-caihuoqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126021904.32325-3-caihuoqing@baidu.com>

On Fri, Nov 26, 2021 at 10:19:00AM +0800, Cai Huoqing wrote:
> ZHOUYI NPU is an AI accelerator chip which is integrated into ARM SOC,
> such as Allwinner R329 SOC.
> Add the binding documentation for ZHOUYI AI accelerator.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v2->v3:
>         *Fix unit_address_format, avoid leading 0s.
> 
>  .../bindings/staging/arm,zynpu.yaml           | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/staging/arm,zynpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/staging/arm,zynpu.yaml b/Documentation/devicetree/bindings/staging/arm,zynpu.yaml
> new file mode 100644
> index 000000000000..d452c08ab4a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/staging/arm,zynpu.yaml

Staging drivers need to be self-contained, which makes it hard for DT
files.  Please try to keep this next to the driver for now until it is
ready to be moved out of the drivers/staging/ area.

thanks,

greg k-h

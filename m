Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51E1E4A1
	for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 00:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943901; cv=none; b=AKFlPqIAzWlRZ2Gx3j/x8Zcm1ghgc8/AtKcJOa27FvMyigKbOM3JQZcYebD1V6lbLnJhFvzUW/yJK8x71864fJT17Ko56oC30OUC7ESHnluFag4rewkW9pAY1MnsfbRFJ1ipVNO92mKvY8szkXBOsRN4c4bDpXKLSV++zxDI8Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943901; c=relaxed/simple;
	bh=LUvHYj/C2OsqFMDW4q41poVuL2JJ+Xkjp0bK98E0Hc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZz6ulhiaXiqE5F9dzLkTltRdMYTpFnRUf6XCvGMe5JpAK1JnS5mlH+Mt5kbDZCKXSlmrU64QUED/+Wdks1JFAHmNZjRYhlaqWm8fHJeDafcqbnhBtgJjnf0F7KbVMZOtp0vXbG+w8MHW1xUU9bMvrHVG4EMNiKyffL8xB6ZhB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kWVg2v4G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kWVg2v4G"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ABF49CA;
	Wed, 29 May 2024 02:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716943895;
	bh=LUvHYj/C2OsqFMDW4q41poVuL2JJ+Xkjp0bK98E0Hc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWVg2v4GBmxUrlAJTgFtbHDWXl2gEHP34PCfQYGDrmw+s+N31rNtrAFPY+6mTkdoI
	 EaMPqXpCk2DTi8mL+1MgEJ7HDStdT2H2yMoIJnq8woueBKERrPt2cwZA85Wzx+RNWl
	 Q5rta5fMx6rg+NzBJSU3zxSp1RNBuH8W/BOcexiQ=
Date: Wed, 29 May 2024 03:51:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 7/8] video: fbdev: use
 for_each_endpoint_of_node()
Message-ID: <20240529005126.GG1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <878qzt4hkk.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878qzt4hkk.wl-kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:55PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> index 09f719af0d0c9..d80720c843235 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> @@ -149,8 +149,7 @@ static void __init omapdss_walk_device(struct device_node *node, bool root)
>  
>  	of_node_put(n);
>  
> -	n = NULL;
> -	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
> +	for_each_endpoint_of_node(node, n) {
>  		struct device_node *pn;
>  
>  		pn = of_graph_get_remote_port_parent(n);

-- 
Regards,

Laurent Pinchart

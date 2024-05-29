Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB515990E
	for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 00:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716943081; cv=none; b=EEUBpoXm+Obj+zVZqwmSAUx+7llZR4nsKOWJsrfg2KY05qLmd4D/0Z3k1kukGvp3qi9et9oBL338YZjA+NAa7wxQED1bVC/yPYAD7J0uuvzprC1qiFVcACC++N0wkWLUim2Q/rfS+ryfVfFijsPczGGNtWyyBZVGEZQdhqqqNhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716943081; c=relaxed/simple;
	bh=kHRgekZOami2rxfBydUVstayyCiU8ig5IVCrrmOjPuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMWdBcBGitU1YTlfbWxcqkSi+ulUrV3Az1Cm7vVtM3wuyT+AdUOvpvGbSvLjl9zhrmyuOIydBSjl2ZP58qKHVpOkLWp1/fto46pS6VCCiIinPBsd2PBmeYkpztkpQ7JLqac8S0Jzmh22Upzb23dNBaRaTsoTj5BlV+oJ4r/WiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LGf9wYuV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LGf9wYuV"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FB829CA;
	Wed, 29 May 2024 02:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716943073;
	bh=kHRgekZOami2rxfBydUVstayyCiU8ig5IVCrrmOjPuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGf9wYuVwGmAlNfhJpe4dh1cCmIR2kdJ6OKQzwwSPQUmdftLgBYtJVyYex3he32Nm
	 52k/ZveFi6S75DlV/PNpXGi77KicZwy3wcxmUVlBCwXkvu1RCOpmooD1sWYKn5CD6o
	 e7K4qQ7NBfw+zrZuKUMBoFEknNcE6wzatjD/V0ms=
Date: Wed, 29 May 2024 03:37:44 +0300
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
Subject: Re: [PATCH v2 resend 1/8] gpu: drm: use for_each_endpoint_of_node()
Message-ID: <20240529003744.GA1436@pendragon.ideasonboard.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>

Hello Morimoto-san,

Thank you for the patch.

On Tue, May 28, 2024 at 11:55:26PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index 050ca7eafac58..5f8002f6bb7a5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -242,8 +242,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
>  
>  	of_node_put(n);
>  
> -	n = NULL;
> -	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
> +	for_each_endpoint_of_node(node, n) {
>  		struct device_node *pn = of_graph_get_remote_port_parent(n);
>  
>  		if (!pn)

-- 
Regards,

Laurent Pinchart

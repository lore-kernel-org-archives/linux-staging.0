Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF217C6A
	for <linux-staging@lists.linux.dev>; Fri, 15 Mar 2024 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500319; cv=none; b=Pa6UljzSfZ7mVtC9bbyD//E7I2C1FtIlBbObwe0pdNyODizaRYfMu6u84hp7MWxMyswNRTryzBfDvWXfDttp8EmGwahrgLQNxfrqAEkqRD3mYMCedRwffhw9ly7bn02IVaGmG8dWmIf+YMwErcHmtMFNSYi8eVQo1IeUrFNDnRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500319; c=relaxed/simple;
	bh=iH+C8iapXKp/5vVS/dZBaSTWyHkhxyq+zkkkTpn9NCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpU7ksUuspThqHygog6FwRNOoDpRGo86kmpYssf9ypBpRohKnlFecgwDP37hMGg7yfzkxXl76Ar5SC8jv3JFwy+edhxpCqErF9O0DgRjVuZOv3CqYVSa2vvXixuzPMzyWV95pEEm0T9fSlsVUfexBK5T3/m0gaA1M6IpOw8JsP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S47pBohO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S47pBohO"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48821B3;
	Fri, 15 Mar 2024 11:58:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710500292;
	bh=iH+C8iapXKp/5vVS/dZBaSTWyHkhxyq+zkkkTpn9NCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S47pBohObb3iS2AfexNI1OzgFZ9KvfpSq5kXT9hjMuUEa83IOiKMrbWmd99f78dhL
	 0vaBVEh6KsqpTwCmIWTNGmAR8UCmizUiQau06dc5K+CnhbGeX7SiDHjo+lQVST4YBZ
	 hJFrlik//9qIoe/m637Onjo0DHSaJYYYsdY/TepI=
Date: Fri, 15 Mar 2024 12:58:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 1/6] staging: vc04_services: Drop g_once_init global
 variable
Message-ID: <20240315105834.GG2441@pendragon.ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com>
 <20240314100607.336009-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314100607.336009-2-umang.jain@ideasonboard.com>

Hi Umang,

Thank you for the patch.

On Thu, Mar 14, 2024 at 03:36:02PM +0530, Umang Jain wrote:
> g_once_init is not used in a meaningful way anywhere. Drop it
> along with connected_init() which sets it.
> 
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

An easy one :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../interface/vchiq_arm/vchiq_connected.c            | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> index 3cad13f09e37..4604a2f4d2de 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> @@ -11,16 +11,8 @@
>  static   int                        g_connected;
>  static   int                        g_num_deferred_callbacks;
>  static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
> -static   int                        g_once_init;
>  static   DEFINE_MUTEX(g_connected_mutex);
>  
> -/* Function to initialize our lock */
> -static void connected_init(void)
> -{
> -	if (!g_once_init)
> -		g_once_init = 1;
> -}
> -
>  /*
>   * This function is used to defer initialization until the vchiq stack is
>   * initialized. If the stack is already initialized, then the callback will
> @@ -29,8 +21,6 @@ static void connected_init(void)
>   */
>  void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
>  {
> -	connected_init();
> -
>  	if (mutex_lock_killable(&g_connected_mutex))
>  		return;
>  
> @@ -60,8 +50,6 @@ void vchiq_call_connected_callbacks(void)
>  {
>  	int i;
>  
> -	connected_init();
> -
>  	if (mutex_lock_killable(&g_connected_mutex))
>  		return;
>  

-- 
Regards,

Laurent Pinchart

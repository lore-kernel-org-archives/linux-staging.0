Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E1101E2
	for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 21:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718140900; cv=none; b=PG/yITRCq9Ea/oQ87JKqe2SuQoGhzcAPx+DpQhQ+LnOn/u+w0AJgRY15BorQQRYdsp/DuMcTNzJosGienQiVWI1re/L7MZSHh3z9C8ouww4HRpe73hkqg85/oyO37mSbdD1ZzRannNNAtczjnaPIWlJMsUaMhRMNod5dUot07Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718140900; c=relaxed/simple;
	bh=ltEiwNolF7GAwZohk7nynuzQuSFcSl3aq/NVS2i2vcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVKSzb+dM+kI6/33TcBf2EwazsdRg9SCdL2SZBA0+R/NfelQN84xiPXLmGxbgaHym/W/RHORpbvcNvyzzcIh/VRZTUqh52MLSuAA3fhiXGNg7akF+kcINrCpD7mt8oark6lfrwQYbgR4J/pIx4HGhdmElTzcni+F+BRo7SgLJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l2lq8rQm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l2lq8rQm"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63F0B512;
	Tue, 11 Jun 2024 23:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718140447;
	bh=ltEiwNolF7GAwZohk7nynuzQuSFcSl3aq/NVS2i2vcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2lq8rQm6fZ8Q5YDw09wO3JrtF48WpkWwQmPF8gjcCj/bbBzuet7QaZH+ovqoBD4g
	 52jnizeWvoXhlG9CA5jYObAEJWGoa+Ty4nYrGywugCHUbv4ihpG0eOuaYbUt7VbvwP
	 KPO4udM7qhurmpufbOsKcS/wg5I6SCFZ5f6KRiQg=
Date: Wed, 12 Jun 2024 00:14:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 01/10] staging: vchiq_arm: Unify return code variable
Message-ID: <20240611211400.GE10397@pendragon.ideasonboard.com>
References: <20240610210220.95524-1-wahrenst@gmx.net>
 <20240610210220.95524-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610210220.95524-2-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Mon, Jun 10, 2024 at 11:02:11PM +0200, Stefan Wahren wrote:
> The file vchiq_arm uses a wild mixture of variable names for
> return codes. Unify them by using the common name "ret".
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 141 +++++++++---------
>  1 file changed, 69 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 69daeba974f2..f3815101e1c4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -758,8 +758,8 @@ void free_bulk_waiter(struct vchiq_instance *instance)
> 
>  int vchiq_shutdown(struct vchiq_instance *instance)
>  {
> -	int status = 0;
>  	struct vchiq_state *state = instance->state;
> +	int ret = 0;
> 
>  	if (mutex_lock_killable(&state->mutex))
>  		return -EAGAIN;
> @@ -769,12 +769,12 @@ int vchiq_shutdown(struct vchiq_instance *instance)
> 
>  	mutex_unlock(&state->mutex);
> 
> -	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);
> 
>  	free_bulk_waiter(instance);
>  	kfree(instance);
> 
> -	return status;
> +	return ret;
>  }
>  EXPORT_SYMBOL(vchiq_shutdown);
> 
> @@ -785,26 +785,26 @@ static int vchiq_is_connected(struct vchiq_instance *instance)
> 
>  int vchiq_connect(struct vchiq_instance *instance)
>  {
> -	int status;
>  	struct vchiq_state *state = instance->state;
> +	int ret;
> 
>  	if (mutex_lock_killable(&state->mutex)) {
>  		dev_dbg(state->dev,
>  			"core: call to mutex_lock failed\n");
> -		status = -EAGAIN;
> +		ret = -EAGAIN;
>  		goto failed;
>  	}
> -	status = vchiq_connect_internal(state, instance);
> +	ret = vchiq_connect_internal(state, instance);
> 
> -	if (!status)
> +	if (!ret)
>  		instance->connected = 1;
> 
>  	mutex_unlock(&state->mutex);
> 
>  failed:
> -	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);
> 
> -	return status;
> +	return ret;
>  }
>  EXPORT_SYMBOL(vchiq_connect);
> 
> @@ -813,10 +813,9 @@ vchiq_add_service(struct vchiq_instance *instance,
>  		  const struct vchiq_service_params_kernel *params,
>  		  unsigned int *phandle)
>  {
> -	int status;
>  	struct vchiq_state *state = instance->state;
>  	struct vchiq_service *service = NULL;
> -	int srvstate;
> +	int srvstate, ret;
> 
>  	*phandle = VCHIQ_SERVICE_HANDLE_INVALID;
> 
> @@ -828,14 +827,14 @@ vchiq_add_service(struct vchiq_instance *instance,
> 
>  	if (service) {
>  		*phandle = service->handle;
> -		status = 0;
> +		ret = 0;
>  	} else {
> -		status = -EINVAL;
> +		ret = -EINVAL;
>  	}
> 
> -	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);
> 
> -	return status;
> +	return ret;
>  }
> 
>  int
> @@ -843,9 +842,9 @@ vchiq_open_service(struct vchiq_instance *instance,
>  		   const struct vchiq_service_params_kernel *params,
>  		   unsigned int *phandle)
>  {
> -	int status = -EINVAL;
>  	struct vchiq_state   *state = instance->state;
>  	struct vchiq_service *service = NULL;
> +	int ret = -EINVAL;
> 
>  	*phandle = VCHIQ_SERVICE_HANDLE_INVALID;
> 
> @@ -856,17 +855,17 @@ vchiq_open_service(struct vchiq_instance *instance,
> 
>  	if (service) {
>  		*phandle = service->handle;
> -		status = vchiq_open_service_internal(service, current->pid);
> -		if (status) {
> +		ret = vchiq_open_service_internal(service, current->pid);
> +		if (ret) {
>  			vchiq_remove_service(instance, service->handle);
>  			*phandle = VCHIQ_SERVICE_HANDLE_INVALID;
>  		}
>  	}
> 
>  failed:
> -	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
> +	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);
> 
> -	return status;
> +	return ret;
>  }
>  EXPORT_SYMBOL(vchiq_open_service);
> 
> @@ -874,20 +873,20 @@ int
>  vchiq_bulk_transmit(struct vchiq_instance *instance, unsigned int handle, const void *data,
>  		    unsigned int size, void *userdata, enum vchiq_bulk_mode mode)
>  {
> -	int status;
> +	int ret;
> 
>  	while (1) {
>  		switch (mode) {
>  		case VCHIQ_BULK_MODE_NOCALLBACK:
>  		case VCHIQ_BULK_MODE_CALLBACK:
> -			status = vchiq_bulk_transfer(instance, handle,
> -						     (void *)data, NULL,
> -						     size, userdata, mode,
> -						     VCHIQ_BULK_TRANSMIT);
> +			ret = vchiq_bulk_transfer(instance, handle,
> +						  (void *)data, NULL,
> +						  size, userdata, mode,
> +						  VCHIQ_BULK_TRANSMIT);
>  			break;
>  		case VCHIQ_BULK_MODE_BLOCKING:
> -			status = vchiq_blocking_bulk_transfer(instance, handle, (void *)data, size,
> -							      VCHIQ_BULK_TRANSMIT);
> +			ret = vchiq_blocking_bulk_transfer(instance, handle, (void *)data, size,
> +							   VCHIQ_BULK_TRANSMIT);
>  			break;
>  		default:
>  			return -EINVAL;
> @@ -898,13 +897,13 @@ vchiq_bulk_transmit(struct vchiq_instance *instance, unsigned int handle, const
>  		 * to implement a retry mechanism since this function is
>  		 * supposed to block until queued
>  		 */
> -		if (status != -EAGAIN)
> +		if (ret != -EAGAIN)
>  			break;
> 
>  		msleep(1);
>  	}
> 
> -	return status;
> +	return ret;
>  }
>  EXPORT_SYMBOL(vchiq_bulk_transmit);
> 
> @@ -912,19 +911,19 @@ int vchiq_bulk_receive(struct vchiq_instance *instance, unsigned int handle,
>  		       void *data, unsigned int size, void *userdata,
>  		       enum vchiq_bulk_mode mode)
>  {
> -	int status;
> +	int ret;
> 
>  	while (1) {
>  		switch (mode) {
>  		case VCHIQ_BULK_MODE_NOCALLBACK:
>  		case VCHIQ_BULK_MODE_CALLBACK:
> -			status = vchiq_bulk_transfer(instance, handle, data, NULL,
> -						     size, userdata,
> -						     mode, VCHIQ_BULK_RECEIVE);
> +			ret = vchiq_bulk_transfer(instance, handle, data, NULL,
> +						  size, userdata,
> +						  mode, VCHIQ_BULK_RECEIVE);
>  			break;
>  		case VCHIQ_BULK_MODE_BLOCKING:
> -			status = vchiq_blocking_bulk_transfer(instance, handle, (void *)data, size,
> -							      VCHIQ_BULK_RECEIVE);
> +			ret = vchiq_blocking_bulk_transfer(instance, handle, (void *)data, size,
> +							   VCHIQ_BULK_RECEIVE);
>  			break;
>  		default:
>  			return -EINVAL;
> @@ -935,13 +934,13 @@ int vchiq_bulk_receive(struct vchiq_instance *instance, unsigned int handle,
>  		 * to implement a retry mechanism since this function is
>  		 * supposed to block until queued
>  		 */
> -		if (status != -EAGAIN)
> +		if (ret != -EAGAIN)
>  			break;
> 
>  		msleep(1);
>  	}
> 
> -	return status;
> +	return ret;
>  }
>  EXPORT_SYMBOL(vchiq_bulk_receive);
> 
> @@ -950,8 +949,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
>  			     unsigned int size, enum vchiq_bulk_dir dir)
>  {
>  	struct vchiq_service *service;
> -	int status;
>  	struct bulk_waiter_node *waiter = NULL, *iter;
> +	int ret;
> 
>  	service = find_service_by_handle(instance, handle);
>  	if (!service)
> @@ -991,10 +990,10 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
>  			return -ENOMEM;
>  	}
> 
> -	status = vchiq_bulk_transfer(instance, handle, data, NULL, size,
> -				     &waiter->bulk_waiter,
> -				     VCHIQ_BULK_MODE_BLOCKING, dir);
> -	if ((status != -EAGAIN) || fatal_signal_pending(current) || !waiter->bulk_waiter.bulk) {
> +	ret = vchiq_bulk_transfer(instance, handle, data, NULL, size,
> +				  &waiter->bulk_waiter,
> +				  VCHIQ_BULK_MODE_BLOCKING, dir);
> +	if ((ret != -EAGAIN) || fatal_signal_pending(current) || !waiter->bulk_waiter.bulk) {
>  		struct vchiq_bulk *bulk = waiter->bulk_waiter.bulk;
> 
>  		if (bulk) {
> @@ -1013,7 +1012,7 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
>  			waiter, current->pid);
>  	}
> 
> -	return status;
> +	return ret;
>  }
> 
>  static int
> @@ -1137,17 +1136,17 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
>  			 */
>  			if ((user_service->message_available_pos -
>  				instance->completion_remove) < 0) {
> -				int status;
> +				int ret;
> 
>  				dev_dbg(instance->state->dev,
>  					"arm: Inserting extra MESSAGE_AVAILABLE\n");
>  				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -				status = add_completion(instance, reason, NULL, user_service,
> -							bulk_userdata);
> -				if (status) {
> +				ret = add_completion(instance, reason, NULL, user_service,
> +						     bulk_userdata);
> +				if (ret) {
>  					DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>  					vchiq_service_put(service);
> -					return status;
> +					return ret;
>  				}
>  			}
> 
> @@ -1294,8 +1293,6 @@ vchiq_keepalive_thread_func(void *v)
>  {
>  	struct vchiq_state *state = (struct vchiq_state *)v;
>  	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> -
> -	int status;
>  	struct vchiq_instance *instance;
>  	unsigned int ka_handle;
>  	int ret;
> @@ -1313,16 +1310,16 @@ vchiq_keepalive_thread_func(void *v)
>  		goto exit;
>  	}
> 
> -	status = vchiq_connect(instance);
> -	if (status) {
> -		dev_err(state->dev, "suspend: %s: vchiq_connect failed %d\n", __func__, status);
> +	ret = vchiq_connect(instance);
> +	if (ret) {
> +		dev_err(state->dev, "suspend: %s: vchiq_connect failed %d\n", __func__, ret);
>  		goto shutdown;
>  	}
> 
> -	status = vchiq_add_service(instance, &params, &ka_handle);
> -	if (status) {
> +	ret = vchiq_add_service(instance, &params, &ka_handle);
> +	if (ret) {
>  		dev_err(state->dev, "suspend: %s: vchiq_open_service failed %d\n",
> -			__func__, status);
> +			__func__, ret);
>  		goto shutdown;
>  	}
> 
> @@ -1348,17 +1345,17 @@ vchiq_keepalive_thread_func(void *v)
>  		 */
>  		while (uc--) {
>  			atomic_inc(&arm_state->ka_use_ack_count);
> -			status = vchiq_use_service(instance, ka_handle);
> -			if (status) {
> +			ret = vchiq_use_service(instance, ka_handle);
> +			if (ret) {
>  				dev_err(state->dev, "suspend: %s: vchiq_use_service error %d\n",
> -					__func__, status);
> +					__func__, ret);
>  			}
>  		}
>  		while (rc--) {
> -			status = vchiq_release_service(instance, ka_handle);
> -			if (status) {
> +			ret = vchiq_release_service(instance, ka_handle);
> +			if (ret) {
>  				dev_err(state->dev, "suspend: %s: vchiq_release_service error %d\n",
> -					__func__, status);
> +					__func__, ret);
>  			}
>  		}
>  	}
> @@ -1408,13 +1405,13 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>  	write_unlock_bh(&arm_state->susp_res_lock);
> 
>  	if (!ret) {
> -		int status = 0;
> +		int ret = 0;
>  		long ack_cnt = atomic_xchg(&arm_state->ka_use_ack_count, 0);
> 
> -		while (ack_cnt && !status) {
> +		while (ack_cnt && !ret) {
>  			/* Send the use notify to videocore */
> -			status = vchiq_send_remote_use_active(state);
> -			if (!status)
> +			ret = vchiq_send_remote_use_active(state);
> +			if (!ret)
>  				ack_cnt--;
>  			else
>  				atomic_add(ack_cnt, &arm_state->ka_use_ack_count);
> @@ -1730,7 +1727,7 @@ static int vchiq_probe(struct platform_device *pdev)
>  	struct device_node *fw_node;
>  	const struct vchiq_platform_info *info;
>  	struct vchiq_drv_mgmt *mgmt;
> -	int err;
> +	int ret;
> 
>  	info = of_device_get_match_data(&pdev->dev);
>  	if (!info)
> @@ -1755,8 +1752,8 @@ static int vchiq_probe(struct platform_device *pdev)
>  	mgmt->info = info;
>  	platform_set_drvdata(pdev, mgmt);
> 
> -	err = vchiq_platform_init(pdev, &mgmt->state);
> -	if (err)
> +	ret = vchiq_platform_init(pdev, &mgmt->state);
> +	if (ret)
>  		goto failed_platform_init;
> 
>  	vchiq_debugfs_init(&mgmt->state);
> @@ -1768,8 +1765,8 @@ static int vchiq_probe(struct platform_device *pdev)
>  	 * Simply exit on error since the function handles cleanup in
>  	 * cases of failure.
>  	 */
> -	err = vchiq_register_chrdev(&pdev->dev);
> -	if (err) {
> +	ret = vchiq_register_chrdev(&pdev->dev);
> +	if (ret) {
>  		dev_err(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
>  		goto error_exit;
>  	}
> @@ -1782,7 +1779,7 @@ static int vchiq_probe(struct platform_device *pdev)
>  failed_platform_init:
>  	dev_err(&pdev->dev, "arm: Could not initialize vchiq platform\n");
>  error_exit:
> -	return err;
> +	return ret;
>  }
> 
>  static void vchiq_remove(struct platform_device *pdev)

-- 
Regards,

Laurent Pinchart

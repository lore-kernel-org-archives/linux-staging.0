Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217270
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 08:03:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3307613DA;
	Thu,  3 Jun 2021 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622707385;
	bh=GBbrPzONb9uI4Eax8rcHtULTqv0VOkzc1qNSK0ChO6Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nvovjY1NUzTR57b9HNV4XHFh5L/lG1Hyst9yRK5sLyGiFZw2vB/mXSgADr6GTeOJk
	 8oOPZYmkFZ/j3hDTz62zComS8LBLgP5X7mN4wtu0+PYDDq+owpOoDcVlPQdAUV9jKe
	 5w8fcpNZ1yygvCbUfxMh/jXfIrbGuXaHWS+WbdwDLBpXI7+nzA5ANXM/Kzh+9WzE43
	 pPlsQcg+TX3fbd1TB0XexRT8mGzrRfKh+ju5+JMagXCzNEUCaoLWN5dMKr54/7dNmA
	 aJbXdW6vdcrYZ65HAShdxkPmLak0sv5Jt3MQwP045pgTdNZgEUtccsJ8MXb8YRoCmX
	 GTNNmQG9Obg4A==
Message-ID: <ccefdaedd79855086684f6188c42a6f3abaa6926.camel@kernel.org>
Subject: Re: [PATCH V2 09/11] staging: vchiq_core: drop vchiq_status from
 vchiq_set_service_option
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev
Date: Thu, 03 Jun 2021 10:03:02 +0200
In-Reply-To: <1619347863-16080-10-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
	 <1619347863-16080-10-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 2021-04-25 at 12:51 +0200, Stefan Wahren wrote:
> Replace the custom set of return values with proper Linux error codes for
> vchiq_set_service_option(). Now we can use the result directly as return
> value for vchiq_ioctl().
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

>  .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  4 ++--
>  .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 18 +++++++++---------
>  .../vc04_services/interface/vchiq_arm/vchiq_core.h     |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 3395201..ab2ce07 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1517,8 +1517,8 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  			break;
>  		}
>  
> 
> -		status = vchiq_set_service_option(
> -				args.handle, args.option, args.value);
> +		ret = vchiq_set_service_option(args.handle, args.option,
> +					       args.value);
>  	} break;
>  
> 
>  	case VCHIQ_IOC_LIB_VERSION: {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 9f9677a..e150feb 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -3371,21 +3371,21 @@ void vchiq_get_config(struct vchiq_config *config)
>  	config->version_min            = VCHIQ_VERSION_MIN;
>  }
>  
> 
> -enum vchiq_status
> +int
>  vchiq_set_service_option(unsigned int handle,
>  	enum vchiq_service_option option, int value)
>  {
>  	struct vchiq_service *service = find_service_by_handle(handle);
> -	enum vchiq_status status = VCHIQ_ERROR;
>  	struct vchiq_service_quota *quota;
> +	int ret = -EINVAL;
>  
> 
>  	if (!service)
> -		return VCHIQ_ERROR;
> +		return -EINVAL;
>  
> 
>  	switch (option) {
>  	case VCHIQ_SERVICE_OPTION_AUTOCLOSE:
>  		service->auto_close = value;
> -		status = VCHIQ_SUCCESS;
> +		ret = 0;
>  		break;
>  
> 
>  	case VCHIQ_SERVICE_OPTION_SLOT_QUOTA:
> @@ -3402,7 +3402,7 @@ vchiq_set_service_option(unsigned int handle,
>  				 * dropped below its quota
>  				 */
>  				complete(&quota->quota_event);
> -			status = VCHIQ_SUCCESS;
> +			ret = 0;
>  		}
>  		break;
>  
> 
> @@ -3420,7 +3420,7 @@ vchiq_set_service_option(unsigned int handle,
>  				 * dropped below its quota
>  				 */
>  				complete(&quota->quota_event);
> -			status = VCHIQ_SUCCESS;
> +			ret = 0;
>  		}
>  		break;
>  
> 
> @@ -3428,13 +3428,13 @@ vchiq_set_service_option(unsigned int handle,
>  		if ((service->srvstate == VCHIQ_SRVSTATE_HIDDEN) ||
>  		    (service->srvstate == VCHIQ_SRVSTATE_LISTENING)) {
>  			service->sync = value;
> -			status = VCHIQ_SUCCESS;
> +			ret = 0;
>  		}
>  		break;
>  
> 
>  	case VCHIQ_SERVICE_OPTION_TRACE:
>  		service->trace = value;
> -		status = VCHIQ_SUCCESS;
> +		ret = 0;
>  		break;
>  
> 
>  	default:
> @@ -3442,7 +3442,7 @@ vchiq_set_service_option(unsigned int handle,
>  	}
>  	unlock_service(service);
>  
> 
> -	return status;
> +	return ret;
>  }
>  
> 
>  static int
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index aad1c5c..bd1f590 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -712,7 +712,7 @@ extern int vchiq_get_client_id(unsigned int service);
>  
> 
>  extern void vchiq_get_config(struct vchiq_config *config);
>  
> 
> -extern enum vchiq_status
> +extern int
>  vchiq_set_service_option(unsigned int service, enum vchiq_service_option option,
>  			 int value);
>  
> 



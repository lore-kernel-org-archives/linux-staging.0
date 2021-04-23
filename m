Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC471
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 10:00:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69D7D613C3;
	Fri, 23 Apr 2021 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619172000;
	bh=d48O+RCcKIrRpxbOJ2JXjevYh+I2d0oAkTW2YFnUdSY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Szwa8W+sU6rXPxC2GcafaBrGJeuYw7ydZ6UBZoOXvcS8PJxWff/iRCvt2I44v2yQi
	 HHmkdE1Qpunt3//dazYuBmNy4cDS7oqAFzC6QynwD3G3KS0wTnJ0q59e4T2yNV/H5p
	 cdaYTH9bcgBvT1o9IxIdVIFm/d0xQzYZ3R9C60NYEHblXJmGdj0AePWKaGDJf29cfw
	 XMMqF2LsR1pVD9ea0rkUsHrSoBdNJXvFoZUWNRJtgfdrSEE8NeIuI/UMuZLaQMRlCN
	 7Y1o00SSmtRE0EZss5rf8l2h42dO6H9nZOiEJsrj/IT7yuyWuZKbvJkfxD5VxodnPb
	 za5FYbdv3BTmA==
Message-ID: <3731e98b81eac97f2bdbe9a24fa7cfef59b07581.camel@kernel.org>
Subject: Re: [PATCH 08/10] staging: vchiq_core: drop vchiq_status from
 vchiq_set_service_option
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 11:59:56 +0200
In-Reply-To: <1619122076-31785-9-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-9-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> Replace the custom set of return values with proper Linux error codes for
> vchiq_set_service_option(). Now we can use the result directly as return
> value for vchiq_ioctl().
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
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
> index 9f9677a..31c1c1a 100644
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
> +	int ret = -EIO;

Due to the nature of the driver it's hard to make a clear distinction, but is
-EIO really the best error for the function? I don't see error paths that
really depend on communication with VC4. I see it more aligned with -EINVAL.

Regards,
Nicolas


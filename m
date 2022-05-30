Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C77A
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 19:27:19 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.170]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mzhzd-1nZfr33Eyf-00vdih; Mon, 30 May 2022 21:27:00 +0200
Message-ID: <ea262d34-954b-aa3d-bb12-cc608bec136a@i2se.com>
Date: Mon, 30 May 2022 21:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/9] staging: vchiq_arm: pass vchiq instance to service
 callbacks
Content-Language: en-US
To: Adrien Thierry <athierry@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20220518191126.60396-1-athierry@redhat.com>
 <20220518191126.60396-4-athierry@redhat.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220518191126.60396-4-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vFkK1yfd6jpmjLSKmmiAU7etS+PJqIMhmLSDjQ2I03PaQT99Wri
 g89whuyOg6+SzfGbFWqEK2xbAOEVzl463uYr6aRi5ZrqEu6cmUTekVuZVr5k+lo3J4J4cjG
 +sH9L76pL8xmi0uZU2qj3JH17XSahsDm0mVm7KxlcrOf+fRU0+fnrpBqqtf+yG5SjHk4k4S
 yVJUyuKQboXX7YRzwsfVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2hgkBlpS17k=:sAe7AqLIY7jx+OP08fDhdg
 eCATXBZb14jXdaaPZHE3XunQiUOZQMR4N0OKi5gOaGreYNchOSJ0PETxhCt+KBVnOmLs7WV21
 sFL3sAzlfk2GfJHuzgUY2WhYMHxK0yE6hRGm5HTaSevvQMwAvlQVryI+ZI+5bDj0i2AnrOAbl
 6ognx9ItSEYYqXzzmyErLa4ukv/IY2Z1Q4ZtxUpqW8pqRuwBKyYRVWy76j7G51o7OHtCaTj/f
 ObBGAZhUw+bGTdXPRJm7VmsxJlCLUsS2+RgIg2vLT/qL2TERIuKmWRJdulRsW4ChveSCwmN1m
 NWlN/mMr0ya/DLqveYQV4sU4rSin8LpzobbgE+dFkIgnW4ED1a3QsChhzDWjgE7Bo4mVzTQPc
 LOpP1yTy0xTyO5N2YhilwFgYHiBb5bVp0s+Ys/XQGvpv9VHEOvtWq9ulFDVtTtkDSA+j8Sbmt
 V+qGY2Fq3QsamuEnlPxztjfaRfrv1wHh8nI6bHnKLUdYIxHlbcj8uWl9eBsBKt4UlD2wpE210
 eDvFSbIjvxP+vwDt4tYmdM7384ARjiT2MEPqebYuOnUuUPmAPuloL6N+a3SvYqBGPm1a/njex
 pbXPxTTECiJzj7OmVQP3y5kLXwgvEB8s6XXOlSb3Ntxr8D/23Pbd3S0gnNmQdNgNkqrr6Hz9r
 Tb/sADOeRWkDnboF/yJahK15vB0G18jjqxgXnfkzCGQOM/Jjyp29PPhjOso54eYuqf0C73hdy
 ra5OaSlpdxoK8Hi+7ps2l+mRX5vj1+L6+vhbARoKQZGpq4CbaduEbcl5nqg=

Hi Adrien,

Am 18.05.22 um 21:11 schrieb Adrien Thierry:
> In order to remove the 'vchiq_states' global array, we need to pass the
> vchiq_instance reference to the 'handle_to_service' function, as well as
> to all functions that call 'handle_to_service'. This will allow
> accessing the vchiq state through the vchiq instance instead of through
> the global array.
>
> 'handle_to_service' is called by 'service_callback'. Therefore, pass the
> vchiq instance reference to 'service_callback'. This also requires
> adding the vchiq instance reference to the service callbacks prototype,
> and update all other callbacks accordingly.
>
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>   .../staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c  | 3 ++-
>   .../vc04_services/include/linux/raspberrypi/vchiq.h      | 8 ++++++--
>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c        | 9 ++++-----
>   .../vc04_services/interface/vchiq_arm/vchiq_arm.h        | 4 ++--
>   .../vc04_services/interface/vchiq_arm/vchiq_core.c       | 3 ++-
>   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c    | 3 ++-
>   6 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> index 701abe430877..c32c8c93a615 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> +++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> @@ -89,7 +89,8 @@ static int bcm2835_audio_send_simple(struct bcm2835_audio_instance *instance,
>   	return bcm2835_audio_send_msg(instance, &m, wait);
>   }
>   
> -static enum vchiq_status audio_vchi_callback(enum vchiq_reason reason,
> +static enum vchiq_status audio_vchi_callback(struct vchiq_instance *vchiq_instance,
> +					     enum vchiq_reason reason,
>   					     struct vchiq_header *header,
>   					     unsigned int handle, void *userdata)
>   {
> diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> index 715f02e7f1e1..97537d3b1d28 100644
> --- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> +++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> @@ -53,9 +53,12 @@ struct vchiq_element {
>   	unsigned int size;
>   };
>   
> +struct vchiq_instance;
as far i can see this struct was already declared in this header 
somewhere below. So please avoid multiple declarations.
> +
>   struct vchiq_service_base {
>   	int fourcc;
> -	enum vchiq_status (*callback)(enum vchiq_reason reason,
> +	enum vchiq_status (*callback)(struct vchiq_instance *instance,
> +				      enum vchiq_reason reason,
>   				      struct vchiq_header *header,
>   				      unsigned int handle,
>   				      void *bulk_userdata);
> @@ -71,7 +74,8 @@ struct vchiq_completion_data_kernel {
>   
>   struct vchiq_service_params_kernel {
>   	int fourcc;
> -	enum vchiq_status (*callback)(enum vchiq_reason reason,
> +	enum vchiq_status (*callback)(struct vchiq_instance *instance,
> +				      enum vchiq_reason reason,
>   				      struct vchiq_header *header,
>   				      unsigned int handle,
>   				      void *bulk_userdata);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 3b447c635c3f..ffb24298e26b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1041,8 +1041,8 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
>   }
>   
>   enum vchiq_status
> -service_callback(enum vchiq_reason reason, struct vchiq_header *header,
> -		 unsigned int handle, void *bulk_userdata)
> +service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
> +		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata)
>   {
>   	/*
>   	 * How do we ensure the callback goes to the right client?
> @@ -1052,7 +1052,6 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
>   	 */
>   	struct user_service *user_service;
>   	struct vchiq_service *service;
> -	struct vchiq_instance *instance;
>   	bool skip_completion = false;
>   
>   	DEBUG_INITIALISE(g_state.local);
> @@ -1067,7 +1066,6 @@ service_callback(enum vchiq_reason reason, struct vchiq_header *header,
>   	}
>   
>   	user_service = (struct user_service *)service->base.userdata;
> -	instance = user_service->instance;
>   
>   	if (!instance || instance->closing) {
>   		rcu_read_unlock();
> @@ -1313,7 +1311,8 @@ vchiq_get_state(void)
>    */
>   
>   static enum vchiq_status
> -vchiq_keepalive_vchiq_callback(enum vchiq_reason reason,
> +vchiq_keepalive_vchiq_callback(struct vchiq_instance *instance,
> +			       enum vchiq_reason reason,
>   			       struct vchiq_header *header,
>   			       unsigned int service_user, void *bulk_user)
>   {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 2aa46b119a46..f671c3976ab7 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -138,8 +138,8 @@ static inline int vchiq_register_chrdev(struct device *parent) { return 0; }
>   #endif /* IS_ENABLED(CONFIG_VCHIQ_CDEV) */
>   
>   extern enum vchiq_status
> -service_callback(enum vchiq_reason reason, struct vchiq_header *header,
> -		 unsigned int handle, void *bulk_userdata);
> +service_callback(struct vchiq_instance *vchiq_instance, enum vchiq_reason reason,
> +		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata);
>   
>   extern void
>   free_bulk_waiter(struct vchiq_instance *instance);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 04eec18835da..547af55d3859 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -466,7 +466,8 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
>   	vchiq_log_trace(vchiq_core_log_level, "%d: callback:%d (%s, %pK, %pK)",
>   			service->state->id, service->localport, reason_names[reason],
>   			header, bulk_userdata);
> -	status = service->base.callback(reason, header, service->handle, bulk_userdata);
> +	status = service->base.callback(service->instance, reason, header, service->handle,
> +					bulk_userdata);
>   	if (status == VCHIQ_ERROR) {
>   		vchiq_log_warning(vchiq_core_log_level,
>   				  "%d: ignoring ERROR from callback to service %x",
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 145021af93b2..55f290b64d6a 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -548,7 +548,8 @@ static void bulk_abort_cb(struct vchiq_mmal_instance *instance,
>   }
>   
>   /* incoming event service callback */
> -static enum vchiq_status service_callback(enum vchiq_reason reason,
> +static enum vchiq_status service_callback(struct vchiq_instance *vchiq_instance,
> +					  enum vchiq_reason reason,
>   					  struct vchiq_header *header,
>   					  unsigned int handle, void *bulk_ctx)
>   {

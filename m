Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040C37A
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 20:09:23 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.170]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQ6C0-1o93MQ0dNY-00M201; Mon, 30 May 2022 22:09:06 +0200
Message-ID: <5b5bdc2a-90a4-25c5-6741-a20e142011b9@i2se.com>
Date: Mon, 30 May 2022 22:09:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 8/9] staging: vchiq_arm: use state from vchiq instance
Content-Language: en-US
To: Adrien Thierry <athierry@redhat.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20220518191126.60396-1-athierry@redhat.com>
 <20220518191126.60396-9-athierry@redhat.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220518191126.60396-9-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NmGRU4rkXJ7y2OUAcXTt529V7JNnJUehi0RzOfeKkJtZF5Xl1jz
 pjFobIVRKWvPVWdgHfAZkbGmkZ4KnkePtQyYyqt0/zVJZlbJDLCmD2BmF387hOXC4S04PX1
 D+Ml866/bhB3RpzlIRj+3/Sh8KyQCpG/v555EnzEmq0Np1WKw5VY01NeWvKntmx1FCnddmV
 amDdwPchbX5ssoK0NdxuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dzUvKTVEr2E=:kY8SXFdsZZNg0WaIdtfQj7
 g0AgMz1euI2DcqOB1008HT7qc5Tss6xhDmCscDGHW6OoeUz918sIuuzqCS5870W2vyv+r9d8R
 qfAV10dFyJPaQxCJEItsXMYj0IDRoNUnNAcRj5QmCSEj5lgOUca2Ijf0Ycj1Q4wQHZxHx5T9w
 2LxvKueP/YaZJ3DXzgqIzVbZB1JSfEnjWaZb5dSTVQQyTvyJmiDjQEuWH6eWlavBZmWasqHD7
 FUz1HMgwQVMsrWGLSSg7dsOdtFo/RK2GY+Bg8YrfrkM8kem1RKJFBskxKGHceN4EJSZ8x2dqe
 PTRLpe+JiYWygkradBo6wUiUxP4CZYvrbNV7ukSMM0+KezO7G/RPUXoqNEQVEyioUK+tJy2Um
 iwvRZs89Tx7ORK+qwhGjUTH7On25TtbvSM8zzCdTIgNj0d+K4uxjWQPNSdyrygzDTn6QcQGis
 Elv3EQTJ70vZw4IsqBpbOU498v/D690nQCX57IPevbmb0IGWiRokb3mrNor2CnW6O1ewGA8/m
 LeRVAmpKvCa7junrQgTcx7+JqWz5vjCL5QHFAmIUBi6QOtINGeXq7MlqNasY4ehoH3MfIIlLj
 SZrm+Oswkoa5c2MXh/uo2RlWkMe7DocPphrdWc0BRvN5x+kW1jlDeYEnaXfIae+B9r4cNbLxL
 9X6/9t0wV9E3B3yOlrBFoHf4YtAnrJ8Bt4sMXAwIrVssSkd4C1ny1caejXZZS7KH9K0uwm1iz
 f0zEgstmOIHvHgR4VeZQd4UsvI+mQAMN8CgAjCDHPZrn42+SF2jkcBtxKTo=

Hi Adrien,

Am 18.05.22 um 21:11 schrieb Adrien Thierry:
> In 'handle_to_service', access the vchiq state from the vchiq instance
> instead of the global 'vchiq_states' array. This will allow getting rid
> of the global 'vchiq_states' array.
>
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>   .../vc04_services/interface/vchiq_arm/vchiq_core.c   |  7 +++++++
>   .../vc04_services/interface/vchiq_arm/vchiq_core.h   | 12 +-----------
>   2 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index be2ee84686b7..cd23d18f8b3c 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -13,6 +13,7 @@
>   #include <linux/rcupdate.h>
>   #include <linux/sched/signal.h>
>   
> +#include "vchiq_arm.h"
>   #include "vchiq_core.h"
>   
>   #define VCHIQ_SLOT_HANDLER_STACK 8192
> @@ -234,6 +235,12 @@ set_service_state(struct vchiq_service *service, int newstate)
>   	service->srvstate = newstate;
>   }
>   
> +struct vchiq_service *handle_to_service(struct vchiq_instance *instance, unsigned int handle)
> +{
> +	int idx = handle & (VCHIQ_MAX_SERVICES - 1);
> +
> +	return rcu_dereference(instance->state->services[idx]);
looking at vchiq_initialise() and vchiq_get_state() let me think that we 
cannot assume that instance->state is always different from NULL.
> +}
>   struct vchiq_service *
>   find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
>   {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 07c3a82e6084..f87b4b9b3596 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -509,17 +509,7 @@ extern void
>   request_poll(struct vchiq_state *state, struct vchiq_service *service,
>   	     int poll_type);
>   
> -static inline struct vchiq_service *
> -handle_to_service(struct vchiq_instance *instance, unsigned int handle)
> -{
> -	int idx = handle & (VCHIQ_MAX_SERVICES - 1);
> -	struct vchiq_state *state = vchiq_states[(handle / VCHIQ_MAX_SERVICES) &
> -		(VCHIQ_MAX_STATES - 1)];
> -
> -	if (!state)
> -		return NULL;
> -	return rcu_dereference(state->services[idx]);
> -}
> +struct vchiq_service *handle_to_service(struct vchiq_instance *instance, unsigned int handle);
>   
>   extern struct vchiq_service *
>   find_service_by_handle(struct vchiq_instance *instance, unsigned int handle);

Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7AA7A
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 19:43:45 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.170]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mgebs-1nJN9T3S16-00h80g; Mon, 30 May 2022 21:43:31 +0200
Message-ID: <7183e022-d456-b8a2-4942-a2eae169d730@i2se.com>
Date: Mon, 30 May 2022 21:43:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 4/9] staging: vchiq_arm: pass vchiq instance to
 'find_service_by_handle'
Content-Language: en-US
To: Adrien Thierry <athierry@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20220518191126.60396-1-athierry@redhat.com>
 <20220518191126.60396-5-athierry@redhat.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220518191126.60396-5-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:M7RYoiA6zsViTDeWkneTARwQduqOnXQnyudMhOLNlLfu8YnOQSS
 3meQQV860I12KCkoA2q6LcO7ku/eUmPvSqT4e4VI/Zzqy7vI2pHutOvfswyMSXXtqtrXCGJ
 5xT4vj4KleJjjPEUJJ+dVr6AAmOmgZDYSW+xowOz+oI7FfXoRb2ssxGyAbZ7uiTzk/Su2WB
 ttfnWcTMwwet8RTiVvPdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ydjo+CkEM50=:/aY6wxUXYsDhtij5CnbH5x
 um+Q214VN3uvtafyTrvcCAdmnq2IwAwY6liK+vpS0Czkw4mtLjUahXaiIevAFM5Dia4mC3j04
 X1Aby6Bkw/7kjhzowb5FZsjWQ23aLYpuMIJCrtVSR4PXtQOWIvZ+MRN7PDMgHMmWbEcdUrkG9
 hdSFeF9HmVqx0l4iNQwJy7jla9jWsENs3qWrZTBE9M+bfh/+MCc/7fZG+0mssVijBkj5CcDHa
 KSAvIgZhgSaNBhgxjW7R/Ema1Y2oaDQWbubVap6g47YDYTkvA8xUMG/PcOAO6Hi0tQwASGllI
 izxSM7Eu5YLrjiC2fn8EsJkVI/NqKr80ZMJe7COIDSloaB+bz7gqyXY50FxoBY4yyWJd/edqo
 jcyANLaLcPmXiI1DQoyPnvqwNdO8H7ZCEopy+dgpXuXEQbNfaTSpNKp9FVU4kthJQv2JpBlSJ
 86LRUEVJ2w7napd3wiExOo/5I3iLzW3cpomQd8GBpNVfw1ZH2MadlGOJLjLftQL/wwnCkahcF
 uGr4m0O+VskvJ0Xxkwldq+KxKVob3IUH6N+VaTfbYED6C8ymUU+uswxTsFVcoagRFlWv9odnR
 7arI+ek32UlRiU77EViWeoj+H3lOc9mfgaM4inrv3MSS2wj5bPI4UEF3KosV0m3b/mEJEzKLi
 x+B0Nl6gbZ04/s82XqIyXOLvfFh/r1c2ANYONzIrlGHUFUc0wiKQu3xcuHo6O3LjHgYOltXLL
 KGEVMDi5jsSv/XBtkXmLTh4LD96us9tOFZa0Leqaqqhzid9pbDUK4tDYaI0=

Hi Adrien,

Am 18.05.22 um 21:11 schrieb Adrien Thierry:
> In order to remove the 'vchiq_states' global array, we need to pass the
> vchiq_instance reference to the 'handle_to_service' function, as well as
> to all functions that call 'handle_to_service'. This will allow
> accessing the vchiq state through the vchiq instance instead of through
> the global array.
>
> 'handle_to_service' is called by 'find_service_by_handle'. Therefore,
> pass the vchiq instance reference to 'find_service_by_handle' and to its
> callers.
>
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>   .../bcm2835-audio/bcm2835-vchiq.c             | 27 +++++----
>   .../include/linux/raspberrypi/vchiq.h         | 26 +++++----
>   .../interface/vchiq_arm/vchiq_arm.c           | 16 +++---
>   .../interface/vchiq_arm/vchiq_arm.h           |  4 +-
>   .../interface/vchiq_arm/vchiq_core.c          | 47 ++++++++--------
>   .../interface/vchiq_arm/vchiq_core.h          |  9 +--
>   .../interface/vchiq_arm/vchiq_dev.c           | 36 ++++++------
>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 56 +++++++++----------
>   8 files changed, 118 insertions(+), 103 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> index c32c8c93a615..aa2ab0df7af5 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> +++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
> @@ -25,12 +25,14 @@ MODULE_PARM_DESC(force_bulk, "Force use of vchiq bulk for audio");
>   static void bcm2835_audio_lock(struct bcm2835_audio_instance *instance)
>   {
>   	mutex_lock(&instance->vchi_mutex);
> -	vchiq_use_service(instance->service_handle);
> +	vchiq_use_service(instance->alsa_stream->chip->vchi_ctx->instance,
> +			  instance->service_handle);
while being in the interface directory it's clear that "instance" refers 
to vchiq, but here it is a higher chance to mixing things up. But not 
sure if it's okay to use an additional variable "vchiq_instance" to 
clarify here or the naming "instance" is unlucky.
>   }
>   
>   static void bcm2835_audio_unlock(struct bcm2835_audio_instance *instance)
>   {
> -	vchiq_release_service(instance->service_handle);
> +	vchiq_release_service(instance->alsa_stream->chip->vchi_ctx->instance,
> +			      instance->service_handle);
>   	mutex_unlock(&instance->vchi_mutex);
>   }
>   
> @@ -44,8 +46,8 @@ static int bcm2835_audio_send_msg_locked(struct bcm2835_audio_instance *instance
>   		init_completion(&instance->msg_avail_comp);
>   	}
>   
> -	status = vchiq_queue_kernel_message(instance->service_handle,
> -					    m, sizeof(*m));
> +	status = vchiq_queue_kernel_message(instance->alsa_stream->chip->vchi_ctx->instance,
> +					    instance->service_handle, m, sizeof(*m));
>   	if (status) {
>   		dev_err(instance->dev,
>   			"vchi message queue failed: %d, msg=%d\n",
> @@ -115,7 +117,7 @@ static enum vchiq_status audio_vchi_callback(struct vchiq_instance *vchiq_instan
>   		dev_err(instance->dev, "unexpected callback type=%d\n", m->type);
>   	}
>   
> -	vchiq_release_message(handle, header);
> +	vchiq_release_message(vchiq_instance, instance->service_handle, header);
>   	return VCHIQ_SUCCESS;
>   }
>   
> @@ -144,7 +146,8 @@ vc_vchi_audio_init(struct vchiq_instance *vchiq_instance,
>   	}
>   
>   	/* Finished with the service for now */
> -	vchiq_release_service(instance->service_handle);
> +	vchiq_release_service(instance->alsa_stream->chip->vchi_ctx->instance,
> +			      instance->service_handle);
>   
>   	return 0;
>   }
> @@ -154,10 +157,12 @@ static void vc_vchi_audio_deinit(struct bcm2835_audio_instance *instance)
>   	int status;
>   
>   	mutex_lock(&instance->vchi_mutex);
> -	vchiq_use_service(instance->service_handle);
> +	vchiq_use_service(instance->alsa_stream->chip->vchi_ctx->instance,
> +			  instance->service_handle);
>   
>   	/* Close all VCHI service connections */
> -	status = vchiq_close_service(instance->service_handle);
> +	status = vchiq_close_service(instance->alsa_stream->chip->vchi_ctx->instance,
> +				     instance->service_handle);
>   	if (status) {
>   		dev_err(instance->dev,
>   			"failed to close VCHI service connection (status=%d)\n",
> @@ -227,7 +232,7 @@ int bcm2835_audio_open(struct bcm2835_alsa_stream *alsa_stream)
>   		goto deinit;
>   
>   	bcm2835_audio_lock(instance);
> -	vchiq_get_peer_version(instance->service_handle,
> +	vchiq_get_peer_version(vchi_ctx->instance, instance->service_handle,
>   			       &instance->peer_version);
>   	bcm2835_audio_unlock(instance);
>   	if (instance->peer_version < 2 || force_bulk)
> @@ -352,8 +357,8 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
>   		while (count > 0) {
>   			int bytes = min(instance->max_packet, count);
>   
> -			status = vchiq_queue_kernel_message(instance->service_handle,
> -							    src, bytes);
> +			status = vchiq_queue_kernel_message(vchiq_instance,
> +							    instance->service_handle, src, bytes);
>   			src += bytes;
>   			count -= bytes;
>   		}

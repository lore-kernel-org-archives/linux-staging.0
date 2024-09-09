Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C1A224F6
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725905224; cv=none; b=VtbzbE77E+p4+cyTkZOl7U46He9bdummqRuafycT1Pv13hvVyl0QRlhDzJLgxQ6fMmtbzqbUZL+8QG8X8H55SOgSu2htitw16yYOU7vdjIO2fVWRJbTsfahM4Ox5qfYH1GO+EMhsP2ilw4p8RSChEvtG9evI7bp2uyQJBJebkWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725905224; c=relaxed/simple;
	bh=EFVBH32yiTSieqbUeO49BQmc7fsNyP+szIXXp8v1pNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bkzdx1XQUw7clu5vqY9EEoRjoWSOvd8t6otrhdIUeKX8OONNTqxOn+V8ctiVJCzIjtmkZgirSjtEXyGlk8AhfvoBfI1Bi0HBgPvsJcm+GB3gokhS5AlMUOV2DyWQwP76nHJQ7IvSrSO91BeqsNHpwrxRk9W5KspyVhvQWMryf3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=p8LMmpjN; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="p8LMmpjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1725905204; x=1726510004; i=wahrenst@gmx.net;
	bh=UObQMsQLhEqDwZD3wnCo/WYIAbTHsveAkvEgoqv/U3w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=p8LMmpjNljIKFW4kxp2qephNm2qQknvkOEhGSf62CQ/QyEh3HadoqJdWstROCGt9
	 YwEhNo7DzBaIbdNTSRj9QR7OmKtPh4JB4uGurkHOnUvD1sYYlwsAqM1KKtlpEiAwa
	 TpSWyun63v5GHxvmEpV4x9SxGXhoIRwGYSBmuKzfxcSPB4OCOCwcDduGtYbDUlBBb
	 vhQUyylicQ9BLRIk8J5Q3SceqhjCqe8zQ73e43afbRtmYTruLFxjT5NeC8Kw9KfWy
	 ymS0jKSLi6reup8PTLBNSMfay262+uwyLx79EJGye8aa18Am2Yu8qaSqCkMYIMjYA
	 2FfsAnDZytVTpnOR8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.128] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1sEf5A1xRI-00kgyp; Mon, 09
 Sep 2024 20:06:44 +0200
Message-ID: <9b3ff1d6-6f39-4210-ac67-23e643636ee8@gmx.net>
Date: Mon, 9 Sep 2024 20:06:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] staging: vchiq_core: Simplify
 vchiq_bulk_transfer()
To: Umang Jain <umang.jain@ideasonboard.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240909061457.255452-1-umang.jain@ideasonboard.com>
 <20240909061457.255452-3-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240909061457.255452-3-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4XrggitUF/Z1ZUCNMMzuBSsIJjSO2+urXjAPENtgplh6wbOZz83
 yJb+9SxFGpvge6nSOPAZfTMvCC83/FHXbgtL5lH3iQt0rlai/VsKmy7G+3IPqyJA92HYLTp
 YsAfX6o1z1sidGOW0/ySi7LJDnC36TYwIVDwv0nNRK8U6YBvGigfGlE9wYSlQEUcQM+mWbS
 8Lp6v6crmJoZLrJ1zsV8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bKMgRpnNRuc=;Qdf0p4VrUUIpNErBfxjKgYS23Ua
 /g3KbUo6eJpPE3nob8D4GWlc8i5d63ZAS68lwHM4vd8bMtlZIeuxGDGiNJEojZqIp9dpMGtri
 clRW0+R9r2YGXfMGyogeTgUyEok0sfDx/LqsToWTtl68SkUgo1ZjYd8OB8/o1xYruOd7q8gs3
 zKmTmTRXKDlzWp2uoj+VUZqneKvi/1PUPmqW7MJUDMSdAFSMsY74PRhnbksUTm/MUTnrum0xh
 WEupFWtJ4zg45hf9uuCXn/KLf/BjgOgvyEt2u+vKACt8tQVdF4i2oYGgziVIOKc2MuqYA192E
 9t1aQcR+9J+ZxUEBixcwEpPLHEfDqKaRrM6eoTfUMgvk/WccJQSFW6cHyH6+RkH/+nlHiUPsa
 zBqtyajgMM5h7ohv76ZHqowynS+c+3xcDFsMsDR9OM3fwCr/lcYTQjQD3RWH7DLbF+FgnWRv/
 K4h1xNRz1TCPtSjIKBHX2UTn4/s4dtM/8vP1B0j5vGFMA4nYq6AMLzfvvjpyRD8VcW7FmwEqZ
 ME2f0RCu5OlfU+QDNzJZ0xaV0H9CTe9yha2EaspHC6MJJag4qofLwe25yB0ZDDrBsGXaT4jW+
 d8pxAptvDAr2+24VwjXRBKD081B2rcr3IEjhMejxwYUGTSGVYdzeQwIfNOC1hJBe4zlBDz+tN
 Ymjc8hVRchCcRj/0/uaxk4F3k0h1jiv80NJC3FMFNK/dsR2ysVPlRtNYU/DIlg7rXOtfJ67xr
 g7I3HdL9MZYzPNJsXa+gOzQdTxsMgJqo1VZKUU+p6AE2KXgXEzAcabYsGriHwfnSfSyDM3itC
 WWL471HkfNEY7XAlQDQsz8dA==

Hi Umang,

Am 09.09.24 um 08:14 schrieb Umang Jain:
> Factor out core logic for preparing bulk data transfer(mutex locking,
> waits on vchiq_bulk_queue wait-queue, initialising the bulk transfer)
> out of the vchiq_bulk_transfer(). This simplifies the existing
> vchiq_bulk_transfer() and makes it more readable since all the core
> logic is handled in vchiq_bulk_xfer_queue_msg_interruptible(). It
> will also help us to refactor vchiq_bulk_transfer() easily for different
> vchiq bulk transfer modes.
>
> No functional changes intended in this patch.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../interface/vchiq_arm/vchiq_core.c          | 217 ++++++++++--------
>   1 file changed, 121 insertions(+), 96 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 2239f59519be..f36044bab194 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -189,6 +189,13 @@ static const char *const conn_state_names[] =3D {
>   static void
>   release_message_sync(struct vchiq_state *state, struct vchiq_header *h=
eader);
>
> +static int
> +vchiq_bulk_xfer_queue_msg_interruptible(struct vchiq_service *service,
> +					void *offset, void __user *uoffset,
> +					int size, void *userdata,
> +					enum vchiq_bulk_mode mode,
> +					enum vchiq_bulk_dir dir);
please no forward declaration of this function. This makes maintenance
harder.

Except of this, i'm fine with this series.

Best regards
> +
>   static const char *msg_type_str(unsigned int msg_type)
>   {
>   	switch (msg_type) {
> @@ -2991,15 +2998,9 @@ int vchiq_bulk_transfer(struct vchiq_instance *in=
stance, unsigned int handle,
>   			enum vchiq_bulk_mode mode, enum vchiq_bulk_dir dir)
>   {
>   	struct vchiq_service *service =3D find_service_by_handle(instance, ha=
ndle);
> -	struct vchiq_bulk_queue *queue;
> -	struct vchiq_bulk *bulk;
> -	struct vchiq_state *state;
>   	struct bulk_waiter *bulk_waiter =3D NULL;
> -	const char dir_char =3D (dir =3D=3D VCHIQ_BULK_TRANSMIT) ? 't' : 'r';
> -	const int dir_msgtype =3D (dir =3D=3D VCHIQ_BULK_TRANSMIT) ?
> -		VCHIQ_MSG_BULK_TX : VCHIQ_MSG_BULK_RX;
> +	struct vchiq_bulk *bulk;
>   	int status =3D -EINVAL;
> -	int payload[2];
>
>   	if (!service)
>   		goto error_exit;
> @@ -3027,89 +3028,10 @@ int vchiq_bulk_transfer(struct vchiq_instance *i=
nstance, unsigned int handle,
>   		goto error_exit;
>   	}
>
> -	state =3D service->state;
> -
> -	queue =3D (dir =3D=3D VCHIQ_BULK_TRANSMIT) ?
> -		&service->bulk_tx : &service->bulk_rx;
> -
> -	if (mutex_lock_killable(&service->bulk_mutex)) {
> -		status =3D -EAGAIN;
> -		goto error_exit;
> -	}
> -
> -	if (queue->local_insert =3D=3D queue->remove + VCHIQ_NUM_SERVICE_BULKS=
) {
> -		VCHIQ_SERVICE_STATS_INC(service, bulk_stalls);
> -		do {
> -			mutex_unlock(&service->bulk_mutex);
> -			if (wait_for_completion_interruptible(&service->bulk_remove_event)) =
{
> -				status =3D -EAGAIN;
> -				goto error_exit;
> -			}
> -			if (mutex_lock_killable(&service->bulk_mutex)) {
> -				status =3D -EAGAIN;
> -				goto error_exit;
> -			}
> -		} while (queue->local_insert =3D=3D queue->remove +
> -				VCHIQ_NUM_SERVICE_BULKS);
> -	}
> -
> -	bulk =3D &queue->bulks[BULK_INDEX(queue->local_insert)];
> -
> -	bulk->mode =3D mode;
> -	bulk->dir =3D dir;
> -	bulk->userdata =3D userdata;
> -	bulk->size =3D size;
> -	bulk->actual =3D VCHIQ_BULK_ACTUAL_ABORTED;
> -
> -	if (vchiq_prepare_bulk_data(instance, bulk, offset, uoffset, size, dir=
))
> -		goto unlock_error_exit;
> -
> -	/*
> -	 * Ensure that the bulk data record is visible to the peer
> -	 * before proceeding.
> -	 */
> -	wmb();
> -
> -	dev_dbg(state->dev, "core: %d: bt (%d->%d) %cx %x@%pad %pK\n",
> -		state->id, service->localport, service->remoteport,
> -		dir_char, size, &bulk->data, userdata);
> -
> -	/*
> -	 * The slot mutex must be held when the service is being closed, so
> -	 * claim it here to ensure that isn't happening
> -	 */
> -	if (mutex_lock_killable(&state->slot_mutex)) {
> -		status =3D -EAGAIN;
> -		goto cancel_bulk_error_exit;
> -	}
> -
> -	if (service->srvstate !=3D VCHIQ_SRVSTATE_OPEN)
> -		goto unlock_both_error_exit;
> -
> -	payload[0] =3D lower_32_bits(bulk->data);
> -	payload[1] =3D bulk->size;
> -	status =3D queue_message(state,
> -			       NULL,
> -			       VCHIQ_MAKE_MSG(dir_msgtype,
> -					      service->localport,
> -					      service->remoteport),
> -			       memcpy_copy_callback,
> -			       &payload,
> -			       sizeof(payload),
> -			       QMFLAGS_IS_BLOCKING |
> -			       QMFLAGS_NO_MUTEX_LOCK |
> -			       QMFLAGS_NO_MUTEX_UNLOCK);
> +	status =3D vchiq_bulk_xfer_queue_msg_interruptible(service, offset, uo=
ffset,
> +							 size, userdata, mode, dir);
>   	if (status)
> -		goto unlock_both_error_exit;
> -
> -	queue->local_insert++;
> -
> -	mutex_unlock(&state->slot_mutex);
> -	mutex_unlock(&service->bulk_mutex);
> -
> -	dev_dbg(state->dev, "core: %d: bt:%d %cx li=3D%x ri=3D%x p=3D%x\n",
> -		state->id, service->localport, dir_char, queue->local_insert,
> -		queue->remote_insert, queue->process);
> +		goto error_exit;
>
>   	vchiq_service_put(service);
>
> @@ -3123,13 +3045,6 @@ int vchiq_bulk_transfer(struct vchiq_instance *in=
stance, unsigned int handle,
>
>   	return 0;
>
> -unlock_both_error_exit:
> -	mutex_unlock(&state->slot_mutex);
> -cancel_bulk_error_exit:
> -	vchiq_complete_bulk(service->instance, bulk);
> -unlock_error_exit:
> -	mutex_unlock(&service->bulk_mutex);
> -
>   error_exit:
>   	if (service)
>   		vchiq_service_put(service);
> @@ -3289,6 +3204,116 @@ vchiq_release_message(struct vchiq_instance *ins=
tance, unsigned int handle,
>   }
>   EXPORT_SYMBOL(vchiq_release_message);
>
> +/*
> + * Prepares a bulk transfer to be queued. The function is interruptible=
 and is
> + * intended to be called from user threads. It may return -EAGAIN to in=
dicate
> + * that a signal has been received and the call should be retried after=
 being
> + * returned to user context.
> + */
> +static int
> +vchiq_bulk_xfer_queue_msg_interruptible(struct vchiq_service *service,
> +					void *offset, void __user *uoffset,
> +					int size, void *userdata,
> +					enum vchiq_bulk_mode mode,
> +					enum vchiq_bulk_dir dir)
> +{
> +	struct vchiq_bulk_queue *queue;
> +	struct vchiq_bulk *bulk;
> +	struct vchiq_state *state =3D service->state;
> +	const char dir_char =3D (dir =3D=3D VCHIQ_BULK_TRANSMIT) ? 't' : 'r';
> +	const int dir_msgtype =3D (dir =3D=3D VCHIQ_BULK_TRANSMIT) ?
> +		VCHIQ_MSG_BULK_TX : VCHIQ_MSG_BULK_RX;
> +	int status =3D -EINVAL;
> +	int payload[2];
> +
> +	queue =3D (dir =3D=3D VCHIQ_BULK_TRANSMIT) ?
> +		&service->bulk_tx : &service->bulk_rx;
> +
> +	if (mutex_lock_killable(&service->bulk_mutex))
> +		return -EAGAIN;
> +
> +	if (queue->local_insert =3D=3D queue->remove + VCHIQ_NUM_SERVICE_BULKS=
) {
> +		VCHIQ_SERVICE_STATS_INC(service, bulk_stalls);
> +		do {
> +			mutex_unlock(&service->bulk_mutex);
> +			if (wait_for_completion_interruptible(&service->bulk_remove_event))
> +				return -EAGAIN;
> +			if (mutex_lock_killable(&service->bulk_mutex))
> +				return -EAGAIN;
> +		} while (queue->local_insert =3D=3D queue->remove +
> +				VCHIQ_NUM_SERVICE_BULKS);
> +	}
> +
> +	bulk =3D &queue->bulks[BULK_INDEX(queue->local_insert)];
> +
> +	bulk->mode =3D mode;
> +	bulk->dir =3D dir;
> +	bulk->userdata =3D userdata;
> +	bulk->size =3D size;
> +	bulk->actual =3D VCHIQ_BULK_ACTUAL_ABORTED;
> +
> +	if (vchiq_prepare_bulk_data(service->instance, bulk, offset, uoffset, =
size, dir))
> +		goto unlock_error_exit;
> +
> +	/*
> +	 * Ensure that the bulk data record is visible to the peer
> +	 * before proceeding.
> +	 */
> +	wmb();
> +
> +	dev_dbg(state->dev, "core: %d: bt (%d->%d) %cx %x@%pad %pK\n",
> +		state->id, service->localport, service->remoteport,
> +		dir_char, size, &bulk->data, userdata);
> +
> +	/*
> +	 * The slot mutex must be held when the service is being closed, so
> +	 * claim it here to ensure that isn't happening
> +	 */
> +	if (mutex_lock_killable(&state->slot_mutex)) {
> +		status =3D -EAGAIN;
> +		goto cancel_bulk_error_exit;
> +	}
> +
> +	if (service->srvstate !=3D VCHIQ_SRVSTATE_OPEN)
> +		goto unlock_both_error_exit;
> +
> +	payload[0] =3D lower_32_bits(bulk->data);
> +	payload[1] =3D bulk->size;
> +	status =3D queue_message(state,
> +			       NULL,
> +			       VCHIQ_MAKE_MSG(dir_msgtype,
> +					      service->localport,
> +					      service->remoteport),
> +			       memcpy_copy_callback,
> +			       &payload,
> +			       sizeof(payload),
> +			       QMFLAGS_IS_BLOCKING |
> +			       QMFLAGS_NO_MUTEX_LOCK |
> +			       QMFLAGS_NO_MUTEX_UNLOCK);
> +	if (status)
> +		goto unlock_both_error_exit;
> +
> +	queue->local_insert++;
> +
> +	mutex_unlock(&state->slot_mutex);
> +	mutex_unlock(&service->bulk_mutex);
> +
> +	dev_dbg(state->dev, "core: %d: bt:%d %cx li=3D%x ri=3D%x p=3D%x\n",
> +		state->id, service->localport, dir_char, queue->local_insert,
> +		queue->remote_insert, queue->process);
> +
> +	return status;
> +
> +unlock_both_error_exit:
> +	mutex_unlock(&state->slot_mutex);
> +cancel_bulk_error_exit:
> +	vchiq_complete_bulk(service->instance, bulk);
> +unlock_error_exit:
> +	mutex_unlock(&service->bulk_mutex);
> +
> +	return status;
> +}
> +
>   static void
>   release_message_sync(struct vchiq_state *state, struct vchiq_header *h=
eader)
>   {


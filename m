Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78645190490
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571267; cv=none; b=to+rwR+sMcC9ZsKtixBR46/2z5qGM5Cf/dYf1Z4KoJSaB3lElMWBQ9crZqKg/9MDOtepc9S849lTS9xcJw4YTNRuCSfU3pdm2Ff5z2aPPn1wxfNmGweU2RDpfjcJog8OGLYg1lQ9t4yaReSS/vKeTQ19SXe+flgvs/fAY97EKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571267; c=relaxed/simple;
	bh=s4lo2D5CYmFDoqgh8iknfXx2tNx870WfNaMcRm1qgTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKyIgNsBNXj+GA+Ic4kWVwFzMePZopkrt8K79mC3w7dR0IFSC89ssi0tEwbq1kDBidNAXnx1bY2qudgLVBpi5e23GqWLQPaB/0uzeyg8WDUuBc4flZj7/QGIv8EGhL0oKrekCfT3nVBcwUTeZr6GZxbZrgr2CxxAbt9MBsM4e54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fEHVc98G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fEHVc98G"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74EB8BEB;
	Wed,  5 Jun 2024 09:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717571255;
	bh=s4lo2D5CYmFDoqgh8iknfXx2tNx870WfNaMcRm1qgTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fEHVc98GdE4/9890K1uDlywybXNfBxTgWyfR5pXYdFNhG2hg1ISQ49UXpF7h9cQPr
	 9ngtLLLIeL08QzWWMVa+nyySy16JA42ZQWtYcXGbEhX9bWLekjCfTyolKrLM7FRcUF
	 cBxiz4ZzkMUxBp9z5uvH6oqMRS/A5LRQMzCn3E2A=
Date: Wed, 5 Jun 2024 10:07:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/11] staging: vchiq_arm: Reduce indentation of
 service_callback
Message-ID: <20240605070727.GA3488@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-8-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604172904.61613-8-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Tue, Jun 04, 2024 at 07:29:00PM +0200, Stefan Wahren wrote:
> The service_callback has 5 levels of indentation, which makes it
> hard to read. Reduce this by using a goto for the corner cases
> (no header or VCHI service).

I think the goto isn't very nice. Could you instead try to split code to
a separate function ? That should do a better job at improve
readability.

> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 111 +++++++++---------
>  1 file changed, 57 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 45acca670bbd..0055c7d7e617 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1101,71 +1101,74 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
>  		user_service, service->localport, user_service->userdata,
>  		reason, header, instance, bulk_userdata);
> 
> -	if (header && user_service->is_vchi) {
> -		spin_lock(&service->state->msg_queue_spinlock);
> -		while (user_service->msg_insert ==
> -			(user_service->msg_remove + MSG_QUEUE_SIZE)) {
> -			spin_unlock(&service->state->msg_queue_spinlock);
> -			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
> -			dev_dbg(service->state->dev, "arm: msg queue full\n");
> -			/*
> -			 * If there is no MESSAGE_AVAILABLE in the completion
> -			 * queue, add one
> -			 */
> -			if ((user_service->message_available_pos -
> -				instance->completion_remove) < 0) {
> -				int status;
> -
> -				dev_dbg(instance->state->dev,
> -					"arm: Inserting extra MESSAGE_AVAILABLE\n");
> -				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -				status = add_completion(instance, reason, NULL, user_service,
> -							bulk_userdata);
> -				if (status) {
> -					DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -					vchiq_service_put(service);
> -					return status;
> -				}
> -			}
> +	if (!header || !user_service->is_vchi)
> +		goto service_put;
> +
> +	spin_lock(&service->state->msg_queue_spinlock);
> +	while (user_service->msg_insert ==
> +		(user_service->msg_remove + MSG_QUEUE_SIZE)) {
> +		spin_unlock(&service->state->msg_queue_spinlock);
> +		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> +		DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
> +		dev_dbg(service->state->dev, "arm: msg queue full\n");
> +		/*
> +		 * If there is no MESSAGE_AVAILABLE in the completion
> +		 * queue, add one
> +		 */
> +		if ((user_service->message_available_pos -
> +			instance->completion_remove) < 0) {
> +			int status;
> 
> +			dev_dbg(instance->state->dev,
> +				"arm: Inserting extra MESSAGE_AVAILABLE\n");
>  			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -			if (wait_for_completion_interruptible(&user_service->remove_event)) {
> -				dev_dbg(instance->state->dev, "arm: interrupted\n");
> -				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -				vchiq_service_put(service);
> -				return -EAGAIN;
> -			} else if (instance->closing) {
> -				dev_dbg(instance->state->dev, "arm: closing\n");
> +			status = add_completion(instance, reason, NULL, user_service,
> +						bulk_userdata);
> +			if (status) {
>  				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>  				vchiq_service_put(service);
> -				return -EINVAL;
> +				return status;
>  			}
> -			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> -			spin_lock(&service->state->msg_queue_spinlock);
>  		}
> 
> -		user_service->msg_queue[user_service->msg_insert &
> -			(MSG_QUEUE_SIZE - 1)] = header;
> -		user_service->msg_insert++;
> -
> -		/*
> -		 * If there is a thread waiting in DEQUEUE_MESSAGE, or if
> -		 * there is a MESSAGE_AVAILABLE in the completion queue then
> -		 * bypass the completion queue.
> -		 */
> -		if (((user_service->message_available_pos -
> -			instance->completion_remove) >= 0) ||
> -			user_service->dequeue_pending) {
> -			user_service->dequeue_pending = 0;
> -			skip_completion = true;
> +		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> +		if (wait_for_completion_interruptible(&user_service->remove_event)) {
> +			dev_dbg(instance->state->dev, "arm: interrupted\n");
> +			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> +			vchiq_service_put(service);
> +			return -EAGAIN;
> +		} else if (instance->closing) {
> +			dev_dbg(instance->state->dev, "arm: closing\n");
> +			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> +			vchiq_service_put(service);
> +			return -EINVAL;
>  		}
> +		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
> +		spin_lock(&service->state->msg_queue_spinlock);
> +	}
> 
> -		spin_unlock(&service->state->msg_queue_spinlock);
> -		complete(&user_service->insert_event);
> +	user_service->msg_queue[user_service->msg_insert &
> +		(MSG_QUEUE_SIZE - 1)] = header;
> +	user_service->msg_insert++;
> 
> -		header = NULL;
> +	/*
> +	 * If there is a thread waiting in DEQUEUE_MESSAGE, or if
> +	 * there is a MESSAGE_AVAILABLE in the completion queue then
> +	 * bypass the completion queue.
> +	 */
> +	if (((user_service->message_available_pos -
> +		instance->completion_remove) >= 0) ||
> +		user_service->dequeue_pending) {
> +		user_service->dequeue_pending = 0;
> +		skip_completion = true;
>  	}
> +
> +	spin_unlock(&service->state->msg_queue_spinlock);
> +	complete(&user_service->insert_event);
> +
> +	header = NULL;
> +
> +service_put:
>  	DEBUG_TRACE(SERVICE_CALLBACK_LINE);
>  	vchiq_service_put(service);
> 

-- 
Regards,

Laurent Pinchart

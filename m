Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E2288530;
	Sun, 29 Mar 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774766139; cv=none; b=TiMiaFEKX5KDmuP+Y0f6XPcCF4qi6E65QHpzLU84w50v5EWjDtEHFsHWqt7RYOZ+mRJr3oTX6DNQ9ngZWrfvV4zDroWNC84EuH0Xa74dMKyN8d0YIRTygcMaevTWth06IlLUxi51thJgiiFzBX888esCn/a6KUoqfsTMy3tazq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774766139; c=relaxed/simple;
	bh=rW+ND+3JbUkWM3lXVcAkjV7CsU2FDSrrp5aDczXqKFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJxpEBn+GajZPeQTRQlUGRry66wvOdSJWi1TGW6WIN1YE1v2AysskZ+Bpir6WcTWmJE+PTmqUTFsHt+D9mPOuMxVY2evyhaUWsbl6vdbEx0Kp22YOQtJoGl1RsoHLUFfhrM/Uckbh1PXGJaar4rvGFfLAQ/GMvHlwXvXFQreah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FWCPNX1n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FWCPNX1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BDAC116C6;
	Sun, 29 Mar 2026 06:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774766139;
	bh=rW+ND+3JbUkWM3lXVcAkjV7CsU2FDSrrp5aDczXqKFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWCPNX1njz1LpAyMDmFTGlpVYZD5kkGOkpzjLQZnvwJfjUxlSjhr+v44XoREwNiZQ
	 T9hoJbIVjnEApr1ysxFKuBGU+qr+ZXI4OzU7QH372Qzesk7KsK2t3h+2iw3FR+Ddi/
	 /SYwUt0FnLRASMLAOgrrcmFgKrNdrwz4BXW1MhG4=
Date: Sun, 29 Mar 2026 08:35:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array
 access in event_to_host_cb()
Message-ID: <2026032936-deniable-visa-2459@gregkh>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329062229.493430-2-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329062229.493430-2-sebasjosue84@gmail.com>

On Sun, Mar 29, 2026 at 12:21:11AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> event_to_host_cb() uses msg->u.event_to_host.client_component as an
> index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
> = 64) without any bounds validation. The client_component value comes
> from the VideoCore GPU firmware via VCHIQ message passing.
> 
> A malicious or buggy GPU firmware could send a crafted
> MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >= 64 (or
> negative), causing an out-of-bounds array access in kernel memory. This
> results in reading/dereferencing a bogus vchiq_mmal_component structure
> from memory beyond the array, which can lead to kernel crashes or
> potentially arbitrary kernel memory access.

The kernel trusts the hardware the driver is bound to, so this shouldn't
be happening ever, right?

> 
> Add a bounds check on comp_idx before using it as an array index.
> Move the component pointer assignment after the validation.
> 
> Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
> Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>

No cc: stable?

> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index d36ad71cc..4772126d7 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
>  			     struct mmal_msg *msg, u32 msg_len)
>  {
>  	int comp_idx = msg->u.event_to_host.client_component;
> -	struct vchiq_mmal_component *component =
> -					&instance->component[comp_idx];
> +	struct vchiq_mmal_component *component;
>  	struct vchiq_mmal_port *port = NULL;
>  	struct mmal_msg_context *msg_context;
>  	u32 port_num = msg->u.event_to_host.port_num;
>  
> +	if (comp_idx < 0 || comp_idx >= VCHIQ_MMAL_MAX_COMPONENTS) {
> +		pr_err("%s: component index %d out of range\n",
> +		       __func__, comp_idx);

dev_err() is best, right?

And are you going to allow a malicious hardware device to spam the
kernel log?  :)

thanks,

greg k-h

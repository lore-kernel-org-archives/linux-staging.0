Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208CD13D8A3
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728820794; cv=none; b=Pb6VnfOawfH5lT2XS0U264JLVtvPeZGpKl3gPluCWLQ/sHbO0kn/N4Rbt5novbG6ksv6NOJg4gxqWVX9vWs+BjwJG+2ip4+dVBjEDaF/+kKOH/nUOQOV/CzEuZ7/e1M9AXrUri2+UxRbkxjvJS+Orkcwa/ZRzfsyx43nmYx0IyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728820794; c=relaxed/simple;
	bh=dBqHoJCLZRA1I6ILaOk1lEkDfPZsCfUEqNQP5Nbk14E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQzkGLlRIYkL5dC2G4u1BIsDQuBrorPGc/Z9OCnOgEdG+PZlddwEK8KzGGFu2+v0kfuYDyp6DNRFQSq11KY9Pp9m2gfGT3MSlFi+aRQHXFF8H6MP+DQGpudwrOS/D397KAsJOo6sfy1yB6szCd3GEfyhAZmOdeCGPhSzXE9flDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aUiYdVmA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aUiYdVmA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4305724c12eso24985515e9.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 04:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728820791; x=1729425591; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHkkyDKC9jM/ugAi4FO1PJaa+9PRYsrHLgdKnQxGMbU=;
        b=aUiYdVmAdRTB7aERFUQHL02op2nOfEM+sFTE+Bdwb2PXeDyaFoPwGp29hSGBkB5ALy
         wmqSLx0uBCuWcwnLOgzcVntx858fM9r9AURNI8eu9dZH/H57EFQgVS/SseCPP1JqkYyr
         xoBqCVXoVXlXCB9B2vdRg4/3ulcXFEB02uFlT4oiagLW0vdlh/bl2rB3cSKM6RBejTL0
         jWp5Qu6NAC1j0ZXJbmmPVu3CvWHj3eP5xaH6XaAiobtxpQ9tKAbfln7gKRdByjbszfvN
         vmMDJuQjxyC8u3tBFfaTp6MHFS24If+50uPoCKtSVhfwVlieeyBhIOYgajnpv6nV81Mk
         GGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728820791; x=1729425591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHkkyDKC9jM/ugAi4FO1PJaa+9PRYsrHLgdKnQxGMbU=;
        b=wsAnJF8hjJMF1XRbyPM0rj3a1EXvmYXQX36RrnOzmqgQXecLdy3Fs89tT0WXQnMhBT
         y5+NC5/INDBIfZU38Ac5u4Kf3iz7aa320PGamSBWG/lcAQ6exX2GAb/4S6UP/H6b2msY
         VwEB79z4egaeevWiWVSuxhkHyFEedvrwUzp43/RERAPMKFDSE9d7TQT+QRzd4oZILCp/
         vYYPdcoMjnfy7JrwruiCmpTMKRn/CYvi7aGB27R9JWgwN/WfE3ypU8AIIeM396e5yNPU
         A3rJuyCsTCc9dR6gT6ZYR1PVZcq2MYs6XbAKWhBSXhGwvj3nsqNo/ART1i9mZlNSYLbR
         VRIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh7C8kK7KdtkRtMSx54h1Ovpwc862MzmuS5GGAnR+ZjS/vpTuRlpq5WogHY0SyqVtG23LyLw+e4WEIn2y0@lists.linux.dev
X-Gm-Message-State: AOJu0YzIRn+wJ4rx2ZtNV3J75QP+LXmVRQ2w1bzNHDVMfgxyjl31P45Y
	3S8wdoRXDXBTtsI2I1PdfHYlmf5/SSXE0+iCxeWH1pl1dfJnTPvBnhDR3KgF2oc=
X-Google-Smtp-Source: AGHT+IGTHTWoEetbHJHhk+MuiM1p3gpUVQ6kSkHyeXY9xdSvulussmgA6QK40F90KB/JXPu8nE1bCA==
X-Received: by 2002:a05:600c:1c9c:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-431255dcb1dmr48705055e9.13.1728820791285;
        Sun, 13 Oct 2024 04:59:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835696esm91419745e9.37.2024.10.13.04.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 04:59:50 -0700 (PDT)
Date: Sun, 13 Oct 2024 14:59:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v3 4/6] staging: vchiq_core: Refactor notify_bulks()
Message-ID: <bfe6dc7b-d34a-444b-98dd-a4b63e0bb751@stanley.mountain>
References: <20241012185652.316172-1-umang.jain@ideasonboard.com>
 <20241012185652.316172-5-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012185652.316172-5-umang.jain@ideasonboard.com>

On Sun, Oct 13, 2024 at 12:26:50AM +0530, Umang Jain wrote:
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index e9cd012e2b5f..19dfcd98dcde 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1309,6 +1309,49 @@ get_bulk_reason(struct vchiq_bulk *bulk)
>  	return VCHIQ_BULK_RECEIVE_DONE;
>  }
>  
> +static int service_notify_bulk(struct vchiq_service *service,
> +			       struct vchiq_bulk *bulk)
> +{
> +	int status = -EINVAL;
> +
> +	if (!service || !bulk)
> +		return status;

I mean, I still wish you would return -EINVAL directly here.  :/

> +
> +	if (bulk->actual != VCHIQ_BULK_ACTUAL_ABORTED) {
> +		if (bulk->dir == VCHIQ_BULK_TRANSMIT) {
> +			VCHIQ_SERVICE_STATS_INC(service, bulk_tx_count);
> +			VCHIQ_SERVICE_STATS_ADD(service, bulk_tx_bytes,
> +						bulk->actual);
> +		} else {
> +			VCHIQ_SERVICE_STATS_INC(service, bulk_rx_count);
> +			VCHIQ_SERVICE_STATS_ADD(service, bulk_rx_bytes,
> +						bulk->actual);
> +				}
                                ^
Indented too far.

regards,
dan carpenter


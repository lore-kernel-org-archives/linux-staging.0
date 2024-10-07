Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A951D7E3D
	for <linux-staging@lists.linux.dev>; Mon,  7 Oct 2024 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315802; cv=none; b=QZOIAo+Zo+k0QW8fED0vdiCP7pZzVzIsjcQpOnTDt/74jvugl8NbQ5K/D86+L+eeHeBX9S5cvHr63Z/R9+22ZsangTfs6QCkeT9BES3gQdYYyvOH8zbEuaELC7mOausD5LbG3M4VfMlGxBQVMcgeLqXnIvUy0HPqPmBHpAZFlR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315802; c=relaxed/simple;
	bh=kSkSqHhmhDBjaBptoqL2+wVR6+Rxvbf4cBcn8HyCGwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNhbS63+eHdHwsMdOgPTgbXqws3j00/UlcmHfeVHRNsroSoIJpMd9jJWgnVRW8IAb+JUUhJl/YYt/5EXEwDSsw7vFwLdTMyPRLDvxPFGNXV24Rshmw6KJqGKYqTLq5I5oBfjYrphkzAPGRw36RnvK23USyF/6KtKhcldm4aHAtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1EwHPFt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1EwHPFt"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37ccd50faafso3114841f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 07 Oct 2024 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728315798; x=1728920598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WSvmE8n5QuavFu63BnKGQtIIFsakEPc33Q76Ua00ugw=;
        b=k1EwHPFtCjDm92gJD5W+EIGK8G95OC4XfDMOANZsJPqeWC40fbnN9dI+fqU2MlbzyI
         Xzm8kD4K9u8zAdryh/uCJ1GTdGaXkbar/2a+LqJ6mnbCySd3GCToMo4NoXh0TgaO1MNI
         lrdO3sPKIZ4NggPfGhRHWE5WIa7MX2/hUM0MrWxtRdqq7vTt1vVvFvS81tmDUKC6Yo+b
         oFXaxMcSTKk6ocU6YDiFbZRkLaKDVdwVQoNbK7oLIGJ1JBx6gkkQ+0xYKXZ39XAZabs3
         bq9XM6g/Q8EA/gEFJsUDoN61mc1LGVKlHHT8PWMb7lK/JyPaA4eX03kPklU2YZsLBUyb
         YEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315798; x=1728920598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSvmE8n5QuavFu63BnKGQtIIFsakEPc33Q76Ua00ugw=;
        b=uM4sJ7DyFuO0Y7EB+GsJGTXvhIf4OI84WPLnTb1D4X4yzYnFJWtpDjGHQbr7AUneUb
         ucgvHiI6YfrhwkjycyplAtveSOedyfvgm6Ti+vTJiy3R2QclhmkG3YYCyPilnwbfBlPz
         dMbkCHjh0zaniu+u6d6SQ4+sCdmCdwh7OkVvaRUkb0YLFmww39E+8PYiXkgr/4L62r5J
         JCUfCR+abguAhewAauTS5zosRDH4BFdFJr63yt4OwvcGN0kc7O4F7bnFoIFPbuappdiB
         YId+yzIKiQIC2nXqSz99lzAUZz2Y0pupvhqTi0ZG+hkj34K/5tVVMDxKkmOblbuZyqYm
         efeg==
X-Forwarded-Encrypted: i=1; AJvYcCULdNPHf1OdLLvDtUx/UJBxWLAnQRtAc0wXr0LAeshS5BzlqAb8qGOPIu8xycOpmE6Ic4OC/bzOh2lFnSjg@lists.linux.dev
X-Gm-Message-State: AOJu0YwJb6uRxYh6b0bDcobHaK90hfVUKReEFXoocNMQ90nFASy7Oi3L
	E4ARZO/ORP0Rn+u37S5rpWLI6IrbDZi/XENueYIt4B8ZHyAmneq1io9QmT+u6gwb7gKSjyqeYyB
	j
X-Google-Smtp-Source: AGHT+IGjHRwsGmvROZcACos6DIixkRGOFRJsUfnF/uGhv9Kl6uH4bJ3AmZ7oBHWLx6CZhF59ANd3Vg==
X-Received: by 2002:a5d:5f4e:0:b0:374:c1a9:b97b with SMTP id ffacd0b85a97d-37d0e6bbab9mr8562598f8f.8.1728315797735;
        Mon, 07 Oct 2024 08:43:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690f79bsm6011795f8f.18.2024.10.07.08.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:43:17 -0700 (PDT)
Date: Mon, 7 Oct 2024 18:43:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hridesh MG <hridesh699@gmail.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] staging: vchiq_core: Fix code indent errors
Message-ID: <6c860738-07b2-4c72-9c99-1b394482a186@stanley.mountain>
References: <20241007152214.23240-1-hridesh699@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007152214.23240-1-hridesh699@gmail.com>

On Mon, Oct 07, 2024 at 08:52:12PM +0530, Hridesh MG wrote:
> Replace spaces with tabs to adhere to kernel coding style.
> 
> Reported by checkpatch:
> 
> ERROR: code indent should use tabs where possible
> 
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


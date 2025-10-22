Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A252C1589
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134638; cv=none; b=hXL+vZxC+VAwrUoeqayrJ4StbS10Cc4+aYJGvms3cd0LgI9BtvOdk+NHwSgPHkz6BYkZGHtVKDBt4KTJtuQwdfQ/I7er+KCY/cWx4pXFu7RnkQ4ln166pUeLt+fbssWl1SKKSJpaRWyPl48RW14oLP0cJR+q2bV53Yz+p3NTGgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134638; c=relaxed/simple;
	bh=8W+Za/KxMR88fWOdm57Y/SPii666pZtp6nVguDm2GTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmvS047uhoqsGYOBOcXVxwfClCVOsErLhcMq6nAdZ2k4s6pc20PAAoxsWF619n5ND7l07lWp2dtq5Fx34RbGJY7/gGs+m1JstR3UyjlehDJNsgtVsYV2k16tJfbMp5hLeI2fkgZCDadldnW1pyT9J1xnSnlCFmqHLm/GJOaepxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzHbc9he; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzHbc9he"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471bde1e8f8so17460595e9.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134635; x=1761739435; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0gYph7SovwhcGw7EVJ3qVkwV+hfXw0N2ivsENsGig4=;
        b=EzHbc9heak+XO1/hGyicjt8Ehd57Fdhm5oT9TVqy/d7f/hV9P0smQS68Ip7r1atOlz
         Wf+wwdDzbpsEEscgWPtqIAFScRJk9ED4lX8XIYJ3nw7cIes9kY8VuG3xD7uMPgV75TF3
         NGVxXbv+4//s3UlfJ6KIjObggYZDrrCtdVB2AnIhOkWnvDemUtpHu6KuY9kGNGxc+043
         ILInT75CS2oeBZkEVDOJYK+5GNN7r/GUF/Fm6aU0+r3dHAwEndA4CBttVrBw7qxpiYTO
         5cWq8mFVb/+U3rhXPIhgTRvWAxhcRUyKNjfB63CY5Iqd2qyCFw9tlVSC/GsNLWbplGZy
         ixGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134635; x=1761739435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0gYph7SovwhcGw7EVJ3qVkwV+hfXw0N2ivsENsGig4=;
        b=td0IMIBF+YW58l999lSVf0nPHzns+k1InsgwtuGRZm2fftGNNYv3sJ4TpdygJD+FSU
         qz/hpiAPXvNDZHTPgNpyI6WagNnGdsP4F1xE5HTyOFLpdMTZ+q/84wEPNwNVerz0ltsD
         +DDl6s6ooMlPl9HjrKKXiQAFiKDWGLQ1ma0ySceFqdyQjcfVlFP9CxX99UVu1FVjLL0o
         AorvJ3eqcZXf54X6iIyfbY++R3XUi13qNqgMV4CYMvRZ/CJxWQ6LbH31cA2mdj6HDuDi
         TDZrE8FxcURll70k1OpbJyqgI2AtbfO88JOHXsjIovKjEgd8gyCis9rIRqpw3EwykzyT
         OtGA==
X-Forwarded-Encrypted: i=1; AJvYcCXfJJutftjwmNS3KKs5CmXMZV2m5POiypGawNRrpqxZeSsm7IiaPm/tCl2t29gqOq3UKkS9Yi7uqBQTpRbz@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg9eCHoCca+eB+9dlymgySuCstnEt8iWVvkyA5hu+PUqFYc6SV
	CeLc0a1ENsZmfOM11BoSxRuRl36TmyOKE+UgG4SDHrflcBfL1s58pkKXm4Iem012tMc=
X-Gm-Gg: ASbGncuW/6ZOuq35/N0gt7Ul8Oxfl2nOyC4UqZzfhrIDIOO+i292xqGlukwf29IIQdC
	MXdjKOyhIjeX4h/Dgnz21vzyI8aoVjqlhhB9ge2eE602SYUypV26D/YrDSDgrvhHdqeTTIlN8IW
	YqQSFi7NbziGCD5tZ75y+1/WIAgV0OPdqso+deyJxUL7uLbCJcfjAiuAWQVS9oD8SK8oRglJai4
	PLnDMEe7pPILHwkMzoFF3fYktxlBR0OxkSGS4Wy2qe85v4IoWy5ZitssWUxdgBUV66yCc8TFXqs
	v0Cnf2B14EFSfcauPiA7TDTGkvedK5UiB7GWc/WeswuIeTvl8fbyiaAZIA+Vwkls3K04r9TdCSB
	dfGEBpHSyqGGd8EN94yqGJ0f3N7fcYYcLA8Bhc/eAzN8mai/fvaYHBZeL0W775VBRH9WPO9qVJj
	DaPm1Z1VFu5fnXnayJ
X-Google-Smtp-Source: AGHT+IEY2TgyTGfGNhNiFczm1vB6rimaMhMz5RZu+zN6ZnmkRbUDl8IcuOYqyXEzu158hZENQ3zc/A==
X-Received: by 2002:a05:600c:4f89:b0:46e:3edc:2811 with SMTP id 5b1f17b1804b1-4711787750dmr137799265e9.14.1761134634976;
        Wed, 22 Oct 2025 05:03:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c41ca845sm42531015e9.0.2025.10.22.05.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:03:54 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:03:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Dhruva Gole <d-gole@ti.com>, Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
Message-ID: <aPjIJw3ahPxnDE5Q@stanley.mountain>
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>

On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
> diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
> index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
> --- a/drivers/staging/greybus/fw-download.c
> +++ b/drivers/staging/greybus/fw-download.c
> @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
>  
>  /* This returns path of the firmware blob on the disk */
>  static struct fw_request *find_firmware(struct fw_download *fw_download,
> -					const char *tag)
> +					const char *tag, const char *format)
>  {
>  	struct gb_interface *intf = fw_download->connection->bundle->intf;
>  	struct fw_request *fw_req;
> @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
>  	}
>  	fw_req->firmware_id = ret;
>  
> -	snprintf(fw_req->name, sizeof(fw_req->name),
> -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
> -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> -		 intf->vendor_id, intf->product_id, tag);
> +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {

Change this to:

	if (format[0] == '\0') {

In the caller, the assumption that format is at least
GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
doesn't make sense.


> +		snprintf(fw_req->name, sizeof(fw_req->name),
> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> +			 intf->vendor_id, intf->product_id, tag);
> +	} else {
> +		snprintf(fw_req->name, sizeof(fw_req->name),
> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
> +			 intf->vendor_id, intf->product_id, tag, format);
> +	}
>  
>  	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
>  		 fw_req->name);
> @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
>  	struct gb_fw_download_find_firmware_request *request;
>  	struct gb_fw_download_find_firmware_response *response;
>  	struct fw_request *fw_req;
> -	const char *tag;
> +	const char *tag, *format;
>  
>  	if (op->request->payload_size != sizeof(*request)) {
>  		dev_err(fw_download->parent,

We have changed the sizeof(*request) but we haven't changed
->payload_size so how can this ever be true?  Did you test this change?

regards,
dan carpenter


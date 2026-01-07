Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED573346AF1
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796271; cv=none; b=J4BaCv6/87U0QXrVQIDYwxHBAboxHWQ6iA9PWhzoulIC4MMWZMjNXDtdqWZ9criM0P+YaxXbtQ3O8ZD48dtaYCmhOeyCiAtdFAyqWBhN+hPm3bSEHGT9K4EWc+zLKjFdhV3efjUCwLv0KcIhKGVHUsF11yeELFwcxlojVM56W0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796271; c=relaxed/simple;
	bh=D8AxSemiKWwzplSHLSboj4TJDF/1ewd39FU62I//Zww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEI3T8T8O2Mp6JmV8TCHAYxIKSwO4PZ8CU37xqR8cDwvnDMbyYQpnS6bxDFBuyBLpwgtJLWqE9Y37RXhZUXT85LT75OS+V1yLbjrpa9DaNqqxP/8337iMgUAPgNCPJ0RvPOVQdW9pngtutbYInbjGXxevj01K9pq8UK53mmSRCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bPWeqYzH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bPWeqYzH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so1664787f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 06:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767796267; x=1768401067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Zk7xXnEuh19gRn4MSw/h56LQt8KgVnQ0vjZH6L/AeM=;
        b=bPWeqYzHaiti4RCgQSN3iPgWsUz1v0F25hMBgFLf+ep922eBPVzmvQT5P3GccH1ezd
         lbPI3ZhoogXhrxj/kI3q8YBNvmiaO2/q7ts8LZrCAwZw3lYzXeEKa8buhLi5XmEC9DV4
         YyWfIFbzV+XWCFWGu6AkFvz59J8iWQIabYp5ZTJ95SpV36QvVwJSTFYHHeVNLpW9z3C5
         AMvg/SDAl57QZbyK2e2rt/UnBOIssFQUz/1zC8znlrwcvwnAb128kATn2CqlKusrhYaw
         vJHZ7eZVsLgB0ZVTwL6/JbuefkgQAYtGUEX8GyeKwi6Go6UtQRVTvIBozUomDuf36Qs8
         DQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796267; x=1768401067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Zk7xXnEuh19gRn4MSw/h56LQt8KgVnQ0vjZH6L/AeM=;
        b=htJ88ITUVuSxlm1L6Ew7npcc+IMb8RnQMsw2JAG39Jl36F7ptaol+jzsD8fW7HGbpQ
         +Vyv8pBKObga9jTcHsDkaFYvQGGYQtKunuq0x8h+SaI4RGJLQ3VnjAD7sxAFqGFYu/7Z
         RSRNGkhTS7F5pnEz7L74SwoKUghEOB9Y1xNglFyx8tvlUSRpYePSR59rl8QC4//1upv8
         Y+Ex+4qga46Gr9MGau9IvhV2d1upoOmZFmSS7DZvVLLk0J5zVsfFU+GwvR4PNnlHORxs
         m80yelUX7geGc5tAaR54tJBf4uhzMONKdwHjFLYW7fWROo9FHaha8MbHtXZ+0bZvLrUJ
         jpeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhrv0i7lsYofdemkXqxY1sw9H2e3hMA0rPZIOoFAHm+6uhDeTcZQMARZMy0xDFO13rvDLHYsjPf9GDR03V@lists.linux.dev
X-Gm-Message-State: AOJu0YwtYRM6NBbP0P7Ml4xx4jyzN2GxB/EY25dIjV8IrCvuMTDXc6C+
	WhQj9D1BbyorbNGrg6lCsHw81trI+6axWT6ytjUOongwTcs44h1NsutNkjD5vp94zTM=
X-Gm-Gg: AY/fxX6KOrrGi162bP2n5AFd+4URjJ7KAo66t46v52EQ2fpXn/1/3V6VroltmqFvzhg
	wf2q0l3trb0in/Rp6/mRHln3gGqHQ214eSWJZmYLysVx5d/qmwHeXlgvHW36bmosxQ5iMfc3B46
	KmqM77XJfubLdQ5Rl+sl2BrZI4yqHFzYhUxIjb30iXXlLasdBmJKGvTK6JeUv9Oh4U3pZ7Eogz5
	/tAGipq5WIvW6+nfOu55Osg+j/16HXld/LqCUZuRfhKbndIe9upQV8/YJLDEMBglAG2QHMXQjOv
	DtNN0KY9i703+NYmbTFbhNLTFXPQmwyMVimfrtAbsyVqwyuCST4uTib2gBPYBEvRaO/j0HBSPDV
	VQlDYGfvX1VZuFntlh/fZktaHtkhfYlRwCqB44WNDgCcqNxnY3NhrmTKa4UkGnxRt1WVlQqXL5t
	gW5aEubA0cbbAH7KXR
X-Google-Smtp-Source: AGHT+IGKFvF9bPd/K7p2LRS+DkckL1HEjJZEVJ9c56W23qxdplsmQlw5GknvyXFPwiNFQLGI8KElVg==
X-Received: by 2002:a05:6000:1acb:b0:430:f879:a0fc with SMTP id ffacd0b85a97d-432c3790b06mr3439013f8f.21.1767796267143;
        Wed, 07 Jan 2026 06:31:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df8besm10132548f8f.26.2026.01.07.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:31:06 -0800 (PST)
Date: Wed, 7 Jan 2026 17:31:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND v2 2/3] media: atomisp: consolidate statistics
 buffer allocation
Message-ID: <aV5uJ-bB6wQcq3s6@stanley.mountain>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
 <20260107134844.68074-3-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107134844.68074-3-karthikey3608@gmail.com>

On Wed, Jan 07, 2026 at 07:18:43PM +0530, Karthikey D Kadati wrote:
> Refactor atomisp_alloc_css_stat_bufs() to use a new helper function
> 
> atomisp_alloc_stat_bufs_list().
> 
> This reduces code duplication for allocating 3A, DIS, and metadata
> 
> buffers and centralizes the allocation loop logic.
> 
> The helper returns -ENOMEM on failure, triggering the existing
> 
> cleanup path in the caller which correctly frees any partially
> 
> allocated lists.
> 
> Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 123 ++++++++++++------
>  1 file changed, 81 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index 5c0a1d92b..9e572b3e6 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -678,13 +678,78 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
>  	return atomisp_try_fmt_cap(file, fh, f);
>  }
>  
> +static int atomisp_alloc_stat_bufs_list(struct atomisp_sub_device *asd,
> +					u16 stream_id,
> +					struct list_head *buf_list,
> +					int count,
> +					enum ia_css_buffer_type type)
> +{
> +	struct atomisp_s3a_buf *s3a_buf;
> +	struct atomisp_dis_buf *dis_buf;
> +	struct atomisp_metadata_buf *md_buf;
> +
> +	while (count--) {
> +		switch (type) {
> +		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
> +			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
> +			if (!s3a_buf)
> +				return -ENOMEM;
> +
> +			if (atomisp_css_allocate_stat_buffers(asd,
> +							      stream_id,
> +							      s3a_buf,
> +							      NULL,
> +							      NULL)) {
> +				kfree(s3a_buf);
> +				return -ENOMEM;
> +			}

The caller doesn't propogate the error code either so this doesn't
affect runtime, but generally we should propogate error codes.

	ret = atomisp_css_allocate_stat_buffers();
	if (ret) {
		kfree(s3a_buf);
		return ret;
	}

Same later as well...

regards,
dan carpenter


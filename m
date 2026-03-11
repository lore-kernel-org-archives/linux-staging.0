Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420D3B3BFA
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773223932; cv=none; b=aaObMha3fZQT5xjXHwtBDAhcG1gCp1fAlGCYG2Tm8ySZ6wcdvvRfxgqKoK3xyFF1UvX1R0maCA79Ln+t6mXwluC6vBEBawFd7MKbxNUwXO/ebl8GpBAO9b6IrkWO8iHEn9rMMeFUrljJO/BQ88awtO2YkNJMNhx4EIFyZFBeid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773223932; c=relaxed/simple;
	bh=HHCHRMBlQWoG2h0erH2fneWs+r/ypJ7fbjpTRA584w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZRu8h8yUefI6VI+g5IdMHrwmzH6VdBjORjg0ybwhTj49wdYrayqVvg38oTtS71Ozf1bjuqVcVlbCcMp9k38xQrCZrIc2+PNJxtzZZ7rWwblthZS9FCItFBw/AwqP5sL2bU5A+W8eEbfxBdymNtxR917bVd2u2mFQW3lz920xlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WJ2uUR9F; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJ2uUR9F"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b9b190easo7200421f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773223930; x=1773828730; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yh7hOj6bN7zf2QqBV2lDsxvYwL2EPcm4zO7IO9jvMh0=;
        b=WJ2uUR9FV+TCshcPa8lyo1aqabF1NK9CjN5/X2pxzMi8yHaKnLQNN1quVTiJqSfVFP
         CRzNxruSedULhidMxl+6whR5LKJqQtArNwZTlTvTkcjuNVF9h6Z6BRX2eWbatFD6KKgL
         vkzHbmFdd0sOi3FG869OPaC8FnhHy+jA3rFzkD0kZIBjPYQLEWCbmOmK0aJqxQesCTDm
         tqN+nszV/Eu4GmiZUfDsQ/Y2hc9pV7hF8bB3UBn5BNCOdzicnSQ8npvPe4dQYpNeUj2A
         MvQ8bkWKekl9ko8bUspEG2p6llnZH0DMWOaLS1YeTnPN0TolAphi+3BhPR9rXLBYtfHg
         JHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223930; x=1773828730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yh7hOj6bN7zf2QqBV2lDsxvYwL2EPcm4zO7IO9jvMh0=;
        b=XRrJdcuzKHZj5907PILIttYQWwD0vS0mXuofKSpUHowHAc9AQxKi8IaVJ9KgoPilyQ
         f1XGnkVRwYvw0M764mfFbgsWhacfTTE9hwnqJbhpo9ic8T+J1KCHqEGy/w5GScEHbjs6
         VKjYnxlNZYRDaX7gbb3hFl9CyOs00E8N4SuuDo1bKEsOi7trMDZJZhtjcbEu3qjjmXef
         4eZg4ejmqmjGDBvoHFAVIb5xHiCE01ulqmk7HgEtDSeGVlBE9JbODCk5u5GDRfNqW25s
         9Kjgt0zL5Sh5Q7Wj8vShjgPG/eHG1py24LHxo7wiocp/KlsGfAfFy7j99xvpfoX0icdf
         G1NA==
X-Forwarded-Encrypted: i=1; AJvYcCXFmce2lwkYgIm63jxNUyIEXQf4IkNTVO2tEPNEa0o52u5tYjsrwgJDDuQKS+EWeDtVEDvy+2O62S0rAIQ8@lists.linux.dev
X-Gm-Message-State: AOJu0YzdqiPmS8dcIZPL/MyaTB4fA/UBOPuOaitoSLu3GafwmQpwdpoM
	coUrmq8k8+HQmh/Z/X9Lc4GajTJBifxlfb4bSzwpsVHD+eoDZ4DOytkut1TicKXNWD2sotYVpFs
	Ai+pg
X-Gm-Gg: ATEYQzxJxNbctVT2pfmBXy6BqcZ0DAUCc+KSQmJDU4s21eB+prqfVxR9gUhLzP/AasV
	yCQ/3Y/uFpL0DNblrcd1f/mop02VhBisPHRZfSbfUjdH+hYaJOqOfJ3pqFTGs4iUnUr1ILcL6lE
	MD6DV9QEFZFywBS2YhWHH+bj+sKVLW8tWX8ljrLHvkmyIosDiyMExGPEjPOml306oyaV1AnFaxS
	IvSWTDFTgdAl6AE11DWpVPAhQIIALeDeiV4/l5WzzuQUZg1vWsXsejz48I9gROAd6P8vFkH+8F4
	Oo6b+LV8YjcXj/Fh/VnC0HCrq+D6JD0VXvuFdsZ7Txk6bt2Sd59O4fEsc7ii2xgXtGRF0UtmD0C
	HnH5rsg4TATAypbrSBDaZJIoaJKWxCpEmVVHzOQPsxLYTZ5qqDkOs1EAdpBLX6ZNnIEY5cRNIZw
	nLN/4Bd3DdXXBP1w64kmZOFuejfhV8
X-Received: by 2002:a05:6000:4011:b0:439:cbc2:63b with SMTP id ffacd0b85a97d-439f842c345mr3685482f8f.29.1773223929820;
        Wed, 11 Mar 2026 03:12:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5231417f8f.5.2026.03.11.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:12:09 -0700 (PDT)
Date: Wed, 11 Mar 2026 13:12:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] media: staging: atomisp: Remove unnecessary return
 statements from void functions
Message-ID: <abE_9phG4OhjBLKS@stanley.mountain>
References: <20260311-atomisp-remove-void-return-v2b-v4-1-62275c55e353.ref@yahoo.pl>
 <20260311-atomisp-remove-void-return-v2b-v4-1-62275c55e353@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-atomisp-remove-void-return-v2b-v4-1-62275c55e353@yahoo.pl>

On Wed, Mar 11, 2026 at 10:48:07AM +0100, Tomasz Unger wrote:
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
> index 40b3f1e48c56..db4052ab3665 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
> @@ -6,7 +6,6 @@
>  
>  #include "system_global.h"
>  
> -

I was debating whether I should ignore this...  When you delete a return
and a blank line those have to be done as one step otherwise you're
introducing new checkpatch warnings.  But this blank line is an
unrelated change.  The patch does it a couple other places as well.

>  #include "input_formatter.h"
>  #include <type_support.h>
>  #include "gp_device.h"
> @@ -65,8 +64,6 @@ void input_formatter_rst(
>  	if (!HIVE_IF_BIN_COPY[ID]) {
>  		input_formatter_reg_store(ID, addr, rst);
>  	}
> -
> -	return;
>  }
>  

[ snip ]

> @@ -483,7 +482,6 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
>  	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
>  
>  	mutex_unlock(&bdev->rbtree_mutex);
> -	return;
>  }
>  
>  void hmm_bo_device_exit(struct hmm_bo_device *bdev)
> @@ -737,8 +735,6 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
>  	kfree(bo->pages);
>  	mutex_unlock(&bo->mutex);
>  
> -	return;
> -

Deleting this return introduces a bug.

>  status_err2:
>  	mutex_unlock(&bo->mutex);
>  	dev_err(atomisp_dev,
> @@ -868,8 +864,6 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
>  
>  	mutex_unlock(&bo->mutex);
>  
> -	return;
> -

Bug.

>  status_err:
>  	mutex_unlock(&bo->mutex);
>  	dev_err(atomisp_dev,

regards,
dan carpenter


Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAEA2D94BE
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211994; cv=none; b=ECcdcJzgUR6FrMb1cCGvyF9pP57Madco7MelIQUFrFeXq64LGMhsrw8z0kfEGefK+xlN57wPAvklq5cMorUFnbhf9EkdOhJb+GinII29sh/qTIhTVZfvLFaC4E8BcdT3xHO0dHpFu3O3UIKJqXl3IjG355KTAa0iR+5A1CzDzBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211994; c=relaxed/simple;
	bh=gLfrcn4GNXtzUHZ4mAGV9C/SkrxMY2hE3JC4Bc6Os5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3jD3SDIm9GovJiIfyzDlAnMmbgiQAikZilFCiSeLeK+r29SDg29lPTc7qpdSUQ6OY4Ld1vOMBhBhGgFmwHWSuPoDOVk2SU+pHKyLLe5MEe2N3v0acjzddf2epBu+u2ZmZlSMzKgUlmV1DnAGgDzHEQElKEql1+c6tJ8R+FyDEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ww4a+5cK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ww4a+5cK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so5164340f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773211990; x=1773816790; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rfTOivZx0p7gzOazZRKQSvuxJsM85KQ4nZ/QkBNEE2E=;
        b=ww4a+5cKgz0OGcgU8pikyZmKEBskEtn2VnEQtwljj+YU3fq7ME0Vk9HhZhQtYOqkR5
         FOYun88bShLfgrUiIqbgnvCDYhQ+7G2gHLsO63ghJlER5UI5gxnZoToH1T5p5ogJjyOl
         FZJg5D1x50gwyMWrYCWATM6yEDo4TKn6yYWHQjwjm5Y4ay2/4hGgE5GUfZqXCKtuMzqC
         fdbJQ1KS/dQNIjAM4XcHrSV6RNy4yj1GiVPAxkMcfhCPTwlg8hqnKnojRqq+cCfAu+KS
         FiXnwN771bDEG/CqwwlerpKbapFUCkd1rNUy44OvLVxKVFctB0dUfMiHd5QKss5abWM7
         LvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211990; x=1773816790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfTOivZx0p7gzOazZRKQSvuxJsM85KQ4nZ/QkBNEE2E=;
        b=rO4m+6D1ALHwK/13f1u5miZXnvPbXtsW5/qs3OGjduj/sU5Ijc9G3fYhWY6ATI0Dq8
         +Osgq98C/CzJhcDflk14C+6EU89BOelJzGJ+DHtg47T6TqWwU7JTM8pCiqYAX+F84qym
         aEyVUIhrb54BXuDELyPW1u5kE5GfooDq79EiUXUlvajzQ3cFtsSsyYqAnrC7uyYLPfMM
         GIKpJzT5gt13b8OFtVEkO+EjCqSOIKm3xGywhTZk5l2YyaQuRpe1s+y/D3OCklVksnEX
         YxmSKbFjeNxLKmAmnAoEHkehGGXhOegBZ8Ek8Slomokb+0f1znscxv8q3i+GWbMXDg5q
         NLJw==
X-Forwarded-Encrypted: i=1; AJvYcCVILZcaS504JUgkg7Dv0ffv2EKY5wZRWLDXOnw3YhyVi3wSwyQrFxZ+8ycLN/LC5L4zUGT87dQMCbOtdbyb@lists.linux.dev
X-Gm-Message-State: AOJu0YwVym39BWh/GG5aN73FRXmtX2gznUn7mnqFrvwxBSLIdMhubAOF
	F8czS3CVom4JkyiG8Uj3Ga1Zmqjc4Kg7cXhed9Y8iC1jaav8mLeoyJFbCs6Gopvzujc=
X-Gm-Gg: ATEYQzzAjUervLcQUx2DvY2bWxSxhP1yqihQ4p4h9HPeqvII2hD8jTCRtXZpEU3QgG9
	Qkxh1XUJEzidFn/fiQBrE4nLw+Jkv3MU7PqszI46kQ4cgi6AjcrrhQX/QMaPEyeq0MfIcN7cTXe
	yzbWK5d7iIPf1o7kFiAklji1aNjie59onc1Mi1Z63PRz6s7IxOnsdfHjJDcYipElGZgU90XXXc1
	lDiTpwHxSSmtDfpgJ9UJSqpAQRH89Y5C9lujAreDMNm1OV0//a7RRFh74EF/YDj+M688FsQdUMo
	Wkx1rw910/yBY9P5qU++ifmXG2zi6UtSuyW04bxzTD7NRTiBBpbyKIdzEDOLCb+vjgrcHMX9r11
	wrAMkn9q3Rntp+ogwL3QBUhsVp/SfCdkklBN9KqKnhWgTycSxUqE0HBQyUScaNQSdoKticSdRC8
	Hjn0NsiHs4/nUZRZTg8mxvucOpdf7mSWuqEcdwg0U=
X-Received: by 2002:a05:6000:2884:b0:439:c628:2228 with SMTP id ffacd0b85a97d-439f843125amr2715649f8f.31.1773211990335;
        Tue, 10 Mar 2026 23:53:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm3857972f8f.5.2026.03.10.23.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:53:10 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:53:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 04/28] media: staging: atomisp: Remove unnecessary
 return statement in ifmtr.c
Message-ID: <abERU_Ac4s7A1-TD@stanley.mountain>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v3-4-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-4-3fdddab41271@yahoo.pl>

On Tue, Mar 10, 2026 at 10:39:15PM +0100, Tomasz Unger wrote:
> Remove redundant 'return;' statement at the end of void function
> ifmtr_set_if_blocking_mode(). Void functions do not need an explicit
> return statement at the end.
> 
> Found with checkpatch.pl --strict.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
> index 50b0b31d734a..31dd3f99e28e 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
> @@ -472,7 +472,6 @@ static void ifmtr_set_if_blocking_mode(
>  		}
>  	}
>  
> -	return;

Delete the blank line as well.

regards,
dan carpenter

>  }
>  
>  static int ifmtr_start_column(
> 

Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D3C26CE3B
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782662; cv=none; b=imYYmxhP6xjCios+7Fea9kDADyP43pOKQiDyOjwZh8ktA2FXdLnRYoQOuxvqgh6zszZc/weLCGpelNshTTCXfPfW78nJSFgz68IUks0fXVNf7px4/YwIJE2nHzHPCZAoDYMqF0zptLg/s8B8lyAJ45p3X7py3nzPJSiPzW/DJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782662; c=relaxed/simple;
	bh=QcvjBdtjzx4el21ou2AyjFk3PoVeXVF0t0TqhAXdQAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuiXwDOcIa8M/5MgLVK9vLSJc9nXxVLwMXLcgxmqz4dps57q9PL69y5phJNc849d+Nw7kCd5C72HNypsrPYgBdE1YSjcNUfbgE2oRFoal/uMJyok9gOK200VKmjF85zIAFUPm6AEh0ahz5ZBSp00HmtJte/Y/6wsmoTx8hR94/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6QjuP2Q; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6QjuP2Q"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2ef493de975so1736376fac.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750782660; x=1751387460; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xauWGZibla3a88RvY6yarAsOrTLbYeOTyPsrWKTduDk=;
        b=e6QjuP2Q/0GjNhiG2PaDACaee4Es2bAQH/odw4I+wEBaZhFxIE7azIGtprUAxZhvxt
         KN3OGgDPMAwqFa6g0VMSRJ6KEDp24owcL9S0Ry73EwT/e///8KjSqltIcLHPTkaqaa2z
         oJViSgF0DMB6XhE1iavwd8Fyrdjn8RBBzzH/m9wYp9YIftAnYKorVXfFVll3f4VMhQzp
         l5kESGhfHk3xqsxM9DY6v/o1Fi1kWoKhS+cia9js/5RfO6WhwZOFugxjJ4lTh8yo2LZW
         YTr2L/mSKLhxbIHIkvkrsKQkCMJFZXKW9XvzSV8MO9JLUkOl224CCLBHBF9xrGg8dlen
         +z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782660; x=1751387460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xauWGZibla3a88RvY6yarAsOrTLbYeOTyPsrWKTduDk=;
        b=F3qqswDd/PhKkWHe2BadhPIz74Rz2rZtdylLw8NvYxGrae4H5OH33S05+SC+TdPDFI
         H0ZBEZSMXkQAzYDcD16HpWI1ZEMI8WF+snmc8WSBIgVNcklJs9RZl4igxMTZRnO42AsU
         Xl43aRuBwvsLIRMHaF8OSN7qDtMalud5iJdSKjNvWsczskXkwqZYu4aF9DuvkEe6JpY6
         sMVrjEjNUS6VtIGGS45ylekq+c8aHL5c664voHEpdUTY1tUNIEtQLrD2qd90+eyCVTIB
         KrDZDXaO4qKFayxpuy93+Fd8OLRTfuKAEJ23bulcWxMpjIx1NgQUA71cxinpFsFMZesc
         l6ww==
X-Forwarded-Encrypted: i=1; AJvYcCXt+pPlJ6rrX0BCI1hrp6+ZyZ2JQ5snf9Od/W0Ktrm92HFgyCEFxoKYUiYX4yzHYFP8/cKq1K1aeppfUZWh@lists.linux.dev
X-Gm-Message-State: AOJu0YxNjaqrxIStofx1YUKbevMbQnc7BgRoVNJ28369531t3GMn2430
	JixzJAJS0z3dVrbPdKmxD4RkJdLrR3NFruC5p87bCgH4MZFU/TMY23K1u0fb1jAbGDY=
X-Gm-Gg: ASbGncuT9MG7biLp7bJsEAW+dDu5ExtYfRGC/OVUuCOG2Q7MF+ufGDdOvjlefesAzHp
	XlXjv/gGvNVy7jlMK7uC2AwMBlWwSFMUe3+tgI8PEGNqn1fO+Q2ku2ormmb7IInK5oMCzV7Ftwk
	0iujmBTJXErsc8nbjMVXEc7HQoy9JJQ61l0nWbsLQPHmiSCstH8acEo0gN8imTLwPI0FHOCTtrI
	GEaTIwMjnc584XdiYmyBPs/tT557NBb6UZsaw78kEYD6jmjpRb5pW4+Y5L6h5+gbrh3j+L7/PYQ
	tasybEMmeHwYqXsZIquyuFtDBwivv8EGmQ1eVTygg7PAuWpwOVyZq566bYByqlXCuy5YeOeY9TM
	LI1WO
X-Google-Smtp-Source: AGHT+IGcNnn1LPrlnNqMBw8pIeYo2YoTiOvJeFOaf225KGbqOfzpC8jSGqoDPVjT+4qvrB73k5LY2g==
X-Received: by 2002:a05:6870:2b14:b0:29e:5dfd:1e17 with SMTP id 586e51a60fabf-2eeee5773e2mr12099997fac.23.1750782660133;
        Tue, 24 Jun 2025 09:31:00 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee664c3cb9sm2167708fac.6.2025.06.24.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:30:59 -0700 (PDT)
Date: Tue, 24 Jun 2025 19:30:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>

On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
>  int hmm_init(void)
>  {
>  	int ret;
> @@ -130,14 +48,6 @@ int hmm_init(void)
>  	 */
>  	dummy_ptr = hmm_alloc(1);
>  
> -	if (!ret) {
> -		ret = sysfs_create_group(&atomisp_dev->kobj,
> -					 atomisp_attribute_group);
> -		if (ret)
> -			dev_err(atomisp_dev,
> -				"%s Failed to create sysfs\n", __func__);
> -	}
> -
>  	return ret;


It's really unclear how this "return ret;" is supposed to work.  Was
that part of the sysfs_create_group()?

>  }
>  
> @@ -145,7 +55,7 @@ void hmm_cleanup(void)
>  {
>  	if (dummy_ptr == mmgr_EXCEPTION)
>  		return;
> -	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
> +
>  

You've introduced two blank lines in a row here.  (checkpatch.pl -f
will complain).

regards,
dan carpenter

>  	/* free dummy memory first */
>  	hmm_free(dummy_ptr);
> -- 
> 2.25.1
> 

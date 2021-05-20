Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B568870
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 17:14:01 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id h20so1407832qko.11
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 10:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jq3RYlVbDqirRaEWm8uYC1ns+MqjwZOrxQ2cNaYJlDg=;
        b=RcqLGnRn4lP6HGnhbtHRODna8BfZi+cQ75Ojh1B4T/MQoZSyXe2wIId8LU/kqGA7RM
         Jp1XZ8pXeszuDXG2zHzwpmNEWdzYkAqLorKBiBofI+lWWUy9ou5hlBCb/00XqAx7VGqX
         B2nUQXfsNTC0+7l1GVDhg99kfLgOkyzkrIu2GHZp+5/U4nrOe9v+sKXA4Rrh1IRQs5NC
         TtjfKt0OJKP+qzmj623o4ETkBwevelOVGwy/nGA4p61DCshVyCcWWdEIZ1L+DULfysEX
         oUOHMtklqm/ZpQ4LRNJj968x5SDD3XYUmYrQljJeJOO9Y3Z+bNBNtPqjnJ2CuJySJs24
         6yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jq3RYlVbDqirRaEWm8uYC1ns+MqjwZOrxQ2cNaYJlDg=;
        b=MvJoN0eDWD0j4/0mURFArH8a4nVD+niJnjr09ukOToaPM1xh1xXCodeIwpNH2LLghw
         hTMgdcaeqOFwz0q15GPDl6JcYYdsnrfVy4zf/8SNHVNgaJEdT3hAo1au3IqOXj6jHbNP
         Sg3ks8b268ldFGrGbgiW9MwrRWZgo0YbM/R1Jue4NGd0twJ5SunNj3aWmKcqdGV6gPoz
         kjVn2EcKPQrJb3jwcKPUaibGN1Af4Bd6ihltYzEuzrCP1GJ6M0wZ7ZN/klaqv3pWOm7P
         JdhxYCYIyGLdk1eWBYoRyGRaEjSirgHduYuwW3o6PM1YZLBJU1k8BxoThfurcJI7Ualg
         hpPQ==
X-Gm-Message-State: AOAM533J2RRI+TXYPlHBx5+WKr8Li3KEFytCi0U3+cMjQdEzaF2gsU5q
	UuMJ69dn2lt8489bIjSUvkM=
X-Google-Smtp-Source: ABdhPJyYWtKsmIPSoSGsuqdD6zSwDOtYPVRAqi9Swk/0eu3dTFJS9AZQooo4mifGsrIHWJWHudqfBw==
X-Received: by 2002:a37:93c2:: with SMTP id v185mr6435183qkd.179.1621530840751;
        Thu, 20 May 2021 10:14:00 -0700 (PDT)
Received: from smtp.gmail.com ([2804:30c:b19:6700:15d6:7f1d:c87:ccf7])
        by smtp.gmail.com with ESMTPSA id f127sm2462842qkd.81.2021.05.20.10.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 10:14:00 -0700 (PDT)
Date: Thu, 20 May 2021 14:13:56 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Wang Qing <wangqing@vivo.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: fix some formatting issues
Message-ID: <YKaY1GAKkqXnAUrq@smtp.gmail.com>
References: <1621389170-5850-1-git-send-email-wangqing@vivo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621389170-5850-1-git-send-email-wangqing@vivo.com>

Hi Wang,

Nice patch for a start. Yet, I think there is room for some improvement.

On 05/19, Wang Qing wrote:
> fixing:
If you wish, you may add here that this style check is reported by
checkpatch.

> CHECK: Alignment should match open parenthesis
> #1351: FILE: drivers/staging/iio/addac/adt7316.c:1351:
Checkpatch warns that commit log lines starting with '#' are dropped by
git as comments. Is this intentional?

> 
> CHECK: Alignment should match open parenthesis
> #1378: FILE: drivers/staging/iio/addac/adt7316.c:1378:
Same warning here.

Its probably not a requirement, but the subject line could be more
specific about where the changes are for. Maybe start with
staging: iio: addac:
or even
staging: iio: addac: adt7316:


Regards,

Marcelo

> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/staging/iio/addac/adt7316.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
> index ccbafca..79467f0 100644
> --- a/drivers/staging/iio/addac/adt7316.c
> +++ b/drivers/staging/iio/addac/adt7316.c
> @@ -1348,9 +1348,9 @@ static ssize_t adt7316_show_in_analog_temp_offset(struct device *dev,
>  }
>  
>  static ssize_t adt7316_store_in_analog_temp_offset(struct device *dev,
> -						struct device_attribute *attr,
> -						const char *buf,
> -						size_t len)
> +						   struct device_attribute *attr,
> +						   const char *buf,
> +						   size_t len)
>  {
>  	struct iio_dev *dev_info = dev_to_iio_dev(dev);
>  	struct adt7316_chip_info *chip = iio_priv(dev_info);
> @@ -1375,9 +1375,9 @@ static ssize_t adt7316_show_ex_analog_temp_offset(struct device *dev,
>  }
>  
>  static ssize_t adt7316_store_ex_analog_temp_offset(struct device *dev,
> -						struct device_attribute *attr,
> -						const char *buf,
> -						size_t len)
> +						   struct device_attribute *attr,
> +						   const char *buf,
> +						   size_t len)
>  {
>  	struct iio_dev *dev_info = dev_to_iio_dev(dev);
>  	struct adt7316_chip_info *chip = iio_priv(dev_info);
> -- 
> 2.7.4
> 

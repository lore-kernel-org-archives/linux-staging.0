Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C54417543
	for <linux-staging@lists.linux.dev>; Wed,  2 Oct 2024 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727837361; cv=none; b=Kh0O1kZLUBNIjS6Uw3iGuLPGzFGeyJXplw+7qfKG6Bt7PdyAA6ugwPQKWrqL1KsPYmxRLJXAFrtmi472JMv/YnZN/TVl7slMqY0zZCRg5otBbr1g7YQPtVSvT6UzCl+kybDoxt/yQc33fII6s9hIRdUkLZOjxhriQuRZ7R6iECI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727837361; c=relaxed/simple;
	bh=g6JCXNF6GwtZ+RgMT/THylB+sN+lh2CnkcPgz8BxFqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZ1N5uTQ8LqJQZR0QfkIyHEx6U8uPRZCcnAoT67QJXEFJnvq4N6jty7bo8/5v+rI9/PpOxhd1iNOREJirZLKaVT8100iiIB3czTKKZ6xRREaCxMIrJHXQMgoJFJ4F+iknBDlTYwj/DPC+qnySpcgViWjEJ52lGFVKmTYKPSnWVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V91x2Bu4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V91x2Bu4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so49824865e9.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Oct 2024 19:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727837358; x=1728442158; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3G1j1oP4m1f1TYdPZNj2l6bWg0CopPXXYtdupBtxJ8=;
        b=V91x2Bu4d/WDrHIa0EOAByqlss3SqRPjXx/wEk+JdqRxSZSDr/10GujV+36SUksepA
         QJoOuHaXbrB3gUL65vHUu0BA9HXlYuVI+m+AW79euLJhI5rcsblKxNT7YOL4Dmr9YSld
         JQVoBHLqLK6XRSuRuxGbYwrLY3a6j4gV7Pv2mqziuMSoO8lh4XF5eO/cTsyet3Nxz4t+
         DqmTLKZyKKhqbrGO0NxTbJFNI1NzJr9byM6u3dflCuTl/D9fODC2oWLcmtpXJFhJDuUO
         9M64DAdspi3Fr8GuTf2WCtaajnMHhsHXaj65Uj9p0HkGXGlAT2QGF7S/h5Z1Iqf6pY+u
         8M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727837358; x=1728442158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3G1j1oP4m1f1TYdPZNj2l6bWg0CopPXXYtdupBtxJ8=;
        b=i0jxJQgU+fVeVxSLmWFBhWIDMNJetsNPGCAhu3P9SvpgBQIxmXjJeG/cyTa4tWJP2a
         P3tUNNntB9J68deixm6CmjtsHWYV6OMjUTs4lEsDaEqKnSeRsMgQpSHX5Ud0bt3jiaM/
         7nS3JPE0cT5stPmUqblIAAZKdZSkGk/1poIvEwo4CNVMEnXkb2ePXyyrLSL2GcVp7zCo
         tYo9J0jc+ppgRwFsfnhQ3GejvyiEkFea3Z0/MB36njN1/eV7ZjbthOkT69jye3JXOX8O
         0xdIigiEUoOfIGBiVS3762RlKH1d0YILNEgSpyIQ6Lr/aKCfy63zKSJ4CgdgXxeqiz2U
         u9rw==
X-Forwarded-Encrypted: i=1; AJvYcCVrLdVofYdSTzCbfmcgTjNrG8DAmppXlg5PZZwY1xgowrmATzOgO5eSwW+WzC69g4ohCX0TnX6p7N4v4Wm/@lists.linux.dev
X-Gm-Message-State: AOJu0Yz10yvwI7e7Kp3Jf9hoS2E8qlTIsS94Uqonmu9fseeCTBhZ2ss3
	OuxyOXg0YN5MZIes4jA71DQQT9MZh4EJzSIm3WJ2zfYCKiTggkHE
X-Google-Smtp-Source: AGHT+IG8i54WhYDVWTDeKf+kvVT+4CKvUd4iQt9WFrOVXWaOje1YYxfJv2duSQ0MQkMhqIKXqV2slA==
X-Received: by 2002:a05:600c:4683:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-42f777bf81bmr10084635e9.8.1727837357387;
        Tue, 01 Oct 2024 19:49:17 -0700 (PDT)
Received: from redaops ([146.70.124.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ff91a1sm5611645e9.38.2024.10.01.19.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:49:17 -0700 (PDT)
Date: Wed, 2 Oct 2024 05:49:15 +0300
From: Tudor Gheorghiu <tudor.reda@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: rename macros
Message-ID: <Zvy0qyQJP1S17SFv@redaops>
References: <20241001202430.15874-2-tudor.reda@gmail.com>
 <20241001225426.wUBOFdMi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001225426.wUBOFdMi@linutronix.de>

On Wed, Oct 02, 2024 at 12:54:26AM +0200, Nam Cao wrote:
> 
> You probably want to elaborate what you mean by "their naming choice" (i.e.
> how does the naming choice causes this false warning?)
> 
> I got curious and digged into checkpatch.pl. This script expects macros
> whose names match "IIO_DEV_ATTR_[A-Z_]+" to have the first integer argument
> to be octal. And this driver defines macros which "luckily" match that
> pattern.
> 
> There is only IIO_DEV_ATTR_SAMP_FREQ which matches the pattern, and accepts
> umode_t as its first argument.
> 
> Instead of changing code just to make checkpatch.pl happy, perhaps it's
> better to fix the checkpatch script? Maybe something like the untested
> patch below?
> 
> Or since checkpatch is wrong, maybe just ignore it.
> 
> Best regards,
> Nam
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4427572b2477..2fb4549fede2 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -817,7 +817,7 @@ our @mode_permission_funcs = (
>  	["debugfs_create_(?:file|u8|u16|u32|u64|x8|x16|x32|x64|size_t|atomic_t|bool|blob|regset32|u32_array)", 2],
>  	["proc_create(?:_data|)", 2],
>  	["(?:CLASS|DEVICE|SENSOR|SENSOR_DEVICE|IIO_DEVICE)_ATTR", 2],
> -	["IIO_DEV_ATTR_[A-Z_]+", 1],
> +	["IIO_DEV_ATTR_SAMP_FREQ", 1],
>  	["SENSOR_(?:DEVICE_|)ATTR_2", 2],
>  	["SENSOR_TEMPLATE(?:_2|)", 3],
>  	["__ATTR", 2],

Hi!

Yes, this is exactly what I discovered while inspecting checkpatch
myself, however it did not occur to me this could be a problem with
checkpatch. But looking deeper, it seems like it is:

IIO_DEV_ATTR_SAMP_FREQ is defined in include/linux/iio/sysfs.h, along
with other helper macros:

> /**
>  * IIO_DEV_ATTR_SAMP_FREQ - sets any internal clock frequency
>  * @_mode: sysfs file mode/permissions
>  * @_show: output method for the attribute
>  * @_store: input method for the attribute
>  **/
> #define IIO_DEV_ATTR_SAMP_FREQ(_mode, _show, _store)			\
> 	IIO_DEVICE_ATTR(sampling_frequency, _mode, _show, _store, 0)
> 
> /**
>  * IIO_DEV_ATTR_SAMP_FREQ_AVAIL - list available sampling frequencies
>  * @_show: output method for the attribute
>  *
>  * May be mode dependent on some devices
>  **/
> #define IIO_DEV_ATTR_SAMP_FREQ_AVAIL(_show)				\
> 	IIO_DEVICE_ATTR(sampling_frequency_available, S_IRUGO, _show, NULL, 0)
> /**
>  * IIO_DEV_ATTR_INT_TIME_AVAIL - list available integration times
>  * @_show: output method for the attribute
>  **/
> #define IIO_DEV_ATTR_INT_TIME_AVAIL(_show)		\
> 	IIO_DEVICE_ATTR(integration_time_available, S_IRUGO, _show, NULL, 0)
> 
> #define IIO_DEV_ATTR_TEMP_RAW(_show)			\
> 	IIO_DEVICE_ATTR(in_temp_raw, S_IRUGO, _show, NULL, 0)

The checkpatch script will match all these macros, even if
IIO_DEV_ATTR_SAMP_FREQ is the only one where we need to check for octal
literal arguments. I grep'd through the entire sourcecode, and the only
false positives with literal decimal arguments which match "IIO_DEV_ATTR_[A-Z_]+"
are inside this driver.

I accidentally discovered this issue by running
checkpatch on the said driver files.

I will submit a patch to the checkpatch maintainers with this thread
linked, and if they agree this is a bug and accept the patch,
this driver patch will no longer be needed, since checkpatch will no longer flag
these macros as false positives.

Do I have your permission to add your name and email to Suggested-by?

Thanks!
Tudor

Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420672777FC
	for <linux-staging@lists.linux.dev>; Wed, 13 Aug 2025 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755099638; cv=none; b=G6Orrkdgr+mDexRzEro5ME5BFbgrr3403l9fwsZu7ZMesze3fN4lTQ0lCzJdJgi36zBzUxG0vmL9uj/Z8QCPPB7Wt7iDk6h4VhkOOVrdPh5eEo4FTVrEEZNVDdUnNAUzBETn8wBTXdH2mUo/hQkLj63bjx+esue+kMG1jLoErf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755099638; c=relaxed/simple;
	bh=tTfqMQ+xfqg6EEGY4MoHKxYaaNAZl3Gjahz3boKFQY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soJz8uW4uI5a3WdgEL47MfDwkD7Apvu/fOcf1+EgiKMzs+TU1u+d1m9jdMMTvZ/uVCbEnkbfFjpxN3URmQEpAHYbX0GL/wRnjK1Itdj9tKD0K3DkpaDI7jz6ZMigBDyQzsiu+8IpZMA2qCU+pyTtah7VIy7d2Hy8nHgj7oJ+NRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PFJJXJYe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PFJJXJYe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-458baf449cbso65129905e9.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Aug 2025 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755099634; x=1755704434; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H9jF1D4WAW3iiaMWmJGnvVMjBRXIxJDhqU8qEtUUnnQ=;
        b=PFJJXJYemuMn43mpkNQ4yMsuOIopHLssu0LwhjcrFHbr9pfNOyY6tosKAzoRkEvIhT
         1mW162FCQJdYwjVciD7ED+YcG5H8XX1qdg8qzl+yOdWTP+nbes2Hzsx07IQkh8AXq0B+
         RMhNyuXgEr26oTn+fi1fO1UVn0uiI0SjGw4PFkuZp9ZNCLzSxouc2x0tigTMYtDqgGfq
         Fyw41dOIWE2UFN/ZoVKJs7TtcR+HFd431vIweVHnzTdjlHgQS/Xrjf5ueFcmP0xcRSYb
         WyeN+2BQMK2ykGB8rZxkPjKM94N03ahSyevwOJty+c7kKl8GwvZJTxrCYlr2ZJvj4PSN
         Uoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755099634; x=1755704434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9jF1D4WAW3iiaMWmJGnvVMjBRXIxJDhqU8qEtUUnnQ=;
        b=Nzz4ywteT3Pj1Qk4yQziGQeW5KQEoUA2UfdzTi3JyXmc0sH2CuKjfANG5hSQbAwkzu
         kg/cbeLH8HjINXC5FN8+4gv/PS/yl0+y1fB5NW1zeRpMbb+7dshz44HOzfuRHl8kXs6w
         FZFqPpUlZAdM1a3uKBV+FG+Mz3nkamJ4T0qYkBoUKKE2IIWRlfcpz+8uI06hK35oE4DW
         NwFk/qDk16nvg8q02us86G+o+yOjA2Ad2mZJINkE8REVgCSLa+PBw/7QVVn3jcU0eFRQ
         oxGgmq0M7D8gfHfhVovKGjxx8e3BL06nKV8/6Hv0jfA6EX7yGJBDKmL6CciGH3SApDh6
         gbDw==
X-Forwarded-Encrypted: i=1; AJvYcCXDTxm78s/y/P87nIpTXz8JZxBUjLSqx7eIKSS5KR0oPmfvcdAlz5S36l89HoJdupXjjwbUharjGROwVedY@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq86oRIndL0LIVD+HqTXdZHJmqcxmECdkM9RSyUwiv75RMZbgp
	3MfDUhV9JWOSlDJECpztbK7JAo1lAg+D362PJTRihJfgobMRDkeL11rMsoyVKQWU5Iw=
X-Gm-Gg: ASbGncuhtTc5ex3Twgw42Dp2Zt5IpITxy/dEA2X9q3WpDsAuK1UC1QG2A0GwoMwRGeK
	YZ97Vo2GLO2+nQnKPt6bYMl+XiAmcZgY4OPY2exSGasyKNcxB6QnRozr8RSDbqfBByVf+QIpNF7
	h1wtPCII2cIkw9yRzr/D1osznbjKDod+02m1th7/Yn1qh7xMkPCObdREiF0utZ3yOEyLEJZLCFH
	kW3jw41viVAd/YBOJ57qV8wfQQ2Pp6caev3BYobyczAraTJNsCj6pjO03ptrMc/gkKOcdKZg/ds
	UP15H91e69uYpApNMNJvU8w/KLiwHU8+AY8q2PoMEgRKW8mPxpRh8F0mUYLdGDrsjxydBTAPpJg
	kHIV8Ec2UVTvnnjlCB6fYCO0N15N1eC/UEza4Kov500o=
X-Google-Smtp-Source: AGHT+IHjyT6fodZTCUswIlR9R1NEGMLkFv4skjXff6LcV3bNBKG7HbuXpFFE1+ZhJWivPfA0Kl0qxw==
X-Received: by 2002:a05:600c:45c7:b0:459:dde3:1a56 with SMTP id 5b1f17b1804b1-45a165e996cmr30088825e9.28.1755099634561;
        Wed, 13 Aug 2025 08:40:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1a519633sm6837845e9.12.2025.08.13.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:40:34 -0700 (PDT)
Date: Wed, 13 Aug 2025 18:40:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] staging: most: video: improve arguments to copy_to_user()
Message-ID: <aJyx7o9KeVS0HEhh@stanley.mountain>
References: <aJx6OF6L2Nza9zQ0@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJx6OF6L2Nza9zQ0@bhairav-test.ee.iitb.ac.in>

On Wed, Aug 13, 2025 at 05:12:48PM +0530, Akhilesh Patil wrote:
> Define cnt constant as unsigned long as expected by copy_to_user()
> to avoid implicit type conversion. Define rem constant as unsigned long
> to compare it with the same type size_t of count variable.
> Use standard helper min() to carry out careful comparison to achive
> same functionality.
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
> This patch is motivated from coccinelle report which suggested to use
> kernel standard helper min(). During build check, I found that
> comparison max()  showing error while comparing variables of
> different types. Hence this patch also fixes that to make comparison of
> save types.
> 
> Compile tested only.
> ---
>  drivers/staging/most/video/video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 2b3cdb1ce140..4b15c390c32d 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -172,8 +172,8 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
>  
>  	while (count > 0 && data_ready(mdev)) {
>  		struct mbo *const mbo = get_top_mbo(mdev);
> -		int const rem = mbo->processed_length - fh->offs;
> -		int const cnt = rem < count ? rem : count;
> +		unsigned long const rem = mbo->processed_length - fh->offs;
> +		unsigned long const cnt = min(rem, count);

The easiest (and most pointless and trivial) comment to make is the
"const" adds no value here.  It doesn't help the compiler and it doesn't
help human readers.

So you wanted to use min(), but it generated warnings that rem is signed
and count is unsigned.  A different way to silence the warning is to
say umin(rem, count).  The umin() macro casts both sides to unsigned.

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 2b3cdb1ce140..de07ed831815 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -173,7 +173,7 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 	while (count > 0 && data_ready(mdev)) {
 		struct mbo *const mbo = get_top_mbo(mdev);
 		int const rem = mbo->processed_length - fh->offs;
-		int const cnt = rem < count ? rem : count;
+		int const cnt = umin(rem, count);
 
 		if (copy_to_user(buf, mbo->virt_address + fh->offs, cnt)) {
 			v4l2_err(&mdev->v4l2_dev, "read: copy_to_user failed\n");

So can the rem variable actually be negative?  It can't unless there is
an issue with locking but I feel like the locking in this driver is
pretty suspect so there could easily be an issue.

So probably we could investigate to see if multiple thread can call
comp_vdev_read() at the same time and maybe add a sanity check to say:

	int rem = mbo->processed_length - fh->offs;

	if (rem < 0) {
		WARN_ON_ONCE(true);
		return -EINVAL;
	}

regards,
dan carpenter

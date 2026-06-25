Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF353B42E2
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388326; cv=none; b=Ei5+EVJT1LMtxQy6hy52641wvCgjZUIRLZe8xaPNs9y+cgiGQrRUkU+rcTlgtA9B93ikACP5uyuDf4DlfW23zlbA8Pu4FS35aYMSV4s+t3IBxVjdFbYbh0aQVkHTFkOVCOyx/HlgtbAKOHkfAT52kloSzlBB4XuLxpTpHeXnddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388326; c=relaxed/simple;
	bh=3uvSjHnY265MqrcNYWwLJlXFW1D4DJ7S4rTTflpijL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6jtemHrz+RpXWNewi3Ma9hL8uoSwQfqVVMUIz4zO2R2jF9N0CDwyYteZRun0MWbZhzP1N8hSVFWG/3d4plymmUOaYJiouOVBqv4pnPNU6REpWwomSGHG4IRCZ9a0AEhWHv9J9AUVYmfMDzxjOEiHdjBLppY14U5Em0MDC/Grnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJEbFu4z; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJEbFu4z"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-446f87b6de1so1020865fac.3
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782388324; x=1782993124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VfF1M7x0rz/6jCJNZGogQzX2I2iEuztJgiV0mRy3oWY=;
        b=AJEbFu4zs06VgboAcHX2h6ZjyVhr4pGBQzN1EtvRLJIbTI6gNdd/cPWbK8b2TLPURY
         9b6cNLaHFiCc0tr6zCB2la1PRzj6uQJArtUmPuazlsywfTk5aIxQmSf34DNVMbyWdNmC
         T9A01zhKAnUX9f/K30ffuj41KTd6pnPGcDfjp4pe8DHUJujcVdqgkpXnnlkUUjuPZUIR
         rDbVC3aKs8fnwSx5SQyXhCUe1SBximu/oYlJ6DeLclEdtn9qWFv4TNfGHJbjIWpyT3wm
         C0g/FeytPQPczRi/R381QkRe3XGfOmU1aOFnJULSsrQgTF0FpOpLi2Hxh1sy3NPpWug9
         EBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388324; x=1782993124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfF1M7x0rz/6jCJNZGogQzX2I2iEuztJgiV0mRy3oWY=;
        b=rVUoQStzGtCgNIddb5mcQoZPLqGt+pbYxMBlsRWaKOY/AqT1ggiTmsXfeF2Vs9KfR2
         Yi3UfCaZWYe0oWrIjj6q9O+HSiPCV/UpZJ3F5g5uLpJXEUSu/GdnzTfOztLa6kfKcagS
         qZS7kToe6raT+AQCZr3XEyUpceKvGKGe26P3TNoTHBczhHSG1Zn7yUSOOSVBBlorGSNn
         zhY+zdt2FokEGzJtF8+JqL4Fy5sDYQ/yKawHcgTwhxITMtBWc398qH99y/lIJCr0iCUB
         KKUSbUlzoXqPxXeiUd3ozNJIVJdxgdgsP4lPbHuuLwgXDDzsO+opATFLOaE68sPXSzoJ
         2Hpg==
X-Forwarded-Encrypted: i=1; AHgh+RqpvgPOl6J4Zl2wgdXw592ZZ/LfTUUcgiFNkqsgBmtv4FmXa7dQFKsycjhTitfQOTYDCHsqwMSCxx70+6eO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2LdwRDejqdcJeXuj+J83wCzP2OsHCOepyrwsoVj6nm3N625Xc
	LPSHzkoUucZTajqQUkw/Ul7Tc3/ANuej9wonwKUPHOHB8UIr+2p4hVz/
X-Gm-Gg: AfdE7cnkdPo8Ld7zFpLRBYI5dqeLfS85T4LbUrVtI/g0QjgKLPYab3OKMAOetjMcazd
	XaoyQkD5mHUJ/e/ScJhotGRQ/pDSPoRWvXFq6RiOk1NTaK7G49Oc3hpujuT0s9OOOCovs/+5vN6
	xj/m0ow01hLnCFFie3wJupmcx7lIkFOTQgeDqWfEkGTizfzFdRwp/Pw0R49YuxbB3QDOXJJNHu9
	AMgV1Q/XOMlIS1nRJyY82y6+B8xsDFc7VnHUyzbx+RDnV7bOLiKDguww48dGDDtxNGkYzcoVzoW
	u8wtqK1xfCI9gVjBaXuynKna8VGuaZ/Ss/GFV5x/dKsCfMC5zRpRSumb7cslZ7vkn68ISgDDooQ
	Z5VIgY7sofh2wgb20c4zItMfkxoZZwS+JYGIHgyH6qkphptxFU3NYXWVEsZD4BJ1TWEghNVEh5V
	a8vn54
X-Received: by 2002:a05:6871:3a06:b0:442:5f16:ab9 with SMTP id 586e51a60fabf-44811a19549mr1776074fac.12.1782388323808;
        Thu, 25 Jun 2026 04:52:03 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472efa8860sm12290019fac.9.2026.06.25.04.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:52:03 -0700 (PDT)
Date: Thu, 25 Jun 2026 14:51:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: bound slave windows to DMA buffers
Message-ID: <aj0WWwiOzjLGbY5z@stanley.mountain>
References: <20260625093137.6589-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625093137.6589-1-alhouseenyousef@gmail.com>

There are two bug fixes in this patch:

1) The driver allows you to set any value for size.
2) The vme_get_size() function returns zero on error but nothing
   checks for error.

There is a third bug as well which is not addressed.

3) The slave.vme_addr is not checked and it allows you to read/write
   to any memory.

It sort of looks like bugs 1 and 2 only affect
drivers/staging/vme_user/vme_fake.c.  I feel like people hacked
together some debug code and weren't too worried about the security
since it wasn't intended to be used on real systems...  The temptation
is to fix this by deleting at least vme_fake.c.

On Thu, Jun 25, 2026 at 11:31:37AM +0200, Yousef Alhouseen wrote:
> vme_user allocates a fixed PCI_BUF_SIZE coherent DMA buffer for each
> slave image, but VME_SET_SLAVE passes the user-supplied size to
> vme_slave_set() unchanged.

Obviously you meant checked instead of changed...  There is some
checking in vme_check_window() but it's not suffient.

> An enabled window larger than PCI_BUF_SIZE lets
> the bridge expose DMA addresses beyond the allocation.
> 
> The character device read/write paths also derive their bounds from
> vme_get_size(), so the oversized programmed window can make
> buffer_to_user() and buffer_from_user() access past
> image[minor].kern_buf.
> 
> Reject enabled slave windows that do not fit in the backing buffer and use
> the same capped size for slave read/write/llseek bounds. Also convert the
> read/write limit checks to subtraction-based form so offset + count cannot
> wrap around the image size check.

An "also" in the commit message, means split it out into its own patch.

> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---

Fixes tag.  Please say when you are using AI.

>  drivers/staging/vme_user/vme_user.c | 38 ++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
> index 11e25c2f6..24d3c6ec3 100644
> --- a/drivers/staging/vme_user/vme_user.c
> +++ b/drivers/staging/vme_user/vme_user.c
> @@ -175,11 +175,22 @@ static ssize_t buffer_from_user(unsigned int minor, const char __user *buf,
>  	return count;
>  }
>  
> +static size_t vme_user_get_image_size(unsigned int minor)
> +{
> +	size_t image_size = vme_get_size(image[minor].resource);
> +
> +	if (type[minor] == SLAVE_MINOR)
> +		image_size = min_t(size_t, image_size, image[minor].size_buf);
> +
> +	return image_size;
> +}

No, vme_get_size() should return the correct size.  If it's really a
bug then fix that instead of adding a work-around here.

> +
>  static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
>  			     loff_t *ppos)
>  {
>  	unsigned int minor = iminor(file_inode(file));
>  	ssize_t retval;
> +	size_t offset;

No need for this variable.

>  	size_t image_size;
>  
>  	if (minor == CONTROL_MINOR)
> @@ -188,17 +199,19 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
>  	mutex_lock(&image[minor].mutex);
>  
>  	/* XXX Do we *really* want this helper - we can use vme_*_get ? */
> -	image_size = vme_get_size(image[minor].resource);
> +	image_size = vme_user_get_image_size(minor);

vme_get_size() returns zero on error.  Just add an check for errors:

	if (image_size == 0) {
		mutex_unlock(&image[minor].mutex);
		return 0;
	}

>  
>  	/* Ensure we are starting at a valid location */
> -	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
> +	if ((*ppos < 0) || ((u64)*ppos >= image_size)) {

No need for this cast.

	if ((*ppos < 0) || (*ppos >= image_size)) {

But actually if we check for zero then this is unnecesssary.

>  		mutex_unlock(&image[minor].mutex);
>  		return 0;
>  	}
>  
> +	offset = *ppos;
> +
>  	/* Ensure not reading past end of the image */
> -	if (*ppos + count > image_size)
> -		count = image_size - *ppos;
> +	if (count > image_size - offset)
> +		count = image_size - offset;

The kernel ensures that "*ppos + count" can't overflow in
rw_verify_area() so this change is unnecessary.

>  
>  	switch (type[minor]) {
>  	case MASTER_MINOR:
> @@ -223,6 +236,7 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
>  {
>  	unsigned int minor = iminor(file_inode(file));
>  	ssize_t retval;
> +	size_t offset;
>  	size_t image_size;
>  
>  	if (minor == CONTROL_MINOR)
> @@ -230,17 +244,19 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
>  
>  	mutex_lock(&image[minor].mutex);
>  
> -	image_size = vme_get_size(image[minor].resource);
> +	image_size = vme_user_get_image_size(minor);
>  
>  	/* Ensure we are starting at a valid location */
> -	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
> +	if ((*ppos < 0) || ((u64)*ppos >= image_size)) {
>  		mutex_unlock(&image[minor].mutex);
>  		return 0;
>  	}
>  
> +	offset = *ppos;
> +
>  	/* Ensure not reading past end of the image */
> -	if (*ppos + count > image_size)
> -		count = image_size - *ppos;
> +	if (count > image_size - offset)
> +		count = image_size - offset;
>  
>  	switch (type[minor]) {
>  	case MASTER_MINOR:
> @@ -271,7 +287,7 @@ static loff_t vme_user_llseek(struct file *file, loff_t off, int whence)
>  	case MASTER_MINOR:
>  	case SLAVE_MINOR:
>  		mutex_lock(&image[minor].mutex);
> -		image_size = vme_get_size(image[minor].resource);
> +		image_size = vme_user_get_image_size(minor);
>  		res = fixed_size_llseek(file, off, whence, image_size);
>  		mutex_unlock(&image[minor].mutex);
>  		return res;
> @@ -394,6 +410,10 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
>  				return -EFAULT;
>  			}
>  
> +			if (slave.enable &&
> +			    (!slave.size || slave.size > image[minor].size_buf))
> +				return -EINVAL;

This isn't the right place to check...  It should probably be done in
vme_check_window()?

This code is quite tricky and I don't really understand it all.  Why does
resource_to/from_user() check for buffer overflow but buffer_to/from_user()
does not?  The checking in resource_to/from_user() is also insufficient
because it doesn't take *ppos into consideration but fortunately,
vme_master_read/write() does.  This code would be safer if we added
bounds checking to buffer_to/from_user().

regards,
dan carpenter





> +
>  			/* XXX	We do not want to push aspace, cycle and width
>  			 *	to userspace as they are
>  			 */
> -- 
> 2.54.0
> 

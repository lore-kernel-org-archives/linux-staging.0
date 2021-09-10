Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9EC3FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 11:40:11 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id n4so956452plh.9
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 04:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vt09EgmCFNaOpoRWV9K80XX9Kd5es86lQ5YaOnlS2Mo=;
        b=bASbeF9GEJGPuSgIhYlbSMyrzz1KEQ90Aq8gYRMx/KHAe9qIF4K1HaiAxhTIR0/X2l
         bQGz9342k0YfCkGqjs+vCAyHvCF3S1XXVBstLvF4GCJDPceRCS2bkCEJe0YddxXIvKOB
         zUz3zH0DAKju4ntSi5JcgOSTf/li3uA9E/I6D4IPH5U6cFG3sDXtUobEY0DdSDMwu808
         CQGXnvxZJso2IexkBlrNom2jRqsRlJFvF6OSuEVW4k7XjSkzRbRFYYAA+OX4qInCtcQ9
         tQ4tnutmlNUlGlLnstbkTTauA/RQlc4p5t5iwRzcTJOwq670c+jLVFju4RFOHJXeF75X
         tBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vt09EgmCFNaOpoRWV9K80XX9Kd5es86lQ5YaOnlS2Mo=;
        b=K40I4N6QJKgBNKZUvjXT4lZmWV1Vmj6SRQ47IH3p7aNOIIHxGy6Z6LN7BykXV784wK
         vRxqqJqoWpu//0c44VJmYL+ZZux8DCu20A6z/4WiDBfcl3nmIsPccxREiX5ybsuffCBk
         xb9TYdxEw9mxjuSnuIik5b6edNDIk5XJAJP2NAAGDXQXqRR8RI2VPRNHwzUU1tshnAen
         bqPtDcKNIqYcLMQHp6NzfOmVO6VL6q/abH19ub/nY30c71xraqTkjez5DVPoU0bWd5b1
         uYEWOulR+8ojrn3e5cyUswx0t5u+A695KsQb8BfThRdFU9mTKykv/yU9GtD+hBszDDF5
         rEvg==
X-Gm-Message-State: AOAM533N6ahPw0/5JWWuhLVHl5+sV0aHEHNoWxxm8t8io/M+282vri3J
	s3QYW7jdNqyrucC/9mTzjrQ=
X-Google-Smtp-Source: ABdhPJwGW9y9T7sPMAt8pvmQ2B+oECa7k9fdxvj/BjNeQIxv55IIO2AkxK6wzUbt4vxK6tAafip71A==
X-Received: by 2002:a17:90b:1d0e:: with SMTP id on14mr8957109pjb.97.1631274011397;
        Fri, 10 Sep 2021 04:40:11 -0700 (PDT)
Received: from ojas ([122.161.49.57])
        by smtp.gmail.com with ESMTPSA id h7sm5014684pfk.96.2021.09.10.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 04:40:11 -0700 (PDT)
Date: Fri, 10 Sep 2021 17:10:04 +0530
From: Ojaswin Mujoo <ojaswin98@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Phil Elwell <phil@raspberrypi.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] staging: vchiq: convert to use a miscdevice
Message-ID: <20210910114004.GA23656@ojas>
References: <20210907115045.2206083-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907115045.2206083-1-gregkh@linuxfoundation.org>

On Tue, Sep 07, 2021 at 01:50:45PM +0200, Greg Kroah-Hartman wrote:
> Using a struct class, a cdev, and another device just for a single minor
> device is total overkill.  Just use a dynamic misc device instead,
> saving lots of logic and memory.

Hello Greg,

I got some time to test this out at my end. This seems to work correctly
however there's a small change in permissions applied to /dev/vchiq that
is causing tests to break.

* Permissions before the patch *
$ ls -l /dev/vchiq 
crw-rw---- 1 root video 235, 0 May  7 17:33 vchiq

* Permissions after the patch *
$ ls -l /dev/vchiq 
crw------- 1 root root 10, 125 May  7 17:30 vchiq

As seen above, after the patch, the cdev is only accessible by root user,
which is causing the tests ($ vchiq_test -f 10) to fail when run as
non-root.

I believe assigning the permission and "video" group to /dev/vchiq is
handled by udev, in the downstream pi OS, as seen in this line in
/lib/udev/rules.d/10-local-rpi.rules file:

SUBSYSTEM=="vchiq", GROUP="video", MODE="0660" 

I'm not completely sure how the SUBSYSTEM part is passed to udev from
the kernel modules, however seems like the miscdevice is not notifying
udev correctly (?).

I'm still looking into this but thought I'd point this out so someone
more experienced can check and see if this could be an issue. 

Regards, Ojaswin

> 
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Ojaswin Mujoo <ojaswin98@gmail.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  .../interface/vchiq_arm/vchiq_dev.c           | 71 +++----------------
>  1 file changed, 11 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> index bf1a88c9d1ee..788fa5a987a3 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> @@ -9,18 +9,13 @@
>  #include <linux/device.h>
>  #include <linux/slab.h>
>  #include <linux/compat.h>
> +#include <linux/miscdevice.h>
>  
>  #include "vchiq_core.h"
>  #include "vchiq_ioctl.h"
>  #include "vchiq_arm.h"
>  #include "vchiq_debugfs.h"
>  
> -#define DEVICE_NAME "vchiq"
> -
> -static struct cdev    vchiq_cdev;
> -static dev_t          vchiq_devid;
> -static struct class  *vchiq_class;
> -
>  static const char *const ioctl_names[] = {
>  	"CONNECT",
>  	"SHUTDOWN",
> @@ -1364,6 +1359,13 @@ vchiq_fops = {
>  	.read = vchiq_read
>  };
>  
> +static struct miscdevice vchiq_miscdev = {
> +	.fops = &vchiq_fops,
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.name = "vchiq",
> +
> +};
> +
>  /**
>   *	vchiq_register_chrdev - Register the char driver for vchiq
>   *				and create the necessary class and
> @@ -1374,57 +1376,9 @@ vchiq_fops = {
>   */
>  int vchiq_register_chrdev(struct device *parent)
>  {
> -	struct device *vchiq_dev;
> -	int ret;
> -
> -	vchiq_class = class_create(THIS_MODULE, DEVICE_NAME);
> -	if (IS_ERR(vchiq_class)) {
> -		pr_err("Failed to create vchiq class\n");
> -		ret = PTR_ERR(vchiq_class);
> -		goto error_exit;
> -	}
> -
> -	ret = alloc_chrdev_region(&vchiq_devid, 0, 1, DEVICE_NAME);
> -	if (ret) {
> -		pr_err("vchiq: Failed to allocate vchiq's chrdev region\n");
> -		goto alloc_region_error;
> -	}
> -
> -	cdev_init(&vchiq_cdev, &vchiq_fops);
> -	vchiq_cdev.owner = THIS_MODULE;
> -	ret = cdev_add(&vchiq_cdev, vchiq_devid, 1);
> -	if (ret) {
> -		vchiq_log_error(vchiq_arm_log_level,
> -				"Unable to register vchiq char device");
> -		goto cdev_add_error;
> -	}
> -
> -	vchiq_dev = device_create(vchiq_class, parent, vchiq_devid, NULL,
> -				  DEVICE_NAME);
> -	if (IS_ERR(vchiq_dev)) {
> -		vchiq_log_error(vchiq_arm_log_level,
> -				"Failed to create vchiq char device node");
> -		ret = PTR_ERR(vchiq_dev);
> -		goto device_create_error;
> -	}
> -
> -	vchiq_log_info(vchiq_arm_log_level,
> -		       "vchiq char dev initialised successfully - device %d.%d",
> -			MAJOR(vchiq_devid), MINOR(vchiq_devid));
> +	vchiq_miscdev.parent = parent;
>  
> -	return 0;
> -
> -device_create_error:
> -	cdev_del(&vchiq_cdev);
> -
> -cdev_add_error:
> -	unregister_chrdev_region(vchiq_devid, 1);
> -
> -alloc_region_error:
> -	class_destroy(vchiq_class);
> -
> -error_exit:
> -	return ret;
> +	return misc_register(&vchiq_miscdev);
>  }
>  
>  /**
> @@ -1433,8 +1387,5 @@ int vchiq_register_chrdev(struct device *parent)
>   */
>  void vchiq_deregister_chrdev(void)
>  {
> -	device_destroy(vchiq_class, vchiq_devid);
> -	cdev_del(&vchiq_cdev);
> -	unregister_chrdev_region(vchiq_devid, 1);
> -	class_destroy(vchiq_class);
> +	misc_deregister(&vchiq_miscdev);
>  }
> -- 
> 2.33.0
> 

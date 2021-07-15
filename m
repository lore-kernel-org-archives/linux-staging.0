Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9E172
	for <linux-staging@lists.linux.dev>; Thu, 15 Jul 2021 20:04:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E4C8340;
	Thu, 15 Jul 2021 22:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1626379448;
	bh=bO1Jxxvmr31rMcKCzyca5EDR8tI5mRe2AfSRhbBQytE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHaYKi7+FWVN1n/SaOjEcLt5v8J0BBKNjB6uJjc6awuePPx2+4j94BtVNK4yGVZ71
	 3syfhrPKp845W29imw2Ck8flkqhb1lRPBSHAK9m6Lr2t9tFfdBUzaqseQRMtXzlWds
	 JCGeMZG5xzkF+WhN8zhDkY9dgWiJ6Itr/6Ax2vLQ=
Date: Thu, 15 Jul 2021 23:04:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Saptarshi Patra <saptarshi.patra.22@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <christian@brauner.io>,
	Hridya Valsaraju <hridya@google.com>,
	Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: usb: uvc: uvc_driver: Added a function pr_info()
 in uvc_driver and staging: android: Decleared file operation with const
 keyword in android keyword
Message-ID: <YPCUtj9LC+i0/98g@pendragon.ideasonboard.com>
References: <20210715194911.8267-1-saptarshi.patra.22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210715194911.8267-1-saptarshi.patra.22@gmail.com>

Hi Saptarshi,

On Fri, Jul 16, 2021 at 01:19:10AM +0530, Saptarshi Patra wrote:
> media: usb: uvc: uvc_driver: Decleared a function called
>  pr_info()  with a string input "I changed uvcvideo driver in the Linux
>  Kernel"
> 
> Added the function pr_info() to see the message / input string using dmesg

I'm curious, could you explain why you think this should be merged in
the upstream kernel ? I fear the kernel log may get a bit too verbose if
everybody added their own little message :-)

> staging: android: Decleared file operation with const keyword

Don't combine multiple independent changes in a single patch.

> Warning found by the checkpatch.pl script
> 
> Signed-off-by: Saptarshi Patra <saptarshi.patra.22@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  drivers/staging/android/ashmem.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9a791d8ef200..0b47ca75091b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2352,7 +2352,7 @@ static int uvc_probe(struct usb_interface *intf,
>  		(const struct uvc_device_info *)id->driver_info;
>  	int function;
>  	int ret;
> -
> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
>  	/* Allocate memory for the device and initialize it. */
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (dev == NULL)
> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> index ddbde3f8430e..4c6b420fbf4d 100644
> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
>  
>  static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>  {
> -	static struct file_operations vmfile_fops;
> +	static const struct file_operations vmfile_fops;

You haven't compiled this, have you ?

>  	struct ashmem_area *asma = file->private_data;
>  	int ret = 0;
>  

-- 
Regards,

Laurent Pinchart

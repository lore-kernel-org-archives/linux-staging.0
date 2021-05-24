Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5305A17F
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 15:18:35 +0000 (UTC)
IronPort-SDR: hvnao/TWbIqGc1lUAxyAZKqdcdV8POJddNZ8ldL7vO5bw3cafu22CkV0e4uZ0b4fT6Z2zmj8oY
 EoQ4F/TMvWuA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="182276111"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="182276111"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:18:34 -0700
IronPort-SDR: 3xTXIYzKCtF6IjPu7vE/AmzsvA23PXBxNkDOLWZ71J7wEIsEt2GSoZn7c8zNKaDFnHxGeMg9wl
 hq5kQftQnV1w==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="629725647"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 08:18:31 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id B4AA4202F7;
	Mon, 24 May 2021 18:18:29 +0300 (EEST)
Date: Mon, 24 May 2021 18:18:29 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Hans Verkuil <hverkuil@xs4all.nl>,
	Christoph Hellwig <hch@lst.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: remove compat_ioctl32 code
Message-ID: <20210524151829.GO3@paasikivi.fi.intel.com>
References: <20210516204818.2967910-1-arnd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516204818.2967910-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Arnd,

On Sun, May 16, 2021 at 10:47:43PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is one of the last remaining users of compat_alloc_user_space()
> and copy_in_user(), which are in the process of getting removed.
> 
> As of commit 57e6b6f2303e ("media: atomisp_fops.c: disable
> atomisp_compat_ioctl32"), nothing in this file is actually getting used
> as the only reference has been stubbed out.

This patch was made redundant by another one that fixed the bug. But I
guess you're right in the sense that no-one could have used this because of
the patch that disabled it.

So:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

But:

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index f1e6b2597853..e383e17c5072 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -1283,7 +1283,8 @@ const struct v4l2_file_operations atomisp_fops = {
>  	.unlocked_ioctl = video_ioctl2,
>  #ifdef CONFIG_COMPAT
>  	/*
> -	 * There are problems with this code. Disable this for now.
> +	 * this was removed because of bugs, the interface
> +	 * needs to be made safe for compat tasks instead.
>  	.compat_ioctl32 = atomisp_compat_ioctl32,

I think the comment could go, too.

>  	 */
>  #endif
> @@ -1297,10 +1298,7 @@ const struct v4l2_file_operations atomisp_file_fops = {
>  	.mmap = atomisp_file_mmap,
>  	.unlocked_ioctl = video_ioctl2,
>  #ifdef CONFIG_COMPAT
> -	/*
> -	 * There are problems with this code. Disable this for now.
> -	.compat_ioctl32 = atomisp_compat_ioctl32,
> -	 */
> +	/* .compat_ioctl32 = atomisp_compat_ioctl32, */

Thie one, too.

>  #endif
>  	.poll = atomisp_poll,
>  };

-- 
Kind  regards,

Sakari Ailus

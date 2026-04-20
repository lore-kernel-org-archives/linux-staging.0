Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91A1F936
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688503; cv=none; b=sAa3CXy8+f+hE7QOc/9WHkePV8p7REMVup07G7puDDtCv4vdsYXhqbnwyPLBUmVpjZWl9TUamHEpVlr1R/q+jAjB6+cbZOECcQaT8nZA557deURF3nUwHBvjIqh1vqjDRV+WbcJLwzFVqFxwEQgRMefyrpshns8KTn+57zQc0cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688503; c=relaxed/simple;
	bh=30phntW6M604xT01CZAH0DRXFafq2D5jNNp0eTk7iUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHB8nQSRxkzhxjgKEo/AZGL6VMnxhfB24DfY+A8WQNH8CFYXgXas9gOiKpTGb0INYCqqjvRAyF/47mXcMbpX7RQ+lOEwK762d63h9cSgEQzKN24qxMuIofhfAI1q4yjDXPOZph8dber1zTa/qDURVNNm6zqiw4JUHHARathe+v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XAzKMwPH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XAzKMwPH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA914C19425;
	Mon, 20 Apr 2026 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776688503;
	bh=30phntW6M604xT01CZAH0DRXFafq2D5jNNp0eTk7iUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAzKMwPHUnRYa9bhI5NCg2LHofqzYzrrwIdVppWL8O9o6R35S29Gp0b3TY7sVHIX4
	 1fZSh8b3RqoEncA9DXmyAh7e5zRT0c0uDBxKr94bfILbA41ufcACLwYpkH0eK4G0bR
	 6lhhl/CHDqioT+4x5hnaPVkV66ps4wnVGbNyG2N8=
Date: Mon, 20 Apr 2026 14:35:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Matan Cohen <matan@matanco.space>
Cc: linux-staging@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Subject: Re: [PATCH] staging: most: video: replace BUG_ON with WARN_ON_ONCE
 and add recovery
Message-ID: <2026042033-elevate-company-449c@gregkh>
References: <20260420113503.62552-1-matan@matanco.space>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420113503.62552-1-matan@matanco.space>

On Mon, Apr 20, 2026 at 11:35:03AM +0000, Matan Cohen wrote:
> BUG_ON() halts the kernel unconditionally. The check after
> most_deregister_component() guards against a bug in mostcore: it
> currently does not call disconnect_channel() for linked channels on
> deregistration, so if that ever changes unexpectedly, video_devices
> could be non-empty.
> 
> Replace BUG_ON with WARN_ON_ONCE so the kernel stays up, and add a
> recovery path that drains and frees any remaining devices to avoid
> memory leaks in that error case.
> 
> Also document what the spinlock and mutex in struct most_video_dev
> each protect.
> ---
>  drivers/staging/most/video/video.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 04351f8ccccf1..4ade49569bd63 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,14 +33,14 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> -	spinlock_t list_lock;
> +	spinlock_t list_lock; /* protects pending_mbos and mute */
>  
>  	struct v4l2_device v4l2_dev;
>  	atomic_t access_ref;
>  	struct video_device *vdev;
>  	unsigned int ctrl_input;
>  
> -	struct mutex lock;
> +	struct mutex lock; /* v4l2 device lock */
>  
>  	wait_queue_head_t wait_data;
>  };
> @@ -577,7 +577,20 @@ static void __exit comp_exit(void)
>  
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
> +
> +	if (WARN_ON_ONCE(!list_empty(&video_devices))) {
> +		/* clean up any devices unexpectedly added during deregister phase */
> +		spin_lock_irq(&list_lock);
> +		list_replace_init(&video_devices, &free_list);
> +		spin_unlock_irq(&list_lock);
> +
> +		list_for_each_entry_safe(mdev, tmp, &free_list, list) {
> +			list_del_init(&mdev->list);
> +			comp_unregister_videodev(mdev);
> +			v4l2_device_disconnect(&mdev->v4l2_dev);
> +			v4l2_device_put(&mdev->v4l2_dev);
> +		}
> +	}
>  }
>  
>  module_init(comp_init);
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

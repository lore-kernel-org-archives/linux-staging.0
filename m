Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A0C10E5
	for <linux-staging@lists.linux.dev>; Thu, 28 Apr 2022 15:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD09C385A0;
	Thu, 28 Apr 2022 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1651159400;
	bh=fotImP6RjEaX7iNcOVKBbxLYwLOMLdnMO2tvTLVJfxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDVzZLWsl3lH8dn5oJJ4v8Ahr6iSPfe1t6jAyTAiIxBbvadQiMWISP+uOcoQ3CisD
	 ZCQY3OyXU1AwDBw1NnXkqRZzVz+eTGSbsf22eegVnuWPC23RiKmDh1mznaL9LyG2Er
	 j5ZtMKesZGM9EfUxFfAnX/bQDFUVhpO2f1rqP1Ro=
Date: Thu, 28 Apr 2022 17:23:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adrien Thierry <athierry@redhat.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vchiq_arm: use standard print helpers
Message-ID: <YmqxZevQJpWuLlQ3@kroah.com>
References: <20220428150550.261499-1-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428150550.261499-1-athierry@redhat.com>

On Thu, Apr 28, 2022 at 11:05:49AM -0400, Adrien Thierry wrote:
> Replace the custom debug print macros with the standard dev_err() and
> friends.
> 
> This handles TODO item "Cleanup logging mechanism".
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
> 
> Changes since v1: removed function name in dev_dbg() calls
> 
>  .../interface/vchiq_arm/vchiq_arm.c           | 157 +++---
>  .../interface/vchiq_arm/vchiq_connected.c     |   7 +-
>  .../interface/vchiq_arm/vchiq_connected.h     |   4 +-
>  .../interface/vchiq_arm/vchiq_core.c          | 495 ++++++++----------
>  .../interface/vchiq_arm/vchiq_core.h          |  43 +-
>  .../interface/vchiq_arm/vchiq_debugfs.c       | 105 ----
>  .../interface/vchiq_arm/vchiq_dev.c           |  86 ++-
>  7 files changed, 341 insertions(+), 556 deletions(-)

Try doing this in smaller chunks.  There's a lot of churn here, and not
all of it is correct.

Try removing these one-function-at-a-time and then when it's all
finished, you can remove the debugfs and function calls as no one is
calling them.

That way it's also easier to review, as-is, this is a tough review.
Would you want to review this at once?

A few odd things that jumped out at me:

> @@ -1332,6 +1325,8 @@ vchiq_keepalive_thread_func(void *v)
>  	struct vchiq_state *state = (struct vchiq_state *)v;
>  	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
>  
> +	struct device *dev = state->dev;
> +

Checkpatch should have warned you about the extra blank line here.  Put
all variables one after each other please.

> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> @@ -27,7 +27,7 @@ static void connected_init(void)
>   * be made immediately, otherwise it will be deferred until
>   * vchiq_call_connected_callbacks is called.
>   */
> -void vchiq_add_connected_callback(void (*callback)(void))
> +void vchiq_add_connected_callback(struct device *dev, void (*callback)(void))

Pass in the real vchiq device pointer, not a struct device.

> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.h
> @@ -4,7 +4,9 @@
>  #ifndef VCHIQ_CONNECTED_H
>  #define VCHIQ_CONNECTED_H
>  
> -void vchiq_add_connected_callback(void (*callback)(void));
> +#include <linux/device.h>

Don't include the .h file here, it shouldn't be needed if you make this
the same real device type.

>  
>  struct vchiq_state {
> +	struct device *dev;

Careful now, have you properly handled the reference counting?  I can't
tell so you should do this type of change on it's own to make it obvious
you handle it properly.

> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> @@ -37,6 +37,8 @@ static const char *const ioctl_names[] = {
>  	"CLOSE_DELIVERED"
>  };
>  
> +static struct miscdevice vchiq_miscdev;

That looks really odd.  If you create this, where are you initializing
it?  Did you test this code?

thanks,

greg k-h

Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56B62FAF
	for <linux-staging@lists.linux.dev>; Sat, 22 May 2021 06:34:00 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkLCh-00HMua-KY; Sat, 22 May 2021 06:33:43 +0000
Date: Sat, 22 May 2021 06:33:43 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: nsaenz@kernel.org, gregkh@linuxfoundation.org, stefan.wahren@i2se.com,
	arnd@arndb.de, dan.carpenter@oracle.com, phil@raspberrypi.com,
	amarjargal16@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: Using copy_from_user() to copy data
 from userspace address
Message-ID: <YKilx7iNSBYYbXSs@zeniv-ca.linux.org.uk>
References: <20210522053429.82710-1-phind.uet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522053429.82710-1-phind.uet@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, May 22, 2021 at 01:34:29PM +0800, Nguyen Dinh Phi wrote:
> This commit to fix the following sparse warning:
> incorrect type in assignment (different address spaces)
> expected void *[assigned] userdata
> got void [noderef] __user *userdata
> 
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index afbf01b7364c..2a4fc599f977 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -960,7 +960,10 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
>  			current->pid);
>  		userdata = &waiter->bulk_waiter;
>  	} else {
> -		userdata = args->userdata;
> +		if (copy_from_user(userdata, args->userdata, sizeof(args->userdata))) {

	The contents of userdata (local variable of type void *) is uninitialized at that
point.  Just what do you think that call of copy_from_user() would do?

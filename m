Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B69772
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:37:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 376EF60F23;
	Sun, 17 Oct 2021 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634463453;
	bh=TnThaLix6SFkYNB2+9atk2ZdBdQ0TC8TXqRaqicaHi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UF11qCPicbcA0HJPW0PLBaAkIKIYHVexVZimVnnT4rwkh/FATGQrEqOI9LLKkqgVl
	 ZdXElZabCc/v+T65lcg0u6cH0YAsOwByFKz6cWwbWBQ1C/Vc3RJ5lyURGOK+XrA+FU
	 sdwc06Sz6NLVxFYLzjNPyqfhicBq2gevOoNxHSR8=
Date: Sun, 17 Oct 2021 11:37:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kushal-kothari <kushalkothari285@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, mike.rapoport@gmail.com,
	kushalkothari2850@gmail.com, outreachy-kernel@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	nsaenz@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v2] staging: vc04_services: replace msleep() by
 usleep_range()
Message-ID: <YWvu2mZutljJLBY7@kroah.com>
References: <20211017092900.134752-1-kushalkothari285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017092900.134752-1-kushalkothari285@gmail.com>

On Sun, Oct 17, 2021 at 02:59:00PM +0530, Kushal-kothari wrote:
> Fixed the warning:-msleep < 20ms can sleep for up to 20ms by replacing
> msleep(unsigned long msecs) by usleep_range(unsigned long min, unsigned long max)

No need to put the parameters in a function call.

> in usecs as msleep(1ms~20ms) can sleep for upto 20 ms.
> 
> Signed-off-by: Kushal-kothari <kushalkothari285@gmail.com>

We need a "Legal" name here, is that how you sign documents?  Sorry, I
have to ask.

> ---
> 
> Changes from v1: Reword both the subject and the log message.
> 
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 6fbafdfe340f..80a7898c5331 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -857,7 +857,7 @@ vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
>  		if (status != VCHIQ_RETRY)
>  			break;
>  
> -		msleep(1);
> +		usleep_range(1000, 2000);

You can not just randomly pick a range value here without lots of
testing and knowing that the hardware really can support this.

Have you done this here?

thanks,

greg k-h

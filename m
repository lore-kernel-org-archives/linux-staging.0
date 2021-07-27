Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A253272
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 13:25:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D12D761A07;
	Tue, 27 Jul 2021 13:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627392303;
	bh=F5FO0KwrjkIdpxIRGWjqMSMQQWb+eHq3L3DMaWH6RQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9q5p5jH2mYJrV8HkMu2/aUtXlP3FXBATy73XY6OdDb3OxuwwLVfTkwz882JyDAQS
	 64+TfrckXAJ8gK6cvMKQT2aygMD5TCe94r0F7G7oPxQOnpEYdiWjYYId5I23tf+vpr
	 E7f8hbHdl8LCfkXDtsJDtU0hSRFqjBcsok1GkgHU=
Date: Tue, 27 Jul 2021 15:25:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ojaswin Mujoo <ojaswin98@gmail.com>
Cc: nsaenz@kernel.org, stefan.wahren@i2se.com, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] staging: vchiq: Make creation of vchiq cdev
 optional
Message-ID: <YQAJLao8H1Hl5VVf@kroah.com>
References: <cover.1626882325.git.ojaswin98@gmail.com>
 <846c424dd4aae14d1cc28c8f30877a06e2b7dd10.1626882325.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <846c424dd4aae14d1cc28c8f30877a06e2b7dd10.1626882325.git.ojaswin98@gmail.com>

On Wed, Jul 21, 2021 at 09:50:52PM +0530, Ojaswin Mujoo wrote:
> Before this commit, vchiq cdev (/dev/vchiq) was always created during
> platform initialization. Introduce a new Kconfig option
> CONFIG_VCHIQ_CDEV which determines if the cdev will be created or not.
> 
> Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> ---
>  drivers/staging/vc04_services/Kconfig                  | 10 ++++++++++
>  drivers/staging/vc04_services/Makefile                 |  5 ++++-
>  .../vc04_services/interface/vchiq_arm/vchiq_arm.h      |  9 +++++++++
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
> index 4b886293f198..63caa6818d37 100644
> --- a/drivers/staging/vc04_services/Kconfig
> +++ b/drivers/staging/vc04_services/Kconfig
> @@ -19,6 +19,16 @@ config BCM2835_VCHIQ
>  		Defaults to Y when the Broadcom Videocore services
>  		are included in the build, N otherwise.
>  
> +if BCM2835_VCHIQ
> +
> +config VCHIQ_CDEV
> +	bool "VCHIQ Character Driver"
> +	help
> +		Enable the creation of VCHIQ character driver to help
> +		communicate with the Videocore platform.

I'll take this, but this really should say more about what this really
is for.  Who needs this?  Why will I know if I want a character driver
interface?  What tools talk to this?

Or conversely, why would I want to turn this off?

Can you send a follow-on patch that makes this more descriptive?

thanks,

greg k-h

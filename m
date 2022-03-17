Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C767A
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 07:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1761C340E9;
	Thu, 17 Mar 2022 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647501883;
	bh=pYEkx45xInxde69G2qndBvl5Zja+r4vxJ1P7iU70phk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yF7C8jb+N8PnVpgnPlZ0MSPfVlGRYVSJyjbooXMFMqS3rmu93uD0DwTIIZDOXNR2f
	 P+tGQx+wy3ZmemseQXmeZdgybqZnTLQl1Y/QUgkMQHPlBmzyYZkefdCqpxpQyW5k+D
	 3UEvvLg3gpP7LF3SdhtFg27A/E02PZH33HGgePcA=
Date: Thu, 17 Mar 2022 08:24:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <YjLiMzVvbLgrePlq@kroah.com>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:
> Introducing the vSMP guest driver which allows interaction with the vSMP control device when
> running a Linux OS atop of the vSMP hypervisor.
> vSMP is a resource aggregation hypervisor from SAP.
> 
> the driver comprises of 3 modules, vsmp which includes all the api needed to interact with the
> control driver, vsmp_logs which allows reading logs from the hypervisor and vsmp_common_info which
> allows reading generic information the hypervisor exposes, currently only the version is exposed.
> 
> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>
> ---
>  MAINTAINERS                             |   6 +
>  drivers/staging/Kconfig                 |   2 +
>  drivers/staging/Makefile                |   1 +
>  drivers/staging/vsmp/Kconfig            |  14 +
>  drivers/staging/vsmp/Makefile           |   7 +
>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++
>  drivers/staging/vsmp/api.h              |  61 ++++
>  drivers/staging/vsmp/common/Kconfig     |  11 +
>  drivers/staging/vsmp/common/Makefile    |   7 +
>  drivers/staging/vsmp/common/common.c    |  64 ++++
>  drivers/staging/vsmp/common/common.h    |  27 ++
>  drivers/staging/vsmp/common/version.c   |  85 +++++
>  drivers/staging/vsmp/logs/Kconfig       |  10 +
>  drivers/staging/vsmp/logs/Makefile      |   7 +
>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++
>  drivers/staging/vsmp/registers.h        |  16 +
>  16 files changed, 832 insertions(+)

800 lines of code turn into 3 modules?  Why isn't this just one module?
Why split them at all?

thanks,

greg k-h

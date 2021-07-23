Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CD72
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 11:02:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31B1360EB2;
	Fri, 23 Jul 2021 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627038166;
	bh=tErI2vcqXTeZiUkoPXX1NnocpSrL2pNRd47WOhAS1uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPWRbVJ8YcJoyO0iwG9wvtQMqVCrpjLHDGtYwSiwYyN82MDk6lVBWUcopcKpF+v3K
	 m1zq3/K9LJplD0gyYGfa2OpQITeoxTM60EKctoVEt7bstbQTlAMOtNug+XBZrXXfcB
	 HVHCBvGF+qtyw4hL4RrQwt5ZKf/0f+U/aQmwPwZg=
Date: Fri, 23 Jul 2021 13:02:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ojaswin Mujoo <ojaswin98@gmail.com>
Cc: nsaenz@kernel.org, stefan.wahren@i2se.com, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] vchiq: Patch to separate platform and cdev code
Message-ID: <YPqh0SHa8n3BugnB@kroah.com>
References: <cover.1626882325.git.ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1626882325.git.ojaswin98@gmail.com>

On Wed, Jul 21, 2021 at 09:50:48PM +0530, Ojaswin Mujoo wrote:
> Hello,
> 
> This patchset adderesses the TODO item number 10 specified at:
> 
>     drivers/staging/vc04-services/interface/TODO
> 
> For reference, the task is:
> 
>     10) Reorganize file structure: Move char driver to it's own file and join
>     both platform files
> 
>     The cdev is defined alongside with the platform code in vchiq_arm.c. It
>     would be nice to completely decouple it from the actual core code. For
>     instance to be able to use bcm2835-audio without having /dev/vchiq created.
>     One could argue it's better for security reasons or general cleanliness. It
>     could even be interesting to create two different kernel modules, something
>     the likes of vchiq-core.ko and vchiq-dev.ko. This would also ease the
>     upstreaming process.
> 
> A summary of the patches is as follows:
> 
> - Patch 1: Move cdev init code into a function
> - Patch 2: Shift some devlarations from vchiq_arm.c to vchiq_arm.h for
>            sharing
> - Patch 3: Move vchiq cdev init code from vchiq_arm.c into vchiq_dev.c
> - Patch 4: Decouple cdev code by defining a Kconfig entry to allow
>            optional compilation of it.
> - Patch 5: Merge code in vchiq_2835_arm.c to vchiq_arm.c
> 
> Changes since v3 [2]:
> 
> * In Patch 5, replace forward declarations of some of the functions with
>   function definition 

You dropped the reviews of others, so now I need to wait for them again
:(


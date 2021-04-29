Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4B71
	for <linux-staging@lists.linux.dev>; Thu, 29 Apr 2021 17:03:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3819613ED;
	Thu, 29 Apr 2021 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619715780;
	bh=86ih1Pwmgv0YL5x9tywf55q61EjjUm4JVP9sqao1QdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hV6N0ssirvcFMAC4nHeJ3RI7CHxhtr7a5qHAQOrRyb/zArTto/mbpT8EeExaeEnXR
	 GzNuFWCxbWLrkkxQ2yNnqd4EKPzrgtJdt3hS5zb+yMQzFsxirhBzNb72a8J5rQduhh
	 fON0mlhKvxGlVF8bM4UE0WmraBKNtG1UKLtZGqXs=
Date: Thu, 29 Apr 2021 19:02:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: code clean up confirmation => staging: media: atomisp: pci driver
Message-ID: <YIrmwYeSU0Clt7U4@kroah.com>
References: <YIrfVFhW8ufjm/tB@192.168.1.8>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIrfVFhW8ufjm/tB@192.168.1.8>

On Thu, Apr 29, 2021 at 10:01:16PM +0530, Deepak R Varma wrote:
> Hello All,
> Is anyone already working on code clean up of the following driver
> /files? I am specifically targeting addressing the checkpatch
> complaints. Let me know.
> 
> 	drivers/staging/media/atomisp/pci

There's no need to ask, just do the work and submit the patches.

We do not "claim" work ahead of time in the kernel, that is what has
killed other open source projects numerous times in the past.  We know
to learn from other's mistakes. :)

thanks,

greg k-h

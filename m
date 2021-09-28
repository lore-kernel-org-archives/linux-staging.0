Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9077529CA
	for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 07:10:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78B2A611C0;
	Tue, 28 Sep 2021 07:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632813046;
	bh=zPQccM6PFEYRzZcyQsbZ75u4XbjptgQYbBq0Dj3jSg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0j2gqTNNZoN29EBZTmf3PhT1ZSFx2bTT/xlXhE4nJBerzQEFIZ7wboWUIm5XW5LD
	 SVJaoc6N0o+RgQvl4BHQfQzKnPcRWQxnypODFASneRpgC3h3dlMLjlmKyzA2EtqKPS
	 QmEFq9BPrmhJsxNgSu8GGcjSrB0aPpgLmxEla84Q=
Date: Tue, 28 Sep 2021 09:10:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ojaswin Mujoo <ojaswin98@gmail.com>
Cc: nsaenz@kernel.org, stefan.wahren@i2se.com, dan.carpenter@oracle.com,
	phil@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq: Update TODO file
Message-ID: <YVK/9AIRQ5yzxpzb@kroah.com>
References: <20210927181323.10931-1-ojaswin98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927181323.10931-1-ojaswin98@gmail.com>

On Mon, Sep 27, 2021 at 11:43:23PM +0530, Ojaswin Mujoo wrote:
> Remove completed tasks from TODO and add some relevant details to task
> 14.
> 
> Signed-off-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> ---
>  drivers/staging/vc04_services/interface/TODO | 43 ++++----------------
>  1 file changed, 7 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
> index 39810ce017cd..5a6b3fc2663a 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -16,23 +16,6 @@ some of the ones we want:
>    to manage these buffers as dmabufs so that we can zero-copy import
>    camera images into vc4 for rendering/display.
>  
> -2) Garbage-collect unused code
> -
> -One of the reasons this driver wasn't upstreamed previously was that
> -there's a lot code that got built that's probably unnecessary these
> -days.  Once we have the set of VCHI-using drivers we want in tree, we
> -should be able to do a sweep of the code to see what's left that's
> -unused.
> -
> -3) Make driver more portable
> -
> -Building this driver with arm/multi_v7_defconfig or arm64/defconfig
> -leads to data corruption during the following command:
> -
> -  vchiq_test -f 1
> -
> -This should be fixed.
> -
>  4) Fix kernel module support

Now the numbering is out of order?

How about a first patch to remove the numbering and just replace it with
a list of items that are not numbered, and then remove the tasks that
are already done?

thanks,

greg k-h

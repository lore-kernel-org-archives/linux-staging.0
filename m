Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1F329CA
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 15:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD70FC340E0;
	Tue, 25 Jan 2022 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1643124796;
	bh=gHVxOv13aYes0ARGGaSYnRjF6hXkSucB+sDl7T24GrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnWFTSrSkU+J57CeUkaAbggOvz/fA5UK1mXbQ74fD29E6RBmcSudwItit9UDbIpWx
	 I2A8Rryv/R6PJXdhYvJDJZc+sdE/quLsa7f/t17d8a6ngSLn76Q8MF6k6x/SKemvDB
	 F51m/zH7qtOS2b9YhS8a5emolpxEMqNQtIUsEBz0=
Date: Tue, 25 Jan 2022 16:33:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: Re: [PATCH 00/10] Cleanup and removal of DBG_88E macro
Message-ID: <YfAYOVY7jFDubwc5@kroah.com>
References: <20220124224415.831-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124224415.831-1-phil@philpotter.co.uk>

On Mon, Jan 24, 2022 at 10:44:05PM +0000, Phillip Potter wrote:
> This series does a few things in order to effect the removal of the
> DBG_88E macro:
> 
> (1) It removes previously converted calls for consistency.
> (2) It removes all current DBG_88E calls.
> (3) It removes all aliased DBG_88E calls.
> (4) It removes the GlobalDebugLevel flag and the file that defines it.
> 
> By its very nature, it is a large patchset, so I've tried to group as
> appropriate. I went by file as I did the work, which led to over 40
> patches originally, so I've listed the largest C files as their own
> patches and then grouped everything else by subdir which gives closer
> sizes for the other patches.

Can you rebase this on my staging-testing branch?  It no longer applies
:(

thanks,

greg k-h

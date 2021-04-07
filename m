Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329DE29CA
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:32:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CEB861246;
	Wed,  7 Apr 2021 08:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617784375;
	bh=YnQM4Dntg6MnBX1n5CpMjAINjqZ8OgHrYo45v3FHX10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tn7dNqH1vKL0Rig5ICBourpNf7ZvbdSNFRcVB1q1W68R1RmEmXGlztoXbllHKBc8u
	 WfL73vHS08P3vkRBpIQyJjMO8yugTS7+q5UcRPxrcIz3L6UzZBMHJCE8rc28QAexUw
	 IUVy6sXR+AcsTyLAWYRpAwCIQqmZH1kfEtRKRKz4=
Date: Wed, 7 Apr 2021 10:32:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavle Rohalj <pavle.rohalj@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/49] *** SUBJECT HERE ***
Message-ID: <YG1uNX1ZaZ106iy8@kroah.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
 <YG1aVx3UuXR2JrC+@kroah.com>
 <YG1cCtbvINJ52tGT@localhost.localdomain>
 <YG1gDV6vqnUtDnbT@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG1gDV6vqnUtDnbT@kroah.com>

On Wed, Apr 07, 2021 at 09:32:29AM +0200, Greg KH wrote:
> On Wed, Apr 07, 2021 at 12:15:22AM -0700, Pavle Rohalj wrote:
> > On Wed, Apr 07, 2021 at 09:08:07AM +0200, Greg KH wrote:
> > > On Tue, Apr 06, 2021 at 11:35:54PM -0700, Pavle Rohalj wrote:
> > > > Changes in v2:
> > > >     - Removed type information from variable names
> > > >     - Broken up the changes into smaller patches
> > > 
> > > Your subject is very odd :(
> > 
> > Sorry about that, I overlooked the fact that I reran format-patch. The
> > subject should be:
> > 
> > [PATCH] staging: sm750fb: Convert camel case to snake case
> > 
> > Should I resubmit?
> 
> Not yet, let me review these first, I think they might need some work...
> 

Ok, now you can fix them up, I stopped after reviewing patch 02/49,
these need some work.

thanks,

greg k-h

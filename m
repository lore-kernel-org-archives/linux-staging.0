Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B656D19
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 09:36:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FFD0613C9;
	Tue,  6 Apr 2021 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617701805;
	bh=J009fz95W1yp7dSEEvcQHAB/rNi9vWwOuHc1FlLXl0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKQBQARblV68vQSDK3VKfeoxmvxv7g81RjXpQ8RzCHbVVtiEfZvwE+AMvGNbCLaPA
	 /NussvoRNsbHm53jXgIfSjGxUKGXv6jlUVZSBKf8qb6qRHx/fCexFNLvtBwio1lWZV
	 GVTzlP4Eg3YgQUcqFl/X1mTT49Xe86VKu7oi3qCw=
Date: Tue, 6 Apr 2021 11:36:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavle Rohalj <pavle.rohalj@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Convert camel case to snake case
Message-ID: <YGwrqUkAUWzccKA2@kroah.com>
References: <YGwncT6RGvYlL9yj@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGwncT6RGvYlL9yj@localhost.localdomain>

On Tue, Apr 06, 2021 at 02:18:41AM -0700, Pavle Rohalj wrote:
> -	struct dvi_ctrl_device *pCurrentDviCtrl;
> +	struct dvi_ctrl_device *p_current_dvi_ctrl;

Does this change make sense?  Why keep the "p_" here?  We do not need or
use, this type of variable naming in the kernel.

Also, please break this up into a patch series where you do one
structure change at a time.

thanks,

greg k-h

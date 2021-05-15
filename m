Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570A570
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 05:33:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D64BB613F6;
	Sat, 15 May 2021 05:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621056786;
	bh=B5DTuF90EF+MWBCeDcVtLq3OnjCaNYSF5lomIO0RGQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDgHYSDwbMxRyh7aLi9AleyT/VK1UINA89wMrBcREojdDcuy/nlfkMJGS36CyXrXT
	 nUMExzSFgrlrIyv0ZdKoftobPMJ12vQE8uhU4+MBP2VobqXW8W4xBOjuG5wbmGzdlt
	 hayrUtHQ16Z5fA/KD/DVflpAIJ61zk7QARtBL56E=
Date: Sat, 15 May 2021 07:33:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add declare_ to declaring macros
Message-ID: <YJ9dDwKMKkifeICJ@kroah.com>
References: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>

On Sat, May 15, 2021 at 09:11:16AM +0530, Shreyansh Chouhan wrote:
> Prefixed the names of all the macros that were used for declaring things
> with 'declare_'. This should help with clarifying about what these
> macros do.

Thanks, but I think I will leave the code as-is.  It's a good "test" for
people who try to modify the code without actually building it :)

greg k-h

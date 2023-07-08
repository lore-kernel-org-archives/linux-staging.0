Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2E1C13
	for <linux-staging@lists.linux.dev>; Sat,  8 Jul 2023 11:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E825C433C7;
	Sat,  8 Jul 2023 11:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688814632;
	bh=/eagb1g41jlYbYNVD/k/nT4mBSx2guvjO7rd3V9z7Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byUOD5YF14hpBIR0uIdMKA8jpGyLsxjhCpB/SrabkT5MPGLXrLxxLjNWghMzp6SwO
	 GcTxBXHYzF9s/JAuahyxdqIAODFbtj47Law+AHbkjCMFNNAu5maaINvndsogHkBlwI
	 sTAtI7oRolezDqz+MO7jjLpMx571EC5iP/5rETaA=
Date: Sat, 8 Jul 2023 13:10:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Madhumitha Prabakaran <madhumithabiw@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: Re: [PATCH] Add struct ad9832_platform_data to the include/linux/iio
Message-ID: <2023070858-brewing-outpour-764c@gregkh>
References: <20230707211553.GA110890@madhu-kernel>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707211553.GA110890@madhu-kernel>

On Fri, Jul 07, 2023 at 04:15:53PM -0500, Madhumitha Prabakaran wrote:
> Add struct ad9832_platform_data to the include/linux/iio
> for maintaining code organization and clarity.
> 
> Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c |  3 +--
>  drivers/staging/iio/frequency/ad9832.h | 34 --------------------------
>  include/linux/iio/frequency/ad9832.h   | 30 +++++++++++++++++++++++

No, not yet, sorry.  Staging drivers should be self-contained, why does
this .c file need a .h file at all anyway?  It should all just be in the
.c file, can you do that instead?

thanks,

greg k-h

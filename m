Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4F2FAD
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 17:05:51 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5CDBC613E5;
	Wed, 26 May 2021 17:05:48 +0000 (UTC)
Date: Wed, 26 May 2021 18:07:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: iio: cdc: ad7746: initial effort to
 move out of staging
Message-ID: <20210526180717.23d13296@jic23-huawei>
In-Reply-To: <cover.1621786036.git.lucas.p.stankus@gmail.com>
References: <cover.1621786036.git.lucas.p.stankus@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 May 2021 14:11:35 -0300
Lucas Stankus <lucas.p.stankus@gmail.com> wrote:

> Tidy up driver code by removing vague comments, simplifying probe
> return, and extracting capdac register write to a separate function.
> 
> These small patches are a starting point for improving the ad7746 driver,
> hopefully to a point where it's possible to get it out of staging. I'm
> looking up to feedback on what could be improved to accomplish that.
Usually the easiest way to get such feedback is to propose moving it out of
staging, (with move detection turned off in git format-patch).
Then we'll review it in a similar fashion to a new driver.

Starting point though for any review is ABI.  Looks like there is some
custom stuff in here which either needs to go away or be properly
proposed and documented. 

This series applied to the togreg branch of iio.git - initially
pushed out as testing to let 0-day poke at it.

Thanks,

Jonathan

> 
> changelog v1 -> v2:
> - Dropped num_channels fixup patch (applied from previous series).
> - Split general code style patch into several atomic ones.
> - New patch to catch capdac write boilerplate into a single function.
> 
> Lucas Stankus (3):
>   staging: iio: cdc: ad7746: remove ordinary comments
>   staging: iio: cdc: ad7746: clean up probe return
>   staging: iio: cdc: ad7746: extract capac setup to own function
> 
>  drivers/staging/iio/cdc/ad7746.c | 58 +++++++++++++-------------------
>  1 file changed, 23 insertions(+), 35 deletions(-)
> 


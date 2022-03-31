Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058E57E0
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 05:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AECBC340ED;
	Thu, 31 Mar 2022 05:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648706232;
	bh=PyjRVZSlbGKAR6UehNDdnoGgntb9T9gi297dJHWkNVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfjP5Suqu8RiD29EZCdLBdodO1i4fOW9wVXex57mfeHPQKfyyRseOH8V8Q3Okib3B
	 88IxCrsyNdxlYPe4UH6ZhslE5bJNpMplRhQvO1wL8lch4fTT5TNqFkudTEuZhXgGQ8
	 kfgDJIjuLp12HAEQMWxXC4Lg8b4EIpkuP7WtebII=
Date: Thu, 31 Mar 2022 07:57:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charlie Sands <sandsch@northvilleschools.net>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: Re: [PATCH V2] staging: r8188eu: Fix sparse endianness warnings
Message-ID: <YkVCtnEXPn8S8CC5@kroah.com>
References: <YkSnBW70kruOyN9h@sckzor-linux.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkSnBW70kruOyN9h@sckzor-linux.localdomain>

On Wed, Mar 30, 2022 at 02:52:53PM -0400, Charlie Sands wrote:
> This patch fixes sparse warnings about the endianness of different
> pieces of data in the driver.
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for
> RTL8188eu driver")

Nit, this should be all on one line or our tools get upset.

> Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
> ---
> V2: Added the "fixes" line to the commit at the request of Dan Carpenter.

My tools picked this up from the v1 patch thread, no need to resend.

thanks,

greg k-h

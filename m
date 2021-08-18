Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598A32FAD
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 14:38:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 595D1610CB;
	Wed, 18 Aug 2021 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629297523;
	bh=j6EFEtKO4tuA55/LWYwGajNNmlhIF104H+KjV4ei1rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDsBlTeFusgN2KPN8ML5eKebZrt08mNLZ7P2dZ4Y9zOkOIzIts1cY1NTYYIY4EvA1
	 MPYOIDiyOpxNlgbOCiYDbfFJTwj5QtNYBycR2RMw5CpWBeGjZHh3zGUtu0+WNypyp+
	 XcxsRNzIguFYaS6gXB3RKa9xCRujaPB7vDyfVfVo=
Date: Wed, 18 Aug 2021 16:38:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sidraya.bj@pathpartnertech.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	prashanth.ka@pathpartnertech.com, praneeth@ti.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 24/30] v4l:vxd-dec: Add resource manager
Message-ID: <YR0bcf8uC6k4Ngv2@kroah.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-25-sidraya.bj@pathpartnertech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818141037.19990-25-sidraya.bj@pathpartnertech.com>

On Wed, Aug 18, 2021 at 07:40:31PM +0530, sidraya.bj@pathpartnertech.com wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> This module handles the resources which is added to list
> and return the resource based requested list.

That does not describe this code at all.

Why is this needed?  What is wrong with the in-kernel resource manager
logic that requires this custom code instead?

Be more specific and verbose please.

thanks,

greg k-h

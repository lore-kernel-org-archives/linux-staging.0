Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8FC1E4BE;
	Sun, 17 May 2026 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029013; cv=none; b=MquKidkygmRmqc0EviF5C+kuILV14S6la6KOV2Bx/a9CHHQvNemgxsAzIUF8bBGYf/u2CeEVWOda8jrrCqwHeRV41IhkMavNGx1h+AOB6yeI5l2U1wqQRr5dlH+t4I+jRO4qnzAyJbDQIy2yLWZb2G11He8Hl9pbble6OgYpTYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029013; c=relaxed/simple;
	bh=3Ebm8qhzLLaUJlNX6/84qM3yarQ1GYCyQcPC9iOvDqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FS9PSfNnmZsv9pHm6YYKWNCZelovMcGSSw/i4zcYPGHPf2quRXukIe3sLKxyTMYfku/z+lQCJOOZRjB/bIMlUC2UZcWChwB5Z+sjoqlJL/2nlFYem23HTxKk0PkdcIj1lGmGnjSLj2DxfaGcIsFse7p3edYemiv5mdJW30xAc/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FeiVtcPY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FeiVtcPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D268C2BCB0;
	Sun, 17 May 2026 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779029012;
	bh=3Ebm8qhzLLaUJlNX6/84qM3yarQ1GYCyQcPC9iOvDqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeiVtcPYEGngyFOvUbDtq4ebWoD4viloDsLkpIkNgA60IPxxN3TrsiaB1nzwlNF1b
	 tcK0uLYKjh2dhcMVHjwzNdVq+v3M6FBGbJcesGRS6E0XbbyPzCkTj5u09QO2D36/cr
	 sBGt7K+SPLNTe1mdh5HvZb9EQIVG7qeuTIM19TYI=
Date: Sun, 17 May 2026 16:43:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: shayderrr <darknessshayder@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: octeon: fix carrier state, null guard, and
 modernize phy ioctl
Message-ID: <2026051706-grab-overstep-66d4@gregkh>
References: <20260517141955.79666-1-darknessshayder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517141955.79666-1-darknessshayder@gmail.com>

On Sun, May 17, 2026 at 09:19:55AM -0500, shayderrr wrote:
> From: Pranav Bajjuri <darknessshayder@gmail.com>
> 
> Add netif_carrier_off() to cvm_oct_common_stop(), guard
> cvm_oct_adjust_link() against null phydev, replace open-coded
> ioctl checks with phy_do_ioctl_running(), and zero priv->link_info
> on stop alongside last_link.

I am sorry, but I do not understand any of this.  Please always only do
one logical thing per patch.  This should be a patch series, right?

And have you tested this?

thanks,

greg k-h

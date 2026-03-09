Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E683A962D;
	Mon,  9 Mar 2026 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072469; cv=none; b=R0TAqqlOrkZIQIarsBhgUaPolpX9TBkNsabWC1CUOuHq7kTPub0xtFI7aEr9tU+BEnVYPTxQAO7t2ENrDPs2rGTimB3wR/VqZE9fVPH1bznprTYy/fld5wqPrPm9yPVEVHfC75EjDpKBMtp/+A9pxNJO1OhqzHOr3DbfgisoRd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072469; c=relaxed/simple;
	bh=27j55Yxwae1jhzp1arp+fTftHBQ5bcPNxXYdbWtCqaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLdewi28KppRvqXUs/2t08i3xZvKNUTNYZkGUvJsu0kClyivG95wV2w+bBrVUT5N5wPN4PbagXWAbbdEapYCWnzqUvS1klQuX6MtZh5VCIXFyfupmz4NrtTAVG9JC0hluJS/u5EDXIfPppAYWzxJxBcrT5WU+xBvG3D47WbYnIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LN4cyHR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LN4cyHR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6422C4CEF7;
	Mon,  9 Mar 2026 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072469;
	bh=27j55Yxwae1jhzp1arp+fTftHBQ5bcPNxXYdbWtCqaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LN4cyHR79GRuRsJlYiFLYdZXprI8ScGr/BW/EC62eJyIoTg+k/hyKp5hVTVPFlZCD
	 9Zk2CHr7IKJ0gucI1/O+NHgMSvIylK1N4MLPXy7CSPotrTHuzpeQAG8MBegxcHSuMF
	 VRuYlYWrs++kc7YF3bjI/bmuLt8imdaFLiFqLDso=
Date: Mon, 9 Mar 2026 17:07:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: minimize lock duration in write
Message-ID: <2026030914-task-stunned-21e0@gregkh>
References: <20260301005836.2513391-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301005836.2513391-1-objecting@objecting.org>

On Sun, Mar 01, 2026 at 12:58:36AM +0000, Josh Law wrote:
> Memory allocation and copy from user space with vmemdup_user() is relatively slow and can sleep. Move it outside the lock to minimize the time the mutex is held, reducing contention for concurrent accesses.

Something happened with your line wrapping :(

And are you sure that your change works?  What is wrong with grabbing
the lock this way?

thanks,

greg k-h

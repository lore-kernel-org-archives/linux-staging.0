Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD837500971;
	Sun, 11 Jan 2026 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135660; cv=none; b=dIQHIRhwyXL9bcWaB1oZEOgHTeRfLghUrks1s9btMGg2I63suwBUEktt7jDRViG3BJBYFCNh9Q+VrQ0TFTAFyyot/2C3ZnUP+WQUoLe59OP7tNbbKX1TU3qpoZ07eO6GlVhasPaM9mZX40bAPTbch77YKW+uXP58blTSnX9h6No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135660; c=relaxed/simple;
	bh=kXCBTjcDmImg9n889q27L6n6AFGT/I0txQBopxWnLSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRH11iTNMx0RyRJoxvfdP2CiXXruidAMdbxepItV+nujxeTQrWvLZCWZY7kVcK8leni3AVNsN9us/XSLwYBnGpum85XOJhx6IRucC8EC8DJBxON5EAZ1l5/+SbIO4zSFkVbQtYXGmgzCP3pYW+KwPOLYhAonsjdXCbsMhHOwvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=psCiDCqp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="psCiDCqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17E9C4CEF7;
	Sun, 11 Jan 2026 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768135660;
	bh=kXCBTjcDmImg9n889q27L6n6AFGT/I0txQBopxWnLSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psCiDCqpfynfjoVNcdpfUf+e3NS38Sci6IRmntkVk0HJ7CvJk9htxLSwOgPBG5LbM
	 TYdhSVOMFjdVM2DwlVzWEWNs5Q7osslp2TlfB9R0iVAiloOmPZYZJqafoOih4ZQzUb
	 D4KYWAM+V9sfwDrRiWtpTB6M755ZHIHtQdofD3mw=
Date: Sun, 11 Jan 2026 13:47:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "moradi.saeed" <saeed.b.67@gmail.com>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: return -ENOENT for AP/Ad-Hoc
 get_station
Message-ID: <2026011122-think-cling-febf@gregkh>
References: <20251231072341.61195-1-saeed.b.67@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231072341.61195-1-saeed.b.67@gmail.com>

On Wed, Dec 31, 2025 at 10:53:41AM +0330, moradi.saeed wrote:
> The cfg80211 get_station callback must return -ENOENT when
> station information is unavailable. The AP/Ad-Hoc path
> currently returns success without filling station_info,
> leading to invalid data exposure to userspace.
> 
> Fix this by returning -ENOENT for unimplemented modes.
> 
> Signed-off-by: moradi.saeed <saeed.b.67@gmail.com>

Please use your name to sign off, not your email alias.

thanks,

greg k-h

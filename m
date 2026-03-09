Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884C3B52E6;
	Mon,  9 Mar 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075269; cv=none; b=i9Ab9SHl/fszqblDATAnS+vCYwAvcfcJF47uWK9vw3gbbaI0AanltiewCR0mDSgGyopN78dVbm4KARtJ0Gxy1HyPcaGwFF+PVgHGKGeo5hcbGCBycK+4fooQMqWWKL0wWsjGmsmuHisa43Jhu6AKo+Y65JX9ey8GEMUE8RGYi5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075269; c=relaxed/simple;
	bh=3DALYcGu0MB6fKvm+7DiNFOUuwYoT+xH/EL/VRcbbtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZE8lx4xK1Q6Wiy8vfvO4JyLLgRnbzJW8C4vKpXm8CA5b01sjTMaSxh/eu9t/X0qxLz+cgtMBhMIXiDU8DtsYiKC38ZChOKLuxAl+6H+pimkv//1IJElLV9mOgg3AYynsVngPsyQNNWf6Nntkyy9cvWqPnd17h/SL6ZXGLifi/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QihnM+f+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QihnM+f+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89EBC4CEF7;
	Mon,  9 Mar 2026 16:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075269;
	bh=3DALYcGu0MB6fKvm+7DiNFOUuwYoT+xH/EL/VRcbbtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QihnM+f+HXx0I0c9yFAZrHcBQanrgDqQIk6mNhBYKrdhaHEIRqpiFnypVVJEr/yQ0
	 vXfMnVPbrJ5A8cHhfQE5/PUwQYYmIXcFUj/W5DRy9Pi8VlxvG+x8CbPT84TNpjMIEz
	 X1M0JSkfsixsEtELZIUG+j2kOtEolcLXTQXcyKJI=
Date: Mon, 9 Mar 2026 17:54:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: rtl8723bs: rename hal_btcoex functions to
 snake_case
Message-ID: <2026030917-plated-retool-1174@gregkh>
References: <20260308192734.186757-1-azpijr@gmail.com>
 <20260308192734.186757-3-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308192734.186757-3-azpijr@gmail.com>

On Sun, Mar 08, 2026 at 08:27:17PM +0100, Jose A. Perez de Azpillaga wrote:
> Rename hal_btcoex functions from CamelCase to snake_case to improve
> readability.
> 
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---

Again, one function name at a time.

thanks,

greg k-h

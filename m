Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867A30CEC
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSN4m25c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D146C433C8;
	Thu,  5 Oct 2023 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696521047;
	bh=1aXKNsvGURh4L9T8WGFdA+ZIToURAZxeUT/05vEWaGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSN4m25cCRn0BzAiJYOMhg7WW6wdT+WR7sHQ3Kg2hsNBJqn3PC4fCcqKAphAg4zaN
	 g5mkH1WGWvFgXij0AY90JnjR2ac2064NslL+4tsCJOCv/9caFXoECUg8MHjeYlCVey
	 bEnHsA1rwwmzLEKdkETqdi+n7pDnrBolx0zoue+FDgeUrFFa+AS4HDV/3IQwz+nefL
	 Lmhaqo2W+4yrMF6D0/VCcTYpSt6shN0CcreHdIe+dkZmIWoOxH8vGcyyk1njw+Ce8w
	 w8onggZobPdN2T/Oqd7pHotg19Waf6zklGh+YVyF/I+FuSsLua0YG3TmRg8wl5kh+6
	 Ku59kEjbRWUTg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qoQcy-0004cn-0l;
	Thu, 05 Oct 2023 17:51:04 +0200
Date: Thu, 5 Oct 2023 17:51:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH 3/3] staging: greybus: fw-management: make fw_mgmt_class
 constant
Message-ID: <ZR7baCUNIrJzJQ05@hovoldconsulting.com>
References: <2023100533-broadband-hunk-9e91@gregkh>
 <2023100534-catty-moodiness-099e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023100534-catty-moodiness-099e@gregkh>

On Thu, Oct 05, 2023 at 03:58:36PM +0200, Greg Kroah-Hartman wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, making all 'class' structures to be declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at load time.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Johan Hovold <johan@kernel.org>

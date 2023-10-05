Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA630CEC
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 15:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VI+kvJYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875EDC433C7;
	Thu,  5 Oct 2023 15:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696520958;
	bh=WIN9EstFELLLPzrqd4Mkhs3wLKPNhGefG3n02Se0ACA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VI+kvJYlwNMuahYX9iwV/fRCzWl0ylPGM4MqVru30c18mxeoS80j/jZu8+TLEe8QX
	 E7J/9KzBaCPFaTAtU89I6HGzVQe234KHYeNRCaasRD72WzTugymQshdiCxerw6Y0RI
	 Bx8bBxvXMjFigiRS8PQFZ2hE3RNHIu//n5ZkBj3x+D6hMUvjEDAU9/EQ8ureYDpwSl
	 7z9qTSTHRESoZ8IuYjBFhyVaY5URK+WCmX78kUsLT7/aVW+W3sDhiJ9v3H44dQO1Od
	 goFlxsFtW/zpeztyA3NwOsIjaShI6NLhbSo4O9630iU5U97KGJM/oT/6mHMkXS4Llp
	 eRrivGJYdhT9g==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qoQbW-0004c6-1z;
	Thu, 05 Oct 2023 17:49:35 +0200
Date: Thu, 5 Oct 2023 17:49:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH 1/3] staging: greybus: raw: make raw_class constant
Message-ID: <ZR7bDtBjPyRXkIKT@hovoldconsulting.com>
References: <2023100533-broadband-hunk-9e91@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023100533-broadband-hunk-9e91@gregkh>

On Thu, Oct 05, 2023 at 03:58:34PM +0200, Greg Kroah-Hartman wrote:
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

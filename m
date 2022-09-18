Received: from valentin-vidic.from.hr (valentin-vidic.from.hr [109.200.23.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D197F3
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 18:42:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
	id 4B4C22903B; Sun, 18 Sep 2022 20:42:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=valentin-vidic.from.hr; s=2020; t=1663526553;
	bh=qWw1AzhIzl+GBly80rOtnMKoshcpg7z0rHEZBe6kOI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQbPl1Fo0YZlyv2/77r3NF78GUN3pYAxoMJ6qpX/eqUGLLExyapkhR4uzo8PH2bLM
	 +z8sOaZVDvYSDpuyeYmU1GLc2k4jNDC/i/I/TwErXb5rsqly4jyRk9dNduhldCE5qX
	 BwpqXZwQxRfI2Ar4BcKnBP5aylyepxN3kVxrGzkCBQawz7kf7WBx8/uC6M/R3aUIuL
	 Pb3EZjOMXvjKZnVwJ0hH6Ad0DevGBEo6sP4LqeJvVd6f7oDTwpIw2c9ldZ8T4xlNmH
	 vtrjWIk/uXnVvgqpPcVWwYHMpz8EIyAHcwqfx/u4RkT2Ukne2FXcUlsOjQ4jYyY865
	 gG6NIFPE589/fIhLf0reqLr6HwNwWzI4hNa0SsMfpOFjREndUJZWL4dMo6y10gNs1G
	 uVnFNuhlA1EA3Pfr7jKENrCI7XO9S4AiTu2HsC2xGTVELtMDGfyHuh9zTlQICxjLQG
	 /70RdJ4R5UWjtee63n7QE1K+O9b5cdOTMxtJD9r6FfhSa+Ml5ZL9h5rphCkgfLbym7
	 WZ73l0ybYpi2GEr0bf9lM+4OyoNRmQjduqxvRvZoh/YztbR3wssXRBXD5kiagNv4BQ
	 k7feEa32rk740CEjarHAH8oZP6TR2XrNfttSnt2fBz6laT+RLM5LVEa9pP06jwXiRy
	 f08o4mQm2ytu355CcGTQvwck=
Date: Sun, 18 Sep 2022 20:42:32 +0200
From: Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: fix CamelCase struct member
Message-ID: <YydmmKtdJJan8FKd@valentin-vidic.from.hr>
References: <20220918114926.3809060-1-vvidic@valentin-vidic.from.hr>
 <YyciAPSyyusp1eCR@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyciAPSyyusp1eCR@kroah.com>

On Sun, Sep 18, 2022 at 03:49:52PM +0200, Greg Kroah-Hartman wrote:
> What does "pfirmware" mean here?
> 
> If you fix up camelcase warnings, please do so in a way that is the
> proper Linux kernel style, not just making everything lowercase.
> 
> Look up Hungarian notation and why the original was named this way and
> why this isn't needed in Linux at all (i.e. we have modern compilers.)

The rest of the driver does not use Hungarian notation, so I assume this
was something like platform or packed firmware. However, I could not
find any more info in the git log, so maybe just drop the prefix as it
is the only firmware in that struct?

-- 
Valentin

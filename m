Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16558EAD0
	for <linux-staging@lists.linux.dev>; Mon,  3 Jul 2023 13:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F88C433C8;
	Mon,  3 Jul 2023 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688391325;
	bh=a/xK+UJ9K5w/dA8s621q1fshRriwp/rBi7LgPiIO4z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hiq1BB0BwG8qkDL9uMCgV3HHmTXew9H6WG0id3+g/623X0SxAcW1qSfyKy/Mq/S8P
	 xSzRNAIOhSaN+tkmBp6k/tdIOzKXU992mTTUCXdZGBzNAbl4LwaCCk+LZGXgSPa1vu
	 jQgmnMmK8/x/S6ZYja6jHeE81IAkRfPQ5Er9ZPWY=
Date: Mon, 3 Jul 2023 15:34:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8192e: Rename function IsHTHalfNmodeAPs
 to is_ht_half_nmode_aps
Message-ID: <2023070358-magnifier-aviator-feed@gregkh>
References: <ZJp8cug8OwyvcLbD@tacos.darkphysics>
 <2023070321-unsubtle-customs-16f9@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023070321-unsubtle-customs-16f9@gregkh>

On Mon, Jul 03, 2023 at 03:22:00PM +0200, Greg KH wrote:
> On Mon, Jun 26, 2023 at 11:06:42PM -0700, Tree Davies wrote:
> > Rename function IsHTHalfNmodeAPs to is_ht_half_nmode_aps in order to
> > fix checkpatch warning: Avoid CamelCase
> > 
> > Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> > v2: Rename is_ht_half_nmode_a_ps -> is_ht_half_nmode_aps
> > ---
> 
> As per the documentation, the "v2..." stuff goes below the --- line so
> it will not end up in the change log text.
> 
> And you don't say why you changed the name here, why?

Ah, you did a v3 with this fixed up, nevermind...

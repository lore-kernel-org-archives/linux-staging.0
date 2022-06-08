Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465817D4
	for <linux-staging@lists.linux.dev>; Wed,  8 Jun 2022 06:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F60C34116;
	Wed,  8 Jun 2022 06:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654668955;
	bh=ryIOVG2/H44ZWlE3JtU1m7wD6c6zOxENtCDNvDozD+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3tDaUKg6m5er2DxG2+5A+y5EZr/hY/Hn2B/KshYvMNIe4/tAI5wPxNU1vgiGKDPb
	 keG0PnPkF54J3SjwpBN+axJzS9GVZkL7qccSj7Tc68U6xAuAKdGQD2WUCaWGblEJ8W
	 ZSfUzLn4ymUhI4Tj9pX0VmdPooaXGYculIsbUV40=
Date: Wed, 8 Jun 2022 08:15:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Soumya Negi <soumya.negi97@gmail.com>,
	fabioaiuto83@gmail.com, hdegoede@redhat.com,
	straube.linux@gmail.com, linux@roeck-us.net,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 5.15 24/51] staging: rtl8723bs: Fix alignment to
 match open parenthesis
Message-ID: <YqA+mOYUNcYj59Cy@kroah.com>
References: <20220607175552.479948-1-sashal@kernel.org>
 <20220607175552.479948-24-sashal@kernel.org>
 <ff5d5283af74576f65545399851a40cb4f16a85c.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff5d5283af74576f65545399851a40cb4f16a85c.camel@perches.com>

On Tue, Jun 07, 2022 at 05:04:08PM -0700, Joe Perches wrote:
> On Tue, 2022-06-07 at 13:55 -0400, Sasha Levin wrote:
> > From: Soumya Negi <soumya.negi97@gmail.com>
> > 
> > [ Upstream commit f722d67fad290b0c960f27062adc8cf59488d0a7 ]
> > 
> > Adhere to Linux coding style. Fixes checkpatch warnings:
> > CHECK: Alignment should match open parenthesis
> > CHECK: line length of 101 exceeds 100 columns
> 
> why should this be backported?  It's only whitespace changes.

Good catch, it should not.

thanks,

greg k-h

Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813B6D19
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 06:12:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D086660F41;
	Tue, 17 Aug 2021 06:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629180745;
	bh=hTwVpjGmUak1NMjM8ZG/8L0yy9w3IguhLNQ5Da//1P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5oCMcykDIhmhfDiqIa2ExpFHt1RQPJiCW1KMCjT37jDHPFNNHK8J1aQM58RRYY1A
	 pHdAqxIJsU1HZlRwhnQEPL6S5G/7PhJyf9MYiDNExP/sV1khiOogItCqao3KkLWS2x
	 dgOCECW/6Io+UV0mqQOjC6Bjvuy0fQ9C7wZ61R5c=
Date: Tue, 17 Aug 2021 08:12:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: daniel watson <ozzloy@challenge-bot.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging:iio:ade7854 surround complex defines in
 parentheses
Message-ID: <YRtTRpioOFBYxcxJ@kroah.com>
References: <20210815023115.13016-1-ozzloy@challenge-bot.com>
 <YRizb/FGfYpGbpJy@kroah.com>
 <20210817043038.GA9492@challenge-bot.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817043038.GA9492@challenge-bot.com>

On Mon, Aug 16, 2021 at 09:30:38PM -0700, daniel watson wrote:
> 
> If this is a false positive from checkpatch, I can submit it as an
> example to the checkpatch maintainers.  Do you think I should?

checkpatch is a perl script that does pattern matching, it is really
hard for it to determine for things like this specific example, that it
is not needed.

Try finding other valid checkpatch cleanups if you wish to contribute in
this way, there are loads of others under drivers/staging/ that should
be easy to find.

thanks,

greg k-h

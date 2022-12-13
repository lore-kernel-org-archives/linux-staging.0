Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9C02563
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 16:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB8DC433D2;
	Tue, 13 Dec 2022 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670949271;
	bh=lJ13zNvOUtaF6O5/WmH6tvw8NRTXilGhwkFJrT50u4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knZabNU67fZySJZzxlahHXeg56vTE6VWbtEMUpWq18wZ/P1x5mW1BbOxaTlYVvfXA
	 uQejJbUnXNirjVDRnxFYSz87E3YEQB8OXYAyv/gNfrAyzqLNXW72htWZUN+359ber7
	 p3XXFqwQIPHcUc4fszK38aPyEvmftgIkijHGQFV8j0w75NQD6CYsh24wW59p3T8Jmp
	 i5YVPKny1BbCPQ5hZEfP9ZfGEAZMaY4Pp69R17mQuMiY2c98ZiWGjMMbfITGBb7toS
	 jUZSnE+sqtKfwi95jX79HLj5MJ1n65JV5I/CYaQzls5abdQhaEJBlEXR2EWl7iCFVL
	 xfU1wzTvW68Sw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1p58F7-0006K1-CO; Tue, 13 Dec 2022 17:34:58 +0100
Date: Tue, 13 Dec 2022 17:34:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: Re: [PATCH] staging: greybus: codecs: Drop empty platform remove
 function
Message-ID: <Y5ipsSgRzWBvVlEA@hovoldconsulting.com>
References: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>

On Mon, Dec 12, 2022 at 11:13:15PM +0100, Uwe Kleine-König wrote:
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Johan Hovold <johan@kernel.org>

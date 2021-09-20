Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552063FC0
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 11:47:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DE766108C;
	Mon, 20 Sep 2021 11:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632138438;
	bh=XIPC8SBRxlf44yhtHeZmU5yKnbKe55y7VoY2t/bcuOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glSIsseM2bRILVlDniTl5g54N/eQyyWY2f3BvO3M/JyEpdhZGMMSOyf4IpBjMApL7
	 ZJqsJZoOr+kfIi66qvCFQSDFh09iLfvutf4RvEHWvqNeLaCB51XHJVpZEulsmjttUk
	 rKPjK72gNV2IAP1J+ujMeujsInr3af1BpqZM8EdY=
Date: Mon, 20 Sep 2021 13:47:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH v8 03/19] staging: r8188eu: remove unnecessary test in
 usbctrl_vendorreq()
Message-ID: <YUh0w7Llj253TDzK@kroah.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
 <20210919235356.4151-4-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210919235356.4151-4-fmdefrancesco@gmail.com>

On Mon, Sep 20, 2021 at 01:53:40AM +0200, Fabio M. De Francesco wrote:
> Remove unnecessary test for "!io_buf" in usbctrl_vendorreq(). Remove the
> no more used "release_mutex:" label.

You need to explain _why_ it is unnecessary.

thanks,

greg k-h

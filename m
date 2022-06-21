Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9BCEDD
	for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 14:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CE7C341C0;
	Tue, 21 Jun 2022 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655822442;
	bh=w320+wuqbFHvuGQ3W4guubYrnJKxDF19Xrl56Eu3yHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RutlupmvxTM2WBwYvITX5xNCm/wKJpI1hJPG0OmWn1IjpLSP9S5Iipo8ivtuNZa4N
	 SREWd6vu3fuliQ3quyD4ngv9hfRsSPJwe7og85nudLkf5uosLDZU/FDofT/Ih0DpdQ
	 qO5Nm12xtVGTxffcoEdNz/BVAmwvl5ZbrD9R/2ZgXQtrqO+4IrCESYxy3aPR0922bF
	 LfunBWPeels2/RJolz24Xc2RHqsK8Ep/RJqsuV3XNyah0Imp31NC/FUBAdAml2QYfd
	 JSMEvt3F77KtVcXwjB+pj6MS8gprWfJjbUBfGB6O63rqbtTPYfCctPYcJ3LBB6Z6Nb
	 Xf9pQZO9CTIwg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1o3f3V-00078B-8q; Tue, 21 Jun 2022 16:40:37 +0200
Date: Tue, 21 Jun 2022 16:40:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: vireshk@kernel.org, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Unitialized Variable and Null Pointer Dereference bug in
 gb_bootrom_get_firmware
Message-ID: <YrHYZb2BT8fQMcaR@hovoldconsulting.com>
References: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>

On Tue, Jun 21, 2022 at 10:36:04PM +0800, Dongliang Mu wrote:
> Hi maintainers,
> 
> I would like to send one bug report.
> 
> In gb_bootrom_get_firmware, if the first branch is satisfied, it will
> go to queue_work, leading to the dereference of uninitialized const
> variable "fw". If the second branch is satisfied, it will go to unlock
> with fw as NULL pointer, leading to a NULL Pointer Dereference.

This sounds like the false positive that checkers keep tripping over.

Please double check your analysis and search the archives first.

Johan

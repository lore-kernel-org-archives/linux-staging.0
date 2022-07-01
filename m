Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A331855
	for <linux-staging@lists.linux.dev>; Fri,  1 Jul 2022 09:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F753C341C7;
	Fri,  1 Jul 2022 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656668995;
	bh=riMhBhIOFPyc8zdSrFO3t8S/CDjKCl3m7OgIKc28lZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEoCtIHzjcPok2GCYV+A6AiK5MNtvOBZBBBTBNKk6n88F1mNEVC35oRv1Kj1xLWdZ
	 /JSGF3BzCSHihDC8go/m8Yzrk5vernrKjKKR8wpvIM6l2t107EKVO9+wvLULOrHqiP
	 Dlj00UuESYFCgA9rEaBnkJkkjGXk3m7Mu39tJ1kM=
Date: Fri, 1 Jul 2022 11:49:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Huang Zetao <huangzetao1@huawei.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	straube.linux@gmail.com, martin@kaiser.cx, abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev, inux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] staging: r8188eu: Use eth_broadcast_addr() to
 assign broadcast address
Message-ID: <Yr7DQJTPrSWTOa0c@kroah.com>
References: <20220701094011.81163-1-huangzetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701094011.81163-1-huangzetao1@huawei.com>

On Fri, Jul 01, 2022 at 09:40:11AM +0000, Huang Zetao wrote:
> Using eth_broadcast_addr() to assign broadcast address instead of memset().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>

Please follow the rules outlined in
Documentation/process/researcher-guidelines.rst when submitting patches
found by a random, private, unknown tool.

thanks,

greg k-h

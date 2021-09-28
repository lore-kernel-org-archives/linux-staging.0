Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00ED72
	for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 04:42:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55DB660FC0;
	Tue, 28 Sep 2021 04:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632804137;
	bh=cxpkxAnjWZA3ynyBkwXT9RRNTLZt6ddR2ES23fzaBm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNGouF6GqaIYJWI5vjzF4YpJFiuRcYKjOj04BdjhMBZD6afxlG94MxmBDNalrI3I0
	 Jty/noU6coZvtWpoxwVZNbYPsaZinUz65FIEKSedB9pUnDI9I9f5zhjEW4W8vxsIWK
	 iJLq/Ze0INxZXN3jqsxqye0/esV6rxqfyUEjRNKo=
Date: Tue, 28 Sep 2021 06:42:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] staging: vt6655: fix camelcase in ldBmThreshold
Message-ID: <YVKdJdTxlNJ55zCy@kroah.com>
References: <20210926162527.21462-1-tomm.merciai@gmail.com>
 <20210926162527.21462-3-tomm.merciai@gmail.com>
 <YVHirHixyOIgvqKB@kroah.com>
 <20210927214624.GB6953@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927214624.GB6953@tom-desktop>

On Mon, Sep 27, 2021 at 11:46:24PM +0200, Tommaso Merciai wrote:
> On Mon, Sep 27, 2021 at 05:26:36PM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Sep 26, 2021 at 06:25:19PM +0200, Tommaso Merciai wrote:
> > > Replace camel case variable ldBmThreshold with snake case
> > > variable ld_bm_threshold.
> > 
> > Same here, what exactly does this name mean and why did you pick it?
> >
>   You are right the same here. What do you think about "bm_threshold"?

What does "bm" stand for?

thanks,

greg k-h

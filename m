Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69E173
	for <linux-staging@lists.linux.dev>; Wed, 19 Jan 2022 10:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0697C004E1;
	Wed, 19 Jan 2022 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1642588159;
	bh=i7W6a1IPOdnCVmjmrwYtLjG7iQyAMgRXD3ReyBt+QKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0ukLnbAswOFr1NxPqmWNEFC2JflcWnFkuqEpTUSTLKEByjJiHJOieVTwtvD40xi8k
	 VHuZPjqhLzWpmvQRaqVvlQB0BqJBl2Z05EW7xSvpXcghub07B2tQHZTm0toFzOwn2U
	 p9ylcLM+GDbI2mR4cQaZf9KDV13M1qLV1ktKsBn4=
Date: Wed, 19 Jan 2022 11:29:16 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: David Binderman <dcb314@hotmail.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re:
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:275: dangling
 pointer ?
Message-ID: <Yefn/J0D33c9bDO+@kroah.com>
References: <HE1P189MB05719D490E35B19D832195139C589@HE1P189MB0571.EURP189.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HE1P189MB05719D490E35B19D832195139C589@HE1P189MB0571.EURP189.PROD.OUTLOOK.COM>

On Tue, Jan 18, 2022 at 09:53:48AM +0000, David Binderman wrote:
> Hello there,
> 
> Recent gcc development versions say:
> 
> drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:275:33: warning: storing the address of local variable ‘h’ in ‘*handle’ [-Wdangling-pointer=]
> 
> Source code is
> 
>       *handle = &h;
> 
> but h is a stack local variable, so exporting its address doesn't make any sense.

Great, can you send a patch to fix this up?

thanks,

greg k-h

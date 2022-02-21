Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69775EBB
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 17:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65B5C340E9;
	Mon, 21 Feb 2022 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645463378;
	bh=TM2fauSe66x2c2zoxsu+MQhxX1uzwMbubNNzf+2HVgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iXoIawLtNFRUBewCOxAho4n/lt1xdttpqD60+a8jPLH+iOTb3dsO14nQMtlKp6EmI
	 LYppBsg2Q/s8ZXo0uU2zNtjLMdoy3L7tECUvB7kE1CJ9owq4nIjFGk39NBYhdutpj3
	 jfFtQrl8OxnHUFc0ar0MpsvCHgSikQtTDqsJAEoc=
Date: Mon, 21 Feb 2022 18:09:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: rtl8192e: use BIT macro instead of left shifting
Message-ID: <YhPHT/9KWnUwVO1Y@kroah.com>
References: <20220218163212.7103e9e6@cpi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218163212.7103e9e6@cpi>

On Fri, Feb 18, 2022 at 04:32:12PM +0100, Moses Christopher Bollavarapu wrote:
> From eaca0dd8fcbe3ff6daf14ea7a532e53acf840790 Mon Sep 17 00:00:00 2001
> From: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
> Date: Fri, 18 Feb 2022 16:08:16 +0100
> Subject: [PATCH] drivers: staging: rtl8192e: use BIT macro instead of left shifting

These headers should not be part of the body of the email.

Please use tools like 'git send-email' to send a patch out, it will do
this correctly and not have this extra information in it.

thanks,

greg k-h

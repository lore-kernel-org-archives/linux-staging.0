Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43447E0
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 07:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C786C433C1;
	Fri,  9 Sep 2022 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662709692;
	bh=cembJTLzrsCcUN/TdAvvEAHow2IUj6Pixg3rsqu8vrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2LQaXzxBgKa0nuijX34MpyVVJeGBKhC7JtE6S9ENOUo7Rks/AoLMRwK7bUby2Q5nT
	 phHrAe6sbGDnVoqVc21iaxfLveldSx/DrwXlzv9ICEbct5xJdSnvjxPeJcMFaWOPa3
	 8mnH1wkJSK5pFVBJwjYljom+iO3GKU+ph0bfMRUE=
Date: Fri, 9 Sep 2022 09:48:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix potential memory leak in
 rtw_init_drv_sw()
Message-ID: <YxrvuoVF+IGfUikb@kroah.com>
References: <tencent_61623C1C5469E9DF0E448B5936B78E239C05@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_61623C1C5469E9DF0E448B5936B78E239C05@qq.com>

On Thu, Sep 08, 2022 at 03:31:25PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In rtw_init_drv_sw(), there are various init functions are called to 
> populate the padapter structure and some checks for their return value.
> However, except for the first one error path, the other five error paths 
> do not properly release the previous allocated resources, which leads to 

You have trailing whitespace on your text :(

> various memory leaks.
> 
> This patch fixes them and keeps the success and error separate. As there
> is no FooBar device to test with, no runtime testing was performed.

What do you mean by "FooBar"?  Please fix that up.

thanks,

greg k-h

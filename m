Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD86923A0
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 05:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC5DC385A9;
	Mon,  6 Jun 2022 05:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654494785;
	bh=dQNfnKYOLlIfCF+niI0syigSL7bjO0G2DVTxEbIA84A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGF3yFXR0ZaDwDTJIkeCNOQ3JkZguJj03r49JcZG3SnMQ2cH2ezKYkCBIkNok0a20
	 FDK/5ibDuSmvjTd3GwTHeg+AY6umshkZOgoGvER3rT6wn8R5lPOx2Cnqj4PjUQS7Y1
	 xchBbmL8vDGzFjjdtCKQDeiJql4un+J9hWQxAH0w=
Date: Mon, 6 Jun 2022 07:53:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] staging: r8188eu: Fix kernel-doc
Message-ID: <Yp2WPrOz85/70CZx@kroah.com>
References: <20220524083914.68736-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524083914.68736-1-jiapeng.chong@linux.alibaba.com>

On Tue, May 24, 2022 at 04:39:14PM +0800, Jiapeng Chong wrote:
> Fix the following W=1 kernel warnings:
> 
> drivers/staging/r8188eu/hal/rtl8188e_phycfg.c:291: warning: expecting
> prototype for Function(). Prototype was for rtl8188e_PHY_SetRFReg()
> instead.
> 
> drivers/staging/r8188eu/hal/rtl8188e_phycfg.c:257: warning: expecting
> prototype for Function(). Prototype was for rtl8188e_PHY_QueryRFReg()
> instead.

Please put build warning lines all on one line.

> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>

No, gcc reported this, not a robot, right?

You have read Documentation/process/researcher-guidelines.rst for how to
properly document patches that are created by research tools like this,
right?  Please fix this commit up to follow those requirements please.

thanks,

greg k-h

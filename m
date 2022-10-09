Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCDF5C84
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 18:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29BDC433D7;
	Sun,  9 Oct 2022 18:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665339717;
	bh=hMew0+7H3jKWGNHdcEwLappFPSB87+CL29n5rR8InKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSWJuXWjzkYh0Y2mPsWumIb6J0GlwjxGUXpSTwv9yzzGV/iVCneEH2H9v1LuP1Nmr
	 87rU4YJlGZmuV5OIgjQzQ2gVV036UbXsOpm0oMGvM6tyAPFDaK0Trd+vK8kJ0XUuGO
	 bJ3WyUNLqWxGfHiwrToZKvH6JEeTyWtGt0fAmkug=
Date: Sun, 9 Oct 2022 20:22:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiangshan Yi <13667453960@163.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jiangshan Yi <yijiangshan@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] staging: sm750fb: fix spelling typo in comment
Message-ID: <Y0MRcIyBtLlzjRzi@kroah.com>
References: <20221009094809.3171319-1-13667453960@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009094809.3171319-1-13667453960@163.com>

On Sun, Oct 09, 2022 at 05:48:09PM +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>

Again, why 163.com?

thanks,

greg k-h

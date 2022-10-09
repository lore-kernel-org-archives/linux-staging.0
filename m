Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61DF5C84
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 18:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB67C433D6;
	Sun,  9 Oct 2022 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665339683;
	bh=mjDDMByZ3oY5zipTJxN+1vFMvZKh37rqliInd680G2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPS5KSbw70/70tSmYw3+7n+kx40hm+6bn0cP7S3kblRYO6+3/D5bEwBhxpiPa2pZU
	 5bjLG5rbw5wFvkMBq137iqTDkGlBUBs1wG7mpkp0Rfa9iEqG4L9bTaoIR9/4COO/DW
	 0pljXQHR9ltZ+3URxGBLisZyRxoMk/4i0Xsotcog=
Date: Sun, 9 Oct 2022 20:22:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiangshan Yi <13667453960@163.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiangshan Yi <yijiangshan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] staging: rtl8192u: fix spelling typo in comment
Message-ID: <Y0MRTlpjuG3rJX9o@kroah.com>
References: <20221009085746.3149599-1-13667453960@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009085746.3149599-1-13667453960@163.com>

On Sun, Oct 09, 2022 at 04:57:46PM +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>

Again, why a 163.com address?

thanks,

greg k-h

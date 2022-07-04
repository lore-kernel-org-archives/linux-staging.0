Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B213FE0
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 13:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539A5C3411E;
	Mon,  4 Jul 2022 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656941331;
	bh=XIwtnQ6NKPC0BfotMk1G0wnhG2C7UeF+3OA9DWRZ//g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcT4komz/hxh0ygo8sCYDhSPVVT+eRWQ/66Fml13ZZRD+jR8ATYL53Xe9E4Y5tpY1
	 uUqmREr/LbnFrqaEb2ZHAuQin+nuCUur3GirmiUpaYuyYXzIoHO/TBQFKaFYOY+NfL
	 uVhllpZSmwdH2pvxKJaGdA1x4VUjdro8CUiZvUZ8=
Date: Mon, 4 Jul 2022 15:27:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	martin@kaiser.cx, straube.linux@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	xuqiang36@huawei.com
Subject: Re: [PATCH -next] staging: r8188eu: use 'is_zero_ether_addr' to
 identify an empty address
Message-ID: <YsLqpSGHoehauWjs@kroah.com>
References: <20220704123140.100128-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704123140.100128-1-zhangzekun11@huawei.com>

On Mon, Jul 04, 2022 at 12:31:40PM +0000, Zhang Zekun wrote:
> Use 'is_zero_ether_addr' to identify an empty ethernet address, intead
> of using 'memcpy' directly.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>

I am now just going to ignore all patch submissions with this line in it
based on a total lack of responses by the developers using it.  See
https://lore.kernel.org/r/Yr7DQJTPrSWTOa0c@kroah.com for why.

greg k-h

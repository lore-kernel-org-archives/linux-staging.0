Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7CD70
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 18:48:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: evelikov)
	with ESMTPSA id 1650F1F4215F
Date: Thu, 20 May 2021 19:43:22 +0100
From: Emil Velikov <emil.velikov@collabora.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: hantro: test the correct variable in probe()
Message-ID: <YKatymPzAtKxpSOY@arch-x1c3>
References: <YKaIKXOcDb0nXguP@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKaIKXOcDb0nXguP@mwanda>

Hi Dan,

Thank you for the patch.

On 2021/05/20, Dan Carpenter wrote:
> This should be testing "vpu->clocks[0].clk" instead of "vpu->clocks".
> 
> Fixes: eb4cacdfb998 ("media: hantro: add fallback handling for single irq/clk")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil

Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F63177
	for <linux-staging@lists.linux.dev>; Mon,  9 Aug 2021 15:20:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: evelikov)
	with ESMTPSA id 5C6D61F42D13
Date: Mon, 9 Aug 2021 16:20:19 +0100
From: Emil Velikov <emil.velikov@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: hantro: Fix check for single irq
Message-ID: <YRFHs7ppCxKJS+vH@arch-x1c3>
References: <20210805190416.332563-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805190416.332563-1-jernej.skrabec@gmail.com>

On 2021/08/05, Jernej Skrabec wrote:
> Some cores use only one interrupt and in such case interrupt name in DT
> is not needed. Driver supposedly accounted that, but due to the wrong
> field check it never worked. Fix that.
> 
> Fixes: 18d6c8b7b4c9 ("media: hantro: add fallback handling for single irq/clk")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

D'oh thanks for catching that. This commit is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil

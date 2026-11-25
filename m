Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604457;
	b=HvD9Mic5tHdlD+2gOObCdQjdqZLxBXqea9Eso2kZJX6XPhOpDXc9grIl6rMjv1xGDhix
	 N12//IUdICFQkSjJ87zHWAOQtH4wG4T8K2qQo8OX/0iWJLUxFZl0qquSKQdB803dY3766
	 75emJeimAD1Vvte0GxNYXDKHCm5lBcYgokgT+7YiD7qyZBG+ym2VS6deRkI1ZI9F1du+q
	 m92eO60R50JEZPrAgXYfDmhE1z8j25Lvk+D3F/WiugFLKSuzSmzBlkmaTtcE4KjgWygrE
	 fFCEZF21G3KPU0YEdOiMz1lVGVeVP6+yZkvz79AQuTYla+dRK8sYTBU0dPQi3jPYXZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604457;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cOvul7rfOwINZX5P3gOwhmNe0uJu9FzOUo8mqn4wMrw=;
	b=5B9zu1vl5lFLlbu1G1ede0DUUl41P0JTkEFXGJ7JjT6GLfKp5Qi8n86GCfG5Fu0YY91i
	 FMUgODPQBH/GZhCXJ1khlh6PWP2pRqEXQ7RP4kP/8Dms1gNBKiiE1MXp/VaEVoFwVXZ5r
	 MPCzG9pJcdZ3XT3+4cb85PTz+Kems2xvpgWU5+u4UXauira3HQG1kDB06mT9YmK+2KyMp
	 Fz67gTR6NvRkLBQhbuqhIxJOr0woT2LwKUmTzQgmwoHtVP8A8QXgJ6cuaNuxDt0X42n1X
	 lmLvZ45+3N7BcCWLLyHkhiwjIX9tlyMeiWICXcV3eZT3isBN1svy2oK1WdWgX9E0WIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WigwYX/L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0429E606A323;
	Wed, 25 Nov 2026 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WigwYX/L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4FE1F000D0;
	Wed, 25 Nov 2026 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604456;
	bh=cOvul7rfOwINZX5P3gOwhmNe0uJu9FzOUo8mqn4wMrw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=WigwYX/LwsIJEHrwkogDu1OCcu9Hig6P20JZlFjD0ZK3uS7bkBIqaNG1gjUuGNKOD
	 wyGZ9Qc6Gk7od1ehhNhM7oacWFMtcN1bbmoQXVHBF9uUF3rRt2VYD3SncUOVD9z/nk
	 5Z3VudGZHBnv+G4e5OVMNHSKpttty6j9mkvgAXzp2Fi7PlBc5Bq1qNJ02PHFCwRE3a
	 pAHukk28gMyL+EOq6YQ87GtJkrCDPONo87KiNf1NHhFVsYVIaXtkatOMiJpcb2q1fz
	 xUym6RYfojztM/bVFSdFbqRiAuuNyFvo4V1nCM+trkcOPJBXl57UPx1BWuEZbcmhro
	 ifsm5tIllykLg==
Message-ID: <479b6df1-3cd7-4609-b197-86bd937b1fdd@kernel.org>
Date: Wed, 25 Nov 2026 12:00:52 +0100
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v6 0/2] media: imx: staging cleanup and FIM export to
 v4l2-core
To: Jiaqi Shi <shijiaqi_develop@163.com>, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 gregkh@linuxfoundation.org, Frank.Li@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com
References: <20261122114205.494704-1-shijiaqi_develop@163.com>
Content-Language: en-US, nl
In-Reply-To: <20261122114205.494704-1-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/11/2026 12:42, Jiaqi Shi wrote:
> Changes in v6:
> - Apply the IC route format selection consistently to pixel-format,
>   frame-size, and frame-interval enumeration as well as TRY/S_FMT.
> - Keep the remaining STD and frame-interval legacy ioctls unchanged.
> 
> This series continues the i.MX staging media driver cleanup by removing
> legacy control inheritance and source-dependent format handling from
> capture video nodes, and exports the generic Frame Interval Monitor to
> v4l2-core while retaining the i.MX input capture controls locally.

I would keep the FIM in the driver itself. I didn't even know it existed
in the imx driver, and I am not convinced it is something we want in the core.

Frankly, it looks dubious in the imx driver as well. There doesn't appear to
be proper documentation of these control either.

I would be more inclined to remove it unless someone can explain the use-case
and if that use-case is real or hypothetical.

In any case, don't move it to the core.

Regards,

	Hans

> 
> The new FIM files are already covered by the existing MEDIA INPUT
> INFRASTRUCTURE entries for drivers/media/ and include/media/.
> 
> Validation:
> - allmodconfig build and sparse
> - scripts/kernel-doc -none on the FIM header and implementation
> - local FIM KUnit tests, not included in this series: 13/13 passed
> - local white-box i.MX capture format tests, not included: 21/21 passed
> - QEMU vivid: v4l2-compliance 125/125, 30-frame streaming passed
> - QEMU vim2m: v4l2-compliance 49/49, 10-frame streaming passed
> - i.MX register-level and hardware DMA paths remain untested
> 
> Jiaqi Shi (2):
>   media: imx: remove legacy video node control and format handling
>   media: v4l2-core: add frame interval monitor helper
> 
>  Documentation/admin-guide/media/imx.rst       |  20 +-
>  drivers/media/v4l2-core/Kconfig               |   4 +
>  drivers/media/v4l2-core/Makefile              |   1 +
>  drivers/media/v4l2-core/v4l2-fim.c            | 385 +++++++++++++++++
>  drivers/staging/media/imx/Kconfig             |   1 +
>  drivers/staging/media/imx/TODO                |  13 -
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  10 +-
>  drivers/staging/media/imx/imx-media-capture.c | 401 +++++++-----------
>  drivers/staging/media/imx/imx-media-csi.c     |  10 +-
>  .../staging/media/imx/imx-media-dev-common.c  | 113 +----
>  drivers/staging/media/imx/imx-media-fim.c     | 361 +++-------------
>  drivers/staging/media/imx/imx-media-utils.c   |   9 +-
>  drivers/staging/media/imx/imx-media.h         |  11 +-
>  include/media/v4l2-fim.h                      |  57 +++
>  14 files changed, 680 insertions(+), 716 deletions(-)
>  create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
>  delete mode 100644 drivers/staging/media/imx/TODO
>  create mode 100644 include/media/v4l2-fim.h
> 


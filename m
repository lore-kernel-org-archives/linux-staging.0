Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BE17738
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52932C433C8;
	Wed, 11 Oct 2023 08:44:45 +0000 (UTC)
Message-ID: <bd0ba3d3-444a-4288-910f-4b8a84b90750@xs4all.nl>
Date: Wed, 11 Oct 2023 10:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/54] media: videobuf2: Access vb2_queue bufs array
 through helper functions
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
 <20231003080704.43911-12-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231003080704.43911-12-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2023 10:06, Benjamin Gaignard wrote:
> This patch adds 2 helpers functions to add and remove vb2 buffers
> from a queue. With these 2 and vb2_get_buffer(), bufs field of
> struct vb2_queue becomes like a private member of the structure.
> 
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer so check the return value of all of them.

This needs to be extended: checking the returned pointer is a preparation
for when buffers can be deleted. As it is right now, checking for a
NULL pointer isn't needed.

I wonder if it isn't better to drop those checks and instead apply them
at the tail end of this series when the actual work on deleting buffers
starts (before patch 49, I think).

Regards,

	Hans

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++-----
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  51 ++++--
>  2 files changed, 146 insertions(+), 56 deletions(-)


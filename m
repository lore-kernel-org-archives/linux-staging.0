Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D238F1C2D
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 08:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6649AC433C8;
	Tue,  5 Sep 2023 08:43:03 +0000 (UTC)
Message-ID: <b756b302-41bc-4e5f-f788-bf61b7f2bae4@xs4all.nl>
Date: Tue, 5 Sep 2023 10:43:01 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 17/18] media: v4l2: Add DELETE_BUFS ioctl
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <20230901124414.48497-18-benjamin.gaignard@collabora.com>
 <814130d1-8597-d567-ddea-cb82cadea00f@xs4all.nl>
In-Reply-To: <814130d1-8597-d567-ddea-cb82cadea00f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2023 10:17, Hans Verkuil wrote:

> 
> You need much more extensive compliance checks for this, esp. mixing
> create_bufs and delete_bufs. And test it with the test-media test script.

This also means that you need to add patches adding delete_bufs support to
vivid, vim2m, vimc, vicodec, visl.

That allows test-media together with v4l2-compliance to do a good job of
regression testing this new ioctl.

Regards,

	Hans

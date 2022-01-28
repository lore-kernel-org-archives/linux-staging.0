Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2682D2C82
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 14:51:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: usama.anjum)
	with ESMTPSA id A3E141F460DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1643381483;
	bh=6wPdzXaH8f6GblGOZIXEb8xAztd6pZNs7b+ck+XJb6Y=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Pcq2GzngcDwmdv7f6o62VSZCrE4VV8uE6ax3TobmwwqsYX3yDyNcDwSfxKU5mjGKf
	 QfXhP6yrGJF1yEBoeZjoNjNJdvRi4ky3ZyMzPCpcFYeiJg4kTM5KI5AT+XQwBwEtTb
	 88tR5I73XIDB1C+jVWP+2X5s2qrQemZiPfhNCSKb1DhYoZYv5sCz/xogA4VOljLGR2
	 NfH1L8Y/zDFQLlYWnCzPpE3CCQ+zCptrFu0XoR7q/qbjKYA26cpbom1rMrqClM8xL7
	 XTZjO1dxANhGNl+heWpqjnNQf5sRz4ptLpvXsN+8aQ6hqd1ZHoIZESXpsnud5Jra72
	 2/mEvuyDIhLog==
Message-ID: <61220daf-ff1e-0c5d-b89e-9325625417ae@collabora.com>
Date: Fri, 28 Jan 2022 19:51:13 +0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: usama.anjum@collabora.com, Steve Longerbeam <slongerbeam@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Martin Kepplinger <martink@posteo.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx: imx8mq-mipi_csi2: Remove unneeded code
Content-Language: en-US
To: Marc Kleine-Budde <mkl@pengutronix.de>
References: <20220128133649.1393201-1-usama.anjum@collabora.com>
 <20220128135217.ncvjlffzpxxmqbjo@pengutronix.de>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20220128135217.ncvjlffzpxxmqbjo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/28/22 6:52 PM, Marc Kleine-Budde wrote:
> On 28.01.2022 18:36:49, Muhammad Usama Anjum wrote:
>> ret is constant in imx8mq_mipi_csi_pm_suspend(). This function cannot
>> return error. Remove the return variable. Simplify other functions which
>> are using this function.
>>
>> Fixes: f0c2ba1ed4ad ("media: imx: imx8mq-mipi_csi2: fix system resume")
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>>  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 16 ++++------------
>>  1 file changed, 4 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
>> index 3b9fa75efac6b..c992b845e63d1 100644
>> --- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
>> +++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
> [...]
>>  static int imx8mq_mipi_csi_pm_resume(struct device *dev)
>> @@ -742,15 +739,12 @@ static int __maybe_unused imx8mq_mipi_csi_suspend(struct device *dev)
>>  {
>>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>  	struct csi_state *state = mipi_sd_to_csi2_state(sd);
>> -	int ret;
>>  
>> -	ret = imx8mq_mipi_csi_pm_suspend(dev);
>> -	if (ret)
>> -		return ret;
>> +	imx8mq_mipi_csi_pm_suspend(dev);
>>  
>>  	state->state |= ST_SUSPENDED;
> 
> 
> what about this flag?
Now that no error is possible inside this function. The state is being
updated each time. This seems correct logically.

Thanks,
Usama

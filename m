Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE43171AE
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rUQXP4GW"
Received: from [192.168.1.110] (unknown [103.251.226.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D3A72B3
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 15:16:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697634962;
	bh=6JeTNNvwu1IWeOOfz3lMQWEA26IiYf3D8Fz3QJ2dT0c=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=rUQXP4GW/LRhenZp6JPtBb902RnwHR9tArWlSF4IYx8rg9S4TmXxoVUCHDgq+RI7e
	 6ASuliR5v3+mc5QEUMqPnkbLhVINZwMRz17y+R2YzTLVc8uiON7hBqrZdV7S7qCz9L
	 Z351+3PcKYJQmFn2llrK2DySaOMbCqzXpHYCZ83o=
Message-ID: <b0571752-1cef-dbc9-47d7-1d9b4ae2baed@ideasonboard.com>
Date: Wed, 18 Oct 2023 18:46:03 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: css: Write LINE_LENGTH_PCK correctly
To: linux-staging@lists.linux.dev
References: <20231018131325.1022113-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20231018131325.1022113-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 10/18/23 6:43 PM, Umang Jain wrote:
> According to MIPI CCS v1.1 specification, the LINE_LENGTH_PCK
> units is in VT pixel clocks (Section 8.2.6).
>
> To compute how many pixel clocks it takes, simply divide the
> VT pixel clock frequency by the number of pixels in a single line.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Wrong list, apologies!
> ---
> Testing:
>
> The patch is tested using IMX519 with CCS.
> This patch makes the frame buffer being filled to the fullest
> (instead of getting 1/3rd only previously) - without any workarounds.
> ---
>   drivers/media/i2c/ccs/ccs-core.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 16de66a37fad..12c75a843dfe 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -734,9 +734,11 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>   
>   		break;
>   	case V4L2_CID_HBLANK:
> -		rval = ccs_write(sensor, LINE_LENGTH_PCK,
> -				 sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
> -				 + ctrl->val);
> +		/* LINE_LENGTH_PCK units are in VT pixel clocks. */
> +		u16 line_length_pck =
> +			sensor->pll.vt_bk.pix_clk_freq_hz /
> +			(sensor->pixel_array->crop[CCS_PA_PAD_SRC].width + ctrl->val);
> +		rval = ccs_write(sensor, LINE_LENGTH_PCK, line_length_pck);
>   
>   		break;
>   	case V4L2_CID_TEST_PATTERN:


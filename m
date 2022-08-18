Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1DF2F22;
	Thu, 18 Aug 2022 20:39:56 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4BF276601B7A;
	Thu, 18 Aug 2022 21:39:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660855194;
	bh=Emk87kB1bYtzutO6QswP9IPNXnW89sucuVH09hsng5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z7Pw0o0gnWPWmZc6NGY0rwGVgWxEM8Ox/f0Qru6PEcbXfg/hpT4nECwSEvaHNKWcN
	 PCtD7bI01TG92ZmmgESKi8+aWT5bnRDIwQKiIaBJf7Vh+GrSJCyJ/YKma3nCKrqnss
	 JGWIYuupLKiRqrFb6IbpeF92NR364iucQjlajtAjTlli/e/gkJbUfqHH9oytV6HNQ0
	 T6MovmAhiaSuR4nhkiveLcQrfcyE1RazFKffiDoNbKZJtc+ePQLnEBnhxwkCsd5a5z
	 j7uwLfTmid70TJ2r/ayvb9JiKiNj7iuUsxg0nZ+PmeQ708Q2aCSNNgD35MvEjK+Jbi
	 AW/6meAPhrgmQ==
Message-ID: <2182ae07-4c0a-5937-7acc-3fad68d28baa@collabora.com>
Date: Thu, 18 Aug 2022 23:39:50 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 3/3] media: cedrus: Fix endless loop in
 cedrus_h265_skip_bits()
Content-Language: en-US
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: kernel@collabora.com, stable@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220818203308.439043-1-nicolas.dufresne@collabora.com>
 <20220818203308.439043-4-nicolas.dufresne@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220818203308.439043-4-nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/22 23:33, Nicolas Dufresne wrote:
> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> The busy status bit may never de-assert if number of programmed skip
> bits is incorrect, resulting in a kernel hang because the bit is polled
> endlessly in the code. Fix it by adding timeout for the bit-polling.
> This problem is reproducible by setting the data_bit_offset field of
> the HEVC slice params to a wrong value by userspace.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index f703c585d91c5..f0bc118021b0a 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -227,6 +227,7 @@ static void cedrus_h265_pred_weight_write(struct cedrus_dev *dev,
>  static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
>  {
>  	int count = 0;
> +	u32 reg;

This "reg" variable isn't needed anymore after switching to
cedrus_wait_for(). Sorry, I missed it :)

>  	while (count < num) {
>  		int tmp = min(num - count, 32);
> @@ -234,8 +235,9 @@ static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
>  		cedrus_write(dev, VE_DEC_H265_TRIGGER,
>  			     VE_DEC_H265_TRIGGER_FLUSH_BITS |
>  			     VE_DEC_H265_TRIGGER_TYPE_N_BITS(tmp));
> -		while (cedrus_read(dev, VE_DEC_H265_STATUS) & VE_DEC_H265_STATUS_VLD_BUSY)
> -			udelay(1);
> +
> +		if (cedrus_wait_for(dev, VE_DEC_H265_STATUS, VE_DEC_H265_STATUS_VLD_BUSY))
> +			dev_err_ratelimited(dev->dev, "timed out waiting to skip bits\n");
>  
>  		count += tmp;
>  	}


-- 
Best regards,
Dmitry

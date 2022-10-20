Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CB23D60
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 15:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA6DC433D7;
	Thu, 20 Oct 2022 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666279635;
	bh=yUb9kASzpdyGhOn55ZBT35rZSOA+C2xuJAammcJn0Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vrxw1yziM7jBZiuUc3jbtSWXr7FQNLACtlkU6aOWmNedZr/uyRFFFgb5br/9UIJ9y
	 oehVl2MCI/s2FrVnGsp0DWPJ8afN1qeIxX6H7nQdEcEPB4CXPBLlb7lXQQeh66dPuB
	 9hBgX+xh3grkfn93PJpqT2m487+5lbCRakD0s3i4=
Date: Thu, 20 Oct 2022 17:27:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kang Minchul <tegongkang@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: Use div64_ul instead of do_div
Message-ID: <Y1Fo0NmzspXRS92n@kroah.com>
References: <20221019053829.821918-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019053829.821918-1-tegongkang@gmail.com>

On Wed, Oct 19, 2022 at 02:38:29PM +0900, Kang Minchul wrote:
> Using div64_ul instead of do_div (64-by-32 division) is more
> recommended by coccicheck because this can avoid potential truncation.
> 
> So this commit changes do_div to div64_ul and
> remove coccicheck warnings.
> 
> Signed-off-by: Kang Minchul <tegongkang@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c          | 2 +-
>  drivers/staging/iio/frequency/ad9834.c          | 2 +-
>  drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 6f9eebd6c7ee..cd038480f63c 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -122,7 +122,7 @@ static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
>  {
>  	unsigned long long freqreg = (u64)fout *
>  				     (u64)((u64)1L << AD9832_FREQ_BITS);
> -	do_div(freqreg, mclk);
> +	freqreg = div64_ul(freqreg, mclk);

I think the original code here is correct, no need for a change, unless
you have the hardware to test this out and can verify it all still works
identically.

thanks,

greg k-h

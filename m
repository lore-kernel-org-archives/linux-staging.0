Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA0B2771E
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unHERqPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C699C43397;
	Thu,  5 Oct 2023 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696514639;
	bh=piLsE53Q1gZgSQFUl07BSGRXu3dJHS5CexWfLgjoioM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=unHERqPdEuFsnlwkj8m5qiTQxIrHwyFBS4Ylk8EvqN9DZvHS4F+PgVWWJRKs04qLZ
	 UjVvRObXsKf1C+0743hADeJSmBxP16oo6/prqwkUa5/B/g2/5ySPticvvoJbK7GcqV
	 M+4dx6jkCc5RZUJio1GnO1OPuS67YePnXZKRrA1TDVxlm0Ft6NAgRA+UTdQEOL7ueQ
	 RQzgSQEtCMQvVsa960b2UCCpCFrLYuvRs9u64LzUUSwrejrOgXU9HSEfPm+8RZ/D9k
	 Fwc+vjtTmBFauSo73drSeW5QhEYYlYo8fU/5QTZ0oQxYtDDKVBzCDqLdLNT+RdTh2V
	 jtv3yMjVoxJqg==
Date: Thu, 5 Oct 2023 15:04:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, Michael
 Hennerich <Michael.Hennerich@analog.com>, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] staging: iio: resolver: ad2s1210: fix return with lock
 held
Message-ID: <20231005150403.453851f3@jic23-huawei>
In-Reply-To: <20231004-staging-iio-resolver-ad2s1210-fix-return-with-lock-held-v1-1-812b932997bd@baylibre.com>
References: <20231004-staging-iio-resolver-ad2s1210-fix-return-with-lock-held-v1-1-812b932997bd@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Oct 2023 09:17:26 -0500
David Lechner <dlechner@baylibre.com> wrote:

> We missed a return statement in ad2s1210_initial() that would cause
> the lock to be held when returning an error.
> 
> This is fixed by replacing the return with a goto to release the lock
> before returning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202310030222.iokamE9T-lkp@intel.com/
> Fixes: 0d03d0e65846 ("staging: iio: resolver: ad2s1210: rework gpios")
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/staging/iio/resolver/ad2s1210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
> index 98afd2e9ea41..67d8af0dd7ae 100644
> --- a/drivers/staging/iio/resolver/ad2s1210.c
> +++ b/drivers/staging/iio/resolver/ad2s1210.c
> @@ -555,7 +555,7 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
>  	mutex_lock(&st->lock);
>  	ret = ad2s1210_set_resolution_gpios(st, st->resolution);
>  	if (ret < 0)
> -		return ret;
> +		goto error_ret;
Ah.  I squashed the same fix into the original patch as it wasn't yet on a non
rebasing tree.

Thanks

Jonathan

>  
>  	/* Use default config register value plus resolution from devicetree. */
>  	data = FIELD_PREP(AD2S1210_PHASE_LOCK_RANGE_44, 1);
> 
> ---
> base-commit: a533eeaef80e879b3ad1937eee7a43d1f9961c5d
> change-id: 20231004-staging-iio-resolver-ad2s1210-fix-return-with-lock-held-f547ce6fae49


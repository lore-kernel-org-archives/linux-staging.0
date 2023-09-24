Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F4D280;
	Sun, 24 Sep 2023 17:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1573DC433C7;
	Sun, 24 Sep 2023 17:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695575955;
	bh=eNYErXcCAerxNr/tunujy0UP4OcdGqejs1ZBEPEyDMY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e6jwZoEvg88nOG/6vAaDT1gHvto+qzkzJPTfXHSMtM09zOLSFQRdocyW6LKG29qdg
	 jRVjTDXtC2LCqDYBIZEWrsjedPtNJQalp3vYey2Ll+/6Osx/8ujT+zMBoLZKNbCe6Y
	 8fNXLxDX/5q/dXc3yM+TWNBXA5JRrqfjuF2wCZtYr0eIQlmNLFqyw/s07z1dGgYE7P
	 +s3RypvDfIlrSLxg6Vhip1LBaWYaXVK+KAAgPToV+kWHOOkKAEzRPw2Uz5xdrDbyLs
	 IYvR6IdXJVQEpQpD8jrk+avTcepHDH75yp++pOnwkZoS+N95UmYYDK38eDXwm1PLBB
	 QXbMFnNDiHmSg==
Date: Sun, 24 Sep 2023 18:19:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>
Subject: Re: [PATCH v2 04/19] staging: iio: resolver: ad2s1210: fix not
 restoring sample gpio in channel read
Message-ID: <20230924181906.16797c9b@jic23-huawei>
In-Reply-To: <20230921144400.62380-5-dlechner@baylibre.com>
References: <20230921144400.62380-1-dlechner@baylibre.com>
	<20230921144400.62380-5-dlechner@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 Sep 2023 09:43:45 -0500
David Lechner <dlechner@baylibre.com> wrote:

> In theory, this code path should not be reachable because of the
> previous switch statement. But just in case we should make sure we
> are restoring the SAMPLE gpio to its original state before returning
> in addition to releasing the mutex lock.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Applied to the togreg branch of iio.git and pushed out as testing
for all the normal reasons.

Thanks,

Jonathan

> ---
>  drivers/staging/iio/resolver/ad2s1210.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
> index 84743e31261a..0bdd5a30d45d 100644
> --- a/drivers/staging/iio/resolver/ad2s1210.c
> +++ b/drivers/staging/iio/resolver/ad2s1210.c
> @@ -510,8 +510,8 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
>  		ret = IIO_VAL_INT;
>  		break;
>  	default:
> -		mutex_unlock(&st->lock);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		break;
>  	}
>  
>  error_ret:


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0482C16400;
	Sat, 30 Sep 2023 15:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4092BC433C8;
	Sat, 30 Sep 2023 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696087105;
	bh=0N1E8fZbi3EOc7oE89IqS4UuU6uwG8LBAGm7h6axkfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O9+Vf1bFChwg1vq8lRPS3YcHI7T8ARQ7s3WYC3d9TICht54yv0jQhok3jDTxlPmXa
	 mWbaZl4s7gWyPN1cH5d9BQnpC6OvmbJsQeNyn+f7bbDA7yL+xb840ZCAo04aI8CF4l
	 VhGmffwBC4yr+1ZTkGztPX970ACgFmT4VAJEmTLtIsd+rJXn4oeoxb+WQM8QPj7TFu
	 LsKF5EdZv51rUkSJQ6ApQytlfT/0lFEodUSl+MvnIiLxfghvbqKKgMlcED7hwtd0Pt
	 GHQcvGOxpTYCDvlOAwQjbQnWbgXvY9a7YHIYBC15IilnYQJBzcCMjTVSqBGdEvLW0n
	 1dSSvwrO0oUsw==
Date: Sat, 30 Sep 2023 16:18:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, David Lechner <david@lechnology.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 19/27] staging: iio: resolver: ad2s1210: add phase
 lock range support
Message-ID: <20230930161823.7e78b2fc@jic23-huawei>
In-Reply-To: <20230929-ad2s1210-mainline-v3-19-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
	<20230929-ad2s1210-mainline-v3-19-fa4364281745@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 Sep 2023 12:23:24 -0500
David Lechner <dlechner@baylibre.com> wrote:

> From: David Lechner <david@lechnology.com>
> 
> From: David Lechner <dlechner@baylibre.com>
> 
> The AD2S1210 chip has a phase lock range feature that allows selecting
> the allowable phase difference between the excitation output and the
> sine and cosine inputs. This can be set to either 44 degrees (default)
> or 360 degrees.
> 
> This patch adds a new phase channel with a threshold event that can be
> used to configure the phase lock range. Actually emitting the event
> will be added in a subsequent patch.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
Looks good to me.


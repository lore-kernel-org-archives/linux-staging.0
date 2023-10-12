Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E7FC16
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fp2KOnFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2379FC433C7;
	Thu, 12 Oct 2023 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697097473;
	bh=YKBR3xSz6UA4cpabndWQc3mJoH82OaQw8/MCmfrz3sk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fp2KOnFzDs+K+eAXWK2HmxcXX1IErO5lkvnqDqOkbpdHsf7FbecYGleBVXTtphuQn
	 bxS6wdSqKZyYT5Fl08sk07lGZuCuhQjJ+Kc3YfF1L8BUE40AkMglO5dkD1NKTaiFj4
	 WH2f3QmmSYCv/P7CLPRxdERUySwb9dgIRIDkhPY25oFa+8kIyQEn9EDDZkmgge1suT
	 5UfN9MlViEVAcXgibLEVkMfGUaL9xDAxHyetYg/B0pMYLQFp0M3DunfFCgWyjLCHJt
	 yX6EByUDDrOMjqhlYMk8pE34fROt0LEb19dwK4Ka6wo+vq+XaiEfN2215tEBXSyg6p
	 XAeqUotK0sEgQ==
Date: Thu, 12 Oct 2023 08:58:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, Michael
 Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] staging: iio: resolver: ad2s1210: refactor
 sample toggle
Message-ID: <20231012085804.3890242e@jic23-huawei>
In-Reply-To: <20231010-ad2s1210-mainline-v5-1-35a0f6ffa04a@baylibre.com>
References: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
	<20231010-ad2s1210-mainline-v5-1-35a0f6ffa04a@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Oct 2023 16:12:33 -0500
David Lechner <dlechner@baylibre.com> wrote:

> This refactors the sample line toggle in the ad2s1210 resolver driver
> to a separate function. The sample has some timing requirements, so
> this ensures that it is always done the same way, both in the existing
> call sites and any future usage.
> 
> Previously, the sample line was kept on for the duration of the read,
> but this is not necessary. Data is latched in on the rising edge and
> after the specified delay the state of the sample line does not matter.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Applied.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A196E9CA5C;
	Sun, 24 Sep 2023 18:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5104C433C7;
	Sun, 24 Sep 2023 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695579041;
	bh=tYGxKVpxb7PZ2YIh2JBJHjxiM1XOyE8essbNsK2nP68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f2WS1Q4Xi3Sodin4WDSptsS62GVbZdwRevbbVH+XhFjLBEY9hyCt4a0CzWDfYFIq7
	 1bjclmrMnQPEdvDl7UdRRkVfj2HU8Sd0YhqaHtg21Cft/nBXxzIh8wMfe9bxSTT0oy
	 LALiG0kxaChjgrCxA3Ix65QPf3i5x7h+rVh6Wo/7WcvSmLLt3L1l1QgGpJ5+uZ9VZe
	 J9JcX+Z+2SH9VQQXraT2Q6HqXWDirP4kd9i/ujpXA6oKGi8WDYDvGOshy6PDYZ6E48
	 W1WCxoi3eL1GbNCMQphcbD7KuFQsEDg3m2dSNzqdjhX2lDPFSmkA5cfq/5fhf/ovBD
	 SV0GjfufZIdDA==
Date: Sun, 24 Sep 2023 19:10:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>
Subject: Re: [PATCH v2 17/19] staging: iio: resolver: ad2s1210: convert
 resolution to devicetree property
Message-ID: <20230924191032.48cc906b@jic23-huawei>
In-Reply-To: <20230921144400.62380-18-dlechner@baylibre.com>
References: <20230921144400.62380-1-dlechner@baylibre.com>
	<20230921144400.62380-18-dlechner@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 Sep 2023 09:43:58 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Selecting the resolution was implemented as the `bits` sysfs attribute.
> However, the selection of the resolution depends on how the hardware
> is wired and the specific application, so this is rather a job for
> devicetree to describe.
> 
> A new devicetree property `adi,resolution` to specify the resolution
> required for each chip is added and the `bits` sysfs attribute is
> removed.
> 
> Since the resolution is now supplied by a devicetree property, the
> resolution-gpios are now optional and we can allow for the case where
> the resolution pins on the AD2S1210 are hard-wired instead of requiring
> them to be connected to gpios.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Good change to see.  Note that mostly I've not commented on patches
where I fully agree with them.

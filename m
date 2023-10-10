Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947AE2744B
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X49pyZQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868EBC433C8;
	Tue, 10 Oct 2023 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696953421;
	bh=UwuZ32zC8AXiHmdbjhpI6SAE/Jw6t06ng7IB8mYYtyA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X49pyZQ64ZrT6prpmrF8Og4aeHanVydZ5d+Tk8P/CKok4xaPzB8WSFPS9quuVo1m9
	 vIXywCCl6bV1pvDPVueiNIzFu+xjjFdwL5tC8JR+uhGIBZlkYyU1bVRdawzTgCF104
	 pZRq2ZTSVvYbXuJZJuJBzIzcV7gBBFRPyjcUMp2lR5FyY+6plMmMRQTTJyW3u3UvGN
	 SsaAKPlgiN4uxboa9IJv81F4Idiw8J4VLiZsesf/vkMChKvN+r4vrzd4OIq2FibBYO
	 NL7Gb4FS2s1rsVQsm/CtqypOid03Y02F92D5e5/Y7XQcyMN9ruTOxHzTrVeNaVy0Hn
	 yqBNyY/ZjPwLw==
Date: Tue, 10 Oct 2023 16:57:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, Michael
 Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/17] staging: iio: resolver: ad2s1210: rename DOS
 reset min/max attrs
Message-ID: <20231010165712.5584d4c1@jic23-huawei>
In-Reply-To: <20231005-ad2s1210-mainline-v4-11-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
	<20231005-ad2s1210-mainline-v4-11-ec00746840fc@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Oct 2023 19:50:28 -0500
David Lechner <dlechner@baylibre.com> wrote:

> The AD2S1210 has a programmable threshold for the degradation of signal
> (DOS) mismatch fault. This fault is triggered when the difference in
> amplitude between the sine and cosine inputs exceeds the threshold.
> 
> The DOS reset min/max registers on the chip provide initial values
> for internal tracking of the min/max of the monitor signal after the
> fault register is cleared.
> 
> This patch converts the custom device DOS reset min/max threshold
> attributes custom event attributes on the monitor signal channel.
> 
> The attributes now use millivolts instead of the raw register value in
> accordance with the IIO ABI.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Applied.

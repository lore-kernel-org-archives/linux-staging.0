Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2532F9D5;
	Sat, 30 Sep 2023 14:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E997DC433C7;
	Sat, 30 Sep 2023 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696085629;
	bh=tyMvdkFgu4uwjiVffaBoF6mgoQPEA9rv5rt4B+ieM88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b8PQdgGGs4dDyYKw9iAHn7THfjMK9tmKD6o8xEDNB27JWivpyC8hU71YDyO9pYpqE
	 U3woK6qSKpubjBc6EHFo0xDdrTiGAqJuQJ5elTGBewIp+98L4gHDpWz9x6QA2bXTv5
	 PundRGYe6VKyyLBJQU85VJV16vvfnoRitKtrZh66cTJecrYPJenEVhaRSSYc5cqjZv
	 zqHnHjZMKPy2BqE8Unodsw6DTes7fx9qQZd6OYq0jpdSAw6PSXQSTxofhPzYKvQ4Mj
	 nhaKpRvF++ynmnfLDOw8+R/5yBN1AkQfx4fUnwFA3GBvS6M7GtiVKMh27tYRBWP4P6
	 scv5wemAOUmJg==
Date: Sat, 30 Sep 2023 15:53:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, David Lechner <david@lechnology.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/27] staging: iio: resolver: ad2s1210: remove
 config attribute
Message-ID: <20230930155348.5759fe79@jic23-huawei>
In-Reply-To: <20230929-ad2s1210-mainline-v3-12-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
	<20230929-ad2s1210-mainline-v3-12-fa4364281745@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 Sep 2023 12:23:17 -0500
David Lechner <dlechner@baylibre.com> wrote:

> From: David Lechner <david@lechnology.com>
> 
> From: David Lechner <dlechner@baylibre.com>
> 
> This removes the config register sysfs attribute.
> 
> Writing to the config register directly can be dangerous and userspace
> should not need to have to know the register layout. This register
> can still be accessed though debugfs if needed.
> 
> We can add new attributes to set specific flags in the config register
> in the future if needed (e.g. `enable_hysterisis` and
> `phase_lock_range`).
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Applied.


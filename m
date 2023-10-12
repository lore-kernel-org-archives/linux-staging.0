Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744614A83
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDttq06g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C45C433C8;
	Thu, 12 Oct 2023 08:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697097663;
	bh=4bm9Oe6eauMqGsfo8NuDGjzg2j6K20kXnmsJNdIG000=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tDttq06gKUul26yHhCrKsEKmy+r8THeGlb1ONLXVU0k6bFFZmn3cmxse/u9OQMJ8+
	 wo3btVKpeF/QoymLLqR2nTCMSE2lC0W7QyYdiCq6XGTTSr+ZiMYiaEz/6YEEkNnBWH
	 7OoOodgeSDSIdDM+hE07SNMJpbuVmExapHgaMvUOfidwlaPncV8wYfjVfNcdhqaDyF
	 O0pXHH3mHS+LgtPUTGfT099WPLqt2r++Y9XEOfK8mZOb89wyorT9ldNqNs6gLL7XrY
	 lEFCGX/6MDh3QqHwTZkVjbXlbQu6RbZEaHk+w8pElG6Rt1Yi0ErI8ZPhbJH95P7JTq
	 tedMrucX/TDOQ==
Date: Thu, 12 Oct 2023 09:01:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, Michael
 Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] staging: iio: resolver: ad2s1210: simplify code
 with guard(mutex)
Message-ID: <20231012090113.212342cf@jic23-huawei>
In-Reply-To: <20231010-ad2s1210-mainline-v5-3-35a0f6ffa04a@baylibre.com>
References: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
	<20231010-ad2s1210-mainline-v5-3-35a0f6ffa04a@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Oct 2023 16:12:35 -0500
David Lechner <dlechner@baylibre.com> wrote:

> We can simplify the code and get rid of most of the gotos by using
> guard(mutex) from cleanup.h.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Applied.

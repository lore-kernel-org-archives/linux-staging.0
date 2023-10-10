Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826F72747B
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwmdmFvX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73F8C433C8;
	Tue, 10 Oct 2023 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696954148;
	bh=VLi55CcTcM0KgnOau/gbeJ9eXnvitesGKRn8dvJeGqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XwmdmFvXDm/37DAyjeysBeCrNBRZCfyB8+XBizMzjP0in0Xgh5TlWu82JDOd0C/5x
	 HMnff1m5DCOO4QuRQVJrlYf6M7l6CzvioiHyI6Qz6zKkr+lOxhaA840P+oxQWS5/rW
	 Q6Zza84u3Nd/sOpBslWOfmtiIHSaDLSxbxlAG/TA71t1ug5R9TYCwwpwIuhRNd+0p8
	 7+nKPRfcXHsh23hBVG1H9pmMZRARbCJTb7Y/mFkODk+/Orgz+tADpIa89wOXM83IxM
	 7r5uZI3MwuF25AhtS9nVM7O0xCRd9mNOVPAf8WPDYyEqENFKf6tdD21kJjdT7HiMEt
	 jyzvIp/8FthtQ==
Date: Tue, 10 Oct 2023 17:09:18 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, Michael
 Hennerich <Michael.Hennerich@analog.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy
 <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/17] staging: iio: resolver: ad2s1210: remove fault
 attribute
Message-ID: <20231010170918.5f2d2595@jic23-huawei>
In-Reply-To: <20231005-ad2s1210-mainline-v4-16-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
	<20231005-ad2s1210-mainline-v4-16-ec00746840fc@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Oct 2023 19:50:33 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Faults have been converted to events and we are now polling the fault
> register each time we read a sample, so we no longer need the fault
> attribute.
> 
> This attribute was not suitable for promotion out of staging anyway
> since it was returning multiple values in a single attribute.
> 
> The fault clearing feature should not be needed unless we need to
> support the fault output pins on the chip which is not currently
> supported. So we can add this feature back in if we need it later.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Applied

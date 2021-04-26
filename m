Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B371
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 08:39:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C5EF60C3F;
	Mon, 26 Apr 2021 08:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619426346;
	bh=RumY+jyF6jcMyh9l5y9E6ie9Qtj7V7yjCUq7pi5xK5k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AftkwppSUuE75DLGajXEcIwYCJog20552wSgttppeDrE0qQZUbDiZQJf4YbIzML3M
	 FVI8Lzjb3tYx4/mlaUE1sqXjqIG8vUQme6Gp3/hk6Veucziw4aD/h2Bf22ASGabjHt
	 yNq51d6dTqM7puIoIi8ZXq32r8NC7yDCPlKF6cBfErp9UDLX3F5LN7xRsyl9PUy4Jx
	 eEVWC9hFnkmKcaL2UGodQ/jnT57bnS5Yw7mjoabQ+xcFyq4elGBt1Uukj9dQLk4EJ6
	 vSNPSWwa+G2AeYAp0gpw039cfCCXxo6b0+aA1N5H8YYPgioRKAYVwQlaTh1pr5eNKL
	 eqmfh8I3YahGQ==
Message-ID: <4ad9f719e90bc4c665f80470525592932a0c2c84.camel@kernel.org>
Subject: Re: [PATCH V2 09/11] staging: vchiq_core: drop vchiq_status from
 vchiq_set_service_option
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev
Date: Mon, 26 Apr 2021 10:39:03 +0200
In-Reply-To: <1619347863-16080-10-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
	 <1619347863-16080-10-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-04-25 at 12:51 +0200, Stefan Wahren wrote:
> Replace the custom set of return values with proper Linux error codes for
> vchiq_set_service_option(). Now we can use the result directly as return
> value for vchiq_ioctl().
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas


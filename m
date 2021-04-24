Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7EC71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:49:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EE7461360;
	Sat, 24 Apr 2021 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619257766;
	bh=2ToJ8c/tTFH85+QAUXTMxDc48OT9RsYGYi24l30wR6c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CX9CzoSPnaAJu6NOc/N+YgvRn32PCHqRYrfcWSUoOFFM32wWHptfH4QGJ5CyVat7K
	 KxyvVS2k6rXrsZSJAjtB2KTcOdD4Prk0Iq5c4y8oN2tNhz669aYwKVKiBJOBNoo7CD
	 +AHU/OejvQrKOGde6zYTu9skJiXlyNmCIeU1svuq1+mI0pNWQLek3ocPCTxpLj4Vw7
	 sjxhfYr8c+GD9XnwUG3razF8CDbuQCi5ude+paDK051QRhECHQYSrl2pj1iZb9aBCS
	 LMuXU4F1uqnYTetH2FgK9VodUcXRZQoZG3hDLgaGkdgqZw4YMnIpXEaGzew3IJOk7z
	 inknzQK3bylGA==
Message-ID: <0e9373094076c1a5f5686a20547b0ffeb32778f0.camel@kernel.org>
Subject: Re: [PATCH 01/10] staging: vchiq_arm: avoid crashing the kernel
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Sat, 24 Apr 2021 11:49:23 +0200
In-Reply-To: <1619122076-31785-2-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-2-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> Using BUG_ON in a non-essential driver isn't recommend. So better
> trigger a stacktrace and bailout.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas


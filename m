Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832FD71
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 09:35:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 253D6613C8;
	Fri, 23 Apr 2021 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619170500;
	bh=v2an+c5yU9mVNsRomUiBDdjje7msXvu8cDOc9h5yHp8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Rt2fd0STQLE4mq+Ht4Mgq7I2i0PXsuCfeEw5uLrkOAL5y9yWfc4vo5F4rPDpLjWuE
	 aYZM8cI/fZl1axavI4u/419jH8mVZOYn6jur9TUh8eCB8CyZjTM9YMjc1hc+0K3QUZ
	 LQ4rlcUxBgdqHdwPmc7OUKXSeuyvc0lVk1wGWiOBtZXRbPHP3oGKFssQD3SXGWpD3K
	 rHBNwI32Ufs5xYr6EZMiAUn+A0nMSV+VMO235+Xe0LrYmTdwfRo/pqGbjfyBdaAf41
	 VZXk8wlcWA6mV/19vd76GWMgqxW09t8xCP5mrdHy1JohIk01FCiAoWmwhqw0T9eClT
	 c1HHEQY7Kr1ag==
Message-ID: <72934220d4fe35fdb70911109758b15401f30169.camel@kernel.org>
Subject: Re: [PATCH 07/10] staging: vchiq_arm: drop enum vchiq_status from
 vchiq_*_internal
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 11:34:56 +0200
In-Reply-To: <1619122076-31785-8-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-8-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> Replace the custom set of return values with proper Linux error codes
> for the following functions:
> 
> vchiq_use_internal()
> vchiq_release_internal()
> vchiq_use_service_internal()
> vchiq_release_service_internal()
> 
> Now we can use the result directly as return value for vchiq_ioctl().
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas



Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1292771
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 10:02:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 921F061406;
	Fri, 23 Apr 2021 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619172127;
	bh=Mb3c/FPLpl/Iu1orR5aLdk3Twpo+Y1hdzbKJtXCZiVI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=n0Ijub3msKb77KVupnJIkWCQTElDFMTdrlPjCwWH0mVdob6spK98BOGd9kmfbQuCk
	 /12JZKwRaX3f+OYJIe5QqFxuY48zgd9aNKJGv0ZlXc8qm7XjSvS24lIhr72Em6HlkT
	 CoM/VsLIhMfzMRLK0qBZrYUwoVeACVkwL8Qzv2rS2fJZFv01cmre+10tCV4STci2xJ
	 +x9vQMP0Akfe2s9qzRCRw0PqtI2uGSGob2zqu9fLhY3cEZ465aIEr45fNb4oZQVnAs
	 U9ObP6Cbk8Clmo7RRzkG5jPvVEpYid7yKX4qk4gWJPEHWPfuTcJw5l64VegP2dzxjC
	 ng7MG6B2ofXcw==
Message-ID: <b62a9caf86e346799821b3bacee7ecd8a8f2ca0b.camel@kernel.org>
Subject: Re: [PATCH 09/10] staging: vchiq_core: drop vchiq_status from
 vchiq_initialise
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 12:02:04 +0200
In-Reply-To: <1619122076-31785-10-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-10-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> Replace the custom set of return values with proper Linux error codes for
> vchiq_initialise().
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas


Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081E171
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 08:37:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D90A60233;
	Mon, 26 Apr 2021 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619426277;
	bh=Qh0FhfkXVxkyrs3Ip+TOgTdIKgjNYUP5XhYx+6BRk9Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=h7NuUDHEQQ7uZo8kBHOS9URBlQHGk0PVsl5n921kT+SNftQxrTd07U41oL7kotLl5
	 znq26dkj8Q3k1C22GLYUUDH8eVeTBkrj1HxIQV159YwsY/srwbXS+flnU+i2CAYh9C
	 3aoZV7+4d+MfKSJG3eTT88PVhD8X48UZUA8lVwzrF47owhKTVHqrG1GWUyApGtLkg1
	 4pi5FvgkQ2G8s+vkvzRyseGKbWpOojoESAM+T+UQJIyHNQbO2JtBMoGrwgSHJb2Sym
	 cb+N6JDrgm8LOhwyCaVrK2FeYA5X/eqB78dgSGQvTl244rvP5bJ/4kbQnqHa3jkb0o
	 u6tFmeL7G5UeQ==
Message-ID: <caecb87370916e7dbfcb6a3e322298c3c646c3c9.camel@kernel.org>
Subject: Re: [PATCH V2 03/11] staging: vchiq_core: return early in
 do_abort_bulks
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev
Date: Mon, 26 Apr 2021 10:37:53 +0200
In-Reply-To: <1619347863-16080-4-git-send-email-stefan.wahren@i2se.com>
References: <1619347863-16080-1-git-send-email-stefan.wahren@i2se.com>
	 <1619347863-16080-4-git-send-email-stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2021-04-25 at 12:50 +0200, Stefan Wahren wrote:
> Avoid the multiline statement for notify_bulks by return early in
> error case.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas


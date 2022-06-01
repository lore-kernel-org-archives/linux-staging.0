Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C67E
	for <linux-staging@lists.linux.dev>; Wed,  1 Jun 2022 09:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70232C385A5;
	Wed,  1 Jun 2022 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654076105;
	bh=fh9C+l4WXBO/9+rE1BEUsHimABjoUujQsVhJBdNO+yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvJHGvyEUldjq7/zjX7flnErdq6uqeZpbbK71xMky5wuaHksRp13sOjboRUg7RTpE
	 ozv0kPi5VAU95TJvZkS6DyKdo7Iudee9Gnv6jw3mmxqQrYsM4Mg/at2k6u71PxqXS0
	 84oYA6YB8oyrYvnM+kbVPzgIorO4UJGwV5RpOsio=
Date: Wed, 1 Jun 2022 11:34:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: keliu <liuke94@huawei.com>
Cc: TheSven73@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fieldbus: Directly use ida_alloc()/free()
Message-ID: <Ypcyv2YahZ+lS40D@kroah.com>
References: <20220527062938.2356319-1-liuke94@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220527062938.2356319-1-liuke94@huawei.com>

On Fri, May 27, 2022 at 06:29:38AM +0000, keliu wrote:
> Use ida_alloc()/ida_free() instead of deprecated
> ida_simple_get()/ida_simple_remove() .
> 
> Signed-off-by: keliu <liuke94@huawei.com>
> ---
>  drivers/staging/fieldbus/anybuss/arcx-anybus.c | 6 +++---
>  drivers/staging/fieldbus/dev_core.c            | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

As my bot said, you need to properly document and fix up your author
name on all of these patches.  I'll drop them all from my patch queue,
please fix up and actually test-build your changes before sending them
out again.

thanks,

greg k-h

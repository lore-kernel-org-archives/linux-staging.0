Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08DCEBE
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uAf4KdNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51D3C433C7;
	Tue, 17 Oct 2023 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697549708;
	bh=k+yqzl+5L7PWirICJ9XzjUlpyk8LvIvWdjeOdYVdKSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAf4KdNv0qw7PCwM8H8/EQgsDZQXeqpHZeYLUImzFIfGjfxQAS+Y2F6/kxdmNdOQv
	 GXLkNA6/n6ISlhu0v5pYKxiNDvif1DQ/uw9TX+z3YBXNyk7CWk25q2JvD1GBCAOaRk
	 0hzjITR53t8PQ8gD86WMqfrQfI7xfF9Lv8TQrG6s=
Date: Tue, 17 Oct 2023 15:35:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] staging: rtl8192u: remove entry from Makefile
Message-ID: <2023101757-defy-spiny-4faa@gregkh>
References: <2023101709-amuck-upward-46f1@gregkh>
 <51fcd05c-cb8e-420f-be62-0c9ade82fbfb@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51fcd05c-cb8e-420f-be62-0c9ade82fbfb@leemhuis.info>

On Tue, Oct 17, 2023 at 12:35:57PM +0200, Thorsten Leemhuis wrote:
> On 17.10.23 10:13, Greg Kroah-Hartman wrote:
> > In commit 697455ce4110 ("staging: rtl8192u: Remove broken driver"), the
> > driver was removed, along with the Kconfig entry, but the Makefile line
> > in drivers/staging/Makefile was not updated, so things like 'make clean'
> > fail to work properly as they will decend into all subdirectories to try
> > to clean things up.
> > 
> > Resolve this by removing the entry in the main staging Makefile.
> > 
> > Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> > Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Fixes: 697455ce4110 ("staging: rtl8192u: Remove broken driver")
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Thx Greg, that fixed things for my case. In case anyone cares:

I care, thanks!

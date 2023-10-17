Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5091A581;
	Tue, 17 Oct 2023 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AV0UvdJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED4EC433C7;
	Tue, 17 Oct 2023 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697528103;
	bh=uFcJLd6HAdVliYI8o7pEF7cyGfZ+4ll1EYpzGw8A6s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AV0UvdJHc8R/P8WUH8SZztzDgI6WSYhJUxuEjlWRV+benN2o6GGhuy5GXDDMQ8S/p
	 eMYbfX01rSTa3CM2utRcaoJw2uu9Ldnx0WueGLQm/S/gsb42IOvf2lC1xYzMO4Dm9L
	 UfudN0EhAWzVhxpFq9/xqjLXKFUhXe6RQO7L6l/0=
Date: Tue, 17 Oct 2023 09:17:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Deepak R Varma <drv@mailo.com>, Simon Horman <horms@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: coding style corrections
Message-ID: <2023101723-molar-defective-7193@gregkh>
References: <ZS4ysMWnjvWmnPvI@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS4ysMWnjvWmnPvI@lab-ubuntu>

On Tue, Oct 17, 2023 at 10:07:28AM +0300, Calvince Otieno wrote:
> This patch brings the codebase in compliance with the Linux kernel coding
> style guidelines, as outlined in the document at
> https://www.kernel.org/doc/html/latest/process/coding-style.html.
> 
> Changes Made:
> - Adjusted line lengths to a maximum of 80 characters
> 
> The guide states that the preferred limit on the length of a single
> line is 80 columns. Statements longer than 80 columns should be broken
> into sensible chunks, unless exceeding 80 columns significantly increases
> readability and does not hide information.

100 columns is ok to use now, so this patch should not be needed.

sorry,

greg k-h

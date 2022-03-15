Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611D23A0
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 14:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58595C340ED;
	Tue, 15 Mar 2022 14:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647353868;
	bh=3H3AfSuzjw8pYm8fCGgzUqWeRwhM4iueTYBYoa7skz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z6aUgf5LLpP8KyJQw9dN13bziiiNz8XhKd4RnKNr/naJZREyQIrZnJBbV1fniRVTp
	 NfjIoQaJkBafyqk3D9l5Y2drlX8GShXhAnH5bH2JwyTOGtG6ikU0eDQ40JgbStnNW8
	 +q0uPaLns6c0wgKiLQMOFlyCHCeMWYcugmBBuVO8=
Date: Tue, 15 Mar 2022 15:17:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: vt6656: Removed unused variable
 vt3342_vnt_threshold
Message-ID: <YjCgCEH4etP/6Ele@kroah.com>
References: <cover.1647284830.git.philipp.g.hortmann@gmail.com>
 <6e1ef287e66039f9013435f8fa1266de7387df2e.1647284830.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e1ef287e66039f9013435f8fa1266de7387df2e.1647284830.git.philipp.g.hortmann@gmail.com>

On Mon, Mar 14, 2022 at 08:31:11PM +0100, Philipp Hortmann wrote:
> Missing part of staging: vt6656: Remove unused rf_type in baseband.c
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Nit, the Reported-by: goes next to the signed-off-by: line.

I've fixed this up in my tree.

thanks,

greg k-h

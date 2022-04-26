Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA0625
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 09:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA17C385A0;
	Tue, 26 Apr 2022 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650965483;
	bh=trwF575pYSLNdADLXboEnkiFT7sbPelL37v2hFvpbzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5QQluvliT4xXWHkl4HwQKbaHVwIHco1MakflFU6x+4jNj9VjicqIx6vWpaCTg1Cl
	 PuGKGfXFRhGaoLccBOJia/W+0zDcs+feKYFvuCRX2iGVY2PSoe9yeb3F1hNM9BDmYj
	 JxXTf/LN6aAxJc/Pi9fKZ7V0lnqsYGADy0eX5P4o=
Date: Tue, 26 Apr 2022 11:31:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: vt6655: Replace two VNSvInPortD with
 ioread64_lo_hi
Message-ID: <Yme76Pxt0y0GxFEx@kroah.com>
References: <cover.1650784817.git.philipp.g.hortmann@gmail.com>
 <db5ba681cea27de815b172f8b93a8fd1efa30e99.1650784817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db5ba681cea27de815b172f8b93a8fd1efa30e99.1650784817.git.philipp.g.hortmann@gmail.com>

On Sun, Apr 24, 2022 at 09:44:22AM +0200, Philipp Hortmann wrote:
> Replace two macros VNSvInPortD (32 Bit reads) with one ioread64_lo_hi.

I would stick to the 2 reads just to ensure that it works properly.

thanks,

greg k-h

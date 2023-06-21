Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249A0C2F0
	for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 10:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1B1C433C8;
	Wed, 21 Jun 2023 10:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687344676;
	bh=ruepZViEyvLdgTSowTD3U1gw1j3qplIAbB79+lD5rkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KL3/NR7Jc6MI+J2NkKoJtlgGiREm0c2CGLgfg1SWhEiJVhx9Z9FGYmg/Jt//0Bqr7
	 85WZq75h1oEdvWFu3X+3/Z4ivf+U+wj50VymF418QjzUXfYwfJymvYZN3XaEDr5te0
	 f2wnaAieERcrBJ26BCmThvG0/ie424GWQddGrVwE=
Date: Wed, 21 Jun 2023 12:51:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: emma christy <emma.t.christy@gmail.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Subject: [PATCH] media: rkvdec: removed redundant blank
 line
Message-ID: <2023062136-drench-pasty-79a2@gregkh>
References: <20230621092223.10805-1-emma.t.christy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621092223.10805-1-emma.t.christy@gmail.com>

On Wed, Jun 21, 2023 at 12:22:23PM +0300, emma christy wrote:
> Adhere to Linux kernel coding style. Removed redundant blank line.
> Issue found by checkpatch.
> 
> Signed-off-by: emma christy <emma.t.christy@gmail.com>

You might need to write this as "Emma Christy", right?

Also, your "Subject" line has an additional [PATCH] and "Subject:" in it
somehow.

thanks,

greg k-h

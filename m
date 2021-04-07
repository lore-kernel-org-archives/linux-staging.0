Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EBC6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 07:08:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D664761139;
	Wed,  7 Apr 2021 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617779290;
	bh=NOnIAQXxZdATMpeyeL3MkgK4crH6oPRZFwvYMzaBbp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d//JSus7wZCfjTdulYxBIbwX0jSyh5hdO0vs0SVrXiGAwALiEjiXT9bNxLv3lbNle
	 SYre9E3MkaTPZ1Vc2/OrrUcvImHA0olPCtq77syy0C+CFSIS4wXxGYz73ZcuAF7bDh
	 lJ6+4QvQBDPILbtcvrqByoC18Mma1Xv3XtLDSQSI=
Date: Wed, 7 Apr 2021 09:08:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavle Rohalj <pavle.rohalj@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/49] *** SUBJECT HERE ***
Message-ID: <YG1aVx3UuXR2JrC+@kroah.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

On Tue, Apr 06, 2021 at 11:35:54PM -0700, Pavle Rohalj wrote:
> Changes in v2:
>     - Removed type information from variable names
>     - Broken up the changes into smaller patches

Your subject is very odd :(

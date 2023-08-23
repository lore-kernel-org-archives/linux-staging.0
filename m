Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218BC20EE0
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 06:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24840C433C7;
	Wed, 23 Aug 2023 06:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692773368;
	bh=TCyII1sw1DT4Dy8tv/bVcCUwpjPGev1c+kC0FfES710=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hm+Qq3XxNzkxghSp+nHCOaaFpX0biVs/K+hTNFF532cltV0IkQ+nh5HcgthHhwq7p
	 dOhuCCDVxcvW+yRNTH+XW2pw/z4hOPC9zDMPqk5N2732+++upwI7Bl5FQdZoT/UlQh
	 TAkZMCPfrzV8M/AGeCWx9I2yFZ8t4Yf1O9V7Nizk=
Date: Wed, 23 Aug 2023 08:49:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix check unbalaced braces and
 misspellings
Message-ID: <2023082303-balmy-bucktooth-f85b@gregkh>
References: <ZOVjfKUWsSAkbpZG@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOVjfKUWsSAkbpZG@alolivei-thinkpadt480s.gru.csb>

On Tue, Aug 22, 2023 at 10:40:12PM -0300, Alexon Oliveira wrote:
> Fixed all CHECK: Unbalanced braces around else statement,
> CHECK: braces {} should be used on all arms of this statement,
> and CHECK: 'specificed' may be misspelled - perhaps 'specified'?
> as reported by checkpatch to adhere to the Linux kernel
> coding-style guidelines.

That's two different things, so that means it should be two different
patches.  Please send a patch series for this.

thanks,

greg k-h

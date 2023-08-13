Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFED15BF
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10819C433C8;
	Sun, 13 Aug 2023 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691908084;
	bh=wPNWARJsQstSHuyNFm0qqrPTyQDoewNiu7kynxu5s0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzNz5vlyXSXMI2bVnPtoxoCDHE8GZufrjdBAuvbJMG4K/PETKJYqnwyweYOFZCfOi
	 jjQ/DfaXn+wIhqdx6x7IHqIRGeSrXVNE7D3UlboKZ0ng7qnV9fHL00FK65EsOfxEWr
	 pkVK3rjeKJWE5ayhfXJDXfvsk7gHBQXLahrDBkCs=
Date: Sun, 13 Aug 2023 08:28:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cyrus Ramavarapu <cyrus.ramavarapu@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Remove unnecessary parentheses
Message-ID: <2023081302-ripping-yo-yo-2b44@gregkh>
References: <20230813005326.98905-1-cyrus.ramavarapu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230813005326.98905-1-cyrus.ramavarapu@gmail.com>

On Sat, Aug 12, 2023 at 08:53:26PM -0400, Cyrus Ramavarapu wrote:
> Remove unnecessary parentheses found by checkpatch.

Please no, don't do this, see the email archives of this list for why I
don't like this type of change (it forces you do have to remember rules
when looking at the code in the future.)

I wish checkpatch would not report this type of issue anymore...

thanks,

greg k-h

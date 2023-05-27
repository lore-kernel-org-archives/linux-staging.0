Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B688D7E
	for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 07:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B004C4339E;
	Sat, 27 May 2023 07:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685173231;
	bh=glPRlksMtJ2Hb+GrjIgQbPVF8Ow+3Sn8rwCAHRqXvL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xgXmcE37h0KC1uf7uXe8n6yJw/tPoUIKIAbaQ1Qw0etyEBNDJYiTPo3XlMm2YUJCm
	 O8XAuOhglujsN0sTZguQ4Rv6gBsTq5IqAvxnVkiaxRSW74TraL2R/a90rZEQVBKpEe
	 ZMc4REx5EyRYoZQjVei7kJ4fvh9ihSrS3R/2Yrts=
Date: Sat, 27 May 2023 08:40:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] Staging: rts5208: rtsx: Moved else statement to same
 line with else if
Message-ID: <2023052759-extrovert-resize-252d@gregkh>
References: <20230519101920.27342-1-kartikey406@gmail.com>
 <20230519101920.27342-2-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519101920.27342-2-kartikey406@gmail.com>

On Fri, May 19, 2023 at 03:49:20PM +0530, Deepanshu Kartikey wrote:
> Moved else statement to same line with else if,
> this warning was given by checkpatch.pl
> 
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> 
> ---
> Changes in V2:
>             - Moved else to the same line with else if
>             - Moved comment on else statement to inside of it

I have 2 v2 patches in my mailbox, which are different, so obviously one
of them is lying.  Please fix up and send a v4.

thanks,

greg k-h

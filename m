Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB470
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 17:15:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C9F661C4F;
	Wed,  2 Jun 2021 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1622654121;
	bh=4LVBqjtQ1eHxqS5JPGdYeDDj29z+8wybNP6Elx/FQ1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAX4TsVFt8GKpIE6XH93GvkIDXLGaasn+ZgsCMTX6qFcWW4Jza6roM0JnFxpZ2XRX
	 5M7IKmokxV+Yq2Z/wxB3l/4vTUSgVF2TI6FgjnrDa6rqyfDO1a/wn7UVVhK9h0O6F/
	 /1oZUtUuvYVjlTAQvNOZo4qkgnRkWN+kYJS/Pwe8=
Date: Wed, 2 Jun 2021 19:15:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manikishan Ghantasala <manikishanghantasala@gmail.com>
Cc: Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: fix coding-style issues in r8192U_hw.h
Message-ID: <YLe8psfQLCb5bn2W@kroah.com>
References: <20210602160333.62163-1-manikishanghantasala@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602160333.62163-1-manikishanghantasala@gmail.com>

On Wed, Jun 02, 2021 at 09:33:31PM +0530, Manikishan Ghantasala wrote:
> staging: rtl8192u: r8192U_hw.h: Clear the coding-style issue

Why is this line here?

> 
> "Macros with complex values should be enclosed in parentheses"
> by enclosing values in parantheses.

I can not understand this sentence, can you please reword it?

> Modified spacing around "|" and removed a space before tab.

This is not related to the first thing, please break this up into
multiple patches like the bot asked...

thanks,

greg k-h

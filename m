Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11770
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 13:04:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE58961159;
	Fri,  2 Apr 2021 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617368654;
	bh=HZ8xfPLTJiNl6wXC0P88v7/DGSQ6zJC/HC+Ox0RWaGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y950T7n22AYw+gQH7I9/x8+MZ34nw7i8ZFzfwiO98OqBtDhkHkJ+bOFzH2L7rmEeq
	 sb3R6Zq9iSaIHjykCHYYRblRbu/aTD43QlM5W9RzvQNnZbhhz0WAgdkixr7b7LEXYB
	 zOPE7l1F9032K70a2KxUhMiqcHHgmLMhhpODQK3U=
Date: Fri, 2 Apr 2021 15:04:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ivan Safonov <insafonov@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Michael Straube <straube.linux@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peilin Ye <yepeilin.cs@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging:r8188eu: remove dummy handlers from
 OnAction()
Message-ID: <YGcWTOUl8OtAHTT4@kroah.com>
References: <20210328163323.53163-1-insafonov@gmail.com>
 <20210328163323.53163-2-insafonov@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328163323.53163-2-insafonov@gmail.com>

On Sun, Mar 28, 2021 at 07:33:25PM +0300, Ivan Safonov wrote:
> on_action_spct() do nothing, because rtw_get_stainfo() has no side
> effects. Other action handlers are trivial.
> 
> Signed-off-by: Ivan Safonov <insafonov@gmail.com>

Same here, wrong driver name :(

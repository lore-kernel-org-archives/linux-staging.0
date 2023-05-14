Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033E31C08
	for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 06:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE55C433EF;
	Sun, 14 May 2023 06:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1684045985;
	bh=0H0QpCOFgRPnk7q/AXlWAjR4u5GPYVQ66kT7i58zt40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjVInvHCA+JpE73QxJ9TzWz+qWT+j8Vae1JnT3aSA8enN3vY7Qv7ItS9vXRc+bS+O
	 EvziSoqX4x+4v45N39yA2AYuNrWN7dWWCSMluyCBskbqFS6E+4EojF239uMDbdjenW
	 jQ6bzd7aRGIXFd5z2VUUp+zNAZ575hBauOdW/H2k=
Date: Sun, 14 May 2023 06:40:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rts5208 :rtsx : fixed  a brace coding style
 issue
Message-ID: <2023051433-skies-hastily-71a1@gregkh>
References: <20230514030940.4820-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230514030940.4820-1-kartikey406@gmail.com>

On Sun, May 14, 2023 at 08:39:40AM +0530, Deepanshu Kartikey wrote:
> Fixed  a coding style issue

And you added another one when doing so :(

Please be specific about what you are fixing, and look at your use of
spaces in the subject and in the changelog text to verify it all makes
sense.

Please fix up and submit a new version of this change.

thanks,

greg k-h

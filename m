Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA247B
	for <linux-staging@lists.linux.dev>; Sun, 13 Nov 2022 06:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8FAC433C1;
	Sun, 13 Nov 2022 06:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668321240;
	bh=hzl62ZDmVbJ9+az2Dx/Rrye4SlLQXn5fe4FKPuII4B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCVkSdlRWBGYkQarFJSz2VtSYO4wP3johKo4djqoXVsV7VWmst9XwEjLbq6zATbLk
	 9NpHF9kcD5TQeBPbNrKQKhhdTHs8mS6zKJgt+lIIDJYZ6VaRVLfLzc9mgCMyxfJHQa
	 5ETKGrY3eTZJ4uVr+zmfTG5kodj1x1FqFouuciMduxZRHF/IcONG+PC7ZBHBiJUkfs
	 yF+ItYiD47gPq8IXPxNLDOhnm6nvpWlPMnWjdmcjLNiGPKtt9PJb572iJsHABQIB0F
	 5leQhF9FNAw3J0YR5ndn6NoE2WhtVZqq8Dd9yGvfF5p7lfVRqNc8xYCKwdKSGvMo39
	 KySxbYd6MiBGQ==
Date: Sun, 13 Nov 2022 00:33:43 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Deepak R Varma <drv@mailo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: staging/wlan-ng query: convert to flexible array member
Message-ID: <Y3CPx0IFf1la7Zy0@work>
References: <Y2px+zOGjkpGh6qC@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2px+zOGjkpGh6qC@qemulion>

On Tue, Nov 08, 2022 at 08:42:59PM +0530, Deepak R Varma wrote:
> 
> Can you please suggest how should I approach correcting the zero element flex
> array implementation here? Can these structs be removed if they are unused?

You can try using DECLARE_FLEX_ARRAY(). See this[1] patch.

--
Gustavo

[1] https://git.kernel.org/linus/6e4a53ee7989c8a2b9fc3b14cd90f6e2d613ca76

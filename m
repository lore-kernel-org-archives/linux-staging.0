Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019ED2563
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 17:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422F8C3411E;
	Thu,  7 Jul 2022 17:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657216403;
	bh=WFHud34Fu15V1qg6NP5QKzYr44hQraLgeUB+VU3GBO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyM0uJt0VKndoK5Hlj1hhDDQxeYGRK67KQS4rKrM4qIqs5p4Wg1kc2BJ1fBCl5U01
	 tm7pfkZty/VkQ0B3ZIqR0mFeSp4gpHf5mf5gSZ0wARUX87wXbg8J2fHOOzh9NR0mxc
	 wbEmavR0wcV1kwhrzF8TYaX8lR5BcKO+jn6bIsKM=
Date: Thu, 7 Jul 2022 19:53:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karthik Alapati <mail@karthek.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: don't use index pointer after iter
Message-ID: <YscdkA8h0hv0GaS2@kroah.com>
References: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>

On Thu, Jul 07, 2022 at 03:59:54PM +0530, Karthik Alapati wrote:
> There are some usages of index pointer of list(w) which may not point to
> the right entry when the required entry is not found and the list traversal
> completes with index pointer pointing to the last entry. So, use w_found
> flag to track the case where the entry is found.
> 
> Currently, When the condition (w->dapm != dapm) is true the loop continues
> and when it is not then it compares the name strings and breaks out of the
> loop if they match with w pointing to the right entry and it also breaks
> out of loop if they didn't match by additionally setting w to NULL. But
> what if the condition (w->dapm != dapm) is never false and the list
> traversal completes with w pointing to last entry then usage of it after
> the iter may not be correct. And there is no way to know whether the entry
> is found. So, if we introduce w_found to track when the entry is found
> then we can account for the case where the entry is not actually found and
> the list traversal completes.
> 
> Fixes coccinelle error:
> drivers/staging/greybus/audio_helper.c:135:7-8: ERROR:
> invalid reference to the index variable of the iterator on line 127
> 
> Signed-off-by: Karthik Alapati <mail@karthek.com>

Also, always at the very least, test-build your patches to ensure that
they pass that step.  This patch fails to build :(

greg k-h

Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AAB70
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 10:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06A4661102;
	Thu,  5 Aug 2021 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628161051;
	bh=5YItBmORmqphWcywSRK6VChbqHUwt7vQFPJnhLyl8Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5yzwbx+98vYtasf88y60sQWHM2ZDNiNNIavxsI3WFkorHqLMy5BpF6paPcbMx/Me
	 QfXSzAdfzwu2usYGyjDR8eCUI1vgjwjn4SdWu5mcsvpb6hU6Q7308kqYIOsokeFdIS
	 GuDjsfM4mppculWROj1t7B49ROCy+znJVq+hyWlo=
Date: Thu, 5 Aug 2021 12:57:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Colin King <colin.king@canonical.com>
Cc: Marco Cesati <marcocesati@gmail.com>, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: r8188eu: Fix spelling mistakes and typos
Message-ID: <YQvEGYIufwoPKHfS@kroah.com>
References: <20210803104410.337982-1-colin.king@canonical.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803104410.337982-1-colin.king@canonical.com>

On Tue, Aug 03, 2021 at 11:44:10AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are quire a few spelling mistakes and typos in the driver
> in comments, literal strings and function names. Fix these.
> 
> Note that this just corrects spelling mistakes and does not
> clean up any existing checkpatch warnings.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Does not apply to my tree right now, and if I try to take just parts of
it, it blows up the build.

Can you please break this up into a patch series?  You are doing a lot
of different things all in one patch (functions, strings, comments) and
it makes it hard to review, and apply.

thanks,

greg k-h

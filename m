Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDAE7C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 11:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06785C340F0;
	Sun,  3 Apr 2022 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648984580;
	bh=BeDEXZSi5vdhZc3OXtrMw1Z5DIAO5EKp3ycsQ7dc/AI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2azfr38Z8YBpwvC1NAVOh6HgeOtW09MKEUn1T+AX+lfZmh6wJJqc9koP27o1Dhqg
	 a1O2nCS7FbH0Z13yHoIqlvoH5qSYW4RxkfdFgtUo+4IyPwcSpOsVYJHOqTBo4zSvDe
	 ERJ6nB5sD2UeyqciiDXLk8UBolrqcxtLJvLv65nE=
Date: Sun, 3 Apr 2022 13:16:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] staging: vt6655: Convert macro PCAvDelayByIO to
 function
Message-ID: <YkmCARvUx7Wg15sH@kroah.com>
References: <cover.1648882847.git.philipp.g.hortmann@gmail.com>
 <b7551e92f42d60ff3bb74b5e28467f09781e3d06.1648882847.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7551e92f42d60ff3bb74b5e28467f09781e3d06.1648882847.git.philipp.g.hortmann@gmail.com>

On Sat, Apr 02, 2022 at 09:29:49AM +0200, Philipp Hortmann wrote:
> Convert do-while(0) macro PCAvDelayByIO to function and relocate.

That says what you did, but not _why_ you did it.

Please read the kernel documentation again for how to write a good
changelog comment and resend a v2.

thanks,

greg k-h

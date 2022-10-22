Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D128F3;
	Sat, 22 Oct 2022 08:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B74C433C1;
	Sat, 22 Oct 2022 08:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666426668;
	bh=6ptY5uf7J44ni3G95NeCYn/H8y8m/dT21iyKp4jpFRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1c3FBZ6y13cqv5ES3YZK45atU8jlF+YxWY0MWkPtqVeelRabGu8UmiVvwxk5rFFJI
	 Hyf+PFHlZSYOfut/9H0k5GWdncx1A5wxR3kfBdp4CLU1YOyKfPSrx+Ubx9aTITyjg8
	 k3bwB+AyQk7SOyDH/jCD5f+TW3acAeR2hdhAD55M=
Date: Sat, 22 Oct 2022 10:11:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3 2/6] staging: vt6655: refactor long lines of code in
 s_uGetRTSCTSDuration
Message-ID: <Y1OlmdhJ564Y4H05@kroah.com>
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-3-tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022070612.13009-3-tanjubrunostar0@gmail.com>

On Sat, Oct 22, 2022 at 07:06:08AM +0000, Tanjuate Brunostar wrote:
> fix checkpatch errors by refactoring long lines of code in the function: s_uGetRTSCTSDuration

So your commit to fix a "too long of a line" has a changelog text line
that is "too long".

The irony is deep here...

thanks,

greg k-h

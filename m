Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5CE748E;
	Tue, 25 Oct 2022 17:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25F9C433C1;
	Tue, 25 Oct 2022 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666718684;
	bh=lRDe6mwjhPn7J61JXXwHsCNe1A76EBCUIZYYfOKlSHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ao6FLjwQu+bhereJ1gJzeqiQcKFRq9tekXZpuU3/NZhL115cTjgVetfn1Dbtfkwuc
	 bAmlHu20p2jujGA96eYc/0DywrFKaR7i1MT0tPw54YuvMdEQT9GNVpwtU3R6EYGAOs
	 6Ev+AQmZmHSRXNLtpCsQw5Gx8prueBI7nnDsXqx8=
Date: Tue, 25 Oct 2022 19:24:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v4 2/6] staging: vt6655: refactor long lines of code in
 s_uGetRTSCTSDuration
Message-ID: <Y1gb2WmbYTD7aGWk@kroah.com>
References: <cover.1666605225.git.tanjubrunostar0@gmail.com>
 <0e6a307052d3a354a850a502e509f46baccdbe1e.1666605225.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e6a307052d3a354a850a502e509f46baccdbe1e.1666605225.git.tanjubrunostar0@gmail.com>

On Mon, Oct 24, 2022 at 10:01:48AM +0000, Tanjuate Brunostar wrote:
> fix checkpatch errors by refactoring long lines of code in the function: s_uGetRTSCTSDuration

Again, you wrote a changelog comment that is too long, for a patch where
you are fixing up too long of code lines.

Please fix.

thanks,

greg k-h

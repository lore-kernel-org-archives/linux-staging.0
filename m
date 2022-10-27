Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226A1100;
	Thu, 27 Oct 2022 06:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC59C433D6;
	Thu, 27 Oct 2022 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666852611;
	bh=MaDXykNOBsnRbQk4Wd2jrRSc2YVPdFhx76PUgnX43H4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5E2AOA/HVxtWehd3uWyckq/HI2+WEvX6cpH/Ep81vOAKQFPPBwomo8Bt1nulKTmt
	 k5a9Lg5Y/c8or506PPYI41PBvPQr86DFZ9wrsCBdOUqz8o4HWrRyYFOyXrbR8GWJtU
	 c1jrrECIoNbSk9jfYWqOq7RfhIteKblYkkM1a/EE=
Date: Thu, 27 Oct 2022 08:37:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v5 2/6] staging: vt6655: refactor code in
 s_uGetRTSCTSDuration
Message-ID: <Y1onOBNpAlIM1c80@kroah.com>
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
 <0e6a307052d3a354a850a502e509f46baccdbe1e.1666849707.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e6a307052d3a354a850a502e509f46baccdbe1e.1666849707.git.tanjubrunostar0@gmail.com>

On Thu, Oct 27, 2022 at 06:01:26AM +0000, Tanjuate Brunostar wrote:
> fix checkpatch errors by refactoring long lines of code in the function: s_uGetRTSCTSDuration

Um, this is 93 characters long.

I don't see it changed from before :(

Please fix _ALL_ changelog texts...

greg k-h

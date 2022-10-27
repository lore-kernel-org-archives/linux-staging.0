Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4953A186A;
	Thu, 27 Oct 2022 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B99C433D6;
	Thu, 27 Oct 2022 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666862415;
	bh=BUkmMerT0m9lDsqxhnQGqs2cLDVxsJ8rEEZ7XvQzo6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeeiAb9mFGC2ZA184rtTWuam9WPVnHzf+lJLnuINyGEijCJ12YzpaXkZy0aOZjRxY
	 nEmbzcjGM81i9xEiVRfci+IztEpiBy3HLQBWeP/UkMuBoCy81/NdmT/cEm3hPH7RQV
	 fwWcIlytqi3+1bWtmKnmoc2XijoiKTZoAuJxZNoM=
Date: Thu, 27 Oct 2022 11:20:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v5 1/6] staging: vt6655: fix lines ending in a '('
Message-ID: <Y1pNTMTjUKnmHia3@kroah.com>
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
 <6742e42999e05ddf09318a0a3bda9ce23b6ae562.1666849707.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6742e42999e05ddf09318a0a3bda9ce23b6ae562.1666849707.git.tanjubrunostar0@gmail.com>

On Thu, Oct 27, 2022 at 08:59:03AM +0000, Tanjuate Brunostar wrote:
> fix serveral checkpatch errors related to lines ending with a '(' by
> refactoring the code lines

Moving line endings is not "refactoring".  "refactoring" is changing
actual code, sorry.

greg k-h

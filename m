Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028AE2F28
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 19:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CC8C433D6;
	Sun, 16 Oct 2022 19:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665949177;
	bh=ASIXwO67vjPplghSfd7GGGjwTL7nvEYN3+Y6upbs+Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgoDqyviiugu12QCjEDuIGkYQS5C0MnJjlD5n9TwHXw55nO29v0OeWEJ+cY2Z6oFD
	 01SHvS1q70KIIkZwhy70gIkAR048xcXqUHs5l7Ru0m6lhIZHpVG+F2QfIN3sC3/ilQ
	 vvoSyHosECQGDRIGsu3FZ+7VzcHGG2Qf5eJw7y3c=
Date: Sun, 16 Oct 2022 21:40:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: query on fixing checkpatch BUG() variants warning
Message-ID: <Y0xeJ/wMWiMHhr2q@kroah.com>
References: <Y0xOKFkL84jqTSj8@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0xOKFkL84jqTSj8@debian-BULLSEYE-live-builder-AMD64>

On Sun, Oct 16, 2022 at 02:32:08PM -0400, Deepak R Varma wrote:
> Hello,
> I am participating in Outreachy program for Dec 2022. Could you please suggest
> if I should explore resolving following checkpatch warning reported by
> driver/stagning/most/*/*.c files?
> 
> Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
> 

Feel free to work on whatever you want, it's not up to us to tell you
what to do :)

Good luck!

greg k-h

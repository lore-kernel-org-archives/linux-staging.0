Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D059EBB
	for <linux-staging@lists.linux.dev>; Tue, 28 Mar 2023 07:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C409C433D2;
	Tue, 28 Mar 2023 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679990198;
	bh=yE/jM7tV7zVRxcad76jIIa1CSUYEmwjIwePWoHBA7Lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5XjxfhMeSbd86cIBPTzjIPdXXWfTZhxvJnH7g4kBCy0BWmTrm7srLZUBMxWJzUFJ
	 UCILVj/LN5EVL5n+SDh/Si62RS4yjr4J8qEdSwA947Ol/0c0yDbchZ1gU0U9lbboOT
	 +/q4XksbjshXvg8DV5caK+mIsCZDALD4D8Mtk+Zc=
Date: Tue, 28 Mar 2023 09:56:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Watson <ozzloy@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: move open curly to first line of if
Message-ID: <ZCKds6_2QYrZgMXh@kroah.com>
References: <ZCKYhfonZN36ZHjG@trent-reznor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCKYhfonZN36ZHjG@trent-reznor>

On Tue, Mar 28, 2023 at 12:34:29AM -0700, Daniel Watson wrote:
> Checkpatch flagged this as a fixable style error.

What exactly is "this"?

Take a look at the kernel documentation, specifically the file,
Documentation/process/submitting-patches.rst in the section entitled,
"The canonical patch format", for how to write a good subject line, and
changelog text.

Most of the time, that's the hardest part of writing a patch.

Fix that up and send a v2 please (after reading in that same file for
how to properly document that this is a version 2...)

thanks,

greg k-h

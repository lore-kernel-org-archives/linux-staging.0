Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94C7173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 13:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0EA5C36AEB;
	Mon,  3 Jan 2022 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641216582;
	bh=6/apdMsn/SOByxPv6kfP2aGLU5Tnss4W3E1xfNqRJwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yRW8KTCN2Q+qL4tY3dnK5fSFgjHRAg3tMUDbsrLR37H3G8OIL4Zi9gnLCG4GuF15Q
	 /u6YhO4cv6vDMDnznyMj/Bp5D0TR71B0UawF+woKd8/NSDeQCY3G4xnO13Mhj11GmS
	 js0j2tbjEMEk0Ybs1Ei3Sj0xmZd4l6HV7WZutBF4=
Date: Mon, 3 Jan 2022 14:29:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: pi433: add comment to rx_lock mutex
 definition
Message-ID: <YdL6QzDK26W5WnaD@kroah.com>
References: <20211230152931.GA6157@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211230152931.GA6157@localhost.localdomain>

On Fri, Dec 31, 2021 at 04:29:31AM +1300, Paulo Miguel Almeida wrote:
> Checkpatch reports: CHECK: struct mutex definition without comment.
> Fix this by documenting what rx_mutex struct is used for in pi433 driver.

Please wrap your changelog comments at 72 columns.

thanks,

greg k-h

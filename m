Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C92870
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:52:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24AB661244;
	Tue, 13 Apr 2021 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618300370;
	bh=wyy6FFxR0i9QhleHrzZ6gh7j23fKBFd0Cq5fJ5/HRAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qupzavy3DlQyTnfQNp21YrR1XZr5M9igQeUPYC8w0+gnLHZ/hXE3ctl9dKsE4YViH
	 luQveDNiFNYDV5ZT0q3AFZhPU/j25y2PvRf4odPM1FjBsKisC4+Nc8ksSIgI+yHTbE
	 YKsvjlBXBSCM7Kiho876BJVG5vYovZaMSOB9GMgY=
Date: Tue, 13 Apr 2021 09:52:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v5 0/3] staging: rtl8192e: Cleanup patchset for style
 issues in rtl819x_HTProc.c
Message-ID: <YHVN0JRWqNDJYF3T@kroah.com>
References: <cover.1618283232.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618283232.git.mitaliborkar810@gmail.com>

On Tue, Apr 13, 2021 at 08:55:03AM +0530, Mitali Borkar wrote:
> Changes from v4:-
> [PATCH v4 1/3]:- No changes.
> [PATCH v4 2/3]:- No changes.
> [PATCH V4 3/3]:- Removed casts and parentheses.

This series does not apply cleanly, please rebase and resend.

thanks,

greg k-h

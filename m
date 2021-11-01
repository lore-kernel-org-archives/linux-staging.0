Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0989668
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 15:18:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E976060F3A;
	Mon,  1 Nov 2021 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635779887;
	bh=6cXhMwsgVW8VcGg5gqT9SlVFJ1jBKf7oyZwsB1UQ2uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ae0zT3Ti9YXpkFV1H6UBCJ7uPAKqddaLmMPtkRYOPS5G0J3UT6Caabyawcfz3fHGw
	 AOuH9k3u7q65IU0hyNrptIZkNwlkjErTz513uHvwwc4fhK3lCW0FFN0S674xR00A3X
	 QFyGaIkb5/tlr10E1NM6o5j+NZU6jJpXsejev63k=
Date: Mon, 1 Nov 2021 16:18:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: Use kzalloc() with GFP_ATOMIC in
 atomic context
Message-ID: <YYAFK83uzfBn03D/@kroah.com>
References: <20211101142732.5638-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101142732.5638-1-fmdefrancesco@gmail.com>

On Mon, Nov 01, 2021 at 03:27:32PM +0100, Fabio M. De Francesco wrote:
> Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in
> report_del_sta_event(). This function is called while holding spinlocks,
> therefore it is not allowed to sleep. With the GFP_ATOMIC type flag, the
> allocation is high priority and must not sleep.
> 
> This issue is detected by Smatch which emits the following warning:
> "drivers/staging/r8188eu/core/rtw_mlme_ext.c:6848 report_del_sta_event()
> warn: sleeping in atomic context".
> 
> After the change, the post-commit hook output the following message:
> "CHECK: Prefer kzalloc(sizeof(*pcmd_obj)...) over
> kzalloc(sizeof(struct cmd_obj)...)".
> 
> According to the above "CHECK", use the preferred style in the first
> kzalloc().
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v1->v2: Fix an overlooked error due to an incorrect copy-paste
> 	of the sizeof() operator.

What commit does this fix?

thanks,

greg k-h

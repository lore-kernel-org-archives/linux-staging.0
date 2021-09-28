Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2766529CA
	for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 07:11:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 029D6611C0;
	Tue, 28 Sep 2021 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632813111;
	bh=khzZIf3Q8Je/p+XmCsetm5TFSg0cYIt4rcBHWjjlO3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEQ8g1KfmIObjRjKJ2VFsVVnz5zJeu0vQC4gAqhnLy/oeczn4xNen+L+63j9yHMF6
	 LevdCREsdaJpVqA1lHIJvlT9Px+NkOJUD2ldh4CV4ni4EqEgJJhIGhkDtiqa0jS0V5
	 8Fgq4nq7PHZbshSmhadpAZ/r+XnX1gs0cuLAOwSQ=
Date: Tue, 28 Sep 2021 09:11:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: dim2: force fcnt=3 on Renesas GEN3
Message-ID: <YVLANRaCgY/CrYdX@kroah.com>
References: <YVHoXyULqXsWktMN@kroah.com>
 <20210927155804.27877-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927155804.27877-1-nikita.yoush@cogentembedded.com>

On Mon, Sep 27, 2021 at 06:58:05PM +0300, Nikita Yushchenko wrote:
> Per Renesas datasheet, MLBC0 register's fcnt field in the embedded
> dim2 module must be never set to value different from 3.
> 
> Enforce that, via an optional field in struct dim2_platform_data.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
> Changes from v1:
> - set dev_fcnt via if statement, not conditional expression

Much nicer, thanks!

greg k-h

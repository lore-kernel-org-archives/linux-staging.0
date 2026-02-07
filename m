Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FE9823DD;
	Sat,  7 Feb 2026 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770465995; cv=none; b=rNxX6ICg5pLbzgBcjZCQUT7shFwyk7o5+4mwDJSZ6vQTpzCtt3338kHR+iSj4Mbp73FfdQYWN5g1xsUC7OnTHiVz9NA7Wtv7if9SW5ae5zOdsTS5JQSQrm2RlJ9x7Hk9MyvB2dFf0hKVF3t1EMUoE7tyHEfHjFdUIB3SpRmHnws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770465995; c=relaxed/simple;
	bh=8pJ2Y+G6KXNd0PoIuUjJKRdIVsc2d3pqbEi0sWSARWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH0c7ChnshII8brmW+9digTeEaShrBkEk6XpTdOYfb7O9EoQ8snkcBrxT4jFVS37OviN4ob3uZIIR5K+Xzsxp3CPVjYL5bZuKZHQR4uPN5fjQPVDQmSUNHfhebJU3b7Snh15m/4wWR07aTROs3npusjY0+qS0mMaCw9G0tOeUqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I03KulCe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I03KulCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CB2C116D0;
	Sat,  7 Feb 2026 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770465995;
	bh=8pJ2Y+G6KXNd0PoIuUjJKRdIVsc2d3pqbEi0sWSARWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I03KulCetZjLxs8uDs2MnfiL4PU4ON28L9ufRjf94x/DxAPcZLexgEgIKekrj4rep
	 eY3cOsptoO2qhnio8XgWESWmZcm8odb80BPjfePLpA7JJZVjPfMTwf0G5Rx7zMH1Ng
	 Zp3BhrzdMlSTdJrTn2OZiRVlOJ1LvG5aMOU9j6mw=
Date: Sat, 7 Feb 2026 13:06:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: dan.carpenter@linaro.org, bqn9090@gmail.com,
	abrahamadekunle50@gmail.com, straube.linux@gmail.com,
	bryant.boatright@proton.me, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: fix potential race in
 expire_timeout_chk
Message-ID: <2026020707-starring-steadily-4d5d@gregkh>
References: <20260131171153.3729458-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131171153.3729458-1-s9430939@naver.com>

On Sun, Feb 01, 2026 at 02:11:53AM +0900, Minu Jin wrote:
> The expire_timeout_chk function currently do lock and unlock inside the
> loop before calling rtw_free_stainfo().
> 
> This can be risky as the list might be changed
> when the lock is briefly released.
> 
> To fix this, move expired sta_info entries into a local free_list while
> holding the lock, and then perform the actual freeing after the lock is
> released.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Changes in v4:
>     - Add Reviewed-by tag from Dan Carpenter

You never have to do this.  Our tools pick that up, and this just moves
you further down the review queue as it's a new submission :(

thanks,

greg k-h

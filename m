Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9403A8733;
	Mon, 30 Mar 2026 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857498; cv=none; b=uxi6vVh4dF+MBABCalwMX/5lOkNOMn9pM2Ab0c7Wj6arbf+3lwVfAf0V1K5tBsM8R3RD/56Ydqf3gqPIthn79wkX7tULtsfkrqMu7G/91251Zerg2emoyqDBz9Pky6zpPOKJobELqH8ZNI5bO4rPLJcfIJdfWgFG63/AwONmLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857498; c=relaxed/simple;
	bh=749QBqlMO8Dn94gF0bdzy5N+4oBU+S+/nsFlx2xVjWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNzJzNWd5+3eANbDy1VMWYd/ZpKIaDGFZYnT4wpTJXhRkTLQb5Mec02PfkNKX8OCgoTmh6yHfW4rxwnLDJqxAR5ATIT9MIXhqAYBIb4TUqtZcaiyZyMC066K68gqWQtzo0aTw9cf8jNH2XjmZvH7DQ+L1qP+rqUMyE+bAYHKBKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmXfxC6+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmXfxC6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B66C4CEF7;
	Mon, 30 Mar 2026 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774857498;
	bh=749QBqlMO8Dn94gF0bdzy5N+4oBU+S+/nsFlx2xVjWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmXfxC6+q34DQXLZxcWw0d5s+V2y1/vlRKqo5lDbe0t5MxldiJxdnUJ5eBw2pPK5D
	 eosOxr1/MAQrdczDQlgKy+9QyxFOOioh8tCAknHU+zB0pQS3AnavNnuOY3Xma7Kzu1
	 2zj2P91wJoLPWHGuBrGoKO6M42IFOK+d+repmEYI4LGO27kk5ZgaA9HNNNOu5SVSBq
	 b8xuQb09D5OLdSIiLGDNp0vsutiEvn9ptoxs7T90M1qKAv0mFbcmU/AgWf0nxVQmmj
	 7pYD8s80HHz56JawKlySu7Q5/OyT1DPALekmnLyuQoC2rVGjmWHy50pjapNZGy9Nck
	 UMnMtf3f96g0w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w77Vn-00000006igK-364q;
	Mon, 30 Mar 2026 09:58:15 +0200
Date: Mon, 30 Mar 2026 09:58:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: fix error message for BTN_3
 button
Message-ID: <acotF6BuMHzno-XJ@hovoldconsulting.com>
References: <20260330062402.1454-1-hechushiguitu666@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330062402.1454-1-hechushiguitu666@gmail.com>

On Mon, Mar 30, 2026 at 02:24:02PM +0800, Haoyu Lu wrote:
> In gbaudio_init_jack(), when setting SND_JACK_BTN_3 key, the error message
> incorrectly says "Failed to set BTN_0". This should be "Failed to set BTN_3"
> to match the button being configured.

Please wrap your commit messages at 72 columns or so (checkpatch warns).

> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>

Looks correct otherwise, so you can add my 

Reviewed-by: Johan Hovold <johan@kernel.org>

when resending.

Johan

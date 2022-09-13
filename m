Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453012F29
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 13:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0212C433D7;
	Tue, 13 Sep 2022 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663074409;
	bh=xkPrNaeSc3nIqS2ojhUubV3xB0uzGFPKPShPBRWyO5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i46GvtL2piN6QP7oIPU5kk+hN29TVgNbIIpq1HIsjkgOl/YyuUivUJwHXevLBGXA8
	 Ri001n/F+XjqxEsU4E+wNfEO6lbCmcgzB7IQdi9Vsr5KCaGFMfdmKIyrQKdYC1i/Cj
	 aGYCOsKB4eNryGbVKkTT+hTckG3foYIQnSgXZwnimyV3fjflgRkJgiEsAuIXb7vNZl
	 Gx17kN5udOkuLiXaYi/FiEUHJWEyQwzmyKsjx3bsuoOltAcjHKTS7J1s6LUk1JW2uJ
	 yIIknFicSETojfeaWAaxR1kMZ6aT26Ox+bWUpetufWyqcPQyTMJwID5rtQ0iH86hFm
	 KVgbr/C5QxR7w==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oY5cn-0003kc-D4; Tue, 13 Sep 2022 15:06:49 +0200
Date: Tue, 13 Sep 2022 15:06:49 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH] staging: greybus: audio_helper: remove unused and wrong
 debugfs usage
Message-ID: <YyCAaaLuT5s1Jhy2@hovoldconsulting.com>
References: <20220902143715.320500-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902143715.320500-1-gregkh@linuxfoundation.org>

On Fri, Sep 02, 2022 at 04:37:15PM +0200, Greg Kroah-Hartman wrote:
> In the greybus audio_helper code, the debugfs file for the dapm has the
> potential to be removed and memory will be leaked.  There is also the
> very real potential for this code to remove ALL debugfs entries from the
> system, and it seems like this is what will really happen if this code
> ever runs.  This all is very wrong as the greybus audio driver did not
> create this debugfs file, the sound core did and controls the lifespan
> of it.

Yeah, this looks very broken indeed.

> So remove all of the debugfs logic from the audio_helper code as there's
> no way it could be correct.  If this really is needed, it can come back
> with a fixup for the incorrect usage of the debugfs_lookup() call which
> is what caused this to be noticed at all.

> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: greybus-dev@lists.linaro.org
> Cc: linux-staging@lists.linux.dev
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I know this has already been applied, but still:

Acked-by: Johan Hovold <johan@kernel.org>

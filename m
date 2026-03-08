Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B511A682D;
	Sun,  8 Mar 2026 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995701; cv=none; b=ccmkJK6dufAbVcrZnFoWw8dtRyvV2aHRPjnjfIwX7DXxSiG9u64UzKfTkLCRxrApbLoDmy/aHMP3Jz9mgD2Px5rCwzXYfb13Y43LpwkSS9YEBjdiySHhYhJeC1TZY/9ED3e1JzNG6gM2R3JH2WLy4RAAJa5MU/I1cN2i9omOzHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995701; c=relaxed/simple;
	bh=nc7puR+XEmGsIIXRV1BN23+jhhvUSPC6G9LhBJPE7d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ju+tbqTXZnLIVR0rPsE9hjCw4KA8erVEG+9lAhJ6NkUvcd8XV1xPEqM3hT+QXjZi6a/ap8RK8gxrx1Ngq1KGX48FR5PuvjESYknxby4Bz0BsVq0BZgB5u5PFmlFLEc/lsbp+I6ztAODft8pj9518UTSvkhAfiGXHf1U8FFpm7EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z7atY8U+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z7atY8U+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83287C116C6;
	Sun,  8 Mar 2026 18:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772995701;
	bh=nc7puR+XEmGsIIXRV1BN23+jhhvUSPC6G9LhBJPE7d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z7atY8U+ilRaQCmB5yDh8MbqFq9YkBKEXonLgzK0BYZc7cG9oECJKodHp4FBfqxJT
	 EwokgG0ziKWBFgHIqnHZcKWeBstpUm40uHEPLU9fHgjvIagD65ggk/Q+BGNGIm1qLD
	 /gRfKnT0eI3IqDMqwuZnZj1xYAPYlTkpvoi23gUM=
Date: Sun, 8 Mar 2026 19:48:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] staging: greybus: fixing checkpatch issues
Message-ID: <2026030803-broadness-basis-9ecc@gregkh>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307140930.1732-1-rchtdhr@gmail.com>

On Sat, Mar 07, 2026 at 02:09:23PM +0000, Rachit Dhar wrote:
> This series fixes some of the checkpatch.pl checks
> highlighted in greybus.
> 
> Changes in v4:
> - As per the suggestions of Greg K.H., I am removing two patches
> that added comments to mutex declarations, since it is hard to
> verify them, without extensive analysis and documentation.

You still sent a patch that did this, as patch 2/2 :(


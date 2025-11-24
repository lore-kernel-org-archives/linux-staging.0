Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78A19644B;
	Mon, 24 Nov 2025 16:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002761; cv=none; b=F575w5B2v3keSwYd2Biyj9Qwbg67jBWjxCFQT6Nl4hnSZWKkRSmUkjLMYlAU9u+y5W3ScFXPeG2phqRsNn0ta9WhXCCRib+NgBfzKbTiI1I+wfFpNTVO9fthGIGiVd+di7AfriioTVJybVs7inAwc339jIDRBO4EEM8mut3jZE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002761; c=relaxed/simple;
	bh=eqa+cqB3gnigA2glq/9RQqy0UkXeQbbdEmGtjYpAU4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNGiV9FzUkYurgX8YnqcUfsXCIO6zH0FBeruJxR7n7as9GEFJIrcFmjG/1SF/Hm7MfoiPey5b1S7i761hvU3e6lkr9jtcLqvHDQi+quTLkFjF/pDlXoXpTjdv40FxguRHg4RxvtTVLTtjuhCziqVOpMe9fD+x2AT9ElWIXepG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i8l2KDMR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i8l2KDMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3FBC116C6;
	Mon, 24 Nov 2025 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002760;
	bh=eqa+cqB3gnigA2glq/9RQqy0UkXeQbbdEmGtjYpAU4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8l2KDMRjZuQyTtOkUOTjZx5KLO8y+Fvb2bSK4FCOVB8evKUqYh6qL+sqQUA/819Q
	 z0wosCb+pvMvHYz4Mzve6/GmQHLsYeFj4P/6cNeCpMsIXumewpDPKPBmpdrHFAw34e
	 xIoFAMeWDfyIr3xu4Nx3FhylcWszpVLOWS7N/nEY=
Date: Mon, 24 Nov 2025 17:45:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH v2 3/3] staging: rtl8723bs: Rename camel case variiable
Message-ID: <2025112444-viable-obsessive-7e39@gregkh>
References: <cover.1762803720.git.bryant.boatright@proton.me>
 <680467c25692e94629734a690e64881279bd4d2b.1762803720.git.bryant.boatright@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <680467c25692e94629734a690e64881279bd4d2b.1762803720.git.bryant.boatright@proton.me>

On Mon, Nov 10, 2025 at 07:50:26PM +0000, Bryant Boatright wrote:
> Adhere to Linux kernel coding style.

Nit, you have a spelling mistake in your subject line :)

thanks,

greg k-h

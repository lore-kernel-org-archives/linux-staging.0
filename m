Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985734EF0F;
	Mon, 16 Mar 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650645; cv=none; b=JNJbtIq2Z5VuwGTaSfcWw63Ctu1VV41ceWpNIaJWoqZgMVGFBbvX5XNgWjoCWoDRS04KUmthu2kvamNjH3rQIlPARdsnQ9MEhfIvcQ0yOX21lWWBPLE6MXJOGn+cmj4RbAkiqW66jA8FTBeAcvY+GZSbBjiBHG7VmajnRRS6Y2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650645; c=relaxed/simple;
	bh=4Bs/SvHDnV9A/jGipnQncjxaHMIt4Npm1foNB6wZeh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tA04a+bz0IiZI37GMu/Mgy/WRkQREaRx6RcVRyaJ0WQRNmYMbmNtkP5n/JUNsqBbtnZ1rDqy5L5JVpAJx9Dpdf9g46CSrior9gBcwDCJzzarmrp7+O0U8d26RWzN27k/JDMQSfVdKJSa91RpiEzNwk9mSVN9OamIfQ+ohjRKh+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPS4RDps; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPS4RDps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D92C19421;
	Mon, 16 Mar 2026 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773650644;
	bh=4Bs/SvHDnV9A/jGipnQncjxaHMIt4Npm1foNB6wZeh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPS4RDpsc+ADclLSVucV+IrpW/kb0Iw+SR8MiL7JAY2ziBHtwXUiMV5a18UcOULVh
	 kooW0fFrGl4zIibXtqu8IsfRO84qtB/JWsBo6SWWyGLulX9riQ9DxfbEmXgZpdOi0b
	 kEfB8FDTICCIrdSPsTG2WunwIHqaZngaMKos51QQV71FkuttMMyt90pjN4QYUHOsYe
	 MQnQd8KgZc+lPAGCq00a/B1bnciq60D9jOcnocKndITb1zeQ9yZdZbTnoVM0IZlpyQ
	 yIX2wS1fws30JrLRigyORF3yazng7dXP8TGFNbhpPH+bc8ou8kd3LjdFVjTdoU4+kB
	 r8UTf33qFxi3Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w23YQ-000000007CF-1PFN;
	Mon, 16 Mar 2026 09:44:02 +0100
Date: Mon, 16 Mar 2026 09:44:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Viresh Kumar <vireshk@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: use %pe to print PTR_ERR in fw-core.c
Message-ID: <abfC0qqrAU4BbS0h@hovoldconsulting.com>
References: <20260315-greybus-pe-format-v1-1-d923fbed3097.ref@yahoo.pl>
 <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>

On Sun, Mar 15, 2026 at 09:40:48AM +0100, Tomasz Unger wrote:
> Replace PTR_ERR() with %pe format specifier which directly prints
> the error pointer in a human readable way, making the code cleaner
> and more idiomatic.

No, this is only results in inconsistency as Greybus logs all other
errnos numerically (which is perfectly sufficient).

See also:

	https://lore.kernel.org/all/20251029132922.17329-1-johan@kernel.org/

Johan

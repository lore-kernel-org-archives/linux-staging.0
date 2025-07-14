Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B4325487B;
	Mon, 14 Jul 2025 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499290; cv=none; b=NxfKBEOA+y6ztv67Z8Bf+l7GnX2y/Pcya/v/O9/IourlAQUnURB5NTNO8te5k4DV6wjSBM83GsbnEu1/Rbvhr3NQl7AqmIoEgetchg3M9dvcUo98CjO5B3uGkREThNnfEgGXmbwSBFVPAz8ZHX1HTRYI7ypFyFKg3fScOa24qi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499290; c=relaxed/simple;
	bh=25Q81RBxzGD0tuOnHIG97mH5lfFX0cnFEdskq40h3HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnvshrG3QQnhA++IW93ugpOPgM3IgnlSJlHQVYhHOs1jlO0kAH9bWN5JAa629dvvDbymnsW6PlAjdDzYcT3T5GUwwMI5l6gpIzoewRX1TN73ywfXyhyFVzU9tKx7RRC/CJyqa40XNrH2OWuGfRKxgqpixPH7bRZJ8kBcAoRjiSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TXLzeWp/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TXLzeWp/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B9FC4CEED;
	Mon, 14 Jul 2025 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752499289;
	bh=25Q81RBxzGD0tuOnHIG97mH5lfFX0cnFEdskq40h3HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXLzeWp/s/VPnyiI/ryBjNGBYy4cmESglEckU7J8ohCqCIKUjRFENhe1o+jsuyr96
	 JdFG0zc1koXlFIzJlP8sAHPgCv0LYIMlfFJ+zD0pYvK4MnO4pGil/aPFMqSThvVwVS
	 quMVd2h4I5bYC9v4E8kZMWtFEgVlcVO4NjqqbY1A=
Date: Mon, 14 Jul 2025 15:21:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Simon Chopin <schopin@ubuntu.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] staging: greybus: fix whitespace alignments in firmware.c
Message-ID: <2025071437-autograph-scalping-b1bd@gregkh>
References: <20250714131101.434301-1-schopin@ubuntu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714131101.434301-1-schopin@ubuntu.com>

On Mon, Jul 14, 2025 at 03:10:47PM +0200, Simon Chopin wrote:
> This addresses all instances of the checkpatch.pl warning
> "CHECK: Alignment should match open parenthesis"
> in this file.

Which file?  This is a documentation file, not a file that the kernel
builds :)

So you might want to add "Documentation" to the subject line, right?

thanks,

greg k-h

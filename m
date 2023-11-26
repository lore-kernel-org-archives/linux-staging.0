Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA191C16
	for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CE+FzQ2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B637FC433C8;
	Sun, 26 Nov 2023 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700994559;
	bh=f+nbJIhiGBaPFaiV+IIHo2OURbKlwrFmj3SbvRtEevY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CE+FzQ2TQ/1pNSPO/OWVj8T5lKg0890qO7mvXIZoMLNwjFMKmxLs5W/Y0x3OZvyve
	 FiQuY8DYfp60px5dTcn6Ecrg9mdBHMLPEuEgN0SeUnLC0ZIg7IeAjp9Z/jPzv17rV8
	 rXlA3FIyUKom5vwYJqa2gn7bcmldRJ47uXsJx414=
Date: Sun, 26 Nov 2023 10:29:16 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8192e: renamed variable nDataRate
Message-ID: <2023112622-jigsaw-scrambler-d385@gregkh>
References: <20231125223432.13780-1-garyrookard@fastmail.org>
 <20231125223432.13780-5-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125223432.13780-5-garyrookard@fastmail.org>

On Sat, Nov 25, 2023 at 05:34:31PM -0500, Gary Rookard wrote:
> -u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 n_data_rate)

Why are you keeping the "n"?  It's not needed, right?  Remember, these
were written in "Hungarian notation" which uses the variable name to
denote the type of the variable, so "n" means "number" perhaps?  So it
can be dropped.

thanks,

greg k-h

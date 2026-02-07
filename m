Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83C8256C84;
	Sat,  7 Feb 2026 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471483; cv=none; b=YylDxf5xPR7CXVNH/aLPzSXATNOf8llkWkxvdeHoe1kq8n2rVHOu2tt5FuyDCgTHWr9JSlRIkJd0yN/Ojk8vKt5M/Buq9ikq3GywW96cWybzWAQwH5WT/Onov1oGErAOqLNgxwMYdNf0f8kU38D/iz2Ulb+XDyQRNibufeT4QUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471483; c=relaxed/simple;
	bh=aw0TVI+xH/GV339fB0TrLFlr9AbbXm4/JArjue//HwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gb0GGHkFsf1nQGTI2yobYrdoPTUjW0Rz8bnsW0UVgJOd0laH1KTb99IZ9cOUQre5GdjFWjv2lmFgCTKGxx+r8fW+rdNx7unAQ69+TeUY1kB7thIakjqYjgbPCC6c22/ZAZfapz2lcXf1eDsl3rTdKFs3Ac1h84rbmI/q/dCYdY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c09O6O4Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c09O6O4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24FFC116D0;
	Sat,  7 Feb 2026 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471483;
	bh=aw0TVI+xH/GV339fB0TrLFlr9AbbXm4/JArjue//HwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c09O6O4YJG06YTJp7IQ8IoFmMnIo4F7Jz9dd3vTRuWpudR5izoETsvGNmXI+WTdfg
	 /DMxxpq6JqL9dIXclloJvkyUjHf1VC+qFDJslu7T1IFXH9tpW/e59hNBnVH045DMoi
	 KYDfXJ1IqM8dQ+zauTaOnNBbZg+YWpXZ0Gaay+9I=
Date: Sat, 7 Feb 2026 14:37:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] staging: greybus: fixed styling issue in
 fw-management.c
Message-ID: <2026020714-tightness-atonable-8a17@gregkh>
References: <20260204183033.182747-1-rchtdhr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204183033.182747-1-rchtdhr@gmail.com>

On Wed, Feb 04, 2026 at 06:30:33PM +0000, Rachit Dhar wrote:
> Fixed a styling issue highlighted by checkpatch.pl.

What specific style issue was fixed?  Please be specific.

Also, your patches were not correctly linked together.  Please use
something like 'git send-email' to send them all at once.  Otherwise
they get lost and out-of-order as you can see in the email archives on
lore.kernel.org.

thanks,

greg k-h

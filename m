Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622EC2BE642;
	Tue, 24 Feb 2026 18:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956927; cv=none; b=mt1sPb0vU0e4OBQizJwjRRNjwrxGTDGr/Stt2qTIHunudaV/orhtoxPqcGMemYVxg4z2sN4D39UPfBaCu2vkUgtjItCUF+GfimSh+4VSNyddYawyBeTgFvNayezr5o/5VDoWsCHrv0GS/9lzdRhdN9J6RjiwYglEYZE7UwS5HOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956927; c=relaxed/simple;
	bh=OEo0T6bwvT+fmS+yRl9SKvBVUH2pXWl9TgzvuNIo+Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKWSysxoK+sal8umY5pksAB0F+juURqgDIMMa0inMVEBFDsJSK1ejeq426HlHXgkEcl5SZvzXGe5cKCaQZk1aAtOTnXsXgqwE0pKnj1nqCftz5Y0wqyU/v4jgQsmkKxDLaYfexrjgg8RmAY6fA5UT8tSjAoCNyyIQ7LLU2/8qoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dBzGfHGD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dBzGfHGD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941F5C19422;
	Tue, 24 Feb 2026 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771956927;
	bh=OEo0T6bwvT+fmS+yRl9SKvBVUH2pXWl9TgzvuNIo+Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBzGfHGDDE/+shMGBWNBjDrYslG8i6gBRPC+NiDVYQaFbsVAU+9IOf+/L32vdK1hM
	 Hd5yDpKycsQXrjij5x6au6fa73W6cQvDd9CfULM3wK6Qd5DRuZ+5gKqo+mc5sJ24NH
	 atxus0qVIed6yrEbzXNb5DHjXwJVS0QoDg5SeP9g=
Date: Tue, 24 Feb 2026 10:15:20 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: luka.gejak@linux.dev
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/21] staging: rtl8723bs: various cleanups
Message-ID: <2026022456-abroad-script-f5fd@gregkh>
References: <20260224132748.12336-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224132748.12336-1-luka.gejak@linux.dev>

On Tue, Feb 24, 2026 at 02:27:27PM +0100, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> Separated OOB bug fix and cleanups to 2 series per Greg's request. No 
> logical changes.

Most of these applied, but many did not.  Can you rebase on top of the
staging-testing branch now and resend the remaining ones?

thanks,

greg k-h

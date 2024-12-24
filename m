Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9772C29A2;
	Tue, 24 Dec 2024 05:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735019041; cv=none; b=cDA5pdOuycndGiJxtR1ZqFLZIa/vFpnFaC7/Sm3bJZ6TwC8DSyFkewxU+My0XIi04z1gw4D2E98+SI4g/SnCXjKA8DAkzvAj9M3ztC4OoTBlDAj8Uux6XD3b+DLtLeraWZMgifj2VfP7dE7/inAPlThAnBY+5/4C1eKQTixmi60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735019041; c=relaxed/simple;
	bh=z/WP4iY6tYW4JkD6RD4YF9ZGIXBgSIc/Ou+WwvJeX0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVoj+zqNjo/gSruvM82aWX14ZY/8kULcD+ux2HLSVSgGUiWxBAkMPxCxEJuLrRdZ08y7lbKyJkHIGKd969kEm0q21DJn5dyijRsqlXTisF5UI6YA5WeUGvZrstDsZrqj6LGpEGUK2egCdmgUnBPpWKZDyDPGYSZViyFStq4X60g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zUZzpTVp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zUZzpTVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A978C4CED0;
	Tue, 24 Dec 2024 05:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735019041;
	bh=z/WP4iY6tYW4JkD6RD4YF9ZGIXBgSIc/Ou+WwvJeX0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zUZzpTVp62scP1vWYUQ2MRiwKUGzkm6ekvAud+UGrKy/uUIZ75sXojmEoum4J0HwG
	 GJLncVBJatlKrpCecyQrrGxKLYJ51L1xL5e7+IYDRjmewKEapnlORN221CtbaK74bn
	 fb58a7zoNfu5LJ5SrzsEH/V1WdW0cPyoY2U4gNLY=
Date: Tue, 24 Dec 2024 06:43:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	mgreer@animalcreek.com, vaibhav.sr@gmail.com
Subject: Re: [PATCH] staging: greybus: Remove Module from list before freeing
 in gb_audio_module_release
Message-ID: <2024122433-awry-active-bf6e@gregkh>
References: <2024122358-vexingly-broadly-7df7@gregkh>
 <20241224051917.1971-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224051917.1971-1-evepolonium@gmail.com>

On Tue, Dec 24, 2024 at 10:49:17AM +0530, Atharva Tiwari wrote:
> Yes I have tested the patch with greybus drivers enabled on Debian 12.It works as expected, and i did not get any errors or warning during the compilation

I have no context here, sorry.

Remember, some of use get over 1000 emails a day to do something with,
always respond with proper email quoting and context of what is going
on.

Also, just bulding code does not mean it works :)

thanks,

greg k-h

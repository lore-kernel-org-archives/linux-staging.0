Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C05F3376A3;
	Wed, 17 Dec 2025 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976215; cv=none; b=eZQTMwDnd5TjEA8aoQNVANVXB4ZFdzh1IAwQ62wvf+OUNVBB1Rs1H3zMGLJed3ePuzdo3PAynOwgMLKs6LafN2GviLm9FsUnnejdHuslDzMEpeuPVeDZwP/KCmvBAJnIIskWd6T4VKXM+zixTcej8GtnUDVvzSry1aC6IJeMN0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976215; c=relaxed/simple;
	bh=SPMVbbG83y/sljnp11jJ5Y7aQtxP1R5i5XEe1vLYmog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7ilLo9I+PwQNWy11zbkG7jyh2PvRdGwD5gf0x4gyVj7pZuDdxZ6YlvFBDJSopNxNNpkjmfGqdfAWFrlwtnZ16e5911jg1CpnfkokfhqyCjYudPmvSJDMKu36GnguANUVkglGToO4R08YZsOxoLJA+IQ7CQbolRUHL7AaM77JyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZVsWWJhF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZVsWWJhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4D0C4CEF5;
	Wed, 17 Dec 2025 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765976214;
	bh=SPMVbbG83y/sljnp11jJ5Y7aQtxP1R5i5XEe1vLYmog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVsWWJhF9Aj/sxCjeSXcGlU/F5C6s7KrCbdzwHC4mItFySUrhVjBA2u7IcgFRBNnC
	 gM4A69C8oVO8n/b5juDoOijGeN+aZxnsneBpkURo0CmtHfq3V1DFVNVo1sczqp11VL
	 Qs9ykx1iMCC/9jH1Dof+flVHaiPflbjqbJifnoQE=
Date: Wed, 17 Dec 2025 13:56:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sammy Malik <sammy@parkour.is>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Remove completed PWN TODO item.
Message-ID: <2025121732-brook-widely-dfc7@gregkh>
References: <20251129104407.145907-1-sammy@parkour.is>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129104407.145907-1-sammy@parkour.is>

On Sat, Nov 29, 2025 at 10:44:36AM +0000, Sammy Malik wrote:
> The pwm.c driver already uses pwn_ops::apply. This item was completed
> but never removed.

What commit id fixed this up?  Please show that here in the changelog
text.

thanks,

greg k-h

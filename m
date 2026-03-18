Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395453DBD43;
	Wed, 18 Mar 2026 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844566; cv=none; b=YahrBynyJCv4+SFr4W9O6gh6ZCGpw1ooMGM6kjzpca7kN5zUiB6xO2S+mutJsaX+v6T0GMNKv4pCFl+z+vCkANUG0RuL6Wia2QwqicL/jrddHy/BavQMf29YFISIRBbrGv3o2fBweGjHP9TQruiwU+tzv/tHTkLW0D5Fcz700V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844566; c=relaxed/simple;
	bh=BJMyTUhset4KimC/hnJ5mRho/6Z6ZQSU723HZFqgbzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftJCtAAVvSm/Sam6k9CH5lovBzvXEhZ/pRgZ1opzEtSnoH9z1Cx4yDS9ROphtROU79p8e5fM4XxV26EINsYpy7HRNtVP12cHNaAOvMetXL9xpr1z0Y77OxlKpqxliCflXakocBW7+Ex0I+T9H9flvLJTNS8FRkc+2Q2mnCAa8wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xiqzzkq9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xiqzzkq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77F5C19421;
	Wed, 18 Mar 2026 14:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844565;
	bh=BJMyTUhset4KimC/hnJ5mRho/6Z6ZQSU723HZFqgbzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xiqzzkq9UUXhrywurESv8MLqTyqa8+du/2HQGvcCqvrAqS25P54OfzsDI2YBRFO6I
	 R1TgWNfWb6ga9Do2GEPNm8LV8SWpcVBFNDkmbMmGIEGSLh75dGHBe6KAtuGePDw8mu
	 EfrQ+JPRmiYp10gUciJPVuslnTVzbk3ez3f/7fyRwwWcbOFmsalpICUdxfCp3SOb7G
	 HeLh1ppG0jRvkmSwa3GXMIKs+xTCE1+mOiMjaTU9f+AC1Q1xcmrYpysbN2FGCGDQSi
	 YTViZzVeYuR/pJiqB17YFfMQvFu9xU9ly7Ujx7WL31xw3zrN9kQd6HayQ7uXQsReix
	 lk2wwNdRG9eww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2s0B-00000000rCO-12uZ;
	Wed, 18 Mar 2026 15:36:03 +0100
Date: Wed, 18 Mar 2026 15:36:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Oskar Ray-Frayssinet <rayfraytech@gmail.com>, dtwlin@gmail.com,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: replace DEFINE_IDR with
 DEFINE_XARRAY_ALLOC in uart.c
Message-ID: <abq4U39uvJYSfdv7@hovoldconsulting.com>
References: <20260317211651.8098-1-rayfraytech@gmail.com>
 <2026031859-nest-booted-56ec@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026031859-nest-booted-56ec@gregkh>

On Wed, Mar 18, 2026 at 03:20:20PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Mar 17, 2026 at 10:16:51PM +0100, Oskar Ray-Frayssinet wrote:
> > Replace deprecated DEFINE_IDR and idr_* functions with the modern
> > DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.
> 
> What tool is causing people to want to do this change that I keep
> rejecting?  Can you please go and fix it?

It's checkpatch:

	WARNING: Deprecated use of 'DEFINE_IDR', prefer 'DEFINE_XARRAY' instead
	#70: FILE: drivers/staging/greybus/uart.c:70:
	+static DEFINE_IDR(tty_minors);

Johan

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4622D30CEC
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXBTjE5g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2ED6C433C7;
	Thu,  5 Oct 2023 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696520994;
	bh=TgPbPYBbJgwN2oCLX+Lek+y4/6PbdViurSWD0n2UUTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXBTjE5gcUOHNxnIq2aL4LwOXH3opTV19XdUTtUj4UaTYQbniCOzPF5+bIOEKOGDp
	 O60nUydPsMA8dhvY6hZUf6U4SK2dZIlj1Rh280yt8FA9eleWLzAJAHSA0tBomwvk7H
	 ww3OJdfEW7U28QCt+PirZy5WMTly3xtVySAdefEbN/SMAwv4w+8f1K44kdPm9zTrHp
	 huZfXvVTc5OSGb2Ar8kCQtik+FSlQx1xvxIyPewZRDEFfeTBYI51xxVA+svQfnMzLL
	 Kbcs7sqCna7Uy0m2JLICkHjrKFOdwEUmbeQTsupYFs9aKlH0Wd//w9sffr40fToyYA
	 qyjGkagqlXghw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qoQc7-0004cK-2T;
	Thu, 05 Oct 2023 17:50:11 +0200
Date: Thu, 5 Oct 2023 17:50:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH 2/3] staging: greybus: authentication: make cap_class
 constant
Message-ID: <ZR7bMwe8k3RR6CuL@hovoldconsulting.com>
References: <2023100533-broadband-hunk-9e91@gregkh>
 <2023100534-showoff-alright-6c95@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023100534-showoff-alright-6c95@gregkh>

On Thu, Oct 05, 2023 at 03:58:35PM +0200, Greg Kroah-Hartman wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, making all 'class' structures to be declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at load time.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Johan Hovold <johan@kernel.org>

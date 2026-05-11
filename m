Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9079E39F172;
	Mon, 11 May 2026 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486006; cv=none; b=kaMuiS4V3xOK1xmottb4AWV5gYy7zbhuYekIiXvrd5AbbhxCgYg9o8BcGxU1MtfkZhCum96HnQmqowtmHvCMgJzp+fNdYm+GNIrk8GaxSUurjHZvUc6/Er9VoZcGd77UieT0l+44WX7ICRY+cL9b4xjB2T0FjQZXIs6aQrf2x90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486006; c=relaxed/simple;
	bh=ya5wG++x5DCGhG/9xVyIKPu4rBCIracriqRThSeH0Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQBLuq+9aYs5GfOUUFRSJkI0EA6tRzuqTrRgXDWtMcdI7fED2ttSw7y2jbE/m1HWplvwvFSIX45ogh/OI+mL3PbhllbNUU3tO01eilh0HLucFduQrEkSKNdpB8LeTp7P4uVGP34T5RT/uzl1cQamf+bxDXDozhB+e3W8a6XaM2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RaEFWYgl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RaEFWYgl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAA0C2BCB0;
	Mon, 11 May 2026 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486006;
	bh=ya5wG++x5DCGhG/9xVyIKPu4rBCIracriqRThSeH0Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RaEFWYglcPsMX/jiVJSxX+fBhrZf9wfocTMlGmxUhi7BWGjpzPdFOggzNZE0QT3O5
	 UtpEdSjgDCCx3uIJxXUNcDACy30pkusJmEjVDegU/D7SO3S7WQ8jlllCb+DpgcWW8O
	 7axlQp6EE/XWCMvsUO19ycF/mE9wBc4XSscsMkmo=
Date: Mon, 11 May 2026 09:53:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] greybus: authentication: validate CAP response
 payload size
Message-ID: <2026051156-hamster-plating-7ae7@gregkh>
References: <20260504233328.7409-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504233328.7409-1-meatuni001@gmail.com>

On Mon, May 04, 2026 at 07:33:28PM -0400, Muhammad Bilal wrote:
> cap_get_ims_certificate() and cap_authenticate() copy variable-length
> response data directly into fixed-size UAPI buffers using the
> untrusted op->response->payload_size value without any bounds checks.
> 
> A malicious or compromised Greybus endpoint can return an oversized
> certificate or signature payload, causing a kernel heap overflow.
> 
> Fix both functions by:
>   - Rejecting responses shorter than sizeof(*response) with -EPROTO.
>   - Rejecting payloads exceeding CAP_CERTIFICATE_MAX_SIZE (1600) or
>     CAP_SIGNATURE_MAX_SIZE (320) with -EMSGSIZE.
>   - Copying only the validated size into the UAPI buffer.
> 
> Fixes: e3eda54d0b5f ("greybus: Add Component Authentication Protocol support")
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
>  drivers/staging/greybus/authentication.c | 34 +++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)

Was this tested on any real greybus devices?

thanks,

greg k-h

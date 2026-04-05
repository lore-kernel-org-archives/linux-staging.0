Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2A19995E;
	Sun,  5 Apr 2026 08:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775376054; cv=none; b=XmSu9pMys+AA9FBbBZg0HaqU9p4fW59p9bcn5ecFaBMu/rTgOPSznbotqujzKQpp2ZlTlY+M/lcJE3KJjAHkGv5m5JemCv/Pl4WrywIGleCQjYC4OoNLuwT9pi929fyKklENUQoAKp5d7lRkIFUt1gB+ILJrPS+L1HvzPywiLoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775376054; c=relaxed/simple;
	bh=7xIAbcYM9oTMkPy0h75pkUozA7f6J1HqrYOWbi9C14c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PM8SNNQzLI+IpBI+TUCNjoon7n/C4mv3rKViZ2Z4g7v4cOSDSI4IRLiNXWe8OuicC+yVfITfqWgoMEb/AjUL0zejf8flTFP9VpItFBtKMmk6Bt283rwCsuzJCMwKJwMAyoYBcjJ5N3vo+ByChqmd0Cx6GdsfPpYDEY8h+v08yBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FL1YUGVh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FL1YUGVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9EEC116C6;
	Sun,  5 Apr 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775376053;
	bh=7xIAbcYM9oTMkPy0h75pkUozA7f6J1HqrYOWbi9C14c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FL1YUGVhloqu1yrBjPSi377eSbEKoTCCZlkHu9sto9OtSisETbj4O4vvLx1KNz/Hr
	 gfU08Slro0DTkB1dJ/2otx8+qgvpqzXS52jezaWTiCNGiNhdC5xVuEOBA0K2TAQqyz
	 3hepmN3PnQY1PQ/i5gJVY+Iam8ErTlpKB0cWMkgo=
Date: Sun, 5 Apr 2026 10:00:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix size_t underflow in
 cap_get_ims_certificate()
Message-ID: <2026040508-portable-natural-47ee@gregkh>
References: <20260404232242.68423-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404232242.68423-1-delenetchior1@gmail.com>

On Sun, Apr 05, 2026 at 12:22:42AM +0100, Delene Tchio Romuald wrote:
> In cap_get_ims_certificate(), the certificate size is computed as:
> 
>   *size = op->response->payload_size - sizeof(*response);
> 
> Both operands are size_t (unsigned), so if a malformed Greybus module
> sends a response with payload_size smaller than sizeof(*response),
> the subtraction wraps to a very large value. The subsequent memcpy()
> then causes a heap buffer overflow.

How can you have a "malformed greybus module"?

Please fix your ai tool's threat model to be realistic :)

thanks,

greg k-h

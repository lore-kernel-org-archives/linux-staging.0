Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1773D4126;
	Wed, 25 Feb 2026 15:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031883; cv=none; b=H89XdS9HMxhJWXW26dgjsqIse33nlS+Sw4gvWb8JBMBjuqz883/dX45jS8ie1j7atpD2+cxw1GoHnJMmlVRGKgYXl97+nS3DRFOGf+pyYsZ1rzw/j3jJHE2NxSU86NT4w4iS84xb9rXXkp78eZYFH4d37LMGGKcXKQBiFUTrrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031883; c=relaxed/simple;
	bh=JcjSM8UPN6S6pGvjcohoXLG9cwhAsyuhQ2IU/A9cLdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0IhWyR58dqgLx3gqIO4mnMdttlDjCUS74ybzMV4Zqw6CIeGo7HDpaTFh4+StVayZWW19mIvzi1XtrkNewEU9qmL2mt1ENwCWnhZqoAEhRHEs5YTJtGTOFODjGynpWNiKceBV1Ea7H5qmNO1SYS65dpFZbIzGyG5FCTChgmlusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xecvfX6l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xecvfX6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E28C116D0;
	Wed, 25 Feb 2026 15:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772031882;
	bh=JcjSM8UPN6S6pGvjcohoXLG9cwhAsyuhQ2IU/A9cLdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xecvfX6lhtft+2bX+H4/3zTN+w3YQcPMBrt4bqmS9H26ZrGOhpJr4iopyBC8gVmv3
	 yTWtRKRYUN8oBSJO9YYX1iqnydmMMv0OR/UtHEuhgIVA+0swDtRKsvWASrD0wluQgl
	 uf4d+dvjtRDz+HL+6PmVDdvELZSpzlIOFznqB9fk=
Date: Wed, 25 Feb 2026 07:04:35 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] staging: greybus: audio: remove unused
 gb_audio_manager_get_module()
Message-ID: <2026022513-kennel-curliness-d783@gregkh>
References: <20260224185421.824210-1-hardik.phalet@pm.me>
 <20260224185421.824210-2-hardik.phalet@pm.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224185421.824210-2-hardik.phalet@pm.me>

On Tue, Feb 24, 2026 at 06:54:59PM +0000, Hardik Phalet wrote:
> gb_audio_manager_get_module() has no in-tree callers. The previously
> reported NULL dereference is therefore unreachable.

What "NULL dereference"?  I'll just drop this sentance from the commit
log when I apply it, thanks.

greg k-h

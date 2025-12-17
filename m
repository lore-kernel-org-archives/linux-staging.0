Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DBF3A4EA9;
	Wed, 17 Dec 2025 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981998; cv=none; b=LcxTMVC8wIJktdrNfETszFSnVpHIeFhOiRxjgrhLnG5j6XPrPLdR4hYZAwBdinlTwUz7OIDvVewKasemD5VOmo5Kt/1dWiuE3vmOCMBvq+I/ByQSefLNKFpGRnKr1G89XEQsMSWTwkRABPfV8XYygwZmVa7oClUNpoCEqXxqBto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981998; c=relaxed/simple;
	bh=V/eWRZrs/Fhw4AKjIcIf/i7kKKiEAr8fGrQf5695eRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfPe2lQEpAkEtKNnS/8eak9qNKIUw3kvYL07tTFJUpxitaew2VVwg7R/+vCKj0/LrfEcZXb8ObtI8caUVz9b3AT4VOtEc1+iyvZ+h2OKdwk881mPETMn9PeFsA50JoAQPzuVnkvsAn+RmggqaYKYJ2kuH+C74TIbjuT/B3Z6j+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CRyC6KFu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CRyC6KFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C102C113D0;
	Wed, 17 Dec 2025 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765981997;
	bh=V/eWRZrs/Fhw4AKjIcIf/i7kKKiEAr8fGrQf5695eRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRyC6KFug9M2A/iG3CxuuKWETQYeTfr7bcMlt/CeOzyoU6Z3UCLvMipQvGXnaoNNb
	 r2f0MM4VnbQvWmWQd7K9k1o1bVE36uqezwanrQvR1yA0TfgZNQIgiWlltqAgS+pvtB
	 +pxy8jcQdPpu21rZmFeqPJBhAKg/k0Ol1bnXP+JU=
Date: Wed, 17 Dec 2025 15:33:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sanghyeon Lee <sanghae778@gmail.com>
Cc: karanja99erick@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: remove unnecessary braces
Message-ID: <2025121740-herald-silent-3a45@gregkh>
References: <20251217142444.5530-1-sanghae778@gmail.com>
 <20251217142444.5530-2-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217142444.5530-2-sanghae778@gmail.com>

On Wed, Dec 17, 2025 at 02:24:43PM +0000, Sanghyeon Lee wrote:
> This patch fixes coding style issues reported by checkpatch.pl in
> odm_CfoTracking.c
> 
> The change include:
> 1. Removing unnecessary braces {} from single-line conditional
>    statements.

No need to list a single item, right?

Look at existing commits for examples of how to write a changelog.

> 
> The change verify clean with checkpatch.pl.

That should be implied, no need to say it.

> 
> thanks,
> 
> Sanghyeon Lee

No need for those lines, right?

thanks,

greg k-h

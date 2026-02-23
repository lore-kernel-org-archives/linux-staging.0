Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C745118DB35;
	Mon, 23 Feb 2026 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859538; cv=none; b=CPiEv8MyvYqo+q2Fa8m8h5YhzSpAsCkWL4yo6w52hAYhZzMeteaXvnPvgkw2EFwHf5IqowKT5reMFlAdNDd4oKtEDI1o1Fs+G82urJhBVRkUw4o9XMyUPwP9ARNYeas4FZMCnctLGk4ruVa/FJIt6LHAFUmJSq945GxDre45Z0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859538; c=relaxed/simple;
	bh=RywnlArZ76pmkNNB1w1PEHZ1tllVu78T4oOaApEccSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGPErfu4ESHlswqoO7zkb7Gd2x5kmb/Zlm0LqKEMAWILPFD5NN6N26NWApvqhviF4r/3s3YB4J4HjgawFbBc7mzfjdTO5M+5Aq+F6BdqtxjmzoS3PuEab+uxz09b7mhoxBzj7Lo4LGu7DiSGStlRfA9MWsB+c4H6Fvf22XWaXRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DEvE3gsd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DEvE3gsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77B5C116C6;
	Mon, 23 Feb 2026 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771859538;
	bh=RywnlArZ76pmkNNB1w1PEHZ1tllVu78T4oOaApEccSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEvE3gsdqTB4Aq6epepTBfugB5GFT66QGPOi+NyVKtss6wUMgtpauFkmldfP7WOfx
	 Zogbu8HKEjtIfJ82uNXw5ZNGzRmZD+PUbHZiIDdMxYL5O39BhvozlSem0hQRc7Up7f
	 2+f+0J95UjttQMpNnmureOy3x81M0D5hc3xQUtKA=
Date: Mon, 23 Feb 2026 16:11:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: tomasz.unger@yahoo.pl
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix spelling mistakes and comment
 format
Message-ID: <2026022329-print-hardened-8c8f@gregkh>
References: <20260221120719.16147-1-tomasz.unger.ref@yahoo.pl>
 <20260221120719.16147-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221120719.16147-1-tomasz.unger@yahoo.pl>

On Sat, Feb 21, 2026 at 01:07:19PM +0100, tomasz.unger@yahoo.pl wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
> 
> Fix spelling mistakes in comments:
> - 'alloction' -> 'allocation'
> - 'overwirte' -> 'overwrite'
> - 'indx' -> 'index'
> 
> Also convert a long single-line comment to multi-line format
> as per coding-style.rst.

That is 2 different things, this should be 2 different patches :(

Please resend this as a patch series.

thanks,

greg k-h

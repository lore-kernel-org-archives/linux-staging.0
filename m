Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9C25B2F4;
	Mon, 12 Jan 2026 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210402; cv=none; b=KAh0vQQzGuzrgJUDsAOKmCS8HbOo3HCFuNXrOMYco3Z3zW0FDO1bEbS6+mJSAEQPVgmGi4q/eBBrRenWygBCKGaldSxz7ld40YCj2bfhm94ULmZCorWEb9cBCncvrHAhFgJtJZNOhfJrhE6z0hzMcS1Q7AZfzQhuMEF/INoXPa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210402; c=relaxed/simple;
	bh=ni5hny6d+KJop86tGfisMx9zOsrunSMSrhAqK7h/0NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdkJytZqg5NMICVMbiKxDUQ0FRja3O+s+1W5zM66ZYko0NexqZI3OdKMq2NeHqdNaBG7RCtdAxVE0ChoSmcvdiD/GmbkAI40obBNP6fkdEIu93RrJ4HVDevyutWIJXU84gIEINMWAK8sAVNZOZ5zMtGfOYKfbopgixCo8N2YrtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=10auBAsc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="10auBAsc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F5DC16AAE;
	Mon, 12 Jan 2026 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768210402;
	bh=ni5hny6d+KJop86tGfisMx9zOsrunSMSrhAqK7h/0NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=10auBAscoqV8fFzBJkA/r4ye/DcAH0hikaPVzjeiTT+eELbq04zvXulL7JMZvq0sB
	 FBx8Bkx4O2mpQwIWleoB5tzaLwbGptsIQFDwtg/s9+KEDHqzLSWT36v2zZURiE/PH+
	 D09xaYlIfy5y8Dzpb0wPrRuRTV+1C5+p8yQA+jkM=
Date: Mon, 12 Jan 2026 10:33:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/4] staging: rtl8723bs: coding style fixes
Message-ID: <2026011210-unstuffed-undrafted-eadf@gregkh>
References: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112043429.42615-1-nayana.mariyappa@gmail.com>

On Mon, Jan 12, 2026 at 04:34:25AM +0000, Nayana Mariyappa wrote:
> This is a series of 4 small coding style fixes for rtl8723bs. Each patch is
> self-contained and focuses on a single logical change, as requested.
> 
> Changes since v1:
> - Split the original patch into 4 separate patches.
> - Each patch now fixes one coding style issue.
> 
> Patches in this series:
> 
> 1/4 staging: rtl8723bs: fix block comment style
> 2/4 staging: rtl8723bs: remove extra blank lines
> 3/4 staging: rtl8723bs: add blank lines after declarations
> 4/4 staging: rtl8723bs: expand multiple assignment into separate statements
> 
> Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
> 

This should have been v3, right?

thanks,

greg k-h

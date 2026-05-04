Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA863DF011;
	Mon,  4 May 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906585; cv=none; b=rthfbhXYMuQHU1lDv95cYwjRYpwG7aVGRK4OMvzwEGHJ8Ybbw+xY8aR+kB9h+6R6I1u2b5aONEorbLhSdAI3HWncoQFQU36WsbVcmjh2Z5vtyB/0Mw/VmoELAQ5MzNe1JtFu6xCoXFVcqY5SrKV2ZaQHxMlMouvSgL7djIObLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906585; c=relaxed/simple;
	bh=1qzY/fqa/tkNGzecJkmK/Uk/wYknyLKog4xmXEyTeEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikcJC6m45XtS1UU4yGaFUk3DCcXwgsvUtL3uIfIG4hHfqoue/BpqWYruprFausNuGUuOGjjFjaTBAm9CXg2Ek893aW6p3h41xe3pMLoyHPv8TiZXn1ZpMJHzrtARnQhZ1/av7aXshcI75/3csSFrOeDbALFWMVHfvSf7dZZh87s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W86QdFiG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W86QdFiG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE08C2BCF5;
	Mon,  4 May 2026 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906585;
	bh=1qzY/fqa/tkNGzecJkmK/Uk/wYknyLKog4xmXEyTeEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W86QdFiGzd1J+47JMEXh1idEKNCUsC1Lr2IQqG0lTXvYv04aLOMN7wBTHgvCcwdmY
	 xlwMJ460d8gSg+P9T88gKCNf2UTXvlgKwNcIRep/MDangjk1ACrj/r7VeaecB2fW+E
	 S4WUqW5AaaLtngyD6awIWxneQIs0+kCYd340ueyM=
Date: Mon, 4 May 2026 16:20:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] staging: octeon: ethernet-mem: replace pr_warn
 with dev_warn in free functions
Message-ID: <2026050441-earwig-bamboo-a28c@gregkh>
References: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
 <20260427151556.91153-2-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427151556.91153-2-ayushmukkanwar@gmail.com>

On Mon, Apr 27, 2026 at 08:45:52PM +0530, Ayush Mukkanwar wrote:
> Replace pr_warn() calls with dev_warn() in the hardware pool free
> functions (cvm_oct_free_hw_skbuff and cvm_oct_free_hw_memory)
> to include device information in log messages. The struct device
> pointer is passed from cvm_oct_remove() through
> cvm_oct_mem_empty_fpa() to the internal free functions.

Why aren't you passing through the platform device pointer?  Why deal
with the "raw" struct device?  Always try to keep the "highest level"
pointer to work with where ever possible.

thanks,

greg k-h

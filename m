Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A19363095;
	Mon, 27 Apr 2026 03:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261824; cv=none; b=TbTLU3KGRjmFpB68ebR4rLvne1MNIc07BqWPGkahko5Ie1pvvyXfbvV7kUGTAFr2QYMwBpRiPr0PNUYEX9Fj8fuaL3Hm77TfIFpDr0riiDqzov8nA43npuAseVxEVlQo/lq2o8gNEoYj49z6hoWkVXOWTFHjya8bgXAGvW6RXvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261824; c=relaxed/simple;
	bh=OqhDdNeXtq2P3xM+JgNGvMqP05j5VVHlyB7OUS7VK0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0I2Sn//kTNJtOEEsqJem8QNqcos9kPuUCohwQ/ZFMd6c+03/zKp9eS+I0LwfSbFoFyO0GWhdqoaisZfBoADUDhrOikgXUk3Bw6m5+c12giLtm1twk4fWzcfmB86Vqv3gp4fnS51uhTxPHyufnFWdAmoiqwPUGJjemGvhvgKebY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FadIunEK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FadIunEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC9CC2BCB7;
	Mon, 27 Apr 2026 03:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261824;
	bh=OqhDdNeXtq2P3xM+JgNGvMqP05j5VVHlyB7OUS7VK0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FadIunEKhOh/jdxmDkhUWDPUmlZboRGf1I7IvMIARFClSGK+SdprFuvzdnsa8rVhl
	 sDWVI+eWR9bqQ3Cro57u04QFqnNTz0XdzvuY8L8J2UZOav7Qtj/KlJn2w+e43Fsd5K
	 BnDNm4b3ZWQYAhwhRGZaK+eNQYubyW6JGMQGnIUc=
Date: Sun, 26 Apr 2026 20:58:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] staging: octeon: ethernet-mem: replace pr_warn
 with dev_warn in free functions
Message-ID: <2026042635-sighing-arrive-5f29@gregkh>
References: <20260405141111.87925-1-ayushmukkanwar@gmail.com>
 <20260405141111.87925-2-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405141111.87925-2-ayushmukkanwar@gmail.com>

On Sun, Apr 05, 2026 at 07:41:08PM +0530, Ayush Mukkanwar wrote:
> Replace pr_warn() calls with dev_warn() in the hardware pool free
> functions (cvm_oct_free_hw_skbuff and cvm_oct_free_hw_memory)
> to include device information in log messages. The struct device
> pointer is passed from cvm_oct_remove() through
> cvm_oct_mem_empty_fpa() to the internal free functions.

This should be passing the platform device around, not the struct device
child, right?  You should keep it as close to the original device
pointer as possible.

thanks,

greg k-h

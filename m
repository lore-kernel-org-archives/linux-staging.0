Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8162BF3F4;
	Mon,  9 Mar 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075253; cv=none; b=QjsLHwvL98MMsuSp50+ucvSiCUEOmMQl6sr3dkc6QVpTH2rd2xjwRH3s1YXvPTFTumgMXn39n9IGtGJdEm6pij89Lx88vI6Abd2yrIq/0Po1x3f+u1UjGK16jxtVh7lKcBLSuGvnrLXMH0tqzH6w5JVEoJhYhIZQu29EbEvXyZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075253; c=relaxed/simple;
	bh=0+NG9twvwPRs7mLXxhIBZCItIpGwjtRSvU77M30eG+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnjjxYHluray8Pni8KBPRJlboRSg5vHdfy+9pXwEc9UA8kvDCNnAFYQx2QRcpOgM8HwgmxgM7ZoEFfNuyrW4nteMho7cap+vMm7UrxonlZI2VdmPOmXv5Dtqbn4ytDRB7kAOVMNvk2dAi+DZfd1obPZvLWO2iMoSNiiWJqv2lkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HpV/8NYw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HpV/8NYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F169DC2BCB0;
	Mon,  9 Mar 2026 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773075253;
	bh=0+NG9twvwPRs7mLXxhIBZCItIpGwjtRSvU77M30eG+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpV/8NYw7N5v8d9as7Qsshc1caqjugJ9xwKN4pd7kPLQBdB5m6LTGSI948Zly9Pna
	 OPHskME3N/DAAc1dAX7MdPxOfESMIXephUiWHE380UNIUVEJybcm7DoYsrf6P3s7KB
	 8ut8eq+y4xuQMBCeMQLXhNZm083QNAEXiYY4OsRw=
Date: Mon, 9 Mar 2026 17:54:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove Hungarian notation from
 booleans
Message-ID: <2026030958-attentive-sporting-97ce@gregkh>
References: <20260308192734.186757-1-azpijr@gmail.com>
 <20260308192734.186757-2-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308192734.186757-2-azpijr@gmail.com>

On Sun, Mar 08, 2026 at 08:27:16PM +0100, Jose A. Perez de Azpillaga wrote:
> Remove Hungarian notation to snake_case to improve readability.
> 
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

Please only rename one variable at a time.

thanks,

greg k-h

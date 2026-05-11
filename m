Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B637B01C;
	Mon, 11 May 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503011; cv=none; b=FllibZFsytCE9N57JNZSdOMsPTsR/Qw291c2WghzLmjraw0E5Uo9iagw3EpdYjvVc1Ty1H8WTd95qZrAaoF3KSC8Kz1Z42x+TCetwz7CeS+mHiq1RFK8TgANpH3muaTUsIAh1/3pBHBOcQdkH3U9fVbhWnHN9r8w3J8Yl2bNFFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503011; c=relaxed/simple;
	bh=wSf8Yj543MfpEXpvXvoA6Z7kuRiTzZ8BevSv9fKsEGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EB4ttLSFS+C24BZGU4+HhmofNJk5ULUmq7h60E9T0+eRkmgY9mrddXGi2umoPoLKyQr5vY2SmBN7k6/Do3mcYXywRedNLVWHLHF1fZovkJsmXC5vaxbL/AJvBv+fdm2NYQtWXf/iwTZ8UD++VfYtB3QyMB8v96ZsXm09xVmtBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dfl9S5va; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dfl9S5va"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910F4C2BCB0;
	Mon, 11 May 2026 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778503010;
	bh=wSf8Yj543MfpEXpvXvoA6Z7kuRiTzZ8BevSv9fKsEGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dfl9S5vaHDNeBc6jnfVanXqOrWHcjQGyzq9vP6N/IruiHY5lRf1q8aU9cSuuvjRfb
	 7QTEeNddx9ESOSthE/ZsWRRMlNp6A3KiIYbZ8noo2RxxC8iVj9Tx7xHn5i5BBwFTQZ
	 lzY+QUMCTQBJrBfhgzS23Ex1FJdpmintZVDDfckk=
Date: Mon, 11 May 2026 14:36:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] staging: rtl8723bs: fix OOB write and read in
 HT_caps_handler and OnAssocRsp
Message-ID: <2026051127-outfield-crushing-d8c5@gregkh>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com>
 <20260505172214.3650398-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505172214.3650398-1-hossu.alexandru@gmail.com>

On Tue, May 05, 2026 at 07:22:12PM +0200, Alexandru Hossu wrote:
> v4, addressing the sashiko review comments on v3.

What about these review comments:
	https://sashiko.dev/#/patchset/20260505172214.3650398-1-hossu.alexandru@gmail.com

thanks,

greg k-h

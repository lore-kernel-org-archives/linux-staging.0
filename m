Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6565A3A6EF1;
	Wed,  4 Mar 2026 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635716; cv=none; b=BA8L35RdQwr69U+7NBo6J8Z2Fy8Ff1VuD/rWu5j3cHpB522ndfI5YyR+6mLVMZUCzL7poFI9Udm4vi0FxU/Gacp7UFuTrb6b3Zf0P8Ntovdo70kMBkDOoIQlsyi5XvSm1Cv3TXE0OE599S6EIzHZGjWWnE4WbU0d71M7h/yprnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635716; c=relaxed/simple;
	bh=BBFx8LaV0vtFeADXn+pvQkVTo/ng7wN4bxU49LWqihk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGbnUHUrmrjejxjqpZQn1T/rwW5253r4N3GWRG11vdMUWy4RBTmKN9NP9190qPgJj2OxH8334Xe2qNWpOMHpcNMLFv3groBFu0Aqj8oOY/h9nKRPgYjFGcuYI0H+0qtUESnX8MtjeoKsGJK7T0QEiYeJ07KuJAdpeVC5avEz8jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ufeNQQ4K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ufeNQQ4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C88AC4CEF7;
	Wed,  4 Mar 2026 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772635715;
	bh=BBFx8LaV0vtFeADXn+pvQkVTo/ng7wN4bxU49LWqihk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufeNQQ4K59C7tNDXMf4cfwkDBZgCeQPwr8PqdZwSovc4y/MWrcPHt1fpzmhMvWkrN
	 yOhZGBUTAEIYCTNRK6ooNLGxBP61xRYh6DO+hsNZ97/E6Y1gVQ1sqKSp7sfzlTxdkf
	 06jWPqewIVDhX/aNy1/MsJ5o9pOvyUmGy48/MZcg=
Date: Wed, 4 Mar 2026 15:48:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: replace alloc+memcpy with kmemdup
Message-ID: <2026030402-enlarging-zipfile-6ed4@gregkh>
References: <20260304130706.37347-1-hossu.alexandru@gmail.com>
 <20260304135914.38286-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304135914.38286-1-hossu.alexandru@gmail.com>

On Wed, Mar 04, 2026 at 02:59:14PM +0100, Alexandru Hossu wrote:
> Replace open-coded alloc+memcpy patterns with kmemdup().
> 
> This simplifies the code and avoids manual size/copy handling.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> 
> v4:
>   - Drop unrelated DT binding changes from earlier attempts.
>   - Include both rtl8723bs changes in one staging-only patch.
>   - Wrap long line reported by checkpatch.
> 
> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c          | 3 +--
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Please slow down and read the documentation that my bot pointed you at.
The version information here is not done properly :(

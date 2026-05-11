Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A89370D69;
	Mon, 11 May 2026 12:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503385; cv=none; b=FY3jJjUEB6i4R3eWqCgDdkVTdium/OJe4zRfGxgz60Be54ncGAss9s/bHWMCyLut3DPu+35bN/+97pwL9jfA2rVUgFZeDWviwYQlOQgxsG8JTM3zgXEogKWUmefFrVGXcvxkzsMOxo+LjIUhEL53ibTE9h1PsxGPGzryeqxu9/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503385; c=relaxed/simple;
	bh=kEh3ZMa0fd/LZcQOD42d4AjqK7iaw/I2FabCleunhzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVCoFGrIPm+ZKpZpG8gUimwXvQe+9mpCMfFa2D+56+JPvxvfsTT3Qw/+/1BUuh0ZkrMKTiOze7lMWVfQBE7zFHHChm7eUx49BtCBeVGBn03b4kOlidPsTXEx0gscEIy3LOxlhyaHo+/YynVMtdzep3zrW7GDoNQmN/UG/o1iph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=votjO450; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="votjO450"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD20DC2BCB0;
	Mon, 11 May 2026 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778503385;
	bh=kEh3ZMa0fd/LZcQOD42d4AjqK7iaw/I2FabCleunhzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=votjO450GAZurM/EMRlTMNBtEGrRNHaoaas2hZCTdG7wLCRYWnDkI5HM/ShKI851e
	 a3dsGDFCUmMGvBK+JjVmJoBnh7HsmoZ6uDl8EcvV77FjkiQcJErnAVldVIhDBsbuw8
	 honyflk9iWnVkTfuurZgs+VR5pZdypgS35Z8GFH8=
Date: Mon, 11 May 2026 14:43:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, stable@vger.kernel.org, luka.gejak@linux.dev,
	hansg@kernel.org
Subject: Re: [PATCH v7 0/2] staging: rtl8723bs: fix OOB reads in OnAuth() and
 OnAuthClient()
Message-ID: <2026051148-broom-rut-4391@gregkh>
References: <2026050453-scorer-rebate-3898@gregkh>
 <20260505211316.3837020-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505211316.3837020-1-hossu.alexandru@gmail.com>

On Tue, May 05, 2026 at 11:13:14PM +0200, Alexandru Hossu wrote:
> v7, addressing the sashiko review comments on v6.

Some more comments on your patch 2/2:
	https://sashiko.dev/#/patchset/20260505211316.3837020-1-hossu.alexandru@gmail.com

thanks,

greg k-h

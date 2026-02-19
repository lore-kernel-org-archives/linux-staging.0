Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BB27EFE9;
	Thu, 19 Feb 2026 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771502296; cv=none; b=hALEsmY2AE72Xyz+EbnBiLN6GC+KpA9gfKhl6B9oeB/haDiZU81UeqvXTHyBqwROUMvPf+7slA3Zik9Hu3PnJ8u5Ieh0bKjjWds8VCPybChI0AO04/oB2uc+oYPKatmzwWcmkf6W9pi+8S2wNsW+5mioA2QlU/88p3AI1NdgrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771502296; c=relaxed/simple;
	bh=IiQuLfoGHRkM0JIlUCTvVWYJ5NioA6NvgyZT6wtXrCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvH0O+sE01srWc3pT4ydH3qZLrCOatw9xrMdlOhYsP+xc67tWnBjCdLNFcHcOse4o64ZmQRTWMnGDwx66aeBCr6mIMqSkTjvIcdnr1wxHJoeL2MX2tvv8qlYGPJ3tWMT4xU61cX0zNBlB6Sa+PHhjOq6ZcHW+Nm3iWnjKVb0M+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0vvmDVnY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0vvmDVnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F60C4CEF7;
	Thu, 19 Feb 2026 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771502295;
	bh=IiQuLfoGHRkM0JIlUCTvVWYJ5NioA6NvgyZT6wtXrCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0vvmDVnYjPuuCCt7ily0OPA1OMl1f/opjhND+9PnVSNghoAUsNe26SMAFTyZN82GZ
	 4RM5pUfu7u6/xXbZkLEQ3lyHgnfir/+qHLFRXMxIeIvpFTbq5ABiW1lWIUrzCNfeRA
	 EyzVg+BxRrSIYgmSmdNMzJm3Oto1SRDSIaieXBGs=
Date: Thu, 19 Feb 2026 12:58:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: andy@kernel.org, dave.hansen@linux.intel.com, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, tony.luck@intel.com
Subject: Re: [PATCH v5] staging: media: atomisp: Fix typos and formatting in
 headers
Message-ID: <2026021900-tarantula-unturned-1ab2@gregkh>
References: <20260209162026.18907-1-hamdankhan212@gmail.com>
 <20260219114849.12675-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219114849.12675-1-hamdankhan212@gmail.com>

On Thu, Feb 19, 2026 at 04:48:48PM +0500, Hamdan Khan wrote:
> Hi,
> 
> Gentle ping on this patch.
> Please let me know if any additional changes are required from my side.

Sorry, but I do not see any context here as to what patch you are
replying to.  Which one is it?

Also, remember that this is the middle of the merge window, no
maintainer can take new stuff like this until after -rc1 is out.  And
even then, stuff like this goes down the list compared to bugfixes and
new features.  There is no rush here, patches will be reviewed in time.

thanks,

greg k-h

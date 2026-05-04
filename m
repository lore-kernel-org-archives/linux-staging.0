Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED4637C916;
	Mon,  4 May 2026 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887322; cv=none; b=sWcCzTqLIwU6vC1d4Fjz68C9xA3O+hFBStyP2VQuDDrfCNHLEBd67UkO1j3xt1ilhfhOtMlmk7v3rW1GRqFuGlUYTTXlyWkHYOKP9DlHLQD/bVOCuYYEe7piESn8OHJWRpxAAJJtOdYO/or0iG0jySoeT8slAT75oVEYa5i8MgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887322; c=relaxed/simple;
	bh=jZdqtpCQPPnGAzvlXzvlcKZDNzXGWxtPWRCYbqEoKpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Onjs4PdIXRTsl50AZRf9IOlRlukWC4qAiTsEiUvE/ZjDohlM0IopjPuc262nTylYvsFSx/yNIBXdlgwIyfXSAI7rfKxSV0DSIC3arBgTU0x3mPSytz4V85o6TRNQYyuO+bmxAO59pO5hGL3+O4eu1unlKqmpQFhBphzwOGSUn0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i4yJ6mAQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i4yJ6mAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717CDC2BCB8;
	Mon,  4 May 2026 09:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777887321;
	bh=jZdqtpCQPPnGAzvlXzvlcKZDNzXGWxtPWRCYbqEoKpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4yJ6mAQVJRg3mF216mSO+534NGg/aVAW0xsrZq7nV5ztiEn11SezdJnqA3RWnk6Q
	 Y/P8MjwGcF6iRDtkj5gb1gJCDKY8hop1blNAniMsWeDJkdOMFHKhaC4h4pdIFexROH
	 JW6mcnte/XbT0CRsUIMUxkuYKa5TOY2fd4+UPdf4=
Date: Mon, 4 May 2026 11:35:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Salman Alghamdi <me@cipherat.com>
Cc: luka.gejak@linux.dev, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/8] staging: rtl8723bs: fix buffer over-read in
 rtw_update_protection
Message-ID: <2026050434-construct-starter-5468@gregkh>
References: <20260428164513.763471-1-me@cipherat.com>
 <20260428164513.763471-2-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428164513.763471-2-me@cipherat.com>

On Tue, Apr 28, 2026 at 07:44:31PM +0300, Salman Alghamdi wrote:
> rtw_update_protection() is called with a pointer offset into the
> ies buffer but the full ie_length is passed, causing a potential
> buffer over-read.
> 
> Fixes: e945c43df60b ("Staging: rtl8723bs: Delete dead code from update_current_network()")
> Fixes: d3fcee1b78a5 ("staging: rtl8723bs: fix camel case in struct wlan_bssid_ex")
> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-staging/DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev
> Cc: stable@vger.kernel.org
> Signed-off-by: Salman Alghamdi <me@cipherat.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

You should not mix patches for the current release (i.e. this one), with
patches for the next release (i.e. the rest of the patches in this
series), as that means I can't take the full series for either :(

Please break this up into two different sets of patches and resend them
that way.

thanks,

greg k-h

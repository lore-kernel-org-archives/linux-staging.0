Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B423815B;
	Sat, 23 May 2026 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779543897; cv=none; b=sPBfdEsjjI7sWTrnD+bexqxuc8Je0nvKc5jDYQw9fypVeDH+Z4dWp3I0EDxcS+hb57zYEZ/3ij9IuhIwPrqRe11LVTxX1apHB+bKIeytYki9ZL7S1WxFMpLY8IKC/q2qFN361zFdgzRMxmx1ElhDAxyhSMrBRMY47bJdUHvrFxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779543897; c=relaxed/simple;
	bh=OLv1HrPYJSXCxMSlLTA1lfVlwTSTtjktRE9KRl2cn+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHdqEWlgT1gE5DWvgLrxrLBGbAeTVT1HS1yblpKOL/PMyshy/6DI2TqFn1O45ax3VZT3v2Xn2TLQi38c2nW05hW7oUyiWMZPzny52lisNMu+EkhmYRyVh2P4li6lwuiOupP2SVniJvnuWSuEOu4PO7TEv4/DsMFPEZtALE9i8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l8EdNMf3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l8EdNMf3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E8F1F000E9;
	Sat, 23 May 2026 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779543895;
	bh=afvmokss5/WE8sKXQFMNkAJHTVJCauMFQItfzSJYjV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8EdNMf3L8Xfh+2TfBz9l9OoLX5eDZVXYAG7drXLvWc38fDPZFD2xjayAezcIoTTO
	 wtGsIDUB+VWTL98VfhmSGHcKhlwkzti3+H+6l3OKHK2Yf4lWm50w4uJWmYV0kelZXE
	 q79QjazDT/FQR3dLWyB55vZDwKike3iPeCcVROzk=
Date: Sat, 23 May 2026 15:44:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v7] staging: rtl8723bs: fix remote heap info disclosure
 and OOB reads
Message-ID: <2026052313-magnetism-platinum-7ee6@gregkh>
References: <20260523131331.69768-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523131331.69768-1-luka.gejak@linux.dev>

On Sat, May 23, 2026 at 03:13:31PM +0200, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> When building an association request frame, the driver iterates over
> the ies received from the ap. In several places, the driver trusts the
> attacker-controlled pIE->length without validating that it meets the
> minimum expected size for the respective ie.
> 
> For WLAN_EID_HT_CAPABILITY, this causes an oob read of adjacent heap
> memory which is then transmitted over the air (remote heap information
> disclosure). For WLAN_EID_VENDOR_SPECIFIC, it causes two separate oob
> reads: one when checking the 4-byte oui, and another when copying the
> 14-byte wps ie.
> 
> Fix these issues by adding upper-bound checks at the start of the loop
> to ensure the ie fits within the buffer, and explicit lower-bound
> checks to return a failure if the length is insufficient. For
> HT_CAPABILITY, also clamp the length passed to rtw_set_ie() to the
> struct size.
> 
> Also fix three additional issues discovered during review:
> - Missing free of pmgntframe and its xmitbuf before jumping to exit
>   in the WLAN_EID_VENDOR_SPECIFIC lower-bound checks.
> - In is_ap_in_tkip(), add missing lower-bound checks for the RSN and
>   vendor-specific IE data accesses (pre-existing bug).
> - Move rtw_buf_update() before dump_mgntframe() to avoid a potential
>   use-after-free of pwlanhdr, which points into the mgmt frame buffer
>   (pre-existing bug).

When you say "also" that implies you need to break this patch up into
smaller pieces, right?  Please do so.

> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
> Changes in v7:
>  - Address new sashiko comments.
> 

That does not say _what_ you did, only that you did _something_.  Please
be more specific.

thanks,

greg k-h

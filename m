Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E479381B13;
	Mon, 11 May 2026 12:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502954; cv=none; b=eTP4EE/Ld0IujOf6GSro276unzO70tFxuP+8MvWbqHevs2e61Gy7k00zSW/V8LYghYHFp48+Ra1TjrErL/Mgn5po1r1D/w14129VOkCytKlA2AHbMPnmASHIQiZyQ7u0QUXf2PCS77orQArzxZdgaZXmOa2yyhf0o9E0tNiQh/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502954; c=relaxed/simple;
	bh=/1TfUMIRUq0ugEX2axuVMQR7jVeiCCs8I/n0zDxDk/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hixAoWTq5gWmb7rhmSMFUXI6pNFu5N0uDeCtdPPLZXsn2eIs9636CqG/Uwkw0LKZb+Z5Re+VmlqlRqghPtGnMOaDQTICBfLFc/Eu8BxEWxixIgDqHKiu4fOEqrtD4oFtEufKuo5QagO3MEQqoAOT0RF/v0+JGBk5qodAyJaQXUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uoXLDJ0J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uoXLDJ0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A3EC2BCB0;
	Mon, 11 May 2026 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778502953;
	bh=/1TfUMIRUq0ugEX2axuVMQR7jVeiCCs8I/n0zDxDk/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoXLDJ0J4A7PBkYcPCxyuoQvj7oxzO5Htlwk33aU6HJ3E6Cs5xuOfcL1JZgTRyg5+
	 PYzAkg8cONxfI9rVXRFpFxEczzwuHZEHKNQWCPEMRSbZ1a1c1JED3ljjrTSSmlPmZO
	 Ow9Z4mx4yE97KooQzSvuqlmPJUQXyD+wI/4CfA2U=
Date: Mon, 11 May 2026 14:35:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] staging: rtl8723bs: fix OOB write and read in
 HT_caps_handler and OnAssocRsp
Message-ID: <2026051157-dictate-traverse-684c@gregkh>
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
> 
> Regarding your questions:
> 
> The two patches to drop from your tree are the ones applied from v2:
> 
>   41a866092f09 ("staging: rtl8723bs: fix OOB write in HT_caps_handler()")

I have no such git id in my tree, where is this coming from?


>   e36c54247447 ("staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop")

Same here, where is that git id in my tree?  What branch?

totally confused.

> v4 supersedes both.

What happened to v3?

> Regarding hardware: I do not have rtl8723bs hardware available.  The
> patches are derived from reading the code, cross-checking against the
> 802.11 spec, and comparing against the existing HT_info_handler() guard
> pattern in the same file.
> 
> What changed in v4:
> 
> Patch 1 (HT_caps_handler):
>   The v3 umin() loop bounded the write side correctly, but three macros
>   that run after the loop access pIE->data[0] and pIE->data[1]
>   unconditionally.  If pIE->length is 0 or 1 those reads go out of
>   bounds.  Added if (pIE->length < 2) return; placed after
>   HT_caps_enable = 1 so that HT negotiation is not regressed.
> 
> Patch 2 (OnAssocRsp):
>   Two additional issues found by sashiko:
>   - The fixed-field reads (capability, status, AID) at
>     pframe + WLAN_HDR_A3_LEN + {0,2,4} run without any minimum frame
>     length check.  Added if (pkt_len < WLAN_HDR_A3_LEN + 6) return _FAIL.
>   - The WMM OUI comparison (memcmp of 6 bytes) ran without checking
>     pIE->length >= 6.  An IE with length < 6 at the end of the packet
>     caused the memcmp to read into adjacent frame data.  Added
>     pIE->length >= 6 guard.

what changed in the previous versions?  You have to list them all.

And you have 3 different sets of patches I see, why is this not all one
big series?  What is the order of these different sets?

really really confused now...

greg k-h

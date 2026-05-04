Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10773DF004;
	Mon,  4 May 2026 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906568; cv=none; b=Vqt8z3Uh9xzNJJx6etSbIF5VGOTxQFKw0W4wdK2xwe7B5zzpm3816aCRZbYQ4o3g5b5NWplpCjRcn8dfN0T+ot5gruVxKjQiqG0sHBLDkMecUEXKx7eX20oXrJa+4ESt0qzQ1tMFfqBpCVMhGxeMm4kLBxlyHYTzVOd2fpDAvWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906568; c=relaxed/simple;
	bh=jruEb/NyIFgT0DdxI1zyADLXvooGcvwt+nN8fQmeFqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibdTQmEUj5YfWrjMZ9SDpwmcCjUd/jdPVgtATNtujriLFo2vfXkVQiLnEqAzpMrlwEvY3DJoQ0JQUGCHgSIWhq9tjMyB6wKNV4DcH/jNpuY2FmW4wLCqI8z55YVchiDWTw/7Xw2rBKygo0iNmDTQ3G3T0WXfxJlpsw3NYxiaZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2v0g4wA6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2v0g4wA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264A5C2BCB8;
	Mon,  4 May 2026 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906567;
	bh=jruEb/NyIFgT0DdxI1zyADLXvooGcvwt+nN8fQmeFqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2v0g4wA6SSS/zhLzYpGLqcn7sA7vNBP1feAgSTTanM0ruEXIsh9YRlKM5lEJmHDfp
	 GCoWhxrR4xh4Rr5liVMWVVg6T37g3zft2wSI9PEMOZfkLXWEH54oaRgB5E9r90wQl1
	 J8fbJeEV3Df0qJNFGmGDP7PLxl524JzbMWmC2ftk=
Date: Mon, 4 May 2026 16:11:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: error27@gmail.com, luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 0/5] staging: rtl8723bs: fix multiple security
 vulnerabilities
Message-ID: <2026050450-tinkling-surname-bb4a@gregkh>
References: <20260417061048.62484-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417061048.62484-1-delenetchior1@gmail.com>

On Fri, Apr 17, 2026 at 07:10:43AM +0100, Delene Tchio Romuald wrote:
> This series fixes five remotely-triggerable memory safety issues in
> the rtl8723bs driver. All of them are reachable from the air by an
> attacker within WiFi radio range, without authentication, via
> crafted management or data frames:
> 
>   1. Heap buffer overflow in recvframe_defrag() when reassembling
>      fragmented frames whose total payload exceeds the receive
>      buffer capacity.
>   2. Integer underflow in TKIP MIC verification when a frame is
>      shorter than the sum of header, IV, ICV and MIC sizes.
>   3. Out-of-bounds read in portctrl() when a non-EAPOL frame is
>      shorter than the 802.11 header + IV + LLC + ether_type.
>   4. Out-of-bounds reads in three IE walkers (rtw_get_wapi_ie(),
>      rtw_get_sec_ie(), rtw_get_wps_ie()) due to missing validation
>      of the TLV length byte and of the byte ranges touched by the
>      subsequent memcmp() calls.
>   5. Integer underflow in rtw_wep_decrypt() when a WEP frame is
>      shorter than the header + IV + ICV.
> 
> Each patch was found by code review and is not tested on hardware.

Please address the comments found here:
	https://sashiko.dev/#/patchset/20260417061048.62484-1-delenetchior1@gmail.com

and ideally, test it on some real hardware to verify it all still works?

thanks,

greg k-h

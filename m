Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58E3CFF68
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841320; cv=none; b=VVhzQK7z9iJi/RwSkLIOcbS1fOCrNvYqiegYrn5T4Z2qYQCKwWOX/Zd7AEbMw/oJ2EmFnDtN+TLwtoEq6KOjVuHfnNTzKY7LJmNa5kuEPF/pnF9be2vsQK0gvdqdtz61zgulHsFB6bCccXR+hNeKMXcc+d9Pxmy9JLeDvfYf0b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841320; c=relaxed/simple;
	bh=ptAYaUqoOj8dfUqmierIXzrmgXkNyJWT66wzkmCfrx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drzzo7FFUfeg1O4oHzfBexbtOztfMVLJ2+zyXvaSukIWmmCyP7aVav0rXUYmA7HaubXDvwvQgvDyXZAEAclZkBmr5GtWnNJGCveRwp2igOXNRKSvcwdqlwwFWOdfgh3xBeHVgMNZnA96oSAvErOh2NB1yNEm+kk1jA1QZrYoNiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e65wNjLQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e65wNjLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E465C2BCB0;
	Fri, 15 May 2026 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778841319;
	bh=ptAYaUqoOj8dfUqmierIXzrmgXkNyJWT66wzkmCfrx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e65wNjLQihZ0zYJ4Khhz39tVQnichkFTFbY5TckWim6htgNvsbb+skauX6NsVnUHF
	 5xYWml75Y3njFUCADeAzJsM5ZrkB0fRago+HPUHE+4uSPiET6UWwqxUyGo66mldiYP
	 hUlTfijmIWVZNwDeJk/bSo+CAPD88pyeMop3fmms=
Date: Fri, 15 May 2026 12:35:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, dan.carpenter@linuxfoundation.org
Subject: Re: staging: rtl8723bs: OOB write in HT_caps_handler() via
 attacker-controlled IE length
Message-ID: <2026051510-decode-numerate-6fcb@gregkh>
References: <6a06f581.0c99f0eb.149f9e.4214@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a06f581.0c99f0eb.149f9e.4214@mx.google.com>

On Fri, May 15, 2026 at 03:29:21AM -0700, Alexandru Hossu wrote:
> Hi,
> 
> I found an out-of-bounds write in HT_caps_handler() in
> drivers/staging/rtl8723bs/core/rtw_wlan_util.c.
> 
> At line 938-942:
> 
>     for (i = 0; i < (pIE->length); i++) {
>         if (i != 2) {
>             pmlmeinfo->HT_caps.u.HT_cap[i] &= (pIE->data[i]);
> 
> HT_cap[] is 26 bytes (wifi.h:349). pIE->length comes from the
> WLAN_EID_HT_CAPABILITY IE in an association response and can be up to 255.
> The loop writes up to 229 bytes past the end of the array.
> 
> A rogue access point triggers this by sending an HT Capability IE with
> length > 26 in the association response. No authentication is needed.
> 
> The write is AND-only so it can only clear bits in adjacent struct fields
> (HT_info, wlan_bssid_ex). This causes state corruption and can crash the
> driver. The RTL8723BS chip is in a large number of cheap laptops and IoT
> devices.
> 
> Suggested fix:
> 
>     u8 ht_cap_len = min_t(u8, pIE->length,
>                           sizeof(pmlmeinfo->HT_caps.u.HT_cap));
>     for (i = 0; i < ht_cap_len; i++) {
> 
> Tested on linux-next commit e98d21c170b0 (2026-05-08).
> 
> Alexandru

Great, please send a fix!

thanks,

greg k-h

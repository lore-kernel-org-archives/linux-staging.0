Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D90838D3FD;
	Thu, 14 May 2026 06:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778740794; cv=none; b=Y/Yj4CnjN2kfBw6ayixVUdv1BTe2bZ19rB+tEYOcCccfTpHTX2TN1w8bpLXsz0lDn/481riUQ2fNE8/Ga9lBdQfXxZzfzZgZviLuB1KF44AekDVB8sgKuD/F2/H7yDesSL3Gy8jajsVV08D4ohD8ns8Nus7RK/CCzopd/RD6N4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778740794; c=relaxed/simple;
	bh=BWBcUvEtzXJPbwuFEiQkfltLj4hxfNkw0DtYRLPgorY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iE5ihb+4Y2e3uXZ/dy7ihYc66XGLvt/GZGnlmKqZozEx2RrcR4dumEjRmxGVMC2mUooQUWh80IE5VqQa75q8EdzWN8QAycYFLj5LcBGO2R7u+C8B2ew08AiyYNSIwUyyUdS0qKEm0qQ9DPRsXi+/m3Q/9yCGN/wo3sFwlrNG7xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1SIwFk0m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1SIwFk0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7F3C2BCB7;
	Thu, 14 May 2026 06:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778740794;
	bh=BWBcUvEtzXJPbwuFEiQkfltLj4hxfNkw0DtYRLPgorY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1SIwFk0mPKwOwOJ96BkrPL605R8z3kZdDFZs0prVuUgvdEDDEHKU+ZBFGhqamjLcO
	 Vugyujnb9Z6uAu75YlM2oDFcfXCk6AnZxX9ZAJn17NxOlxkRDA91DS0oadZ1uv0RPc
	 CLVWc2WFZRaieMW+2PwQgmdKjCGRZ/0J3YskAj8I=
Date: Thu, 14 May 2026 08:39:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] staging: rtl8723bs: fix remote heap info disclosure
 and OOB reads
Message-ID: <2026051454-lunacy-unknown-3b80@gregkh>
References: <20260513181842.17480-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513181842.17480-1-luka.gejak@linux.dev>

On Wed, May 13, 2026 at 08:18:42PM +0200, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> When building an association request frame, the driver iterates over
> the ies received from the ap. In three places, the driver trusts the
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
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
> Changes in v5:
>  - Address shamiko comments.
>  

You have to list all of the changes from all of the previous versions :(

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A529E0E5;
	Wed, 15 Apr 2026 04:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776228929; cv=none; b=ambDULnQoE2Fx2r5Ji4hnEFjjJzeCFnpZVsPZx46sKMIwbBPBkyB1WQZqU39kusQGYx3fNFIprVa3azzzhXdBqZ1kwdn37rwf72u6FF3Ss5sZrufF7pJWjGbD3aGwFyr2TFbMIc9o7MSqnUA9LtMV1EZdGF1WFH6qGbHdhWWulQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776228929; c=relaxed/simple;
	bh=CgD8yDwX/LpKMqyfme+UTCppo5KKCMpnwC581PlowAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbaFptnut4gWSYXyA1OLyQUmBFzVC5gC1scdnHwG8+MbSNIFfaPybYUzoyWULgeKaNdIs8eYsidhBFbJjayKtSPPhuwg8Ab2YJAI/YG3IWb4Qz8Qb+/FVdc0CZ5IaTCvJWSIcfxEQK0yP6RKV1B+YeKpz6hm8y02J8YGfiPMwQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qKU0S3+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qKU0S3+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87696C19424;
	Wed, 15 Apr 2026 04:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776228928;
	bh=CgD8yDwX/LpKMqyfme+UTCppo5KKCMpnwC581PlowAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKU0S3+3n39uypt9KrvaXN++EkbBm0R/ZuFAxwRXjbzx/iOuCR/iNG5wCORtw9qAx
	 utJasT3ZZlUoIBo2Yjdgan+FZMi5oTx2wQ4EbQZv1ZaYzS1zb4TgOtT8rJdbT8Drfh
	 UHslfhs3YbgUIOHuXmCGx1+1yARQU4t2Q2DVLyRg=
Date: Wed, 15 Apr 2026 06:54:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix remote heap information
 disclosure in issue_assocreq
Message-ID: <2026041528-bling-germinate-e1c8@gregkh>
References: <20260414194945.138626-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414194945.138626-1-luka.gejak@linux.dev>

On Tue, Apr 14, 2026 at 09:49:45PM +0200, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> When building an association request frame, the driver copies the
> ht capability ie using the attacker-controlled pIE->length from the
> ap's beacon. If the ap provides a length greater than the size of
> struct HT_caps_element (26 bytes), it causes an out-of-bounds read
> of the adjacent heap memory (HT_info and network structures).
> This uninitialized or sensitive memory is then transmitted over the air,
> resulting in a remote heap information disclosure.
> 
> Fix this by clamping the length passed to rtw_set_ie() to the actual
> size of struct HT_caps_element.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
> Note: Note: Alignment of arguments in rtw_set_ie() is intentionally 
> like that to avoid WARNING: line length of 105 exceeds 100 columns.

That's not ok, please exceed the length.

thanks,

greg k-h

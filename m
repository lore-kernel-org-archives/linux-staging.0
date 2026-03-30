Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9B334572B;
	Mon, 30 Mar 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886592; cv=none; b=NzmysdIGxRio13k1i8DdY7nsTYJZx4nRAeb/KFNiLWt5ArRHJ0VVb0Hn+4d+LJfZC70/3kf9lZbelgKlVYJ8VvEA+x0qDzf6UTLdkJB1m9S7fQWbtpBuUSAg3z6WG9/rMl9o55ve6Z5jnowI9OEnz/4B5rMiCKSoTJ4aqxoMFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886592; c=relaxed/simple;
	bh=ckjMKN9a9NqhO1/KeZipVwRjuNPIuQTCTiSEfJKh5Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzC16O14JZ8Lf/1zK04/ggyAMWA/IR2Hht7ge05oZ9PpSswtYdIkEDJTruMCmnoD7cfH8xrON9PO++lhoyaZHlSVVa8JyYwfGxRE2m4gmubI3/K8qssEsZOV2hBWHGUOpUGgDsglg9XCjTH6M0YBdDdxvcXSXDE/Bxc/YtH2h6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TlWznSHS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TlWznSHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62516C4CEF7;
	Mon, 30 Mar 2026 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774886592;
	bh=ckjMKN9a9NqhO1/KeZipVwRjuNPIuQTCTiSEfJKh5Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlWznSHS0PZEx/GaCg4An2nNPrFhZSsle5fcT7UXff2O5q2GnnceA8ZWuBkFpBT+w
	 kGJczCFc4q+czENmcGJnTYM1eiWju/ef/vbU7U0D291t5LyFuV07cjUmOVa3VP/ItD
	 ohsjiqkpI1gGPdWZ5ED75wS2reYCDG1eyGvvTzrk=
Date: Mon, 30 Mar 2026 18:03:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Prithvi <activprithvi@gmail.com>
Cc: andriy.shevchenko@linux.intel.com, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, lukagejak5@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <2026033047-explore-embody-564f@gregkh>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <20260328174716.rna2qykokwkojzpt@inspiron>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328174716.rna2qykokwkojzpt@inspiron>

On Sat, Mar 28, 2026 at 11:17:16PM +0530, Prithvi wrote:
> Hello all,
> 
> Thank you very much for taking time to review this patch.
> 
> I understand, that this patch may be considered to be majorly mechanical
> changes, but still, the scope of the patch as well as the changes
> involved make testing important for this patch.
> 
> I agree that, in case of unavailability of hardware for testing, I should
> have mentioned it and used the RFT tag for the patch since v1. I
> apologize for missing this detail & understand that compile-time testing
> can't be sufficient here with all the changes introduced by this patch
> and also the concern of the possibility of regressions getting introduced.
> 
> Going forward, I will be meticulous about clearly disclosing the testing 
> status of the patch and if I am not able to test a patch, I will be sure 
> to add RFT tag since v1 of the patch itself.
> 
> Lastly, I wanted to kindly ask if it will be alright to send a v3 patch 
> with the RFT tag, incorporating the changes discussed in this thread?

Yes please.

But remember to do only one logical thing per patch, I see multiple
things happening in this one :(

thanks,

greg k-h

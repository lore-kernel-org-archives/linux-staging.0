Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B726C3812C9;
	Tue, 12 May 2026 12:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589421; cv=none; b=qNmxDT6d8ZCVpMf1SkE1DQ13re14V2M1IgXSxYiLEtusU+kkO6iG3iJOU6O+Ze/LiC7adHuOP4FcH7FEp1HF+4s4CGGM4KBOrxp3k/RWMhO4CIH5AuAVJhaWa2rojIvo+rWCYo5E9qipfuU4bBUopwyF0rcIur3K/j50T0bDfeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589421; c=relaxed/simple;
	bh=xBNxpPeZqkhuDGR7xR+hQmRVc47CkSd1P3emQAxtXNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFJkJ50XmlCz7XsHe4fWz8wyoKQovWmvMElb+3QPjPlmh/l3i9Hui+b6SwXqtIKZFs7+VM4rDIytXX4uVWNn0VASTEjZeQAzxdFosSqxxf5AqMyjRlL0g1WEN/yTWyZhVBH/PyqXSAC1WT1T2wp0PCx6u4T2fmss0qD4S7NX/iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DAX2fpuY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DAX2fpuY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6E7C2BCB0;
	Tue, 12 May 2026 12:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778589419;
	bh=xBNxpPeZqkhuDGR7xR+hQmRVc47CkSd1P3emQAxtXNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAX2fpuYHsVifTl9TL+bBw5VqO10b6upua9ZJWol/QGOoTMJutNNZ/vs29p7IsgP3
	 Ou5za4Pi6NfYZwyxtJ6eZ6zZNIF/RMvzrJ10rHM6+u0PqCI8xfmYb8CNZ6VZSsFRmz
	 k6ylAqMEepFhrXomcaa1xkzbG9E6jfuRZyAldJ3U=
Date: Tue, 12 May 2026 14:36:03 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v9] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Message-ID: <2026051220-sierra-uncorrupt-1f29@gregkh>
References: <19e1c276bb9.33f3855947400.5648290742103580904@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e1c276bb9.33f3855947400.5648290742103580904@zohomail.in>

On Tue, May 12, 2026 at 05:56:46PM +0530, Ashwin Gundarapu wrote:
> 
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Tue, 12 May 2026 17:54:37 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

Please please slow down, otherwise you are going to end up on our email
filters, and we will just ignore your patches.

Stop for a few days, go back and read ALL of the review comments, and
then make a new patch.  What you sent here is totally wrong still :(

thanks,

greg k-h

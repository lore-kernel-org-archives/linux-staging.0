Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C3D200110
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695805; cv=none; b=oLVdgzV9mAreJyncZWdope3jQIJmr02TEwsYVO3IdQIONEJ4a4D4XCIcFiLkfpo1FSffoF7p84FwlaQwEwB+TvPqX1Vs7dYSfg9Gqwp1YHOPxbhn0uEfL8DOEkvS6bAikj16KAlI3727k8nKSKWPTm9DAaVXtDXzNE6PM2Sbx5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695805; c=relaxed/simple;
	bh=vqiYSUZB5S1y7jP1q1CLPBdD3U209ry4gXQ3thEcRYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHwg1HKXDet0J0hMpkO89H1VNdO4h0BhL5EiAPgtQM4wDsF7Xrl7HBVZq+wgq+ciuDTt0d0Br2er5q+ajjzEf1OqK5aNiW83LeoJ1MGfgC0NqapL2qSMMwG1/svfKZVvXxvFuUKMc1Vv53mGRClgGaaDZDhNp35TJ336uLeVzdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hwZ0s9gZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hwZ0s9gZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE341F000E9;
	Fri, 10 Jul 2026 15:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783695803;
	bh=W6gMpxjW83cslAA8yeKOhtZPKbAJxf2n1tCrUB1G1j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hwZ0s9gZkBg5Co8ghDA9YzIATfbSEEhxP0w6Gxa5dV1EqbjAd2oj0FkLdLuFcWFlc
	 pahGj6TNchV9ls72lyABMxQJLo9QeB2sPJIdVrHMCt6E0zvOrf7gcYPhryKPoTio/c
	 yJYTFLUaksfD5Dyw8+wX+0iR79SkERbnr1UR0+i4=
Date: Fri, 10 Jul 2026 17:03:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Freeman Yuan <freemanyuan15@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: rename camelcase struct member
 dot11PrivacyAlgrthm
Message-ID: <2026071002-unboxed-earlobe-3991@gregkh>
References: <20260710053347.46649-1-freemanyuan15@gmail.com>
 <2026071050-illusion-unstuffed-cc3b@gregkh>
 <CAL2AV2PJ8WxvgtU4rxhAyDvmtT2Wt-FcRr2NzD+Q3qiUSCmcCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL2AV2PJ8WxvgtU4rxhAyDvmtT2Wt-FcRr2NzD+Q3qiUSCmcCA@mail.gmail.com>

On Fri, Jul 10, 2026 at 07:53:43AM -0700, Freeman Yuan wrote:
> Hey Greg,
> 
> I don’t think anyone did this one yet, I think

Ok, can you rebase against my staging-testing branch and resend?

thanks,

greg k-h

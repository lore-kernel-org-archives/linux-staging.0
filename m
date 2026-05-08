Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B232E6BD;
	Fri,  8 May 2026 05:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778217913; cv=none; b=DN+XTRllXgtS2qSafs6WumGrmSEPO44bCuzdMP2V079kNn31kerTDynbE/YcNN6Rk5ZXWhO7JM1tYmGNMpdG4FliizwGmwxIOFlDuu8CrDZwr/Cu75RRle/pcXwDLGTyRgj5YgxOmvvq/qUaYpJCL8SasT5M/CGLhNSt13K1lrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778217913; c=relaxed/simple;
	bh=6ZPET0N+ByiBgQ8lCfuYwtmPw0gYTCAsA/smscecMbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXoKOjuc7wnarlYWt6vsGt4MlpWlqMniViqDRUtXArH2YxnpZKF94KNwG4JUVvZ/+KjB5Ncq+4qJjW0UMfuBmJAhCx/IZWUqueAl1BZewzszCFsh+kt23sDNbxww+kK3ME04KZdJGLlXJU4JODLxfaJwNKQNpDoHBhwTyXqrP9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HLkUW2Xk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HLkUW2Xk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E91FC2BCB0;
	Fri,  8 May 2026 05:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778217912;
	bh=6ZPET0N+ByiBgQ8lCfuYwtmPw0gYTCAsA/smscecMbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLkUW2XkOH0a//rXEpVCO6tuR0f7fRpeRLKzb7j+72+ts31QwheLSVc/T9JiiuDIr
	 wx7f66qI5shKD6MNJGlkblWbLVTUjVuiNjxJMKztmgJTWZpX1nqqMBXzTeT/Axy66G
	 KTZxJvQL/mT8mhjaVzMkmpmSSLown47/tEepTc3g=
Date: Fri, 8 May 2026 07:25:10 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: David Cardenas <ldcc@proton.me>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix open parenthesis at end of
 line
Message-ID: <2026050842-direction-amends-9c09@gregkh>
References: <OorLKjBEmwLMB-OuQC_MerB0GkYg2fsHmJcvxPmc8EFrk7VuBlisVIa90K86InsIr2MjgjoSceOv_PUY0OfsepmQ42JdZIoSvK0pMggDfYI=@proton.me>
 <2026050635-gravitate-sprinkled-575f@gregkh>
 <1XxaPkNOP-p-F8PW1lsqdkdN9K2o6TS3kphmVpxm6gXIMn9Ygk7UPsiOosb9eybCDX_1lCU4PwdUKlPmFdTuAhAAg_aS65tADEe2YeAisek=@proton.me>
 <IzXMpb3HpYTWCGRxzFNRhYk599YySxA0stKf5vVJlvJkgGRLvbhpYNjfCf5XYgqOqA0yyApLi82SPBGg1dKA3wEd6-B_fgd5X_2Vdb5NfM0=@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IzXMpb3HpYTWCGRxzFNRhYk599YySxA0stKf5vVJlvJkgGRLvbhpYNjfCf5XYgqOqA0yyApLi82SPBGg1dKA3wEd6-B_fgd5X_2Vdb5NfM0=@proton.me>

On Fri, May 08, 2026 at 02:48:55AM +0000, David Cardenas wrote:
> v2: add missing period to commit message, clarify blank line fix

This goes below the --- line.  The documentation should have stated
this, and there are thousands of examples here on the list as well to
look at.

thanks,

greg k-h

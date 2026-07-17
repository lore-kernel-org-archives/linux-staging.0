Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9EC3F7AB2;
	Fri, 17 Jul 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290254; cv=none; b=QbIMukmPiIh1WHaGqSPC4uiO4FaiOmqcg4ZNnnEDljjUfliZKAt1ZPKoF4mLuN4Ni3K4PEy+FcF9mryWDD/mK9Foa0easXHmB/TOl+P5HD4X8C0MvrOWQge3Hvjtk3Y7lqnHyhpzHcfQwJ91yEtej8C2ePEol7vZYSHxQZd9mEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290254; c=relaxed/simple;
	bh=/2p0IJhSabdoCnnBx6WXgBDYNV6XrTjL+/3n20rq1a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7Xq2aIr8fDpktXpsQpYLs18NUrx8a0QZAes0PWXwGUhCY3C8TZtPVZuxn0xb9ZY3W8jy/pcHd7l5lWwIZWyUPDM7jSp1up76qQUGCLCb3LxmAD8qSo2y+smqcHI1FPXLRMljxH2ONtt8o16AFBen9RS7bneQlLSrug8zgSVgDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fVCwIUDM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fVCwIUDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2AD1F000E9;
	Fri, 17 Jul 2026 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784290252;
	bh=TjXqxEmO4yTpsjkYs9Xl2ndK55iRhXuiF0JEv3L876g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fVCwIUDMUnoRlxNPYxstz4KZWz+/xgVMJfyjYW5tLByQfSKr3Fb0+E/nO3VFwgSMo
	 xWs0vuNnAMaFB+JPUq6mKM1ZPvZkBgIfFK4/RslU3O1HQ8fGks+jPvoZiex4UEuB66
	 zbVTA6G8lpi8pOIDgRu3ryZPPBBnZhLGnDF0NwTI=
Date: Fri, 17 Jul 2026 14:10:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arsenii Pashchenko <ulijg308@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: remove redundant
 ReadChipVersion8723B wrapper
Message-ID: <2026071713-drearily-tropical-49ea@gregkh>
References: <20260716-remove-readchipversion8723b-wrapper-v4-1-9493b5f37c31@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-remove-readchipversion8723b-wrapper-v4-1-9493b5f37c31@gmail.com>

On Thu, Jul 16, 2026 at 05:33:10PM +0700, Arsenii Pashchenko wrote:
> Collapse the static CamelCase helper function ReadChipVersion8723B()
> directly into the main rtl8723b_read_chip_version() function.
> This removes unnecessary code nesting and cleans up the CamelCase
> naming violation in a single atomic change.
> 
> ---
> Changes in v4:
>   - Format patch via b4 as suggested by Greg (no code changes). 
>   
> Changes in v3:
>   - Merged the previous 2-patch series into a single patch as suggested
>      by Nikolay. Completely removed the redundant helper instead of
>     renaming it with '__' prefixes.
> 
> Changes in v2:
>   - Resent the series due to submission issues with v1 (no code changes).
> 
> Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>

The changelog goes below the only --- line, and the signed-off-by goes
above it.

Try using the b4 tool for all of this, it should handle it for you
automatically.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E132ABCA
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029767; cv=none; b=nDHumGo5RLkLq4v0Y5d6zY7Q/WkhSsLT0fJI6Lqddq3vZXHGylseRMMOwHInmiVAQsiNWRyTUhx9F0b2rC66goAIxbxZ6KrnUz+T6skWYn0o0yZWKpCDvIMmUi2gb83Qn7Kxn5evfUWy0IFqWkcrDMw1NVCGmFOXULARkW1w5tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029767; c=relaxed/simple;
	bh=+PGCzVh18esrePzfY3Ifs5Tep2dK4mbpgelai8GW/pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ER4R0qLbHIgFtDx8+L+Ce00zXjw67zLfRYhQ3Euu3SzFYfoLpYApa2LV4E5qWPKGPnahovGaOWByQ2XxY+5+Xc3lKDiylZp/dyKuSfaCOPhotx2HaNm3gSgTj0O6qcAs2VzbkqB4dQret31dlGxTKXJIffvb+PzEiavJfWDRyuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R+e0LtNL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R+e0LtNL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8F3C2BCB0;
	Sun, 17 May 2026 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779029767;
	bh=+PGCzVh18esrePzfY3Ifs5Tep2dK4mbpgelai8GW/pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+e0LtNL0otEpde2XEjrUhJk1C6sfwy7bNfRXB8rHNwjGHt6Z48WGQ/V/gfVNV6/X
	 S7EgRrxrwwfz3M7/KQzfVm8mgQuct9Om0mJwdiD5z4e3yCyX9jU8HGFx+vztHDVp/Y
	 lJ9b2ss3jF8qfdbMBc8z7jpjleixENgwsnmAQsiI=
Date: Sun, 17 May 2026 16:56:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/4] staging: rtl8723bs: fix efuse formatting and
 brace handling
Message-ID: <2026051742-mammogram-mammary-9f68@gregkh>
References: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517143723.13281-1-mokshpanicker.7@gmail.com>

On Sun, May 17, 2026 at 02:37:19PM +0000, Moksh Panicker wrote:
> This series fixes coding-style issues in
> drivers/staging/rtl8723bs/core/rtw_efuse.c and adds a missing brace fix.
> 
> Patch 1 reformats rtw_efuse_read_1_byte() signature.
> Patch 2 adds braces to the else clause in rtw_efuse.c.
> Patch 3 reformats rtw_efuse_one_byte_read() signature.
> Patch 4 fixes missing brace/comment formatting in rtw_efuse_read_1_byte().
> 
> v3 -> v4: added the missing brace fix as a separate patch and compile-tested the series. 
> 
> Moksh Panicker (4):
>    staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
>    staging: rtl8723bs: add braces to else clause in rtw_efuse.c
>    staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
>    staging: rtl8723bs: fix missing brace in rtw_efuse_read_1_byte
> 
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 12 ++++--------
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> -- 
> 2.34.1
> 
> 

This is the second v4 version :(

It should be v5, right?  Also, what about the changes from v1 -> v4?
You have to list them too.

thanks,

greg k-h

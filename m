Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F94749FC;
	Tue, 25 Aug 2026 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672353; cv=none; b=rpwOYDAcnBGAkIFqCNzdQoV+MSuIC12hFtAJrsr3xUZ0MXGtlD/C1VK456EJt+JAStXSNzU1RUMD7DvhiKyrOqMSUb6aTpq4nlBH8Juvpq0FtC7AkY1rHC2/7prHuBT8w//FJA3XaZoHHHrkllqBpcQIU+aC7OXY4m2m9TfYOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672353; c=relaxed/simple;
	bh=gTmHGNjPb8eh/prKlCkRbsCEeKrxxv6yEDRMW2BLPGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QF/yjHz0Ty4HrAEBan2CvSpfzcyuNWzU5CnrfXQq3R6gX9Vpu8gkKfXbxbyvnxuF9W6EFinfzPbZo4N9YFMa76ybZF805S38d6SCyZpS+mVG65YISDKwCq9PtDMd9oPLcZfRbtHToph6OWW0JcJnxph+Tp5Mh4iKY1GL0MdPy/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ntt4TIMw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ntt4TIMw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B7C1F00A3A;
	Tue, 25 Aug 2026 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787672351;
	bh=+PgEo4xYpi47VLXUrcEuF0KBkFE/V9GEtsfW1hNuZcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ntt4TIMwULWWD9U2nEM9epL+ut+pW6PnegIO5xDyYKUOw/NBANx/W+3uMrD4dCtQG
	 cX+G6my+PdiKDWoCM7oWbrGgWj4qc87A2f5xxVgcR8P3fyaVPa+ARYLzRphrdTucVc
	 0mpKuY88p/IxunubS5DU7I01r75lZJF01nnPpsf0=
Date: Tue, 25 Aug 2026 17:39:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: tomasz.unger@yahoo.pl
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: fix space before tab in
 rtl8723b_cmd.c comment
Message-ID: <2026082514-tree-grandpa-33b8@gregkh>
References: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-1-11f2600e470a@yahoo.pl>
 <20260823170239.229548-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823170239.229548-1-tomasz.unger@yahoo.pl>

On Sun, Aug 23, 2026 at 07:02:39PM +0200, tomasz.unger@yahoo.pl wrote:
> Please disregard this patch (1/2 of this series).
> 
> I already sent a fix for this exact same line earlier today, in an
> unrelated, separate submission:
> 
>   "staging: rtl8723bs: fix space before tab in rtl8723b_cmd.c comment"
>   Message-Id: <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c@yahoo.pl>
> 
> I did not check for an existing pending fix to this line before
> preparing today's series - sorry for the duplicate noise.
> 
> Patch 2/2 of this series (rtl8723b_xmit.h) is unrelated and still
> applies independently.
> 
> Noted on the series point too - going forward I'll send related
> patches (not just for rtl8723bs) as a single series with a cover
> letter.

Please resend ALL of the pending patches in a patch series, as you have sent a
lot of them and I don't know what order to apply any of them.

thanks,

greg k-h

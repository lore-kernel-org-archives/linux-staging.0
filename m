Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E378D18872A;
	Fri, 16 Jan 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568934; cv=none; b=mSyMaO3HnN2AzIUFyH/uDC1+30chD3xDVgIpoi+f7wVpPZqDWmnGwdL8wfj8GigogujKSLcbyo9UofNL3uAi5l0ZB/DH2JjiL8subsiO9HTCm+Zm517kU38tr+GXLbTUzab2gomhXYNmQgdVMOwvgyoCk2vTYomDJzSdlxKnNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568934; c=relaxed/simple;
	bh=HApxF12DvKPdg/XYoqtr5Lcmc+LQeTP9Di3wVLRl2Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpmXexkZWEx4a2D1R1fhJk03d8X5xI/ScToTMOYjuEcHtKxU8XP+3aHfB7lIF3qG1QZEHYHywwMt8vpBupSh9s5rPr+RvHhSGrmQ2yfxC5xmdOUio89MSIVeLudfYtv8YVFJWUy74Gtt7ofNsA5uqFMFuxDQvcrnYTf46iITi5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y7dlPSzY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y7dlPSzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4941AC116C6;
	Fri, 16 Jan 2026 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768568933;
	bh=HApxF12DvKPdg/XYoqtr5Lcmc+LQeTP9Di3wVLRl2Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7dlPSzYLo4f3i4vwmcqWjO8oPEKaeuHGRxngO2F7xfJFdHChcN3HpfC7MgoE1j9N
	 RXqhXqlli62JWACrI9yNAcFDnKv0iKMiVegUudOiNmrS/H1a/1tTaMit+OfdTiq/Pn
	 vJ9vkREzGpey+RR4jAf3cXhjXbhwmdtlHWd9y9e0=
Date: Fri, 16 Jan 2026 14:08:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Archit Anant <architanant5@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: rtl8723bs: fix multiple coding style issues
Message-ID: <2026011634-directed-settle-0cb3@gregkh>
References: <20260114094949.14825-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114094949.14825-1-architanant5@gmail.com>

On Wed, Jan 14, 2026 at 03:19:46PM +0530, Archit Anant wrote:
> From: ArchitAnant <architanant5@gmail.com>
> 
> This patch series fixes several coding style issues in rtw_cmd.c
> identified by checkpatch.pl.
> 
> Changes include:
> - Adding missing spaces around operators.
> - Removing unnecessary blank lines.
> - Fixing alignment to match open parenthesis.
> 
> ArchitAnant (3):
>   staging: rtl8723bs: fix spacing around operators
>   staging: rtl8723bs: remove unnecessary blank lines
>   staging: rtl8723bs: fix alignment to match open parenthesis
> 
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 56 +++++++++++-------------
>  1 file changed, 26 insertions(+), 30 deletions(-)
> 
> -- 
> 2.39.5
> 
> 

Only a portion of this series applied to my tree, please rebase and
resend the remaining ones.

thanks,
greg k-h

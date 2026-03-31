Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797DC261B92;
	Tue, 31 Mar 2026 04:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774932418; cv=none; b=WnNwtXEcXcK1UyUqwVgeKp0Z0ph8/IPgG9DMZQpTyiTZuZ7kDEd/QrTX0Qi0uD3XPGBzRYaa67fD/FbpDK/koSWjS/DjcIE6iJWMHp1kRbyqlsRtzNl2fK8RkIFqNo5tHBnc6QwQFRbpuYWO/Zhb872mtMBT+jWe/ZKO2yNDE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774932418; c=relaxed/simple;
	bh=piY0PkkjvfHD/WPV++lg0jLHKXzpj2MuaogQ2JMEtXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeBRq8YcsBe5E18brwhYzmQMgfHtqYr5KbcLEF9fmFyWDBB/aUlS+fyVtquZE7G7s07WqAr2FOkTq7q2DobSJM4UgF+3PHGbwslO0Xtb5/e/80xS2yzZNMUhBb9LFKoI9YzFtVTV/ZOK+Uy/DsI5ht23CF5xbxl4ZMMrewdfPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=usRNmZvw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="usRNmZvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7037C19423;
	Tue, 31 Mar 2026 04:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774932418;
	bh=piY0PkkjvfHD/WPV++lg0jLHKXzpj2MuaogQ2JMEtXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usRNmZvwcMLh0eG4DrpG9jqWYhtF+OyGtJ9o2EqsAdF0alI5VNaaqy02hMWH0Z9WE
	 VzmOPnZwjUEXxGb4Naig5yKW1X8BnvGarOXXBs2jqi2Ky+Hdt5voasq3JhyvA+W9AT
	 TDz0DoT2EKuEWbDMiMKh4WqYnrgaCT8sJHf3Tzs4=
Date: Tue, 31 Mar 2026 06:46:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Probert <linus.probert@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up function names
Message-ID: <2026033106-ferris-sizzle-d15e@gregkh>
References: <acrpggSYn1iwvUwN@mosquito>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acrpggSYn1iwvUwN@mosquito>

On Mon, Mar 30, 2026 at 11:24:22PM +0200, Linus Probert wrote:
> Renames camel case functions in rtw_efuse.h and also removes two
> function declarations that were never implemented nor called in the
> source.
> 
> Naming problems found using checkpatch.pl tool. The unused functions
> were discovered while applying the changes.

That is two different things, which means this should be a patch series
doing only one thing per patch.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FCB42903C
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298817; cv=none; b=sieO3CypQnc3I0ajy/zOYdvGJN9vwqwJDj394rX5CIgv0ZuO4dQCZG3eLkfCD1fQNJ6CzRDsIgCqxDW0S/3SZHak+CD0O+g9+BqQIAOKERxQ1uVkS7qztT+E7MTrjkH5/CcwqbeQ3v7TnBcXl3tk2RPUC6y7+sjThF08NP8hAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298817; c=relaxed/simple;
	bh=SNPOXS+verclnlFHv4Oo7mqStcjxIdM+FiHX7bImcMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCdR3svfGBFaCKoq51jQBMzXZ2z3wD3igY56o88Rdmbe+RrCZQjIitpkDPVjrv2UkG4iPUmeFK3x22R3cHhya4TNqTICeU6Cq4GFSq6Mw4VftRPRE4/MnuyPNHlHbKaTh/5GMhqnStWNkZrqlUyPSpXT0Iiek8zgKwdWAIe4BHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yxy2m+91; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yxy2m+91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852461F000E9;
	Fri, 17 Jul 2026 14:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784298816;
	bh=SNPOXS+verclnlFHv4Oo7mqStcjxIdM+FiHX7bImcMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yxy2m+913qckolYAbQw1jVwLWNimYwXQwT6awpCAS/sgHpfXWo5UrUaFyvBFAEQBB
	 pRVJovIBppYJTIlsBI9nQugXugdMZ5VGcybEfZ3VrvZdcTATMJQcdRhPBqxX68wzgO
	 5i/DDBl6kI0RdmVR386FpJOLGP+G6GJZbl+vKavg=
Date: Fri, 17 Jul 2026 16:33:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hussien Sajjad Ali <teamakeads@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix while loop checkpatch logic in
 enqueue_reorder_recvframe
Message-ID: <2026071749-endpoint-diagram-7179@gregkh>
References: <20260717140344.16131-1-teamakeads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717140344.16131-1-teamakeads@gmail.com>

On Fri, Jul 17, 2026 at 05:03:44PM +0300, Hussien Sajjad Ali wrote:
> The checkpatch.pl tool reports a warning for using an unnecessary else
> after a return statement. This patch refactors the while loop logic in
> enqueue_reorder_recvframe to remove the unnecessary else block and
> improve code style.

If you look in the archives, you will see that this patch actually
changes the logic here, right?

Be careful please.

thanks,

greg k-h

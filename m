Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B193B4EBB;
	Wed,  1 Apr 2026 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032634; cv=none; b=jdA1ay5VqPC3yt2IpcBUOm9el3CkDv+vewAhkKQY02ICfB2LoYn1fqUrCV877miMCOFZ6bvwGNsyxshVC87SSflUVH2ofSU+wAU5nEHlTUBdIKyaXs8BQUaQ9dVjSpim3+U/8TxImMnbJSJrahJaBT2pNe2nViO4+u1U4jMxlnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032634; c=relaxed/simple;
	bh=XlDIXLifENY2FAesM2bNsUywXSvswIHEJPbQ6pcXi1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSUH47xmiXoHHy9h6RmqnYuMnQhIzj64TTTZbEow9moNXCK6jb3iaojSUsV0aWtSoNqcVcQ2aOBno5/QuDshofClT96WSMzNuZG2bdFsf8RWb9wrJYBieTZhfC/AXEBmQKQhBPUJPk1sFcQpgMDMAw4C+AIXWegozVz3T9VkFwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e8kTR65W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e8kTR65W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A6AC4CEF7;
	Wed,  1 Apr 2026 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775032633;
	bh=XlDIXLifENY2FAesM2bNsUywXSvswIHEJPbQ6pcXi1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8kTR65W2uw7Bjy/yXXulgzfYVOvQVpmFjxxa7ofZQ7E/5sOjMujVMi6cQJmgaKmm
	 DeOqlzgehO5LYarw9MdOgKLxUne7oUad2eI1jvCxze3QjMXScpyFjacxUnKbu2bezQ
	 9MPEr74Zeas+vgpyvdaOWi4O3j3cRD+k2avYRuGc=
Date: Wed, 1 Apr 2026 10:29:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: omer.e.idrissi@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
Message-ID: <2026040119-smasher-oozy-8d41@gregkh>
References: <B2394A3C-25FD-4CEA-8557-3E68F1F60357@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B2394A3C-25FD-4CEA-8557-3E68F1F60357@linux.dev>

On Tue, Mar 31, 2026 at 10:25:22PM +0200, Luka Gejak wrote:
> Hi Omer,
> Thank you for submitting this patch series. Efforts to clean up the 
> initialization paths in these legacy Realtek staging drivers are 
> always welcome, as they are a necessary step toward aligning the code 
> with upstream kernel standards and eventually moving the driver out of
> staging.
> I have performed a detailed technical audit of the series. While the 

<snip>

Luka, this review REALLY looks like it was AI generated, and then
cut-pasted into here.  Please do not do that.

If you wish to use AI to generate reviews, great, then use some of the
tools we already have, and notify the submitter that this is an AI
report and that it should be treated as such.  Don't try to pass it off
as a human review that must actually be trusted.

thanks,

greg k-h

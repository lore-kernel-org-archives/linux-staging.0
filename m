Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802E404BC5;
	Wed,  8 Jul 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512148; cv=none; b=barE5CVEhKKvX/pZNyqQeiSDwutVDDjBRPkaM9MqlLuL8a/rTJ6otprgfLIBrX5t/vmcIHvKhABB8Dzse+mncLHV6Y989unOs7Bzhw84y6iGBD5xL20X90crNKqN1XwUv9FAVfLXgSMcgggTceHn83z9MjJgL3HQrxZEBF+7Y6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512148; c=relaxed/simple;
	bh=7wnQYlOjzF2mNZ18II4ICAkJV9HoJVJTpOM3H7sUIDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3MoC4IPViW8fZ1X/XTLspLhBpwEafE5hGuTfTrScFXPkMIJlHkI2kg/TzKIG00u47MN3HWs1PeV0Z1vlo0OYJPRIdVGOCywNebnZgL3wDpZdLftLqoGI713s/pfEWzyZBqREP4K49KDxPb0+Ftp+T2Al6Nu1BfQ4X+7QsrVXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e9Pkf3mX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e9Pkf3mX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE221F000E9;
	Wed,  8 Jul 2026 12:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783512145;
	bh=svUegCeeEIJxDYccAP7/EgAAget1Ldeb6ZB4b7gGTfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e9Pkf3mX0Y7tJfxpUJZOKxzT3mGk2GMle7FlnaH4U4t63u+8U1EepgCa+7pHAcWtT
	 8LCqe0q9fV4pcr0TiLvwxEzJnJXiDmRekrbAVeDeRJIL0JT5yV1B26xxkwk8IfNmr3
	 Uuf5e2EJ355M92xh3DcIMn15zpmzcfv/cfnGAtdo=
Date: Wed, 8 Jul 2026 14:01:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] staging: rtl8723bs: sdio_intf.c: cleanup
Message-ID: <2026070845-wildly-bagpipe-403d@gregkh>
References: <20260708084808.305951-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708084808.305951-4-manuelebner@mailbox.org>

On Wed, Jul 08, 2026 at 10:48:10AM +0200, Manuel Ebner wrote:
> This series aims at cleaning up sdio_intf.c
> 
> [v4]
>  Remove patch [v3 4/4]
>   This already got patched
> 
> [v3]
>  split [v2 2/3] into [v3 2/4] and [v3 3/4]
> 
> [v2]
>  split patch into series of 3
> 

Only one of these applied to the tree due to changes sent by others in
the same area.  Please rebase those and resend.

thanks,

greg k-h

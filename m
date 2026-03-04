Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8941A00F0;
	Wed,  4 Mar 2026 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630581; cv=none; b=aBzeskoXaG6MaCgFxlYepdRzCJAFSgSwAVpmQAe1xUowYMl581kK2Vm1+T2XiSdB4rndk7jXkQirW7Y7Cp+/oxIGxtY77/HF9OnzpPinpeTLsM1K8pxTOjnFumoOmPTqO4rXK1SYf20tsUd+jHWGD/IxBEcewZEmmE3ccDscPgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630581; c=relaxed/simple;
	bh=cRnnHFbPuT6OC5f+Qq+chWQRgCUWueZ6ITV6N+2q91A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fndvd9OqrTndqA/nt3olG9exJqniAzBIve5LVLiXFGd6V7UyDHco04IPEx9Hy+vEOH5u8vPddc1Ce5vydKFlFrdXOWhy2z+8w7tUkmNdqkZsdGj0yKl5+CV+QqYACUamk8d/fq//jM7KGjCGWM0XuEECDu6uU/CYF26eB6A3rvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zKbE+uri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zKbE+uri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2F8C19423;
	Wed,  4 Mar 2026 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772630581;
	bh=cRnnHFbPuT6OC5f+Qq+chWQRgCUWueZ6ITV6N+2q91A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zKbE+uriWRd7BOWb/2uV7S+bYVc8TO05UszsDDfki4PTeVgJ/ReeGeItd5qNI/fM7
	 kYISdDLxTTjPNcM0i/D0siweyHd9wa9TTeMVj2UtYzAjnRIwV5YuaBMZvVbVoM62eU
	 p82tGSmVjuk5APoT/JcfbG5N8WWNSKegjeIWY82E=
Date: Wed, 4 Mar 2026 14:22:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: misc: xlnx,axi-fifo-mm-s: fix
 interrupt-parent property
Message-ID: <2026030429-kick-anemic-f48f@gregkh>
References: <e6f8db4d-2a5a-4424-b44d-6416ee0c5ca0@kernel.org>
 <20260304131610.37503-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304131610.37503-1-hossu.alexandru@gmail.com>

On Wed, Mar 04, 2026 at 02:16:10PM +0100, Alexandru Hossu wrote:
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

For obvious reasons, we can't take patches without any changelog text,
nor would you want us to.

thanks,

greg k-h

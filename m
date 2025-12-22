Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2E3A1E8B
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384601; cv=none; b=GxfnAj9kwk83pjC7WXCYIXwTElEEJVEI5Tut3tZhKCRMCqLk7kdjdF8y5k48bdjLgBATxzTJ0FZlT9j0OtxHMq+5cVAq0pBNsKqd8dlQoS8xv5yYuosAAitGuBndNXQjsliE6T4llBvbvnyLTu66iM/yQbuV3Jts9C16GbaYtyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384601; c=relaxed/simple;
	bh=cp4Y4Viq32Tcu/PvRr7OtpD1mzw/G1T4ZluFPnluqvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFftFgQ/CdBrJJejseFO9l+ka+bn1JguxwIaHqHOkv7f+lxtVDB2ln6t6OCjvO5zTwTblXUsqfUW5wxodLE1BCM5x18XEDDG8uJGXHy+9uHhpk+X3EVyMyyPRVONAYs/RBXhlnyMkRF+Q0xaHISCzuIKOH1mkVmC6KIZFf2TOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PzUPzYVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PzUPzYVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20322C4CEF1;
	Mon, 22 Dec 2025 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766384600;
	bh=cp4Y4Viq32Tcu/PvRr7OtpD1mzw/G1T4ZluFPnluqvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzUPzYVjVAH6WAkkJbr+ycJigjIYl245pJky2cwK+MCO75BK9kmvUXV5FTET6wsVd
	 or/+tg03AxZQm2u895SbjJpSPU67/3IztKCzhhncxT8KhJDwZEWwRmYumj9hE5RWb2
	 ziXFUIsSoUenwWOzbqxn0JbCHRZVpNYSidUKudqo=
Date: Mon, 22 Dec 2025 07:23:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khaled Saleh <khaled.saleh.req@gmail.com>
Cc: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH] staging: greybus: split gb_audio_gb_get_topology() into
 helper functions
Message-ID: <2025122240-cofounder-nephew-aec2@gregkh>
References: <20251221194200.3734-1-khaled.saleh.req@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221194200.3734-1-khaled.saleh.req@gmail.com>

On Sun, Dec 21, 2025 at 09:42:00PM +0200, Khaled Saleh wrote:
> From: khaled <khaled.saleh.req@gmail.com>

This, does not match:

> Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>

this.

Please fix up for your next submission of this change.

thanks,

greg k-h

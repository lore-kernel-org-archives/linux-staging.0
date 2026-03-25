Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7E030F540;
	Wed, 25 Mar 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428354; cv=none; b=pL58HFUvrSmb1bImT91AtJwg9lSSCKwcFysUz/x+DX7HYjJDfJMRRb07A365YqZmJ9S0HQ0Zm5eqae3U5K1GCZkZXp2e8fkNcYGoHr87QnKj68qliV6B5Iq1ae4Z2/cUBubQUvNhIJyV/JrBmP7BQwsQ8RL3PNR0GQB5iV9Djmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428354; c=relaxed/simple;
	bh=yuA40Noq2B38gqBeBHT/TJ+Si2YN8dCOsLOvXO04RFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRyk40mkS89Sd3FlprYQ3ExBDbcWphmXxsYB+XeEGU2FXrszaSgbjgAn2gdorlFcn7VO3R8xFE3T5WFrbc8tRgC8W5pCfrqFU/SrP054Iby9o3BODM3m9z49PVmH2lLQX6+XLfwMEY8PMnhIAfM1ZSqt+67Pe3HPKSBjDDjyUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bNReXSYD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bNReXSYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62025C4CEF7;
	Wed, 25 Mar 2026 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774428353;
	bh=yuA40Noq2B38gqBeBHT/TJ+Si2YN8dCOsLOvXO04RFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNReXSYDIO3EH/CfZlIqfTsRXG7rHOuZIp6xStKVmqF+X3YxTuyy0l9Z/LCdC9mCC
	 6LW4Sj7gf6kzd2YyLGj8FCcpMbCLZlwOVkz1dSDS86lo8RAFtfPlyZrWOT442Pb082
	 N7W95RkfsnS+u4kU84DVqbWY2rYcrG6TkPzRXHeg=
Date: Wed, 25 Mar 2026 09:45:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] staging: atomisp: pci: fix block comment style and
 merge split declaration
Message-ID: <2026032514-floral-preachy-bdb4@gregkh>
References: <acJ6sH4yUyity0gu@ashevche-desk.local>
 <20260324180821.42084-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324180821.42084-1-anushkabadhe@gmail.com>

On Tue, Mar 24, 2026 at 11:38:21PM +0530, Anushka Badhe wrote:
> Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> ---
> Changes in v2:
> - Fix block comment style (move closing */ to its own line)
> - Merge split GP_TIMER_BASE declaration onto a single line
> 
> Checked the rest of the file for similar issues; no others found.
> 
> Thank you so much for your guidance on improving the patch.

For obvious reasons, we can't take patches without any changelog text.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41CE18EFD4;
	Wed,  9 Oct 2024 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728467596; cv=none; b=n5AKUre1t6lLMZaMrzapSyfe85l8Uy/9yx8H7UUFiSOPwCdhcq55s77P5Hq3qh95inUhpnNgWBTbOF+lOye/D4raSfrs9gwCyGmFneGNCjbUyPSm2Sp4fxQunnQDg9lsrv/RF8Fy5ilMFwlAs4PiIpWE77Kn+ORpGANuBZjtJbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728467596; c=relaxed/simple;
	bh=j2Lxse2BN4aTLr8ZejBZA1i5O2pOcx+kLD6jz6YZ7oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4I+jyjm5F4zUc/oHdQe3ZlBgIC3jo9mkVT1+Df7VDLge+tq71+iT9ekY34ExoodpaLEViB6fBEuMHQUrQLEynHHj2WUbGYtwYGseD6/CiiW4ICdHc5VOsndumqHPv60Amm1wWpCVK6ThLV71E9Mf/3sqxiqna56HCogTOhDLj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pzB/7JFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pzB/7JFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE6C4CED5;
	Wed,  9 Oct 2024 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728467596;
	bh=j2Lxse2BN4aTLr8ZejBZA1i5O2pOcx+kLD6jz6YZ7oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzB/7JFtuMXRV9Tgp7v0B8g5CtLCObkdiOMCeTSSzolPY3iqAattoMtPJCJurk3Xc
	 nDvvZm0z0PUM4zcBMEqg/UqgOWdBsd6OaJy/7nUNmxhgNFlQipb8Z2tQsbqyyLkgx7
	 RCXi/U+hvEcJf8/7mFoDGDcZkZUmR1QcH0ciuBn0=
Date: Wed, 9 Oct 2024 11:53:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] Staging: rtl8192e: 18 more Style guide variable
 renames
Message-ID: <2024100902-jurist-outward-a6a4@gregkh>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>

On Mon, Sep 16, 2024 at 10:31:34PM -0700, Tree Davies wrote:
> This series fixes camelCase variable names
> Thank you to all reviewers.
> ~Tree

Sorry, but this driver is now deleted from the tree.

greg k-h

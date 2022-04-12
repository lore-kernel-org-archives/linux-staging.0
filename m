Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A031FA1;
	Tue, 12 Apr 2022 04:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66164C385A6;
	Tue, 12 Apr 2022 04:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649739584;
	bh=7GTblpVpSQYcAVhFqTpBAzjm8SimTPaUHKg0ETvVUI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxXrb3FNHbJBnyOCUDOz2Y+T89PrBH/HRtU3ykwISXCaDAPkHd7OOsNnkZT9CkX4/
	 x1ZnFXoudcryTVI0Ny+Tc6dlwwI/QiuphrVkXnuViw23GzN7J+Z07UICJSDp9jI4Uq
	 VMG/Qs5IJMOXZIkBOokMJjAQnZq4pQfzqQcoRwnU=
Date: Tue, 12 Apr 2022 06:59:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaehee Park <jhpark1013@gmail.com>
Cc: =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH V3] wfx: use container_of() to get vif
Message-ID: <YlUHPjw2mbhnuZCM@kroah.com>
References: <20220412041218.GA2859599@jaehee-ThinkPad-X1-Extreme>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412041218.GA2859599@jaehee-ThinkPad-X1-Extreme>

On Tue, Apr 12, 2022 at 12:12:18AM -0400, Jaehee Park wrote:
> Currently, upon virtual interface creation, wfx_add_interface() stores
> a reference to the corresponding struct ieee80211_vif in private data,
> for later usage. This is not needed when using the container_of
> construct. This construct already has all the info it needs to retrieve
> the reference to the corresponding struct from the offset that is
> already available, inherent in container_of(), between its type and
> member inputs (struct ieee80211_vif and drv_priv, respectively).
> Remove vif (which was previously storing the reference to the struct
> ieee80211_vif) from the struct wfx_vif, define a macro
> wvif_to_vif(wvif) for container_of(), and replace all wvif->vif with
> the newly defined container_of construct.
> 
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
> 
> Changes in v3:
> - Made edits to the commit message.
> - Shortened the macro name from wvif_to_vif to to_vif.
> - For functions that had more than one instance of vif, defined one 
> reference vif at the beginning of the function and used that instead.
> - Broke the if-statements that ran long into two lines.
> (There are 3 lines that exceed 80 by less than 4 characters. Two of 
> those lines of code could be shorted but it involved defining two more 
> variables, and could potentially make the code less readable.)
> 
> Note: I will mail this patch to the wireless-next tree after testing.
> 
> 
>  drivers/staging/wfx/wfx.h     |  2 +-

This file is not in linux-next anymore.


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736323A0
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 05:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08096C385A9;
	Mon,  6 Jun 2022 05:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654494927;
	bh=NhiW/DZWdFttkvRo+PQSIkrmMlpMLgPm+d57yoJMkxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fE0zo+GvfbMWejpv/sgSEe70OfsKvdCZ8/a/HVluJOnDByePqeIsmuNWaa4Eztnxv
	 APIaTsN7e/ovxF2MPUsoyVmguvUr6SZed1EYN1au2+R+3wWSFS8zNKlEUmU1vyCVI3
	 2UOTeWy+6L7djk60/CMyFFUfyNk9ds5ZvFPElntk=
Date: Mon, 6 Jun 2022 07:55:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] staging: r8188eu: Fix one kernel-doc comment
Message-ID: <Yp2WzN7q0Pe2WTKy@kroah.com>
References: <20220526125342.78264-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526125342.78264-1-yang.lee@linux.alibaba.com>

On Thu, May 26, 2022 at 08:53:42PM +0800, Yang Li wrote:
> Remove one warning found by running scripts/kernel-doc,
> which is caused by using 'make W=1'.
> 
> drivers/staging/r8188eu/core/rtw_ieee80211.c:720: warning: expecting
> prototype for ieee802_11_parse_elems(). Prototype was for
> rtw_ieee802_11_parse_elems() instead

Again, all on one line please.

thanks,

greg k-h

Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF2B70
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:39:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8B54613B8;
	Tue, 13 Apr 2021 07:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618299587;
	bh=UKLi8N7PpyoP0aTw1Rc06CM25uT52l0anJPWfPBcGOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQNwowknv7OnO5LeSWNcWfwmUf3l+pPLdAutNHoLNXy2Zf6aIBOSWhPi7kW15lYXd
	 olyoch2ThrKxUlw853xBL6h+Z06xtJCNPfQzi2ZSQ/zjqae1CyYIIU/x3AqlpcvliM
	 MlLtGG0VH6MoPms7iKfJAKl/frNSs1GcMU0sS5sw=
Date: Tue, 13 Apr 2021 09:39:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Remove
 camelcase
Message-ID: <YHVKwEX8CvV7brRg@kroah.com>
References: <20210412210258.8061-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412210258.8061-1-fmdefrancesco@gmail.com>

On Mon, Apr 12, 2021 at 11:02:58PM +0200, Fabio M. De Francesco wrote:
> Removed camelcase in (some) symbols. Further work is needed.

What symbols did you do this for?  What did you change them from and to?

Be specific, and try to do only one structure at a time at the most,
trying to review 1000 lines of changes at once is hard, would you want
to do that?  :)

thanks,

greg k-h

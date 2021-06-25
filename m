Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357662FB2
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 08:07:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 650EA61425;
	Fri, 25 Jun 2021 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1624608448;
	bh=3U9dOh8ubJIZg7LPE4ibu71lztZPpneG4VY8XUeQMJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NecY4QLc6B1Iy1Wn0nDs+hgKCfA11BmN3lJ9UndAuFph4V3CxfXgv9bNevvKbpEhL
	 QZnZm+rwc2daJFC6U+4YlxDUBufuRCTZrFc3D2uKjcT6s7O9TLGP4upUN3PqsmiEB4
	 JINWJt7rhwJymccYInvr130+hYknFGYWh7OT+CPw=
Date: Fri, 25 Jun 2021 10:07:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 00/12] Move Hisilicon 6421v600 SPMI and USB drivers
 out of staging
Message-ID: <YNWOvn67Gl2v3Cco@kroah.com>
References: <cover.1624606660.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624606660.git.mchehab+huawei@kernel.org>

On Fri, Jun 25, 2021 at 09:45:52AM +0200, Mauro Carvalho Chehab wrote:
> Hi Greg,
> 
> Thanks for merging patches 1 and 2 from the v7 series!
> 
> Those are the remaining patches that are needed for the USB to work
> with Hikey970.
> 
> I guess patches 1 and 2 on this series are also OK, as they were acked
> by the PHY and SPMI maintainers.
> 
> As suggested on your last review, I broke the MFD staging patches 
> into one logical change per patch.
> 
> Except for the split, the only change from v7 was at the copyright: 
> I'm using 20xx-2021 instead of 20xx- to indicate that the copyrights
> extend to the present. I also changed the HiSilicon name to better
> reflect the name of the company.

The copyright change is still not correct.  I recommend you take a look
at this:
	https://www.linuxfoundation.org/blog/copyright-notices-in-open-source-software-projects/
and:
	https://training.linuxfoundation.org/training/open-source-licensing-basics-for-software-developers/
	(the copyright chapter)
for specifics as to what to, and not to do with regards to copyright
notices.

I'm sure your employer also has some information about what to do with
regards to this as well.

I've taken patches 1-3, 5-9 now.

thanks,

greg k-h

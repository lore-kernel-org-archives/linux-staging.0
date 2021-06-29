Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E236177
	for <linux-staging@lists.linux.dev>; Tue, 29 Jun 2021 10:43:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CF6661DA7;
	Tue, 29 Jun 2021 10:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1624963429;
	bh=zp9yHcBmMJmseSg/8nw8IwZKe97SADcduF31yAi7xqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yXnjKFs0mezf3ClAmrFWScUUImQebiGVxENgKuaFQIVYObxzGGv6sqDXAXlKQnWhZ
	 CTjMLNYYqjALs3piy2M9NyxUQnyixsNglKbGBMK/TNZJz05MO5kd6mXPMHXgHAWf1b
	 cX9OWERbS6uM21L2qfplXRlfpG8dBTk7Z24BT8Z0=
Date: Tue, 29 Jun 2021 12:43:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Lee Jones <lee.jones@linaro.org>, Axel Lin <axel.lin@ingics.com>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 0/5] Move Hisilicon 6421v600 SPMI and USB drivers out
 of staging
Message-ID: <YNr5Y5mDjX5pHfFO@kroah.com>
References: <cover.1624962269.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624962269.git.mchehab+huawei@kernel.org>

On Tue, Jun 29, 2021 at 12:31:26PM +0200, Mauro Carvalho Chehab wrote:
> Hi Greg,
> 
> This series contain the final bits needed for the USB3 bus to work
> without staging drivers on Hikey 970.

Thanks for these, I'll look at them after 5.14-rc1 is out.

greg k-h

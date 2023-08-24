Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B02D24550
	for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 11:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37845C433C8;
	Thu, 24 Aug 2023 11:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692877052;
	bh=gQQO8+W0iPNHyhHVuXHhRpBxxoXJMSUX9SaWcgjfdDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0M56WddNEdpzp4NnpU7uDhm5ba/lb5zmiJ+WMFaWc9Y4KbBLHk3hldlK+ATVL0UY
	 ea8JlBQq9n8FuKKLieH2AzQMAD5zTKalztLC7k0B0lydK/Njtl6X8zCJvghs5t9T5a
	 7fM2iIvLLodqifcRTO7fYr77wAdoV4vAOZsSyEDE=
Date: Thu, 24 Aug 2023 13:37:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jack Zhu <jack.zhu@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	changhuang.liang@starfivetech.com
Subject: Re: [PATCH v8 0/8] Add StarFive Camera Subsystem driver
Message-ID: <2023082436-spendable-reshuffle-878d@gregkh>
References: <20230824080109.89613-1-jack.zhu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824080109.89613-1-jack.zhu@starfivetech.com>

On Thu, Aug 24, 2023 at 04:01:01PM +0800, Jack Zhu wrote:
> Hi,
> 
> This series is the v8 series that attempts to support the Camera Subsystem
> found on StarFive JH7110 SoC.

I don't see anything here about why this is in drivers/staging/media/
now and not just in drivers/media/.  What is preventing this to be put
into the correct place to start with?  What needs to be done to the code
to get it out of drivers/staging/media/ and who is going to do that
work?

thanks,

greg k-h

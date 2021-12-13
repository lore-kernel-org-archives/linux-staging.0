Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D68173
	for <linux-staging@lists.linux.dev>; Mon, 13 Dec 2021 04:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7897CC00446;
	Mon, 13 Dec 2021 04:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639371554;
	bh=uqDkjyi1DAG2WVFI7Iu0TC2w+GaDC3EmWkInyLpcGtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVDRCny15VHJlA+o7pFyvRO+fGTVY2J3x91BIqcOwy4cryBFjZQyaHtyPhgW6KO28
	 HCKopx8WXOVlRdPjhEOrjN2VBJ1zFB8NRnGb5EUdfofWdRrki7ZlorlrhKm0n81/la
	 3mN9IpyIgfzc1/r0ZuBokeJT/zwaGH17foE/YzWMrXovh2MCpsiNQwWNaKLY5YRyFy
	 blW8ncTTX15Q1zUIMmgSzOFg2mWmU6KWhkXrs65ZUlMvc/lyG3K8k5h5nInsBLDfjW
	 SlpMqgTcrrDN8iKQSo2q7ad2+NbXTwlELLLoqff2K0DHg43fpfYsWOz0ibzpD4QupX
	 V/h6/iJ4bdVAQ==
Date: Mon, 13 Dec 2021 10:29:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
	Jon Hunter <jonathanh@nvidia.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Scott Branden <sbranden@broadcom.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/11] dmaengine: kill off dma_slave_config->slave_id
Message-ID: <YbbTHo+Wfpl30ZUH@matsya>
References: <20211122222203.4103644-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>

On 22-11-21, 23:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I recently came across some new uses of the 'slave_id' field that
> I had (almost) removed a few years ago. There are no legitimate
> uses of this field in the kernel, only a few stale references and
> two drivers that abuse the field as a side-channel between the
> dmaengine driver and its client.
> 
> Let's change the xilinx and qualcomm drivers to use the documented
> side-channel (peripheral_data) instead, and remove the remnants of
> it to prevent new users from coming in.
> 
> I think I got all the necessary Acks on v1 already, so if there are
> no further concerns, please merge this through the dmaengine tree
> for v5.17, or pull from

Arnd, Thanks for the cleanup. I have applied and folder the fix you sent
in this

-- 
~Vinod

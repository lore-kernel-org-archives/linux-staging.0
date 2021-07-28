Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB473481
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 07:46:18 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1m8eGT-0006hg-9S; Wed, 28 Jul 2021 09:46:05 +0200
Date: Wed, 28 Jul 2021 09:46:05 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, fabioaiuto83@gmail.com
Subject: Re: [PATCH v4 0/6] staging: r8188eu: add newer/better RTL8188eu
 driver
Message-ID: <20210728074605.pp5rs4c65tofnqot@viti.kaiser.cx>
References: <20210727232219.2948-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727232219.2948-1-phil@philpotter.co.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Philipp and all,

Thus wrote Phillip Potter (phil@philpotter.co.uk):

> The driver currently in staging is older and less functional than the
> version on Larry Finger's GitHub account, based upon v4.1.4_6773.20130222.
> This series of patches therefore:

[...]

> V4: don't remove old driver now, just mark as deprecated and modify to
>     allow building alongside the new driver.

Basically, you're suggesting to put aside all the fixes and cleanup
that was done since the rtl8188eu driver was imported into the kernel
tree. The TODO file says

- merge Realtek's bugfixes and new features into the driver

Why aren't we going down this route?

Edimax offer a realtek driver linux_v5.7.6.1_36803.20200602 for
rtl8188eu as a .zip file for download on their website

https://www.edimax.com/edimax/mw/cufiles/files/download/Driver_Utility/EW-7811Un_V2/EW-7811Un_V2_Linux_Driver_1.0.1.2.zip

If we integrate and fix the v4.1.4_6773.20130222 driver, are we running
the risk that someone else will come along and propose another replacement?

Thanks,
Martin

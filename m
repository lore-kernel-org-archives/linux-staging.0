Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D6AD47
	for <linux-staging@lists.linux.dev>; Thu,  6 Apr 2023 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680810866; x=1712346866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dBwR6d65NhaZa59aMDdtZHdCzTe7JiUQkdICsAhmmks=;
  b=Qb+hzsr0B4Ns3Nxm3YdfG4AZGHdkSkWpWk44trh5UknxViMYHBGI368a
   sK162HSjmxLxs7CO0KfEeW4lpw2QtwrAqGufG2yw9xsDS2glJ5J2Be2s0
   W7j5XFC8QuOCp26ZHZVYgOlq/LSShyUAAYs8qS0vHxqkj3P4JjjVFngt9
   4LRGriwmy7Tl9PYiYPWa7zXmD2q4y1XCWqk3sdg7Ijtt8LLLcxAH86V6g
   Y8agqwKS26IUkU8fn0oaKvMAhS2SxmYSI3Xm+6PIgMc0MdLYAHe7LpG9X
   PUZSPKbiKAmCzfdeTgD2xf5Uw9bwbktVMO6kSY+OJ3CKdIsEZxkueSn8E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341572510"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="341572510"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 12:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664620036"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664620036"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.219.12])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 12:54:12 -0700
Date: Thu, 6 Apr 2023 12:54:10 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: rtl8192e: Remove unused local variable
 irq_line
Message-ID: <ZC8jYs/m47SeKkuZ@aschofie-mobl2>
References: <cover.1680729715.git.philipp.g.hortmann@gmail.com>
 <6ec702e12cb30501fc81693a71a96b238bf09ea0.1680729716.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ec702e12cb30501fc81693a71a96b238bf09ea0.1680729716.git.philipp.g.hortmann@gmail.com>

On Wed, Apr 05, 2023 at 11:48:20PM +0200, Philipp Hortmann wrote:
> Remove unused local variable irq_line.

This does more than just remove the unused variable.

> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_pci.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> index 0bc3e013001e..1c3ccd2aabc3 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> @@ -33,11 +33,9 @@ bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
>  	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
>  	u16 device_id;
>  	u8  revision_id;
> -	u16 irq_line;
>  
>  	device_id = pdev->device;
>  	revision_id = pdev->revision;
> -	pci_read_config_word(pdev, 0x3C, &irq_line);
>  
>  	priv->card_8192 = NIC_8192E;
>  
> -- 
> 2.40.0
> 

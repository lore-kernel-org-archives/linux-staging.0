Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7E82579
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RzMWJ+V7j6n8wqrdlxSAaZ65WmCdGM5jpjFwYqURuAU=; b=KcmlhnLarEdV5Hogd22WEy04wc
	fIAC//AKmkT1hu9BOGzKTN9giV2GHY/5ZIjNSME5+BVQ7fMpe7aDmjO++gQrc5dfC+ZJb9sFKhrKb
	7YN8508ec+ZXufjZLhiBF1TSGV9hdiz1kfCQG1n354+x+JlVxwgWUCUXc+AI+LVOGZm8D7QTR8vSj
	SIXtAbGQMzxz29kMBziWGwHHot0FIjk8VBwzkRJTG0zc8wPn9jJIZ5LhlMIJFHDKRbcOt6ebCXLPL
	7pBLHdpGi53Qh8WZ0eBhi768k6Q/WocMotP2Wpd1k9NZdTrBNpb3JuK+aEB9yrvbkWWzS8l3/oZOD
	29p2Z10A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nskAB-001Ecq-QI; Sun, 22 May 2022 11:54:23 +0000
Date: Sun, 22 May 2022 04:54:23 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>, kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-staging@lists.linux.dev,
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
	linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	KVM list <kvm@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	linux-sparse@vger.kernel.org,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [linux-next:master] BUILD REGRESSION
 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
Message-ID: <Yookb5den2ruDBDo@infradead.org>
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com>
 <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
 <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

How about just turning the MMIO/PIO accessors on m68k into inline
functions as they are on most other architectures?

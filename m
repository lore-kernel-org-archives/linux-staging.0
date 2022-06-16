Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9847A
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 05:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655356271; x=1686892271;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=NkEFYvNXfkRiyQzrKr5w73UFu/bNjvCsd8osZsw1FkQ=;
  b=Wq5Wbr5j20sn2CgBp1V83crUtBiroXWV06ScgHoTxBgfvFlPg1mmqNvo
   d3f+NQgHx5zWAC4CdqTiMCTDx7xOQvHoFFm/KDGFCmPynC1YVwz3KPvUf
   QdAFsW9tC314fJSapnN5G/G3oj0OuKYMh9j/iJteIFzKSxD6akjyRzTbZ
   JDa8Wbsj+goGQWRmIEx6cjU6IEUjj+NLY6Rgyz8CRFo1MdIDBdjI4mezm
   +ZAHlhq2PKGlF6lfU37QQVnnuvIFagDR6MY66Zb0QZaH9iEzJvCm+r6EA
   se8ZDauOW1R2JKRcv9JEW7rkDWthcSYE1P2DPWBIGjCq29bw7h4M4uIWS
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="262187908"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="262187908"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:11:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="641365226"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.174.230]) ([10.249.174.230])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:11:05 -0700
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 Networking <netdev@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-parport@lists.infradead.org,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kvm list <kvm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 bpf <bpf@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <7a9f0c2d-f1e9-dd2f-6836-26d08bfa45a0@intel.com>
Date: Thu, 16 Jun 2022 13:11:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/26/2022 4:32 PM, Arnd Bergmann wrote:
> On Wed, May 25, 2022 at 11:35 PM kernel test robot <lkp@intel.com> wrote:
>> .__mulsi3.o.cmd: No such file or directory
>> Makefile:686: arch/h8300/Makefile: No such file or directory
>> Makefile:765: arch/h8300/Makefile: No such file or directory
>> arch/Kconfig:10: can't open file "arch/h8300/Kconfig"
> 
> Please stop building h8300  after the asm-generic tree is merged, the
> architecture is getting removed.
> 
>          Arnd
> 

Hi Arnd,

Thanks for the advice, we have stopped building h8300 for new kernel.

Best Regards,
Rong Chen

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA7C10E0
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652715098; x=1684251098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZWRS3tXKRPVHeGH9vSAu21uCI1IHYONEyb+H9e2Oa2s=;
  b=MU+qTjR7xcnJxB0sbgL91VhK8opa6MWeu1H2ExnhzHbZRNNtdJGxR4YL
   M31SMCnRIsCjPT8/SzRNFdUInbPZt7per7dFnQsoaWUE0U9Cs5qAiC2u7
   8ZT5cFbZpkIWo3VkQahdhS1pyBeaagizm4LUZ1XgtFo0xJ9aYFCyF3aFs
   R53ZJhKwIpiCUB6lrbSiCb0Y5JpSNgsAKNWvmRPqIHJYstuQ1RUfLHfpN
   n5lv6wbIPJgWh3xJ409u7kyzDbJqxPGegGdLcJ0dd3KxL0DkNo22QvXx6
   a20Bki4jOsriCdE0uBjZ+3KrGRwFgPTvViQJDe1VGJtndtxNNPAS1Uz54
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="269696841"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="269696841"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 08:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="522498262"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 May 2022 08:31:35 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqch4-000096-Ag;
	Mon, 16 May 2022 15:31:34 +0000
Date: Mon, 16 May 2022 23:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?WWHFn2FyIEFyYWJhY8Sx?= <yasar11732@gmail.com>,
	gregkh@linuxfoundation.org
Cc: kbuild-all@lists.01.org, paulo.miguel.almeida.rodenas@gmail.com,
	dan.carpenter@oracle.com, alexandre.belloni@bootlin.com,
	realwakka@gmail.com, u.kleine-koenig@pengutronix.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	=?utf-8?B?WWHFn2FyIEFyYWJhY8Sx?= <yasar11732@gmail.com>
Subject: Re: [PATCH] Staging: pi433: Don't use ioctl for per-client
 configuration
Message-ID: <202205162305.tBuUiz79-lkp@intel.com>
References: <20220515104711.94567-1-yasar11732@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220515104711.94567-1-yasar11732@gmail.com>

Hi "Yaşar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Ya-ar-Arabac/Staging-pi433-Don-t-use-ioctl-for-per-client-configuration/20220515-185057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git e41f7a5521d7f03dca99e3207633df71740569dd
config: x86_64-randconfig-s022-20220516 (https://download.01.org/0day-ci/archive/20220516/202205162305.tBuUiz79-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/0cfbff215eb0e9e558af6b491d319fc736a927c6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ya-ar-Arabac/Staging-pi433-Don-t-use-ioctl-for-per-client-configuration/20220515-185057
        git checkout 0cfbff215eb0e9e558af6b491d319fc736a927c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/staging/pi433/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/staging/pi433/pi433_if.c:816:19: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +816 drivers/staging/pi433/pi433_if.c

   792	
   793	static ssize_t
   794	pi433_write(struct file *filp, const char __user *buf,
   795		    size_t count, loff_t *f_pos)
   796	{
   797		struct pi433_instance	*instance;
   798		struct pi433_tx_cfg *tx_cfg;
   799		struct pi433_device	*device;
   800		int                     retval;
   801		unsigned int		required, available, copied;
   802	
   803		instance = filp->private_data;
   804		device = instance->device;
   805	
   806		/*
   807		 * check, whether internal buffer (tx thread) is big enough
   808		 * for requested size
   809		 */
   810		if (unlikely(count > MAX_MSG_SIZE))
   811			return -EMSGSIZE;
   812	
   813		if (unlikely(count < sizeof(struct pi433_tx_cfg)))
   814			return -EMSGSIZE;
   815	
 > 816		tx_cfg = (struct pi433_tx_cfg *)buf;
   817	
   818		if (unlikely(count != sizeof(struct pi433_tx_cfg)) + tx_cfg->payload_size)
   819			return -EMSGSIZE;
   820	
   821		/*
   822		 * write the following sequence into fifo:
   823		 * - tx_cfg
   824		 * - size of message
   825		 * - message
   826		 */
   827		mutex_lock(&device->tx_fifo_lock);
   828	
   829		available = kfifo_avail(&device->tx_fifo);
   830		if (count > available) {
   831			dev_dbg(device->dev, "write to fifo failed: %d bytes required but %d available\n",
   832				required, available);
   833			mutex_unlock(&device->tx_fifo_lock);
   834			return -EAGAIN;
   835		}
   836	
   837		retval = kfifo_from_user(&device->tx_fifo, buf, count, &copied);
   838		if (retval || copied != count)
   839			goto abort;
   840	
   841		mutex_unlock(&device->tx_fifo_lock);
   842	
   843		/* start transfer */
   844		wake_up_interruptible(&device->tx_wait_queue);
   845		dev_dbg(device->dev, "write: generated new msg with %d bytes.\n", copied);
   846	
   847		return copied;
   848	
   849	abort:
   850		dev_warn(device->dev,
   851			 "write to fifo failed, non recoverable: 0x%x\n", retval);
   852		mutex_unlock(&device->tx_fifo_lock);
   853		return -EAGAIN;
   854	}
   855	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

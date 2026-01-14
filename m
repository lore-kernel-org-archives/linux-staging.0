Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39586397AA3;
	Wed, 14 Jan 2026 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393125; cv=none; b=OljqGWR+Br7yfWCrvlYXv+Aj7wJu4yDTKotIC+PXYBbuESKuNsMtwNE3eFY3ZQt3reh11M0U5gLZoIe00lo+Q3k0SCH8S1njQOh2tl7fhNa+vOSFvmNZa1E7kOqBe5+MNZ0j3Jrq3FDG6J7ZeIx5H68rWfpKsNPtI9Ihahn5PXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393125; c=relaxed/simple;
	bh=UnhHQ8lXJMIrgyIB4tJHn5Pjr2E3aLS11oULT4eO7xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7Kp8MIgPvUUF60sSMWfXfxy0a12tSPUe2A4m8/cdEhD2xnwEFS1Vph9m4eqEDWDmRCqirTbrNhTilZjWN+ewG71IfPH9PtYh8sP7jgRmoLWRI+oGgkYuBiTQiT9n31d8f1qanGAR6AHVFst8qkSDL+LWMXfIJj1qBhvNs20qco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnFRT91d; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnFRT91d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768393124; x=1799929124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UnhHQ8lXJMIrgyIB4tJHn5Pjr2E3aLS11oULT4eO7xs=;
  b=DnFRT91doNMoSkr0r4QAs79yXIdiNYV3IMXtaDw3F9Xyxj8yNLuGK4oF
   HyXUTCEYBiJ2R5++NmXyIx4JkPQd/nmZZUdIjElKj+aLAMfjjVN10xL0O
   aj32GwB3s9QNkEh+jgObpQTv69aG+E3kEKIByTB55GqN6nI8dHHj5Q97O
   i/aERrVbOLkmuriSH9sXqN6kpoiYl15IxGxsjtFUq7566bhOKiT19a9Lh
   HRvtkHM4lf/J1qDPyNzIcL+7KUmMunE+q/daep9ukTEXRbrn4rl1+QHRl
   6tAelEaGKBPKcR+5EFoBlH6Ma5NOxPzC/kNfpBpy7syGFlLi19fOliKJW
   Q==;
X-CSE-ConnectionGUID: sXt7G1/WR4+C07RN8i5LzQ==
X-CSE-MsgGUID: gNNs8q5KQzuaytHJgzEENg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95164448"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="95164448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:18:44 -0800
X-CSE-ConnectionGUID: 0h/5i/kIQPiIIzcl7TPdqg==
X-CSE-MsgGUID: FAtXkHxFQhyO3eTWCRk3jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204452818"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jan 2026 04:18:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfzpe-00000000GLs-2mnp;
	Wed, 14 Jan 2026 12:18:38 +0000
Date: Wed, 14 Jan 2026 20:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Minu Jin <s9430939@naver.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Minu Jin <s9430939@naver.com>
Subject: Re: [PATCH 2/2] staging: axis-fifo: Use bulk I/O accessors for data
 transfers
Message-ID: <202601141928.CyFxDTEk-lkp@intel.com>
References: <20260113133831.3422480-3-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113133831.3422480-3-s9430939@naver.com>

Hi Minu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-linus]
[also build test WARNING on linus/master v6.19-rc5]
[cannot apply to staging/staging-testing staging/staging-next next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Minu-Jin/staging-axis-fifo-introduce-helper-functions-for-register-access/20260113-215835
base:   staging/staging-linus
patch link:    https://lore.kernel.org/r/20260113133831.3422480-3-s9430939%40naver.com
patch subject: [PATCH 2/2] staging: axis-fifo: Use bulk I/O accessors for data transfers
config: powerpc-randconfig-001-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141928.CyFxDTEk-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141928.CyFxDTEk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141928.CyFxDTEk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/axis-fifo/axis-fifo.c: In function 'axis_fifo_read':
>> drivers/staging/axis-fifo/axis-fifo.c:203:22: warning: unused variable 'i' [-Wunused-variable]
     203 |         unsigned int i;
         |                      ^


vim +/i +203 drivers/staging/axis-fifo/axis-fifo.c

4a965c5f89decd Jacob Feder       2018-07-22  179  
0443b3f4436321 Quentin Deslandes 2020-01-21  180  /**
bbf40b2f6e38d0 Lee Jones         2021-04-14  181   * axis_fifo_read() - Read a packet from AXIS-FIFO character device.
c848434c629db5 Lee Jones         2021-04-14  182   * @f: Open file.
c848434c629db5 Lee Jones         2021-04-14  183   * @buf: User space buffer to read to.
c848434c629db5 Lee Jones         2021-04-14  184   * @len: User space buffer length.
c848434c629db5 Lee Jones         2021-04-14  185   * @off: Buffer offset.
0443b3f4436321 Quentin Deslandes 2020-01-21  186   *
0443b3f4436321 Quentin Deslandes 2020-01-21  187   * As defined by the device's documentation, we need to check the device's
0443b3f4436321 Quentin Deslandes 2020-01-21  188   * occupancy before reading the length register and then the data. All these
0443b3f4436321 Quentin Deslandes 2020-01-21  189   * operations must be executed atomically, in order and one after the other
0443b3f4436321 Quentin Deslandes 2020-01-21  190   * without missing any.
0443b3f4436321 Quentin Deslandes 2020-01-21  191   *
0443b3f4436321 Quentin Deslandes 2020-01-21  192   * Returns the number of bytes read from the device or negative error code
0443b3f4436321 Quentin Deslandes 2020-01-21  193   *	on failure.
0443b3f4436321 Quentin Deslandes 2020-01-21  194   */
4a965c5f89decd Jacob Feder       2018-07-22  195  static ssize_t axis_fifo_read(struct file *f, char __user *buf,
4a965c5f89decd Jacob Feder       2018-07-22  196  			      size_t len, loff_t *off)
4a965c5f89decd Jacob Feder       2018-07-22  197  {
4a965c5f89decd Jacob Feder       2018-07-22  198  	struct axis_fifo *fifo = (struct axis_fifo *)f->private_data;
4a965c5f89decd Jacob Feder       2018-07-22  199  	size_t bytes_available;
4a965c5f89decd Jacob Feder       2018-07-22  200  	unsigned int words_available;
4a965c5f89decd Jacob Feder       2018-07-22  201  	unsigned int copied;
4a965c5f89decd Jacob Feder       2018-07-22  202  	unsigned int copy;
4a965c5f89decd Jacob Feder       2018-07-22 @203  	unsigned int i;
4a965c5f89decd Jacob Feder       2018-07-22  204  	int ret;
4a965c5f89decd Jacob Feder       2018-07-22  205  	u32 tmp_buf[READ_BUF_SIZE];
4a965c5f89decd Jacob Feder       2018-07-22  206  
89443a92c506dc Ovidiu Panait     2025-09-19  207  	if (f->f_flags & O_NONBLOCK) {
0443b3f4436321 Quentin Deslandes 2020-01-21  208  		/*
0443b3f4436321 Quentin Deslandes 2020-01-21  209  		 * Device opened in non-blocking mode. Try to lock it and then
0443b3f4436321 Quentin Deslandes 2020-01-21  210  		 * check if any packet is available.
4a965c5f89decd Jacob Feder       2018-07-22  211  		 */
0443b3f4436321 Quentin Deslandes 2020-01-21  212  		if (!mutex_trylock(&fifo->read_lock))
4a965c5f89decd Jacob Feder       2018-07-22  213  			return -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  214  
58e835695afaef Minu Jin          2026-01-13  215  		if (!axis_fifo_read_reg(fifo, XLLF_RDFO_OFFSET)) {
0443b3f4436321 Quentin Deslandes 2020-01-21  216  			ret = -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  217  			goto end_unlock;
0443b3f4436321 Quentin Deslandes 2020-01-21  218  		}
4a965c5f89decd Jacob Feder       2018-07-22  219  	} else {
4a965c5f89decd Jacob Feder       2018-07-22  220  		/* opened in blocking mode
4a965c5f89decd Jacob Feder       2018-07-22  221  		 * wait for a packet available interrupt (or timeout)
4a965c5f89decd Jacob Feder       2018-07-22  222  		 * if nothing is currently available
4a965c5f89decd Jacob Feder       2018-07-22  223  		 */
0443b3f4436321 Quentin Deslandes 2020-01-21  224  		mutex_lock(&fifo->read_lock);
0443b3f4436321 Quentin Deslandes 2020-01-21  225  		ret = wait_event_interruptible_timeout(fifo->read_queue,
58e835695afaef Minu Jin          2026-01-13  226  						       axis_fifo_read_reg(fifo, XLLF_RDFO_OFFSET),
752cbd8f191678 Khadija Kamran    2023-03-17  227  						       read_timeout);
4a965c5f89decd Jacob Feder       2018-07-22  228  
0443b3f4436321 Quentin Deslandes 2020-01-21  229  		if (ret <= 0) {
4a965c5f89decd Jacob Feder       2018-07-22  230  			if (ret == 0) {
0443b3f4436321 Quentin Deslandes 2020-01-21  231  				ret = -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  232  			} else if (ret != -ERESTARTSYS) {
4a965c5f89decd Jacob Feder       2018-07-22  233  				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in read (ret=%i)\n",
4a965c5f89decd Jacob Feder       2018-07-22  234  					ret);
0443b3f4436321 Quentin Deslandes 2020-01-21  235  			}
0443b3f4436321 Quentin Deslandes 2020-01-21  236  
0443b3f4436321 Quentin Deslandes 2020-01-21  237  			goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  238  		}
4a965c5f89decd Jacob Feder       2018-07-22  239  	}
4a965c5f89decd Jacob Feder       2018-07-22  240  
58e835695afaef Minu Jin          2026-01-13  241  	bytes_available = axis_fifo_read_reg(fifo, XLLF_RLR_OFFSET);
82a051e2553b9e Ovidiu Panait     2025-09-12  242  	words_available = bytes_available / sizeof(u32);
4a965c5f89decd Jacob Feder       2018-07-22  243  	if (!bytes_available) {
c6e8d85fafa719 Gabriel Shahrouzi 2025-04-18  244  		dev_err(fifo->dt_device, "received a packet of length 0\n");
0443b3f4436321 Quentin Deslandes 2020-01-21  245  		ret = -EIO;
0443b3f4436321 Quentin Deslandes 2020-01-21  246  		goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  247  	}
4a965c5f89decd Jacob Feder       2018-07-22  248  
4a965c5f89decd Jacob Feder       2018-07-22  249  	if (bytes_available > len) {
c6e8d85fafa719 Gabriel Shahrouzi 2025-04-18  250  		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu)\n",
4a965c5f89decd Jacob Feder       2018-07-22  251  			bytes_available, len);
0443b3f4436321 Quentin Deslandes 2020-01-21  252  		ret = -EINVAL;
82a051e2553b9e Ovidiu Panait     2025-09-12  253  		goto err_flush_rx;
4a965c5f89decd Jacob Feder       2018-07-22  254  	}
4a965c5f89decd Jacob Feder       2018-07-22  255  
4a965c5f89decd Jacob Feder       2018-07-22  256  	if (bytes_available % sizeof(u32)) {
4a965c5f89decd Jacob Feder       2018-07-22  257  		/* this probably can't happen unless IP
4a965c5f89decd Jacob Feder       2018-07-22  258  		 * registers were previously mishandled
4a965c5f89decd Jacob Feder       2018-07-22  259  		 */
c6e8d85fafa719 Gabriel Shahrouzi 2025-04-18  260  		dev_err(fifo->dt_device, "received a packet that isn't word-aligned\n");
0443b3f4436321 Quentin Deslandes 2020-01-21  261  		ret = -EIO;
82a051e2553b9e Ovidiu Panait     2025-09-12  262  		goto err_flush_rx;
4a965c5f89decd Jacob Feder       2018-07-22  263  	}
4a965c5f89decd Jacob Feder       2018-07-22  264  
4a965c5f89decd Jacob Feder       2018-07-22  265  	/* read data into an intermediate buffer, copying the contents
4a965c5f89decd Jacob Feder       2018-07-22  266  	 * to userspace when the buffer is full
4a965c5f89decd Jacob Feder       2018-07-22  267  	 */
4a965c5f89decd Jacob Feder       2018-07-22  268  	copied = 0;
4a965c5f89decd Jacob Feder       2018-07-22  269  	while (words_available > 0) {
4a965c5f89decd Jacob Feder       2018-07-22  270  		copy = min(words_available, READ_BUF_SIZE);
4a965c5f89decd Jacob Feder       2018-07-22  271  
884090d9d589b8 Minu Jin          2026-01-13  272  		axis_fifo_read_data(fifo, tmp_buf, copy);
884090d9d589b8 Minu Jin          2026-01-13  273  
82a051e2553b9e Ovidiu Panait     2025-09-12  274  		words_available -= copy;
4a965c5f89decd Jacob Feder       2018-07-22  275  
4a965c5f89decd Jacob Feder       2018-07-22  276  		if (copy_to_user(buf + copied * sizeof(u32), tmp_buf,
4a965c5f89decd Jacob Feder       2018-07-22  277  				 copy * sizeof(u32))) {
0443b3f4436321 Quentin Deslandes 2020-01-21  278  			ret = -EFAULT;
82a051e2553b9e Ovidiu Panait     2025-09-12  279  			goto err_flush_rx;
4a965c5f89decd Jacob Feder       2018-07-22  280  		}
4a965c5f89decd Jacob Feder       2018-07-22  281  
4a965c5f89decd Jacob Feder       2018-07-22  282  		copied += copy;
4a965c5f89decd Jacob Feder       2018-07-22  283  	}
82a051e2553b9e Ovidiu Panait     2025-09-12  284  	mutex_unlock(&fifo->read_lock);
82a051e2553b9e Ovidiu Panait     2025-09-12  285  
82a051e2553b9e Ovidiu Panait     2025-09-12  286  	return bytes_available;
4a965c5f89decd Jacob Feder       2018-07-22  287  
82a051e2553b9e Ovidiu Panait     2025-09-12  288  err_flush_rx:
82a051e2553b9e Ovidiu Panait     2025-09-12  289  	while (words_available--)
82a051e2553b9e Ovidiu Panait     2025-09-12  290  		ioread32(fifo->base_addr + XLLF_RDFD_OFFSET);
0443b3f4436321 Quentin Deslandes 2020-01-21  291  
0443b3f4436321 Quentin Deslandes 2020-01-21  292  end_unlock:
0443b3f4436321 Quentin Deslandes 2020-01-21  293  	mutex_unlock(&fifo->read_lock);
0443b3f4436321 Quentin Deslandes 2020-01-21  294  
0443b3f4436321 Quentin Deslandes 2020-01-21  295  	return ret;
4a965c5f89decd Jacob Feder       2018-07-22  296  }
4a965c5f89decd Jacob Feder       2018-07-22  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

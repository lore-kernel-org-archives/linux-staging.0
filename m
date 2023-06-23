Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E1AD24;
	Fri, 23 Jun 2023 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687533076; x=1719069076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rx5rxTjZywE9SSTSseHg/Sc6c4OWkUAeUcWp+yPZTQ4=;
  b=XGZV1ryVldfa94I0CUmuZKpbiQKE2brizHK4jH2gDf3Wwc++T8QnLqDq
   Jx7ny84ZjTORC0tlwhwRZzmZer+zJM1Bl3VqBSlm3QeVXRlnLAL0dok35
   gWKHzL5y24hsFZx6QWmuuPXC0TsDcW0RqCMMoVBnuKE3iVx1eIAOgvtzz
   MzkICYIwYaRqGG5J0UmXwjpAlMlT7twC21ngP+dlDkKRqEs8fU/Q2PNQc
   bQXg9XmP6ghpcHI+Diawz9ilEkAbwwnxydR10HjxYl27asvb0x5VtA+YK
   y3M6/MYSaLh1jvxCXsktBeKZy493bMLXV7SkYZff5GFew9vag1xHSIRNE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="345540979"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="345540979"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 08:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="889506053"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="889506053"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Jun 2023 08:11:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCiRK-0008Lr-15;
	Fri, 23 Jun 2023 15:11:10 +0000
Date: Fri, 23 Jun 2023 23:10:54 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
	tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3 01/11] media: videobuf2: Access vb2_queue bufs array
 through helper functions
Message-ID: <202306232218.dOcWboPB-lkp@intel.com>
References: <20230622131349.144160-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622131349.144160-2-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.4-rc7 next-20230623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Access-vb2_queue-bufs-array-through-helper-functions/20230622-214122
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230622131349.144160-2-benjamin.gaignard%40collabora.com
patch subject: [PATCH v3 01/11] media: videobuf2: Access vb2_queue bufs array through helper functions
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306232218.dOcWboPB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306232218.dOcWboPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306232218.dOcWboPB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_ioctl.c: In function 'atomisp_dqbuf_wrapper':
>> drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1080:33: error: incompatible type for argument 1 of 'vb2_get_buffer'
    1080 |         vb = vb2_get_buffer(pipe->vb_queue, buf->index);
         |                             ~~~~^~~~~~~~~~
         |                                 |
         |                                 struct vb2_queue
   In file included from include/media/videobuf2-v4l2.h:16,
                    from drivers/staging/media/atomisp//pci/ia_css_frame_public.h:23,
                    from drivers/staging/media/atomisp/pci/sh_css_legacy.h:22,
                    from drivers/staging/media/atomisp/pci/atomisp_internal.h:34,
                    from drivers/staging/media/atomisp/pci/atomisp_cmd.h:30,
                    from drivers/staging/media/atomisp/pci/atomisp_ioctl.c:27:
   include/media/videobuf2-core.h:1239:67: note: expected 'struct vb2_queue *' but argument is of type 'struct vb2_queue'
    1239 | static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
         |                                                 ~~~~~~~~~~~~~~~~~~^


vim +/vb2_get_buffer +1080 drivers/staging/media/atomisp/pci/atomisp_ioctl.c

  1065	
  1066	static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer *buf)
  1067	{
  1068		struct video_device *vdev = video_devdata(file);
  1069		struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
  1070		struct atomisp_sub_device *asd = pipe->asd;
  1071		struct atomisp_device *isp = video_get_drvdata(vdev);
  1072		struct ia_css_frame *frame;
  1073		struct vb2_buffer *vb;
  1074		int ret;
  1075	
  1076		ret = vb2_ioctl_dqbuf(file, fh, buf);
  1077		if (ret)
  1078			return ret;
  1079	
> 1080		vb = vb2_get_buffer(pipe->vb_queue, buf->index);
  1081		frame = vb_to_frame(vb);
  1082	
  1083		buf->reserved = asd->frame_status[buf->index];
  1084	
  1085		/*
  1086		 * Hack:
  1087		 * Currently frame_status in the enum type which takes no more lower
  1088		 * 8 bit.
  1089		 * use bit[31:16] for exp_id as it is only in the range of 1~255
  1090		 */
  1091		buf->reserved &= 0x0000ffff;
  1092		if (!(buf->flags & V4L2_BUF_FLAG_ERROR))
  1093			buf->reserved |= frame->exp_id;
  1094		buf->reserved2 = pipe->frame_config_id[buf->index];
  1095	
  1096		dev_dbg(isp->dev,
  1097			"dqbuf buffer %d (%s) with exp_id %d, isp_config_id %d\n",
  1098			buf->index, vdev->name, buf->reserved >> 16, buf->reserved2);
  1099		return 0;
  1100	}
  1101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

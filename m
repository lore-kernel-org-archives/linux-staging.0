Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A19B173
	for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642237973; x=1673773973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k5ucTHCrtIMsiD+hPgkXunIfg64P/1zJ8j3fvZyhDSo=;
  b=GWtjGwRqCUpsVVf7/AzLy/qqHEGuUrGJLToEDk+bXCIbBNlxboPc+XSZ
   ddFM3argEmzZh7T0+qfl5dTTMutym0hy9FTAdDrwGQg04tL8BtH4FTsf5
   DW2pwKS32Q2q+jOTmvgtuZyc7me4M4BX1mKeKBvNqfW/yxldXg72WNXTZ
   ua686optjlBZeyIlxy5XScOEPSWUMH/8Mnpgb129AOBk1d3+o8tqb9sH8
   kqaVOIhug635vhRMj6efttjt1na+SLJicBGGbstAktdadjNmTKbU9KdPR
   TGRV09Z2lf/k5qaRvIa/lusY8dLk8Et/ZpLxwl/zXzTUtSQ0RkOhTF0J0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="243210799"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="243210799"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2022 01:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="473914978"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Jan 2022 01:12:49 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8f7A-0009a9-Kx; Sat, 15 Jan 2022 09:12:48 +0000
Date: Sat, 15 Jan 2022 17:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kbuild-all@lists.01.org, Kees Cook <keescook@chromium.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Subject: Re: [PATCH 2/3 v2] staging: rtl8723bs: Drop get_recvframe_data()
Message-ID: <202201151724.U21w0KEg-lkp@intel.com>
References: <20220115042427.824542-3-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220115042427.824542-3-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kees,

I love your patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/staging-rtl-Check-for-NULL-header-value/20220115-122817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git fa783154524a71ab74e293cd8251155e5971952b
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220115/202201151724.U21w0KEg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0ee2a9ea6309b9087293fe3b38a76421998bff7d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kees-Cook/staging-rtl-Check-for-NULL-header-value/20220115-122817
        git checkout 0ee2a9ea6309b9087293fe3b38a76421998bff7d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/staging/rtl8723bs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_recv.c: In function 'portctrl':
>> drivers/staging/rtl8723bs/core/rtw_recv.c:468:15: error: 'precvframe' undeclared (first use in this function); did you mean 'precv_frame'?
     468 |         ptr = precvframe->u.hdr.rx_data;
         |               ^~~~~~~~~~
         |               precv_frame
   drivers/staging/rtl8723bs/core/rtw_recv.c:468:15: note: each undeclared identifier is reported only once for each function it appears in


vim +468 drivers/staging/rtl8723bs/core/rtw_recv.c

   449	
   450	/* set the security information in the recv_frame */
   451	static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *precv_frame)
   452	{
   453		u8 *psta_addr = NULL;
   454		u8 *ptr;
   455		uint  auth_alg;
   456		struct recv_frame_hdr *pfhdr;
   457		struct sta_info *psta;
   458		struct sta_priv *pstapriv;
   459		union recv_frame *prtnframe;
   460		u16 ether_type = 0;
   461		u16  eapol_type = 0x888e;/* for Funia BD's WPA issue */
   462		struct rx_pkt_attrib *pattrib;
   463	
   464		pstapriv = &adapter->stapriv;
   465	
   466		auth_alg = adapter->securitypriv.dot11AuthAlgrthm;
   467	
 > 468		ptr = precvframe->u.hdr.rx_data;
   469		pfhdr = &precv_frame->u.hdr;
   470		pattrib = &pfhdr->attrib;
   471		psta_addr = pattrib->ta;
   472	
   473		prtnframe = NULL;
   474	
   475		psta = rtw_get_stainfo(pstapriv, psta_addr);
   476	
   477		if (auth_alg == 2) {
   478			if ((psta) && (psta->ieee8021x_blocked)) {
   479				__be16 be_tmp;
   480	
   481				/* blocked */
   482				/* only accept EAPOL frame */
   483	
   484				prtnframe = precv_frame;
   485	
   486				/* get ether_type */
   487				ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;
   488				memcpy(&be_tmp, ptr, 2);
   489				ether_type = ntohs(be_tmp);
   490	
   491				if (ether_type == eapol_type)
   492					prtnframe = precv_frame;
   493				else {
   494					/* free this frame */
   495					rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
   496					prtnframe = NULL;
   497				}
   498			} else {
   499				/* allowed */
   500				/* check decryption status, and decrypt the frame if needed */
   501	
   502				prtnframe = precv_frame;
   503				/* check is the EAPOL frame or not (Rekey) */
   504				/* if (ether_type == eapol_type) { */
   505					/* check Rekey */
   506	
   507				/* prtnframe =precv_frame; */
   508				/*  */
   509				/* else { */
   510				/*  */
   511			}
   512		} else
   513			prtnframe = precv_frame;
   514	
   515		return prtnframe;
   516	}
   517	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

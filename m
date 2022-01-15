Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD2B2CA1
	for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 07:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642230111; x=1673766111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+z4Q6c/6sh2gjnr2v3WboyJfwtzeLajSpXEERfSsdZ4=;
  b=XMAYcafty2V0u2pwi5rwCqd1TCtxmoywN5ZXfoutO34Sg0JYPQm4N7T0
   6I/YqS9ZVYvSg7jftoKnInFHFR07PBiVF+0uj2DZaF3glvboC6maQf/ij
   dZQqxmLtahWFe+VwYGMyisslZSRFVS3P/oTBV6So3zvtDzl3EMrCv2pzY
   P5WhMjC4/Ob/jdXpN1pZG05XZXYaJnW2C7E1nPwQ7fwpiAcieFzD+AvwL
   A+pg8hs6UDPWForfuj4Vo2q7YGIiQpmQmNZlED6oHUwKCdgrTDPnEtF87
   TWQ9Kc/VbslfYf9Ui/oxmA6EU/GJw3h8hFI3gCmPP/dRbTqEr1OojMiJw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="241947868"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="241947868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 23:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="491756721"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Jan 2022 23:01:47 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8d4M-0009UF-Bb; Sat, 15 Jan 2022 07:01:46 +0000
Date: Sat, 15 Jan 2022 15:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kbuild-all@lists.01.org, Kees Cook <keescook@chromium.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>, linux-staging@lists.linux.dev,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH 3/3 v2] staging: rtl8712: Drop get_recvframe_data()
Message-ID: <202201151447.WZ02BFf7-lkp@intel.com>
References: <20220115042427.824542-4-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220115042427.824542-4-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kees,

I love your patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/staging-rtl-Check-for-NULL-header-value/20220115-122817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git fa783154524a71ab74e293cd8251155e5971952b
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220115/202201151447.WZ02BFf7-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/190b2c80a0e1844b5e38a9311830227d27533471
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kees-Cook/staging-rtl-Check-for-NULL-header-value/20220115-122817
        git checkout 190b2c80a0e1844b5e38a9311830227d27533471
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/rtl8712/rtl871x_recv.c: In function 'r8712_portctrl':
>> drivers/staging/rtl8712/rtl871x_recv.c:237:8: error: 'precvframe' undeclared (first use in this function); did you mean 'precv_frame'?
     237 |  ptr = precvframe->u.hdr.rx_data;
         |        ^~~~~~~~~~
         |        precv_frame
   drivers/staging/rtl8712/rtl871x_recv.c:237:8: note: each undeclared identifier is reported only once for each function it appears in


vim +237 drivers/staging/rtl8712/rtl871x_recv.c

   223	
   224	/*###set the security information in the recv_frame */
   225	union recv_frame *r8712_portctrl(struct _adapter *adapter,
   226					 union recv_frame *precv_frame)
   227	{
   228		u8 *psta_addr, *ptr;
   229		uint auth_alg;
   230		struct recv_frame_hdr *pfhdr;
   231		struct sta_info *psta;
   232		struct	sta_priv *pstapriv;
   233		union recv_frame *prtnframe;
   234		u16 ether_type;
   235	
   236		pstapriv = &adapter->stapriv;
 > 237		ptr = precvframe->u.hdr.rx_data;
   238		pfhdr = &precv_frame->u.hdr;
   239		psta_addr = pfhdr->attrib.ta;
   240		psta = r8712_get_stainfo(pstapriv, psta_addr);
   241		auth_alg = adapter->securitypriv.AuthAlgrthm;
   242		if (auth_alg == 2) {
   243			/* get ether_type */
   244			ptr = ptr + pfhdr->attrib.hdrlen + LLC_HEADER_SIZE;
   245			ether_type = get_unaligned_be16(ptr);
   246	
   247			if (psta && psta->ieee8021x_blocked) {
   248				/* blocked
   249				 * only accept EAPOL frame
   250				 */
   251				if (ether_type == 0x888e) {
   252					prtnframe = precv_frame;
   253				} else {
   254					/*free this frame*/
   255					r8712_free_recvframe(precv_frame,
   256							     &adapter->recvpriv.free_recv_queue);
   257					prtnframe = NULL;
   258				}
   259			} else {
   260				/* allowed
   261				 * check decryption status, and decrypt the
   262				 * frame if needed
   263				 */
   264				prtnframe = precv_frame;
   265				/* check is the EAPOL frame or not (Rekey) */
   266				if (ether_type == 0x888e) {
   267					/* check Rekey */
   268					prtnframe = precv_frame;
   269				}
   270			}
   271		} else {
   272			prtnframe = precv_frame;
   273		}
   274		return prtnframe;
   275	}
   276	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20A3803F5;
	Fri,  3 Apr 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205966; cv=none; b=Q1BL4JdgtEoKbxN8qiwGpeLBegCCinwIM/yItK0k3RPshU7eh+C+uDLrlkzLlw1QEUPk3CwGFBeCvF7HL5e8HnFTjV+nvtMAzOMQd+ZOIMde2gAGMBOYRm/8JrfDsuIRWRR8To0mAOSvx60FWMQsC+tnlYvU+/KIuTP0QWfIDlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205966; c=relaxed/simple;
	bh=J3HRDDlK8CGP88XGih1eIitICQQ4A7a2saqzqJBUfbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGXuIusAoLB8DSTqjrjS4g2RDr88RItNFGXwrR7xTQBRwlS+6dbZa0ISQuOcRoNAd51VG3+3M4eyeLIrVDRq9IEmbBBwoRpqOXi/dBhKyjARfKGMYfxsgtBgNMoLbS2JeJuiSfETzbI5X/z73Qz01Nj9PuQqQ2eZUdXvlOPkopg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMDZ5540; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMDZ5540"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205965; x=1806741965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J3HRDDlK8CGP88XGih1eIitICQQ4A7a2saqzqJBUfbU=;
  b=DMDZ5540UMEZ/xGSJJMYLyNu+P7ycg9au4wlj1a3C7/DMnb7C4ib1Qbr
   MYCCcRM2euWwSOPsAiMd4JkN0mRf+QM+zIjPcBwti4YM250oVpthP4Izm
   TSVff3BJipySGPT/TERBdfaaHLUyuItx8gndYrhQZ6qPi7lUJHPDxwGCH
   wfbd3ggKyrbqd6pzFWYfug67MjBzB7ow7v3EtRZGs3WFMxeFt3VqSMWvS
   v4sgCMbBhirkZ+gKa5bEXgPMJTULuAyW5o5MA9mqJ+iec+km25ZQm4UUt
   BH4rFf25LjbhZYoTP55cl400qc8puy6uVMggXaxdJL+S8sBmxEqoyMqRL
   g==;
X-CSE-ConnectionGUID: gn/gfjd3RiGPN+hyHEwZYw==
X-CSE-MsgGUID: AKjbqAA9TteTLGRAMJYoVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889041"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889041"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:01 -0700
X-CSE-ConnectionGUID: 6iwvB1KeQzql9sfggTQDXA==
X-CSE-MsgGUID: 6bljxaEHTnK/PbovVdv31A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368979"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-00000000161-1v8p;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 3 Apr 2026 16:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Xiyuan Guo <tommyguo039@gmail.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Xiyuan Guo <tommyguo039@gmail.com>
Subject: Re: [PATCH v1] staging: rtl8723bs: remove GEN_CMD_CODE macro and
 callback array
Message-ID: <202604030942.7Rbjavhn-lkp@intel.com>
References: <20260401000818.51141-1-tommyguo039@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401000818.51141-1-tommyguo039@gmail.com>

Hi Xiyuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiyuan-Guo/staging-rtl8723bs-remove-GEN_CMD_CODE-macro-and-callback-array/20260403-054141
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260401000818.51141-1-tommyguo039%40gmail.com
patch subject: [PATCH v1] staging: rtl8723bs: remove GEN_CMD_CODE macro and callback array
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260403/202604030942.7Rbjavhn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030942.7Rbjavhn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030942.7Rbjavhn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/rtl8723bs/core/rtw_cmd.c: In function 'rtw_cmd_thread':
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:305:16: warning: unused variable 'pcmd_callback' [-Wunused-variable]
     305 |         void (*pcmd_callback)(struct adapter *dev, struct cmd_obj *pcmd);
         |                ^~~~~~~~~~~~~


vim +/pcmd_callback +305 drivers/staging/rtl8723bs/core/rtw_cmd.c

554c0a3abf216c Hans de Goede     2017-03-29  298  
554c0a3abf216c Hans de Goede     2017-03-29  299  int rtw_cmd_thread(void *context)
554c0a3abf216c Hans de Goede     2017-03-29  300  {
554c0a3abf216c Hans de Goede     2017-03-29  301  	u8 ret;
554c0a3abf216c Hans de Goede     2017-03-29  302  	struct cmd_obj *pcmd;
d698b0a0965681 YueHaibing        2019-07-31  303  	u8 *pcmdbuf;
554c0a3abf216c Hans de Goede     2017-03-29  304  	u8 (*cmd_hdl)(struct adapter *padapter, u8 *pbuf);
554c0a3abf216c Hans de Goede     2017-03-29 @305  	void (*pcmd_callback)(struct adapter *dev, struct cmd_obj *pcmd);
529d87b44da777 Himanshu Jha      2017-08-28  306  	struct adapter *padapter = context;
53303e7a1f6eec Kushal Kothari    2021-10-23  307  	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
554c0a3abf216c Hans de Goede     2017-03-29  308  	struct drvextra_cmd_parm *extra_parm = NULL;
554c0a3abf216c Hans de Goede     2017-03-29  309  
8209ab0f9bf97f Philipp Hortmann  2024-11-03  310  	allow_signal(SIGTERM);
554c0a3abf216c Hans de Goede     2017-03-29  311  
554c0a3abf216c Hans de Goede     2017-03-29  312  	pcmdbuf = pcmdpriv->cmd_buf;
554c0a3abf216c Hans de Goede     2017-03-29  313  
554c0a3abf216c Hans de Goede     2017-03-29  314  	pcmdpriv->stop_req = 0;
53303e7a1f6eec Kushal Kothari    2021-10-23  315  	atomic_set(&pcmdpriv->cmdthd_running, true);
09a8ea34cf431b Arnd Bergmann     2018-12-10  316  	complete(&pcmdpriv->terminate_cmdthread_comp);
554c0a3abf216c Hans de Goede     2017-03-29  317  
554c0a3abf216c Hans de Goede     2017-03-29  318  	while (1) {
09a8ea34cf431b Arnd Bergmann     2018-12-10  319  		if (wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp)) {
79df841b435018 Fabio Aiuto       2021-04-15  320  			netdev_dbg(padapter->pnetdev,
79df841b435018 Fabio Aiuto       2021-04-15  321  				   FUNC_ADPT_FMT " wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
79df841b435018 Fabio Aiuto       2021-04-15  322  				   FUNC_ADPT_ARG(padapter));
554c0a3abf216c Hans de Goede     2017-03-29  323  			break;
554c0a3abf216c Hans de Goede     2017-03-29  324  		}
554c0a3abf216c Hans de Goede     2017-03-29  325  
cf8f6446bb9f03 Kushal Kothari    2021-10-20  326  		if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
79df841b435018 Fabio Aiuto       2021-04-15  327  			netdev_dbg(padapter->pnetdev,
79df841b435018 Fabio Aiuto       2021-04-15  328  				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
79df841b435018 Fabio Aiuto       2021-04-15  329  				   __func__, padapter->bDriverStopped,
79df841b435018 Fabio Aiuto       2021-04-15  330  				   padapter->bSurpriseRemoved, __LINE__);
554c0a3abf216c Hans de Goede     2017-03-29  331  			break;
554c0a3abf216c Hans de Goede     2017-03-29  332  		}
554c0a3abf216c Hans de Goede     2017-03-29  333  
554c0a3abf216c Hans de Goede     2017-03-29  334  		if (pcmdpriv->stop_req) {
79df841b435018 Fabio Aiuto       2021-04-15  335  			netdev_dbg(padapter->pnetdev,
79df841b435018 Fabio Aiuto       2021-04-15  336  				   FUNC_ADPT_FMT " stop_req:%u, break\n",
79df841b435018 Fabio Aiuto       2021-04-15  337  				   FUNC_ADPT_ARG(padapter),
79df841b435018 Fabio Aiuto       2021-04-15  338  				   pcmdpriv->stop_req);
554c0a3abf216c Hans de Goede     2017-03-29  339  			break;
554c0a3abf216c Hans de Goede     2017-03-29  340  		}
554c0a3abf216c Hans de Goede     2017-03-29  341  
6206fdb4f30ba1 Fabio Aiuto       2021-04-07  342  		if (list_empty(&pcmdpriv->cmd_queue.queue))
554c0a3abf216c Hans de Goede     2017-03-29  343  			continue;
554c0a3abf216c Hans de Goede     2017-03-29  344  
13aefa65bc6a63 Fabio Aiuto       2021-04-04  345  		if (rtw_register_cmd_alive(padapter) != _SUCCESS)
554c0a3abf216c Hans de Goede     2017-03-29  346  			continue;
554c0a3abf216c Hans de Goede     2017-03-29  347  
554c0a3abf216c Hans de Goede     2017-03-29  348  _next:
cf8f6446bb9f03 Kushal Kothari    2021-10-20  349  		if (padapter->bDriverStopped || padapter->bSurpriseRemoved) {
79df841b435018 Fabio Aiuto       2021-04-15  350  			netdev_dbg(padapter->pnetdev,
79df841b435018 Fabio Aiuto       2021-04-15  351  				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
79df841b435018 Fabio Aiuto       2021-04-15  352  				   __func__, padapter->bDriverStopped,
79df841b435018 Fabio Aiuto       2021-04-15  353  				   padapter->bSurpriseRemoved, __LINE__);
554c0a3abf216c Hans de Goede     2017-03-29  354  			break;
554c0a3abf216c Hans de Goede     2017-03-29  355  		}
554c0a3abf216c Hans de Goede     2017-03-29  356  
554c0a3abf216c Hans de Goede     2017-03-29  357  		pcmd = rtw_dequeue_cmd(pcmdpriv);
554c0a3abf216c Hans de Goede     2017-03-29  358  		if (!pcmd) {
554c0a3abf216c Hans de Goede     2017-03-29  359  			rtw_unregister_cmd_alive(padapter);
554c0a3abf216c Hans de Goede     2017-03-29  360  			continue;
554c0a3abf216c Hans de Goede     2017-03-29  361  		}
554c0a3abf216c Hans de Goede     2017-03-29  362  
92576c84c8c608 Manuel Palenzuela 2020-10-29  363  		if (rtw_cmd_filter(pcmdpriv, pcmd) == _FAIL) {
554c0a3abf216c Hans de Goede     2017-03-29  364  			pcmd->res = H2C_DROPPED;
554c0a3abf216c Hans de Goede     2017-03-29  365  			goto post_process;
554c0a3abf216c Hans de Goede     2017-03-29  366  		}
554c0a3abf216c Hans de Goede     2017-03-29  367  
554c0a3abf216c Hans de Goede     2017-03-29  368  		pcmdpriv->cmd_issued_cnt++;
554c0a3abf216c Hans de Goede     2017-03-29  369  
046bd5c9c2833f Ross Schmidt      2020-10-03  370  		pcmd->cmdsz = round_up((pcmd->cmdsz), 4);
554c0a3abf216c Hans de Goede     2017-03-29  371  
554c0a3abf216c Hans de Goede     2017-03-29  372  		memcpy(pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);
554c0a3abf216c Hans de Goede     2017-03-29  373  
554c0a3abf216c Hans de Goede     2017-03-29  374  		if (pcmd->cmdcode < ARRAY_SIZE(wlancmds)) {
554c0a3abf216c Hans de Goede     2017-03-29  375  			cmd_hdl = wlancmds[pcmd->cmdcode].h2cfuns;
554c0a3abf216c Hans de Goede     2017-03-29  376  
554c0a3abf216c Hans de Goede     2017-03-29  377  			if (cmd_hdl) {
554c0a3abf216c Hans de Goede     2017-03-29  378  				ret = cmd_hdl(pcmd->padapter, pcmdbuf);
554c0a3abf216c Hans de Goede     2017-03-29  379  				pcmd->res = ret;
554c0a3abf216c Hans de Goede     2017-03-29  380  			}
554c0a3abf216c Hans de Goede     2017-03-29  381  
554c0a3abf216c Hans de Goede     2017-03-29  382  			pcmdpriv->cmd_seq++;
554c0a3abf216c Hans de Goede     2017-03-29  383  		} else {
554c0a3abf216c Hans de Goede     2017-03-29  384  			pcmd->res = H2C_PARAMETERS_ERROR;
554c0a3abf216c Hans de Goede     2017-03-29  385  		}
554c0a3abf216c Hans de Goede     2017-03-29  386  
554c0a3abf216c Hans de Goede     2017-03-29  387  		cmd_hdl = NULL;
554c0a3abf216c Hans de Goede     2017-03-29  388  
554c0a3abf216c Hans de Goede     2017-03-29  389  post_process:
554c0a3abf216c Hans de Goede     2017-03-29  390  
53303e7a1f6eec Kushal Kothari    2021-10-23  391  		if (mutex_lock_interruptible(&pcmd->padapter->cmdpriv.sctx_mutex) == 0) {
554c0a3abf216c Hans de Goede     2017-03-29  392  			if (pcmd->sctx) {
79df841b435018 Fabio Aiuto       2021-04-15  393  				netdev_dbg(padapter->pnetdev,
79df841b435018 Fabio Aiuto       2021-04-15  394  					   FUNC_ADPT_FMT " pcmd->sctx\n",
554c0a3abf216c Hans de Goede     2017-03-29  395  					   FUNC_ADPT_ARG(pcmd->padapter));
554c0a3abf216c Hans de Goede     2017-03-29  396  
554c0a3abf216c Hans de Goede     2017-03-29  397  				if (pcmd->res == H2C_SUCCESS)
554c0a3abf216c Hans de Goede     2017-03-29  398  					rtw_sctx_done(&pcmd->sctx);
554c0a3abf216c Hans de Goede     2017-03-29  399  				else
554c0a3abf216c Hans de Goede     2017-03-29  400  					rtw_sctx_done_err(&pcmd->sctx, RTW_SCTX_DONE_CMD_ERROR);
554c0a3abf216c Hans de Goede     2017-03-29  401  			}
53303e7a1f6eec Kushal Kothari    2021-10-23  402  			mutex_unlock(&pcmd->padapter->cmdpriv.sctx_mutex);
554c0a3abf216c Hans de Goede     2017-03-29  403  		}
554c0a3abf216c Hans de Goede     2017-03-29  404  
554c0a3abf216c Hans de Goede     2017-03-29  405  		/* call callback function for post-processed */
933201cba4056f Xiyuan Guo        2026-03-31  406  		switch (pcmd->cmdcode) {
933201cba4056f Xiyuan Guo        2026-03-31  407  		case _Read_BBREG:
933201cba4056f Xiyuan Guo        2026-03-31  408  		case _Read_RFREG:
933201cba4056f Xiyuan Guo        2026-03-31  409  			rtw_getbbrfreg_cmdrsp_callback(padapter, pcmd);
933201cba4056f Xiyuan Guo        2026-03-31  410  			break;
933201cba4056f Xiyuan Guo        2026-03-31  411  		case _JoinBss:
933201cba4056f Xiyuan Guo        2026-03-31  412  			rtw_joinbss_cmd_callback(padapter, pcmd);
933201cba4056f Xiyuan Guo        2026-03-31  413  			break;
933201cba4056f Xiyuan Guo        2026-03-31  414  		case _DisConnect:
933201cba4056f Xiyuan Guo        2026-03-31  415  			rtw_disassoc_cmd_callback(padapter, pcmd);
933201cba4056f Xiyuan Guo        2026-03-31  416  			break;
933201cba4056f Xiyuan Guo        2026-03-31  417  		case _CreateBss:
933201cba4056f Xiyuan Guo        2026-03-31  418  			rtw_createbss_cmd_callback(padapter, pcmd);
933201cba4056f Xiyuan Guo        2026-03-31  419  			break;
933201cba4056f Xiyuan Guo        2026-03-31  420  		case _SiteSurvey:
933201cba4056f Xiyuan Guo        2026-03-31  421  			rtw_survey_cmd_callback(padapter, pcmd);
933201cba4056f Xiyuan Guo        2026-03-31  422  			break;
933201cba4056f Xiyuan Guo        2026-03-31  423  		case _SetStaKey:
933201cba4056f Xiyuan Guo        2026-03-31  424  			rtw_setstaKey_cmdrsp_callback(padapter, pcmd);
933201cba4056f Xiyuan Guo        2026-03-31  425  			break;
933201cba4056f Xiyuan Guo        2026-03-31  426  		case _SetAssocSta:
933201cba4056f Xiyuan Guo        2026-03-31  427  			rtw_setassocsta_cmdrsp_callback(padapter, pcmd);
933201cba4056f Xiyuan Guo        2026-03-31  428  			break;
933201cba4056f Xiyuan Guo        2026-03-31  429  		default:
554c0a3abf216c Hans de Goede     2017-03-29  430  			rtw_free_cmd_obj(pcmd);
933201cba4056f Xiyuan Guo        2026-03-31  431  			break;
554c0a3abf216c Hans de Goede     2017-03-29  432  		}
554c0a3abf216c Hans de Goede     2017-03-29  433  		flush_signals_thread();
554c0a3abf216c Hans de Goede     2017-03-29  434  		goto _next;
554c0a3abf216c Hans de Goede     2017-03-29  435  	}
554c0a3abf216c Hans de Goede     2017-03-29  436  
554c0a3abf216c Hans de Goede     2017-03-29  437  	/*  free all cmd_obj resources */
554c0a3abf216c Hans de Goede     2017-03-29  438  	do {
554c0a3abf216c Hans de Goede     2017-03-29  439  		pcmd = rtw_dequeue_cmd(pcmdpriv);
cd1f1450092216 Michael Straube   2021-08-29  440  		if (!pcmd) {
554c0a3abf216c Hans de Goede     2017-03-29  441  			rtw_unregister_cmd_alive(padapter);
554c0a3abf216c Hans de Goede     2017-03-29  442  			break;
554c0a3abf216c Hans de Goede     2017-03-29  443  		}
554c0a3abf216c Hans de Goede     2017-03-29  444  
933201cba4056f Xiyuan Guo        2026-03-31  445  		if (pcmd->cmdcode == _Set_Drv_Extra) {
554c0a3abf216c Hans de Goede     2017-03-29  446  			extra_parm = (struct drvextra_cmd_parm *)pcmd->parmbuf;
8f870aab80b041 Manuel Palenzuela 2020-10-28  447  			if (extra_parm->pbuf && extra_parm->size > 0)
554c0a3abf216c Hans de Goede     2017-03-29  448  				kfree(extra_parm->pbuf);
554c0a3abf216c Hans de Goede     2017-03-29  449  		}
554c0a3abf216c Hans de Goede     2017-03-29  450  
554c0a3abf216c Hans de Goede     2017-03-29  451  		rtw_free_cmd_obj(pcmd);
554c0a3abf216c Hans de Goede     2017-03-29  452  	} while (1);
554c0a3abf216c Hans de Goede     2017-03-29  453  
09a8ea34cf431b Arnd Bergmann     2018-12-10  454  	complete(&pcmdpriv->terminate_cmdthread_comp);
53303e7a1f6eec Kushal Kothari    2021-10-23  455  	atomic_set(&pcmdpriv->cmdthd_running, false);
554c0a3abf216c Hans de Goede     2017-03-29  456  
501c88722797a1 Eric W. Biederman 2021-10-20  457  	return 0;
554c0a3abf216c Hans de Goede     2017-03-29  458  }
554c0a3abf216c Hans de Goede     2017-03-29  459  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

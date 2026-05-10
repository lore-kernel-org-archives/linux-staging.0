Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3897522A4E9;
	Sun, 10 May 2026 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778427875; cv=none; b=DdHsBBVQekVzC8sWsAzabCqhsfchnOBiNBPisyOdPyzPO9ocEAuy7k4daZxCJ22WIITUI0Ui11OhB+uT4h7PgeUtnwRRbgBTT+7tO/1PByCmMEDGkDBZiwp0BrEaaZtw4JleAjtnqj2OJjpI4EVP6TlZo+fSa5FPmsWxluwzafA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778427875; c=relaxed/simple;
	bh=5Sq2rGZxkRSNRFCeK+kzY0R3/TMVeetSjZ5AwN8eSZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofvV3zhrNys2gEmR02OSt8634uzwZpd4NxdVYOJ1KjTf/yXQN1/yqYAGxGscB5QQ5ylFWEmrEuQkVIJAPKrG5BGbFm9Bu9Ue56aq56TDgbayhlzUwFvTeCPKvNoScVI0bkZw5ZKuwbkUzoB7HYu5y8z7ua3iXF1h8lNWPWfVQZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvSQJQAL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvSQJQAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778427872; x=1809963872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Sq2rGZxkRSNRFCeK+kzY0R3/TMVeetSjZ5AwN8eSZI=;
  b=PvSQJQALnk27KrS6pfq25Ig7PMQQgy3tZB0BcGGfrdA2K4bcRSs9BZ3J
   xqNyEVscqN9VYB0KeYSEZ/Zho0POn7Y5IzjB+lBNdUbvMpvnsggxwYPIg
   P3cf02j+HzMqRE70cEqial5J+1rscMuMiT03feYUBW/N/hSp6y6M/LzFO
   BBlZdMUNnX+appr+vqKQiDpiHMJso/M4fwkd/MQr7Q2ukT5d1oA8KaUzv
   qqs0xMLen97IgNZ7EGtP9BPFwtcJIxLVoGdjUfP2j3nV1ttpwDmGNofn3
   TcS/sEhzMq5P4kRM4smDum8Y6gulxbciFWXWuxwfJOL4Q+fPoJqponcLj
   A==;
X-CSE-ConnectionGUID: fr9D5N0vTPOj+rH3ALvI7g==
X-CSE-MsgGUID: HPa0bUbmRL+OVnzACADxyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90434078"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="90434078"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 08:44:32 -0700
X-CSE-ConnectionGUID: zZ+uNMeBRh2I7y2zKsLEDg==
X-CSE-MsgGUID: Fjn8H+G0QYGCPVSogSmOhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="241213745"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2026 08:44:29 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM6KP-000000002M9-3S2g;
	Sun, 10 May 2026 15:44:25 +0000
Date: Sun, 10 May 2026 23:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Everton Colombo <e.rcolombo2@gmail.com>, andy@kernel.org,
	hansg@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	koike@igalia.com, ~lkcamp/patches@lists.sr.ht,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Everton Colombo <e.rcolombo2@gmail.com>
Subject: Re: [PATCH v2] media: atomisp: remove returns from void functions
Message-ID: <202605102303.EGwA2HDq-lkp@intel.com>
References: <20260506173028.24417-1-e.rcolombo2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506173028.24417-1-e.rcolombo2@gmail.com>

Hi Everton,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Everton-Colombo/media-atomisp-remove-returns-from-void-functions/20260510-154432
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260506173028.24417-1-e.rcolombo2%40gmail.com
patch subject: [PATCH v2] media: atomisp: remove returns from void functions
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260510/202605102303.EGwA2HDq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102303.EGwA2HDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605102303.EGwA2HDq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: In function 'ia_css_debug_binary_print':
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:853:1: error: invalid storage class for function 'findf_dmem_params'
     853 | findf_dmem_params(struct ia_css_stream *stream, short idx)
         | ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1049:28: error: invalid storage class for function 'dtrace_dot'
    1049 | static void __printf(1, 2) dtrace_dot(const char *fmt, ...)
         |                            ^~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1063:1: error: invalid storage class for function 'ia_css_debug_pipe_graph_dump_frame'
    1063 | ia_css_debug_pipe_graph_dump_frame(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1875:1: error: expected declaration or statement at end of input
    1875 | }
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: At top level:
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1862:6: warning: 'ia_css_debug_pc_dump' defined but not used [-Wunused-function]
    1862 | void ia_css_debug_pc_dump(sp_ID_t id, unsigned int num_of_dumps)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1848:6: warning: 'ia_css_debug_dump_trace' defined but not used [-Wunused-function]
    1848 | void ia_css_debug_dump_trace(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1575:1: warning: 'ia_css_debug_dump_stream_config' defined but not used [-Wunused-function]
    1575 | ia_css_debug_dump_stream_config(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1475:1: warning: 'ia_css_debug_dump_pipe_config' defined but not used [-Wunused-function]
    1475 | ia_css_debug_dump_pipe_config(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1447:1: warning: 'ia_css_debug_dump_pipe_extra_config' defined but not used [-Wunused-function]
    1447 | ia_css_debug_dump_pipe_extra_config(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1399:1: warning: 'ia_css_debug_pipe_graph_dump_stream_config' defined but not used [-Wunused-function]
    1399 | ia_css_debug_pipe_graph_dump_stream_config(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1368:1: warning: 'ia_css_debug_pipe_graph_dump_sp_raw_copy' defined but not used [-Wunused-function]
    1368 | ia_css_debug_pipe_graph_dump_sp_raw_copy(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1157:1: warning: 'ia_css_debug_pipe_graph_dump_stage' defined but not used [-Wunused-function]
    1157 | ia_css_debug_pipe_graph_dump_stage(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1114:6: warning: 'ia_css_debug_pipe_graph_dump_epilogue' defined but not used [-Wunused-function]
    1114 | void ia_css_debug_pipe_graph_dump_epilogue(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1039:1: warning: 'ia_css_debug_mode_enable_dma_channel' defined but not used [-Wunused-function]
    1039 | ia_css_debug_mode_enable_dma_channel(int dma_id,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1024:1: warning: 'ia_css_debug_mode_disable_dma_channel' defined but not used [-Wunused-function]
    1024 | ia_css_debug_mode_disable_dma_channel(int dma_id,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1011:6: warning: 'ia_css_debug_mode_init' defined but not used [-Wunused-function]
    1011 | bool ia_css_debug_mode_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:976:6: warning: 'ia_css_debug_dump_isp_binary' defined but not used [-Wunused-function]
     976 | void ia_css_debug_dump_isp_binary(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:946:6: warning: 'sh_css_dump_sp_raw_copy_linecount' defined but not used [-Wunused-function]
     946 | void sh_css_dump_sp_raw_copy_linecount(bool reduced)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:877:6: warning: 'ia_css_debug_dump_isp_params' defined but not used [-Wunused-function]
     877 | void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:839:6: warning: 'ia_css_debug_wake_up_sp' defined but not used [-Wunused-function]
     839 | void ia_css_debug_wake_up_sp(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:824:6: warning: 'ia_css_debug_enable_sp_sleep_mode' defined but not used [-Wunused-function]
     824 | void ia_css_debug_enable_sp_sleep_mode(enum ia_css_sp_sleep_mode mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:807:6: warning: 'ia_css_debug_dump_sp_sw_debug_info' defined but not used [-Wunused-function]
     807 | void ia_css_debug_dump_sp_sw_debug_info(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:441:6: warning: 'ia_css_debug_frame_print' defined but not used [-Wunused-function]
     441 | void ia_css_debug_frame_print(const struct ia_css_frame *frame,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c: In function 'inputfifo_send_data_b':
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:110:13: error: invalid storage class for function 'inputfifo_send_data'
     110 | static void inputfifo_send_data(
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:122:13: error: invalid storage class for function 'inputfifo_send_sol'
     122 | static void inputfifo_send_sol(void)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:131:13: error: invalid storage class for function 'inputfifo_send_eol'
     131 | static void inputfifo_send_eol(void)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:139:13: error: invalid storage class for function 'inputfifo_send_sof'
     139 | static void inputfifo_send_sof(void)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:148:13: error: invalid storage class for function 'inputfifo_send_eof'
     148 | static void inputfifo_send_eof(void)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:156:13: error: invalid storage class for function 'inputfifo_send_ch_id_and_fmt_type'
     156 | static void inputfifo_send_ch_id_and_fmt_type(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:173:13: error: invalid storage class for function 'inputfifo_send_empty_token'
     173 | static void inputfifo_send_empty_token(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:181:13: error: invalid storage class for function 'inputfifo_start_frame'
     181 | static void inputfifo_start_frame(
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:190:13: error: invalid storage class for function 'inputfifo_end_frame'
     190 | static void inputfifo_end_frame(
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:200:13: error: invalid storage class for function 'inputfifo_send_line2'
     200 | static void inputfifo_send_line2(
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:290:1: error: invalid storage class for function 'inputfifo_send_line'
     290 | inputfifo_send_line(const unsigned short *data,
         | ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:333:13: error: invalid storage class for function 'inputfifo_send_frame'
     333 | static void inputfifo_send_frame(
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:368:38: error: invalid storage class for function 'inputfifo_determine_type'
     368 | static enum inputfifo_mipi_data_type inputfifo_determine_type(
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:390:35: error: invalid storage class for function 'inputfifo_get_inst'
     390 | static struct inputfifo_instance *inputfifo_get_inst(
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:503:1: error: expected declaration or statement at end of input
     503 | }
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c: At top level:
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:488:6: warning: 'ia_css_inputfifo_end_frame' defined but not used [-Wunused-function]
     488 | void ia_css_inputfifo_end_frame(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:467:6: warning: 'ia_css_inputfifo_send_embedded_line' defined but not used [-Wunused-function]
     467 | void ia_css_inputfifo_send_embedded_line(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:443:6: warning: 'ia_css_inputfifo_send_line' defined but not used [-Wunused-function]
     443 | void ia_css_inputfifo_send_line(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:421:6: warning: 'ia_css_inputfifo_start_frame' defined but not used [-Wunused-function]
     421 | void ia_css_inputfifo_start_frame(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:396:6: warning: 'ia_css_inputfifo_send_input_frame' defined but not used [-Wunused-function]
     396 | void ia_css_inputfifo_send_input_frame(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c: In function 'ia_css_isys_rx_configure':
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:646:1: error: expected declaration or statement at end of input
     646 | }
         | ^
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c: At top level:
>> drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:637:6: warning: 'ia_css_isys_rx_disable' defined but not used [-Wunused-function]
     637 | void ia_css_isys_rx_disable(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/ia_css_debug_pc_dump +1862 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c

ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1847  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19 @1848  void ia_css_debug_dump_trace(void)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1849  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1850  #if TRACE_ENABLE_SP0
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1851  	debug_dump_one_trace(TRACE_SP0_ID);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1852  #endif
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1853  #if TRACE_ENABLE_SP1
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1854  	debug_dump_one_trace(TRACE_SP1_ID);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1855  #endif
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1856  #if TRACE_ENABLE_ISP
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1857  	debug_dump_one_trace(TRACE_ISP_ID);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1858  #endif
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1859  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1860  
3c0538fbad9f1d0 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c                  Mauro Carvalho Chehab 2020-04-30  1861  /* ISP2401 */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19 @1862  void ia_css_debug_pc_dump(sp_ID_t id, unsigned int num_of_dumps)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1863  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1864  	unsigned int pc;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1865  	unsigned int i;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1866  	hrt_data sc = sp_ctrl_load(id, SP_SC_REG);
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1867  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1868  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "SP%-1d Status reg: 0x%X\n", id, sc);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1869  	sc = sp_ctrl_load(id, SP_CTRL_SINK_REG);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1870  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "SP%-1d Stall reg: 0x%X\n", id, sc);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1871  	for (i = 0; i < num_of_dumps; i++) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1872  		pc = sp_ctrl_load(id, SP_PC_REG);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1873  		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "SP%-1d PC: 0x%X\n", id, pc);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1874  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19 @1875  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

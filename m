Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763845;
	b=fhe01eKu1sBsMGO85zWBPTKRVv0xgMg/GulHfdtG0CuSxzPjntMrcdCWsIwDLdKfRYL1
	 QUkTTl1XKkZYoAhynNVbTGlAkb/H7CxH5Wri8w7C9FGqgRS2E8Ruw89aqnLMZ9vrODWXP
	 K55V749NlBQGts73w3m1CkdMJHnjRvJzaSDZgHaFgEJIoRYysJsUl1BF2YsBlYzPVUhx4
	 rEjXDsTMHN258GqFkxx8Wwcvmvam299xacIhLM7+LbFDDaEBdXC6J9aw8QYzMTIfiGN5/
	 BjHViOAY6HFMsyvYVItE4s/VbYKLUD6zUpAPBPHWzOs5H2Jz1rR1qq66w33WC6dylhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763845;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=RgeaRejPzcus2J0aVKvDf8ygY8BmdI4ZYaZqvVEuuHE=;
	b=2yEz24TbDmNlPUiDtH2Sq1kpomE3KE9zkQMEXrjrTP7nOOcxwBzf5EzzkFj6S2ODBVmU
	 1a+6cY+6mNzvnN+p7hhUP0S5Mr8xZrj1uCEiidqqTVpibcwJWvDpvZdn5TpCOiPUGvS2l
	 VGMluvtKQSHbLDV1rv3mvMoqLzyPfeRAHiZrucagQQuXpt5JytfsmuXpybS5ZGXLeOyp+
	 Vj0DJJGnMhaxIDG877wBTlTtZbmd6ZfrsKUXGz0I6Wm1eVUsaXr1hvrleHkyX5r4BmqhM
	 amLUgm5aY180SiaiMWUCPLbk21KF5MW0eUWIaA4cASSjSieCFqBNLbdhwsnJkI3bTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OC+BPw6T;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63C2606A31D
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 13:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63C2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OC+BPw6T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792763845; x=1824299845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OF/kZBXSPt9pCh7CjgFn7D/7BdQXxVF8v0DAMErXXsE=;
  b=OC+BPw6Twj9czH5Vl2FVDS0Ets+KqjOW1EKBllLN25TZwnGzCqH7Zmbh
   /BQCIX4i1SyesrQwxnMXeNtcZYj9rFSrQ17p7wo5uo60VaQ4yeBMNTP4S
   4RqP+vWG5yLJszFfAwXzZYzpmoEQKGcuPhMCaFQO97fWu6cDhjc6zPIsG
   Dlg2AMTOyT7QsT4H/TgOzKFL81cxK9rqV8/zH9GIxDMZUAoWbPLTfZ1d7
   v+C/jwEAmtR0zhQO/oGzeA9ZE7oToftzvv1z6brMaXzw4ai4uht8m3caz
   b+mSNQWuLVUeogF/m0un5BpdKHJHPoB49Rv8lV8a+eFseiIBfxhQRtcOK
   w==;
X-CSE-ConnectionGUID: B7Hf0POcRQqBvieyVSGrWQ==
X-CSE-MsgGUID: oKWM4BM8Shq1BblM/nqK3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1404170"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1404170"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:57:24 -0700
X-CSE-ConnectionGUID: B3MHGVAQS4u8ozHPy1jNsg==
X-CSE-MsgGUID: fUOMgXIIR4eOq5tG+wDtlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4035949"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 06:57:22 -0700
Date: Fri, 23 Oct 2026 16:57:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: atomisp: sh_css_mipi: include
 assert_support.h directly
Message-ID: <attnv_ezWMGQlRp-@ashevche-desk.local>
References: <20261014111213.1967452-1-vladurares@gmail.com>
 <20261014111213.1967452-2-vladurares@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014111213.1967452-2-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 14, 2026 at 11:12:10AM +0000, Rareș-Mihai Vladu wrote:
> sh_css_mipi.c uses assert() but only gets its definition indirectly
> through the circbuf headers. Include assert_support.h directly so the
> file does not depend on that include chain.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F047D3DEFF7;
	Tue, 24 Mar 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361162; cv=none; b=CG182BzlWzgRwqknSkk7s57CLv54FPub96OC0xmch7Sqz+biuTCuW1NSJk2HOj0pNFoaimeyZC+KrRif2qwGfZQbTxPfruAxTP8RTwG+wUp9Mto9rChDUs+Hp10Odmja05ok3SVbecwf+PV1M0+D4f/dhlFiECMPAyvWOFR0CD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361162; c=relaxed/simple;
	bh=dEBs8uqB3eYnBrT/+/h18pz6TNuBUL1v68BKdVi/6n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIaUzwwy1hjCr19eVKzBP/zsAcLg3A2QE32157IK1HpRR2TPzipj+ZxcJqUN0q9wQ9SdPblJpLYKZvxVobXtnPyuRMKL0t8oHYG/p4+02I4UqSOt28k1bsOzvO4HqAwpOLJfFXkiwdkNbFfXvM8SkhOqlR+zAtr0oIJvMtA2ISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQhtIbJ1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQhtIbJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774361161; x=1805897161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dEBs8uqB3eYnBrT/+/h18pz6TNuBUL1v68BKdVi/6n8=;
  b=DQhtIbJ1sHL6n/GMxEiWTA40BBTKVEwPiYf6uxJy7W4Z1iKzKMMNvSgz
   /9ATMM715poOs9wDsIOk+eBgeMtBEaH0jUdrcOMp1LvKXb6Z8LuRfTWvF
   92RZXVqv4Gg3tC/tMUYdwDgzOiLBOv7GiZzpHb/27RORHhe/iY/QLTFQo
   m1H1CVzxumpCo390awvetm1AaGV47g08XExN5p7VOQ9CjM3EQKsK/b4tN
   um+sexL/WE869evOelDRY9KLFtKAKqaSBK2lvsPmOtFA4b2+hUGjVl+A5
   zd60Pe6O1r4PsTSZMFHZeeJWKoUiPB5ec/oF78UrN0DYOrdN4lZLX+Ure
   w==;
X-CSE-ConnectionGUID: FNnzH1m4RM+5rAYhYYM+5Q==
X-CSE-MsgGUID: fAxRHXdzTv6P2boEhIRcaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85685725"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="85685725"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 07:05:59 -0700
X-CSE-ConnectionGUID: 3wELZIHhQqKc24AjfVhU9A==
X-CSE-MsgGUID: tzC7kERWT0y3ydWXsprBBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254840919"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 07:05:54 -0700
Date: Tue, 24 Mar 2026 16:05:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Prithvi <activprithvi@gmail.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	lukagejak5@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <acKaP0Jz-VqfmEqj@ashevche-desk.local>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
 <20260324135551.grth7jfjyoh5krzr@inspiron>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324135551.grth7jfjyoh5krzr@inspiron>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 24, 2026 at 07:25:51PM +0530, Prithvi wrote:
> Sure. Also can you please guide if any testing would be required for these 
> changes, or I can directly send the v3 patch?

It's implied that the author of the patch each time before submission (either
a new version of the existing patch or a new patch in general) is tested and
validated it.

-- 
With Best Regards,
Andy Shevchenko



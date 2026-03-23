Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B99918A6D4
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259098; cv=none; b=C9kjuZdDdQrQn9hP+D+IyboHndgUxeEfwEVC8uEHuUKc8S6hzlHG5MAyTpZooUReeTctUkMRh+wLi+QM+BWgMEgyqC0SJSamLayaDV6zvoO7XNuiX/6FED7VKAKGzL/82ISkMOmwNwOVHJ64KypbfWdcMIVaX9e0FxrHjb1c9pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259098; c=relaxed/simple;
	bh=OODlxbqPYQUXCJQEQ8iZOrfup27M/jPEjIzgMxy7G8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFIkCV60iSXue/w+g1eyyqlpfFKba4DqHIUQa6LVZr4MjMiKk63BdRpMieT8fBuWgLxgeXc3seWssUZ7extqtqeLEZcfcZqKHnyufmAq3Cq8b6HR9jFi2uZeG0uH6j4twDorORNU5/VA3vwhXzVj0rEXv/pcs7et7X+5CS5oSpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOhOujtP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOhOujtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774259098; x=1805795098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OODlxbqPYQUXCJQEQ8iZOrfup27M/jPEjIzgMxy7G8M=;
  b=KOhOujtPXu7yAssO2UQEwDZqdUJmEHF42QkqOZ52lrKawBvOiFME/CEL
   uhSBTgmR3QWU1U6r0fB7t82KdMzvVWcHmKuuIfhllVAGp1GsQGwJkoMV4
   B7scqNh3v1Os3cxbxJsBFZECZLYlmq/dkqyraZWQbLoufmmWzO6Xi0OB7
   8ILwy8WEGvnHND4tAKrXjlulOCaiPqw5OaFrzRwpTmO+I/OFMGyhL1fkf
   +l/e5hcDBkacCbihg/hGhAcfSN8fXPafiMuvka4DaZK9KREEn+qF2Fodz
   7sNY61FQLZ6tVFLWyLNI/Sj5tnJsEW3YZTACmgFz1OjmaON47VV0esC3i
   Q==;
X-CSE-ConnectionGUID: PTgqZqseQ2Cqbfvd/8t7Lw==
X-CSE-MsgGUID: cVqp/TicT8aS326X9KrBpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79111840"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="79111840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:44:57 -0700
X-CSE-ConnectionGUID: BIjxPuyuRHeb8OrSa9RyrA==
X-CSE-MsgGUID: H+VygUxfSOSGuibavPhIuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223045104"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:44:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3B5DE11F94F;
	Mon, 23 Mar 2026 11:44:58 +0200 (EET)
Date: Mon, 23 Mar 2026 11:44:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lian Xiangyu <lin25001x@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com, mchehab@kernel.org,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: remove 'U' suffix from register
 definitions
Message-ID: <acELmu8kD-F8NCLH@kekkonen.localdomain>
References: <20260321143132.661290-1-lin25001x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321143132.661290-1-lin25001x@gmail.com>

Hi Lian,

On Sat, Mar 21, 2026 at 10:31:32PM +0800, Lian Xiangyu wrote:
> The ipu7 driver's TODO specifies that the 'U' suffix should be
> removed from hexadecimal and decimal values in register definitions.
> 
> This patch cleans up the definitions in the header files within the
> ipu7 directory to comply with the requirements and improve consistency.
> 
> The modification was verified by comparing the disassembly of the
> built-in.a archive before and after the change. The MD5 hashes of the
> disassembly output remained identical, confirming that this is a
> purely cosmetic cleanup with no functional impact on the binary.
> 
> Signed-off-by: Lian Xiangyu <lin25001x@gmail.com>

Could you do this just for the hexadecimals?

-- 
Regards,

Sakari Ailus

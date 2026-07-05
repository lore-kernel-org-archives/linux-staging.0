Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A1125AA
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783234206; cv=none; b=PB2MD6jtVsXxyXKvuE5/48+Xntudrzq6nxGcxiqcFFb8JoD0nbVP8ComXyEa1qqfvo8T2zQOPxDlggWfetFsGUQ3eGkiEBoAoCb0pvceLf25r2qJXNptT7A7OBvaDXAYqiGLNfMfBApyXCwzlRjIQM5FRsVmsTCGcbAD1mv3lwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783234206; c=relaxed/simple;
	bh=3/mDoSqD0dmq0n7Xb9urDH1LgUjE3ahiwVuSxPlpFXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnYnQJs8VuLL+QjJZ3o4OGJUwZ4kBr14VvX1Z7/akyrFNpqAdCsurdquIY8+rWwmwqscKiz/XTUBa6DETYAIC4Hd0E3Wur1WSTmPP1fdj/8IfUVyz77WRVO3VP19Rv6bkGdwE3tj7idf/G4Tx3eDNA5WXIvn0EFFrT4DyXIEsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/8nvRbu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/8nvRbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783234204; x=1814770204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3/mDoSqD0dmq0n7Xb9urDH1LgUjE3ahiwVuSxPlpFXY=;
  b=b/8nvRbuI1ZO8oXI8wQrH24VagvgGhz4IdY76N/ZKfEe+dCAlua4DhWy
   QZrGBq0RDWc/7LNKUtaM2e3wJ3EI3iJhkPpArWUVo3ntovV88D35IEdSV
   ufv654HsI7NKA/HAP+1dfAl4dvnICwJC+1Bo0c8JcrQfLjlj1m5QEg4Zy
   Ih67WY+j3Cw9mZX3ydHUnalLmzsDrJyFJilJ1xNMFIwJWffGBTwTNV6/v
   FRE+h8nPw6jO45mDzhRcwQeq1mn+eKlWLfXXUCKzpdBUbTj3dUOaaVIfR
   gcbf9/1JfDRJrHDeYloJTrCJIuIirjsSbY7723B3dWqprZOLw+aCjk4/7
   w==;
X-CSE-ConnectionGUID: 9RnXVlUDSS608jwr8r+OYA==
X-CSE-MsgGUID: FX46WbuMRFSe5Z7t1sT4zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="83008397"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="83008397"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 23:50:04 -0700
X-CSE-ConnectionGUID: hoKwTULzTZi6OhCAE5Wcrw==
X-CSE-MsgGUID: 1xpAr8tyTfunI11Cswj8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="253563032"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 23:50:01 -0700
Date: Sun, 5 Jul 2026 09:49:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: flatten pre_power_down logic and
 clean up staging code
Message-ID: <akn-l_8jVLI4VmbB@ashevche-desk.local>
References: <20260704190854.114172-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704190854.114172-1-miraly.dev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jul 05, 2026 at 12:08:54AM +0500, Ruziev Miraly wrote:
> Refactor atomisp_mrfld_pre_power_down() by removing the redundant
> nested 'else' block, making the function structure linear and easier
> to follow. Keep both error logging branches intact to ensure consistency
> in hardware failure reporting.
> 
> In addition, fix minor checkpatch.pl style warnings in the same file
> regarding code alignment and hanging open parentheses.

> ---
> Changes in v2:

As I see this went completely wrong. Read my previous reply why.
Please, slow down and take your time to study how the Git works
and what is the process to upstream the changes and read related
(in-kernel) documentation for that (also articles from lwn.net
will be helpful).

On top of that, find a hardware to test your changes. It's usually quite cheap
no-name Intel Bay Trail or Intel Cherry Trail tablets one may find.

-- 
With Best Regards,
Andy Shevchenko



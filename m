Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873483;
	b=kCdqEd1hRCPxqpcHtnZqPPSgJJIP5svMmWswxCEK8i2YgDUxiEy5BY4n7BinRE3qY2Z3
	 fdQlJrQ6TxCoB7fWhqMPdm2pHhPGesBe2OIwtri0oEpyl5GrTfAJ5eZ6Sg4PvfV+z9zhi
	 BduQTPGK4cXwFwbXLOshmFS2GzbEhJHB4TB0aVPt5aC5Sadm/OiUG3fL/RIPOvV7CsGis
	 o/uY1EW3OrmR9n4Z4h92z65C7wsFkb3o0kRFK9ZNrMdw+M+SzZ1dsIspiubh3iVA6WH2S
	 2ZCRZPbaRhdB08w+qPNrJwLe0nrZQzelNUwevIM11NyY7qYB6j3m4s4kW1sSFperHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873483;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wsdgcA9vaCSEKoIEPaFm6fxJFmWhFKqHok8lRNdUQUA=;
	b=e+e++U1YyTbzydZwmBZ59AeFWUrcGJVaIGlJu85AUcjbVheIR4E545c4upeKowWuikTH
	 z602jm45WgKczA45+zMvN34hKpdBLCevGX1AtAp1dpysU06Z72LL0nIMxfMXNjx0NOuWt
	 6J5/sCtax0Nkqx6vrgPUwp2KlAzKgZpDvco+wQVZ8Dx2XmT6qwm3TxwloCIjkE4apaNcW
	 5Gq0GiB3GuYkYvFu4wg/0OMIQRJe9o0uzuCf4oOO8+59TuHkbMQIsWczz8j7HHLu7/a0V
	 8J7fHmpjWYXmfC50nrvMvBJ6kFrBAsFEQCM0PL7htcoPvFhDBxZo+Zq1RzyasFDpkVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7XnIbvf;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36694606B8D3
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 10:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36694606B8D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b7XnIbvf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873483; x=1825409483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cweAt+G5hJEjWG5u8FMoAhY7j0vIg+95aauQT9On/go=;
  b=b7XnIbvfFrumMlxZVIQGa3cV2wlRuH2Ozed5ydAaS8e8ijBfNWseXQHJ
   G6wLViIBvuvvxOjFyb2DJnyx1c77L9iCzXx0aP6+/kK+aVMidtGls6Byd
   L1/oWrrI0QlDXUVrug7yXO8fjU4oQN8RNDgDPsOBl00NUa6mOFNLv5OZY
   xiFtccthzTCn6CQJPrxViKyj4Y4D4kjABmJ0rGGZjixGd0uSXw2/TwYqC
   JqPU5XOLAfAwgILqCaRt6fhpOP4e2OPfmDdNmcI7CpT6A2fDjtZI82uKJ
   1E+whCOVpe+JJGK4zKMgFD4NWfKpfbzc0LAFW6bWpSw9f2QkAggmEIrwI
   g==;
X-CSE-ConnectionGUID: yMyovkXlRjixYij7paOsZg==
X-CSE-MsgGUID: gGSPylnvSUesyuFUTl3IkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2673919"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2673919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:11:23 -0800
X-CSE-ConnectionGUID: +GylQFaiR6qSOiSg1gzRGg==
X-CSE-MsgGUID: c5UrPFLITOWTTwaBoDkmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7084246"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.182])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:11:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F18C5121B97;
	Thu, 05 Nov 2026 12:11:31 +0200 (EET)
Date: Thu, 5 Nov 2026 12:11:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurian Iacob <laurian.iacob@yahoo.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: use guard(mutex) and simplify retry
 loop in buttress
Message-ID: <auxWU5QgfZ8hrSAH@kekkonen.localdomain>
References: <20261104222832.32471-1-laurian.iacob.ref@yahoo.com>
 <20261104222832.32471-1-laurian.iacob@yahoo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104222832.32471-1-laurian.iacob@yahoo.com>

Hi Laurian,

On Thu, Nov 05, 2026 at 12:28:32AM +0200, Laurian Iacob wrote:
> Use scope-based guard(mutex) from linux/cleanup.h in
> ipu_buttress_ipc_send_msg() and ipu_buttress_authenticate() to simplify
> error handling and remove redundant goto unlock paths.
> 
> Additionally, replace the backward goto retry label in
> ipu_buttress_ipc_send_msg() with a standard for (;;) loop to improve
> control flow readability.
> 
> Signed-off-by: Laurian Iacob <laurian.iacob@yahoo.com>

Thanks for the patch.

Unfortunately the ipu7 staging driver will be removed soon, therefore it's
a target of fixes only.

-- 
Kind regards,

Sakari Ailus

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879174;
	b=XSDM5V/+8iqbTNqTYpDY/mTf6RQr6yrYsoPPOZs0ZHJRxZ/cLn79jbX8ewBr+5D3QLU4
	 lvKb6c/PBGag8+suC6evSuAIXTfwsliidgXT5xb/dnAJZ40jj/jMccH/E4Iq9h36tVmIm
	 XmDMcTIbbbRRnoP4hdoknPbJIBUZH7Ub81B+KqwDCaqLWSdO59tlDpGKyDQvrgKs+HS+C
	 bmN2XWsnHzyuabdLdyAP3JZvdRgS/pMsmpq+ZJn/1QXjJ6XDg3RuilGq0iiA9IagVLdaW
	 022iIZxOVZDYM4KDy/iJGdPOFSJN75xF099pRPQFdfElrtzoR5pGe1rA8YlZnq+45sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879174;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=NSKZa4ye0LkUdsLkrm7Rm28ju04K47Dqy5NWckuPC+k=;
	b=oWsuWOXOnvYSKLSIBfez1YfTUOAOatan+sekPzZRBOfzhgF6i2vg5pR4JHVPGEpAbFpF
	 Vsr2tZyV1wQ9VuzROkXzrc6XEcE1/4y7Ch4LdBue98VGwHT6KaW9P7wDVaxAjWwqSQlu7
	 CfpxgjOsdrg/YGumVuU0Cd+6jvJmkN/4smn8n4hti/agZi5fUzi3BldKiVG0I58kbA/47
	 q4WpRvXQrq6M8TLSxYCK/pW6xs9pmnHSTtMYVa+zfjJQ4+m5G8QVgv8GmhK/yG+CD37/8
	 DvFMMtYCwXCfxclgRJkwA3PHgZiSH7cyykE/+txTSXwrVr6O9jPLZKx+S4eIptETNww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sr4C7iZ9;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8511606A928
	for <linux-staging@lists.linux.dev>; Thu,  5 Nov 2026 11:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8511606A928
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sr4C7iZ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793879173; x=1825415173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OCg2W30o8vQ8OO1s+xdsqkrOdBHhLk2OtMes1baq76c=;
  b=Sr4C7iZ9s0umWaZx9amVQ2t0Hc2an7JmRL1z8Optpa67ofauSGIpe3ij
   qkVWRnYSJRCPGXp/+XenM5QQ1M/XH0zWeEy2GPz7nCOjsP7POvqPBIYx2
   wZt6aoawM7ppPcsrMdchyCvF72M0fLIMsn4tvncGWIq9A3pq9PI4IU+AL
   HeNUTYbNmCg0q9RJ5HOKC5PYlhhKWqMhzwnhy1iWGavcLgHxW9z+k5aJo
   1qVIHAPO742jKJUsmjxV8iUQi1jjc8OZft383EO7Xs0blEVXN5+C3OUb3
   Ob6BJ12bZALuCQPxF4byOt8XOT6BNEkVmlQ3Df3PrDnpKzy3ik/rAt4Vk
   Q==;
X-CSE-ConnectionGUID: PoSJ8CTgShu4ZCrbQ72oIg==
X-CSE-MsgGUID: pFuw6fX5RRGTnGTNr+JYsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2548020"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2548020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:46:12 -0800
X-CSE-ConnectionGUID: Vdd75W6xS4i/w10gfKSiGA==
X-CSE-MsgGUID: DBVu0q0gTD6lwwwebdsT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7113980"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 03:46:10 -0800
Date: Thu, 5 Nov 2026 13:46:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Gobi Durairaj <gobidurairaj@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: fix block comment style in sh_css_sp.c
Message-ID: <auxsf6qUD4XeAV2D@ashevche-desk.local>
References: <20261105064312.360626-1-gobidurairaj@gmail.com>
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
In-Reply-To: <20261105064312.360626-1-gobidurairaj@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 12:13:12PM +0530, Gobi Durairaj wrote:
> Convert block comments to the preferred kernel style with a leading
> "*" on each line and the closing "*/" on its own line, as reported
> by checkpatch.

If Sakari wants to take it...
This type of changes to this driver are not appreciated at this moment, sorry.
I can point to the success story in case you want to continue with this driver

https://lore.kernel.org/linux-media/20261027230807.2407261-1-vladurares@gmail.com/

-- 
With Best Regards,
Andy Shevchenko



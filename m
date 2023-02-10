Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68692F31
	for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 12:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676031997; x=1707567997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AAW8CAxh3NospT4twb5krZ4kq1Oorn3Fo1t0adNhpqg=;
  b=fCT8s7HC5w+7slFyvgG5tt117z/D7IzK7QI62ShwOUwnHvli1MkIOUOm
   souqqtVzEbCs8GIqMKvI9iX/gYcteVgMRiKbv6/8/jQFQSfzmXDKKA4o9
   laBUiHBtkOqNrIXVyIiKUhP102WaBP/HXAd1Od2NhaX/Anws0B7wge8wE
   uS4k+oQoBZEKqSECgMGOLVarIDYDjrIL4xEW0N2CUhGsOmjkxG58sq1qe
   a5V2F0c5RY/OoC5RXwtlI8RaPIk8JGzHFzoDwuF5gnY85s1bd8h31xRQS
   RnH1zYY86rRCxrpf/DpXn5He8Uy3/R9u0EPGoCMVb2MumAhrPvQYSQjef
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="331711498"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="331711498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 04:26:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="698410598"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="698410598"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 04:26:34 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 65E8B11F9EF;
	Fri, 10 Feb 2023 14:26:31 +0200 (EET)
Date: Fri, 10 Feb 2023 14:26:31 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Feb 10, 2023 at 01:45:10PM +0200, Laurent Pinchart wrote:
> Regarding the width-specific versions of the helpers, I really think
> encoding the size in the register macros is the best option. It makes
> life easier for driver authors (only one function to call, no need to
> think about the register width to pick the appropriate function in each
> call) and reviewers (same reason), without any drawback in my opinion.

As I noted previously, this works well for drivers that need to access
registers with multiple widths, which indeed applies to the vast majority
of camera sensor drivers, but not to e.g. flash or lens VCM drivers. Fixed
width registers are better served with a width-specific function. But these
can be always added later on.

-- 
Sakari Ailus

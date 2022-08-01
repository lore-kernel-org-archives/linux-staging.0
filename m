Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B77F
	for <linux-staging@lists.linux.dev>; Mon,  1 Aug 2022 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659336332; x=1690872332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DHX+Z4xvrQF68kEA0CuDzi0u0vWaW4w0gl4GfmgkvFI=;
  b=O48hNwLm8aB6Pfiy9b+QNuALqhfCTOIYsUh31QEadth9u5aIQIAslLaU
   1rK21Iq+I1ODA48OgrQ9AeOr2WMZGr1sh1GHiXTFau4eiaQtQzPmpCdB6
   wesGysQhBJmJfKMOmRyGgWvfTEUIV2mJF2YnipDpzdgu3lrlptaLpSJZ5
   tDW3zyfqn+WhvrsChqd0kILPaw6uN/0yaqjZ5rHXP9i4t5z+tfO/twtU6
   45P3nqM1mPFRDld0PMK5bl2OBj3tJSZbnKQ8AIK/o+U2LE70RKtPt1KT4
   Yyio48Ms5++jt8rxlz/Q/QG5vdRngCMs70OMoB7fHWUpD4j/OlwHOrDbQ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="350784231"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="350784231"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 23:45:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="691360372"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 23:45:29 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id D1D702019B;
	Mon,  1 Aug 2022 09:45:27 +0300 (EEST)
Date: Mon, 1 Aug 2022 06:45:27 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/1] media: atomisp_gmin_platform: Switch to use
 acpi_evaluate_dsm_typed()
Message-ID: <Yud2hzq3JQBzf+oK@paasikivi.fi.intel.com>
References: <20220730155905.90091-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220730155905.90091-1-andriy.shevchenko@linux.intel.com>

On Sat, Jul 30, 2022 at 06:59:04PM +0300, Andy Shevchenko wrote:
> The acpi_evaluate_dsm_typed() provides a way to check the type of the
> object evaluated by _DSM call. Use it instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

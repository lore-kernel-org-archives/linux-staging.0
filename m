Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C93B1C75F
	for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686584085; x=1718120085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Eb3Mm09adN6K9gUBCgKSk4MjwnPUfaI+/HnXTw8x3W4=;
  b=ZGR1/cpjIkwAXogK8KbOcp2q9LpcxFG/+qJvyAxblMAgrcO/4seiuezu
   87iLE3+OQ90bvGbUAEVjseR681UDdaBnlRJyz1Fw6Y+y5WLZ99XpsMRYF
   HXxO8AzqZriqpbsvB3JMyY3hHMPqTdEWEOZxPrI/m3AfsHkY3KXTA5hMx
   TiWJdgxh9uKwSKgrmsWoRfuNqdBhPXEbHBellONM2g1FGo24x4x+m9fng
   hFps9n6OfVQHcDtmo7tjCWlu/k+AEa2/iVV6RgYHHwTbj6HsUKFdvEXkx
   ty1wvuLIpYy4vjxSdo1a9cpguvn0NCwLZEBS+VOEEGxPV/Cr+TK+TGDVm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337712751"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="337712751"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 08:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="781252297"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="781252297"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2023 08:34:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q8jYy-0039IC-2J;
	Mon, 12 Jun 2023 18:34:36 +0300
Date: Mon, 12 Jun 2023 18:34:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/4] Make sscanf() stricter
Message-ID: <ZIc7DJME7yDfrOf+@smile.fi.intel.com>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230610204044.3653-1-demi@invisiblethingslab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Jun 10, 2023 at 04:40:40PM -0400, Demi Marie Obenour wrote:
> Roger Pau Monné suggested making xenbus_scanf() stricter instead of
> using a custom parser.  Christoph Hellwig asked why the normal vsscanf()
> cannot be made stricter.  Richard Weinberger mentioned Linus Torvalds’s
> suggestion of using ! to allow overflow.

As Rasmus articulated, NAK w.o. test cases being added to all parts where your
changes touch.

-- 
With Best Regards,
Andy Shevchenko



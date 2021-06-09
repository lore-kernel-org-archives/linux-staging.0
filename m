Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730529CA
	for <linux-staging@lists.linux.dev>; Wed,  9 Jun 2021 14:54:09 +0000 (UTC)
IronPort-SDR: NGqnapfJ+HVa45Nvg7TQ1Uj+sEdl4ASdm5JAhNPgE0thdsBkQKUvKaL+zMLwXAhK9cPa6iOIEC
 olb+Hl4jL3pw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203235151"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; 
   d="scan'208";a="203235151"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 07:54:08 -0700
IronPort-SDR: lqZE0eQv+v5lrVzBazQmDGO0q9nm+JbbXoTZ+SGwgEuL7AVOjWtaR/GnyU2eqMyfDGIIUsXcQy
 fqDscxUFbdbQ==
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; 
   d="scan'208";a="449968541"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 07:54:06 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 7FC5020116;
	Wed,  9 Jun 2021 17:54:04 +0300 (EEST)
Date: Wed, 9 Jun 2021 17:54:04 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: remove redundant initialization of
 variable ret
Message-ID: <20210609145404.GI3@paasikivi.fi.intel.com>
References: <20210609121408.186239-1-colin.king@canonical.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121408.186239-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jun 09, 2021 at 01:14:08PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read,
> it is being updated later on. The assignment is redundant and can be
> removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

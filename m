Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F295177
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 15:07:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="300509268"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="300509268"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 08:04:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="526178724"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 08:04:13 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 9D9C820345;
	Tue, 10 Aug 2021 18:04:11 +0300 (EEST)
Date: Tue, 10 Aug 2021 18:04:11 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Evgeny Novikov <novikov@ispras.ru>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dewar <alex.dewar90@gmail.com>,
	Colin Ian King <colin.king@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] media: atomisp: Fix error handling in probe
Message-ID: <20210810150411.GG3@paasikivi.fi.intel.com>
References: <20210810115303.9089-1-novikov@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810115303.9089-1-novikov@ispras.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 10, 2021 at 02:53:03PM +0300, Evgeny Novikov wrote:
> There were several issues with handling errors in lm3554_probe():
> - Probe did not set the error code when v4l2_ctrl_handler_init() failed.
> - It intermixed gotos for handling errors of v4l2_ctrl_handler_init()
>   and media_entity_pads_init().
> - Probe did not free resources in case of failures of
>   atomisp_register_i2c_module().
> 
> The patch fixes all these issues.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

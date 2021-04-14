Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252666D28
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 20:55:39 +0000 (UTC)
IronPort-SDR: 9KP65LAZL9aIPZS5LK1s4rV9Io+UIAeTY1vcOuuHgGadCi3ZxAB02jLej04qOTDRou8n3fvVxv
 oYjYFe46oszg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="182236256"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="182236256"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 13:55:38 -0700
IronPort-SDR: GLbey1GVBxh6cFzkyqokGMnywWDiujcWnFN8IJe7X1O8DersDr8SwtrvA0l7w2rgJTtazkNAlL
 nB1uyaqUTqGg==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="443946283"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 13:55:36 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 53E4A204F8;
	Wed, 14 Apr 2021 23:55:34 +0300 (EEST)
Date: Wed, 14 Apr 2021 23:55:34 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Format comments
 according to coding-style in file atomisp_cmd.c
Message-ID: <20210414205534.GF3@paasikivi.fi.intel.com>
References: <20210414204244.GA8287@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414204244.GA8287@focaruja>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 14, 2021 at 05:42:44PM -0300, Aline Santana Cordeiro wrote:
> Format all comments according to the coding-style.
> Issue detected by checkpatch.pl.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

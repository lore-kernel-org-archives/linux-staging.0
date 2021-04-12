Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938471
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 21:22:54 +0000 (UTC)
IronPort-SDR: ItEGMVD3lByhcWo366AuATSM5u54YH64dGCbyeDilU6mvg/mX59Jvayv+J8fhy+1XG6ON5u3y3
 sVGgGICw3SCQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="173773382"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="173773382"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 14:22:53 -0700
IronPort-SDR: w20xRPbCNHbZFV4m4XNmVa95UmIEMCg5aIdaO7+IhGBpJS5OGhALVd7CkDtoYszRuLy2sWGJpr
 Pclup8EAGWSg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="521337381"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 14:22:50 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id B5855200E8;
	Tue, 13 Apr 2021 00:22:48 +0300 (EEST)
Date: Tue, 13 Apr 2021 00:22:48 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Re: [PATCH 2/6] staging: media: intel-ipu3:
 preferred __aligned(size) over __attribute__aligned(size)
Message-ID: <20210412212248.GN3@paasikivi.fi.intel.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
 <20210412094315.GJ3@paasikivi.fi.intel.com>
 <YHRZSYmHfXTh/S39@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHRZSYmHfXTh/S39@kali>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mitali,

On Mon, Apr 12, 2021 at 07:59:29PM +0530, Mitali Borkar wrote:
> On Mon, Apr 12, 2021 at 12:43:15PM +0300, Sakari Ailus wrote:
> > Hi Mitali,
> > 
> > On Mon, Apr 12, 2021 at 04:38:59AM +0530, Mitali Borkar wrote:
> > > This patch fixes the warning identified by checkpatch.pl by replacing
> > > __attribute__aligned(size) with __aligned(size)
> > 
> > Same comments on this than the 1st patch.
> > 
> > It's a staging driver so even if this is a user space header, it's not
> > under include/uapi/linux.
> >
> Sir, I am not able to understandd what you are trying to say in this. As you
> mentioned in patch 1/6, I removed and added header where BIT() macro under 
> apprpriate userpace, but what should I modify in this patch?

The comment on the 1st patch and above was a weird way of saying "please
drop patches 1 and 2".

BIT(), __aligned() and __packed are macros in kernel headers that generally
are not available in headers exported for user space consumption.

-- 
Kind regards,

Sakari Ailus

Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5011072
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:28:16 +0000 (UTC)
IronPort-SDR: 9RUYmZHBqJhpA2Rlch1EGgHdoBApMwAL5R79qT6uJOQrfeClA0WibOfImkTa94Nks0CGCeVrfz
 8l1XKlws7G0w==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="194150781"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="194150781"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 00:28:03 -0700
IronPort-SDR: G662FlIdTzBS+sgyF982vbTaYMXS791eapI1uQ7YZ9cmOYdI8Vm6F7ySXj2FWXxjdoBR/PvNKs
 7ga5mYfCzYww==
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="382268190"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 00:28:00 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 1BBA1200E8;
	Wed, 14 Apr 2021 10:27:58 +0300 (EEST)
Date: Wed, 14 Apr 2021 10:27:58 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Mitali Borkar <mitaliborkar810@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] Re: [PATCH v3 4/4] staging: media:
 intel-ipu3: remove space before tabs
Message-ID: <20210414072757.GY3@paasikivi.fi.intel.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
 <01ad7ff353f805dfc48e7bcc26ed974e7bb5ef9f.1618326535.git.mitaliborkar810@gmail.com>
 <20210413181712.GI6021@kadam>
 <YHX3iVCNXJlOsmuQ@kali>
 <alpine.DEB.2.22.394.2104140004430.14108@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104140004430.14108@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 14, 2021 at 12:05:04AM +0200, Julia Lawall wrote:
> 
> 
> On Wed, 14 Apr 2021, Mitali Borkar wrote:
> 
> > On Tue, Apr 13, 2021 at 09:17:12PM +0300, Dan Carpenter wrote:
> > > On Tue, Apr 13, 2021 at 08:59:34PM +0530, Mitali Borkar wrote:
> > > > Removed unnecessary space before tabs to adhere to linux kernel coding
> > > > style.
> > > > Reported by checkpatch.
> > > >
> > > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > > ---
> > > >
> > > > Changes from v2:- No changes.
> > > > Changes from v1:- No changes.
> > > >
> > > >  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > index 47e98979683c..42edac5ee4e4 100644
> > > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > > @@ -633,7 +633,7 @@ struct ipu3_uapi_bnr_static_config_wb_gains_thr_config {
> > > >   * @cg:	Gain coefficient for threshold calculation, [0, 31], default 8.
> > > >   * @ci:	Intensity coefficient for threshold calculation. range [0, 0x1f]
> > > >   *	default 6.
> > > > - * 	format: u3.2 (3 most significant bits represent whole number,
> > > > + *format: u3.2 (3 most significant bits represent whole number,
> > > >   *	2 least significant bits represent the fractional part
> > >
> > > Just remove the spaces, don't remove the tab.  It's looks silly now.
> > >
> > Okay Sir, do I have to send a v4 patch on this now?
> 
> Yes.  If you get feedback on a patch, you should send a new version.

v2 of this patch can be used as well, it's fine. (I missed this change in
v3.)

-- 
Sakari Ailus

Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7282046AF
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 10:04:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="303982879"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="303982879"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 03:04:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="673801721"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 03:04:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1o13Pl-000cEx-3D;
	Tue, 14 Jun 2022 13:04:49 +0300
Date: Tue, 14 Jun 2022 13:04:48 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/40] media: atomisp: Various hmm and other cleanups
Message-ID: <YqhdQIPaG6ictF7/@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <CAHp75VcLfeN+y3S=AkMDjUyB3oS1k0j7pu4Ts7D9K35F3UkEbw@mail.gmail.com>
 <655885f2-e3c4-2e26-7271-7032bae017c5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655885f2-e3c4-2e26-7271-7032bae017c5@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 14, 2022 at 11:50:32AM +0200, Hans de Goede wrote:
> On 6/14/22 11:25, Andy Shevchenko wrote:
> > On Mon, Jun 13, 2022 at 9:51 PM Hans de Goede <hdegoede@redhat.com> wrote:

> > For patches 9-13: I believe that patch 10 and 9 should be swapped in
> > the series. Logically you drop caller first followed by (unused)
> > callee.
> 
> Note the code removed in patch 9 was never called even before patch 10,
> the removed calls in patch 10 were already "#if 0"-ed out. So there
> is no bisect breakage here. With that said I get your point.

Yes, it's not about bisecting, but rather logic and (quite unlike) possibility
of restoring that partially and when someone switches 0 to 1 in those #if:s,
compilation will be broken.

-- 
With Best Regards,
Andy Shevchenko



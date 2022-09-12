Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E52589
	for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 11:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662981126; x=1694517126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V0MvIQM7UUUrtqPLAtd6ppjVH1qbfAZVSmHo17lME3k=;
  b=npc4Rql2v3IaOevKGYJ5LKdhPjLGBhwyuQwQomZztmUYm98lAYjVVqLg
   EuuPyQRxfPB3VrW9oE3gBxucvI9IjM9s0jnC+dY3lLkpH3/e0P2rQv3yi
   /HqtkcTDzPc7OAptUb6/gFE635ASz1LS0g8Qq8i717U6xFICZetiPkGww
   wxyjMJrK7dolJJE1KhD8PMV/P0lv3M4Vs5b1gQ0+05mqGSUsk5HT0hTyt
   dKzxX26VrYIGxa8oVysOxG+sx3WLQv3K3ZfqM03+zfjrgIIHlQu/7WIBo
   jmZMGJonQbAWbdwqyV7pfK5hU5Na8jk7hRap54T2V0PSDAf5qB78lJgR4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="324070829"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="324070829"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:12:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="593450970"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:12:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1oXhM7-001JgB-0l;
	Mon, 12 Sep 2022 14:11:59 +0300
Date: Mon, 12 Sep 2022 14:11:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/17] media: atomisp: Use a normal mutex for the main
 lock
Message-ID: <Yx8T/uEKvVDoCvsT@smile.fi.intel.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911171653.568932-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Sep 11, 2022 at 07:16:37PM +0200, Hans de Goede wrote:
> There is no reason for atomisp to use a rt_mutex instead of a normal
> mutex, so switch over to a normal mutex.
> 
> All the changes in this patch are just s/rt_mutex/mutex/.
> 
> This is a preparation patch for switching the ioctl locking over
> to using the video_dev.lock member so that the v4l2-core takes
> care of the locking.

So the idea behind rt_mutex here is to inherit the priority on the task.
I'm wondering what could be possible the bottle neck this is trying to
solve. If there is no other V4L2 driver that does the same, any specific
run flow of AtomISP v2 code that may suffer of this?

-- 
With Best Regards,
Andy Shevchenko



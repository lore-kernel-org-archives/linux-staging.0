Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA972
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 16:37:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228443604"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="228443604"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 09:37:23 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="444562961"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 09:37:19 -0700
Received: from andy by smile with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1mcs6l-00025u-8z;
	Tue, 19 Oct 2021 19:36:59 +0300
Date: Tue, 19 Oct 2021 19:36:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nable <nable.maininbox@googlemail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <YW70KzXJ8q1ksEx5@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <bc7f699d-d77d-83ad-ce5b-6082f30881c1@redhat.com>
 <7550e3359471726cf14572dd4860c238f166dde8.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7550e3359471726cf14572dd4860c238f166dde8.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 19, 2021 at 10:50:27PM +0900, Tsuchiya Yuto wrote:
> On Mon, 2021-10-18 at 09:48 +0200, Hans de Goede wrote:
> > On 10/17/21 18:19, Tsuchiya Yuto wrote:

...

> > >   ## for mipad2 (and whiskey cove pmic based devices)
> > > 
> > > For devices which equip whiskey cove PMIC, you need to add non-upstream
> > > regulator driver [1].
> > > 
> > > [1] work done by jekhor, which seems to be from intel-aero or old
> > >     Android kernel
> > >     https://github.com/jekhor/yogabook-linux-kernel/commit/11c05b365fb2eeb4fced5aa66b362c511be32a34
> > >     ("intel_soc_pmic_chtwc: Add regulator driver and definition for VPROG1B")
> > 
> > Interesting I recently bought a 2nd hand mipad2 myself too. I still need
> > to put Linux on there. I'm definitely motivated to do that now :)
> 
> I'm glad to hear that you also got a mipad2 :) It might be a interesting
> device to look into. It even won't boot without nomodeset, no battery
> charging/status on mainline kernel.
> 
> By the way, instead of adding whiskey cove regulator driver, we may also
> add a "hack" like the other PMIC in atomisp_gmin_platform to control
> regulators [1].

I looked briefly into the code and if we indeed need to turn off or on
the regulators it should be a driver.

I don't like having hacks outside of driver/staging to satisfy the one from
the staging.

I.o.w. having a regulator driver is a right thing to do in my opinion.

> It seems that to do so, it needs to "read" value from the PMIC before
> writing. So, I'm not sure if this can be achieved easily with the current
> mainline kernel though.
> 
> [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/commit/6204d4b7aeefc4db622f8ac57b87bf2c76c6c8aa
>     ("atomisp_platform: add whiskey cove pmic support")

-- 
With Best Regards,
Andy Shevchenko



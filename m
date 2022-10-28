Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8FE320E;
	Fri, 28 Oct 2022 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666981318; x=1698517318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WdtycWAj7ZZzF2NnGQ8L1k0yKjh4DNQY2nx3zhBw42o=;
  b=RtP9n/dohKOu7gkVgsfoStT/Gr+p2q0Qtees5+MBwjFN7mbIOLZ9kElC
   fi89Y3YeHSYg6+0B2LPSQ5gwLeMCpZXDdJwyzFjSpxfjv3nFFYL1pm9iZ
   bWiXAZ1ZKSfa/x7bYvgQw71fZ9dNTg+FeVjAsrYlJG+n/6VLHDbSXnHcS
   5ujm3dAl7tqddSvZbCSaMSxd+D06wdZh8DwNZMvRKYkShVSuGiIKkZYDb
   xctGgXSZL33DZprelzxWmTMOYw80DvvxqBp1z4g8a0bHS9V57l0SHnOZF
   8IvpMnfA7gkCeZ+NmnILEQpnuSgMaokavBWoBUZfloBTp1KpIuy3ZoaCG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="335207830"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="335207830"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 11:21:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="722145510"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="722145510"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.175.207])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 11:21:57 -0700
Date: Fri, 28 Oct 2022 11:21:55 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Tanju Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: Outreachy first patch wiki modification proposal
Message-ID: <Y1wdw5GC8ZUhXFKj@aschofie-mobl2>
References: <CAHJEyKU8YhVLg2k4c6H_B9YJo=Va=V8ea+vkgDKH8aUZBou0wA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHJEyKU8YhVLg2k4c6H_B9YJo=Va=V8ea+vkgDKH8aUZBou0wA@mail.gmail.com>

On Fri, Oct 28, 2022 at 09:35:48AM +0100, Tanju Brunostar wrote:
> After setting up my mutt with Gmail, I tested it by sending an email
> but it did not go through. After some research, I realized that Gmail
> no longer allows less secure apps. The way around this is to set up
> two step verification, then generate and use "App password". I would
> like to add this to the wiki, as this will save others from the
> additional work. Please let me know if I can proceed.

Hi Tanju,

This is an Outreachy specific question.
Please resend it to the Outreachy list only.

Thanks,
Alison

> 
> Thanks,
> 
> Tanju
> 

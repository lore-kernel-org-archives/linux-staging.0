Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44761C39;
	Sun, 15 Oct 2023 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Znv+tto+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697347788; x=1728883788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ol2mskPaIAGU2DmeZWM0ybt7o8CfsN8HfxPqGue9/EE=;
  b=Znv+tto+1zlAKyW2om6rUzQ8MkeI8kAwyQsdOh3/bp7lkKMNXG9kZiM5
   xLdbSvZ/uNXsybx+3paLyZfsI1UhWWn7LwkvFbqXf377rMxytOJqcjbh3
   whQH02PLqSNpp38JoxGE/LKCCeg+ZVQciah6vTDBhQ3q3i8lak1SzWKtX
   Q21Mm/R2+j93p8rZFWMkoXRvtIDCo2k1RH2/NZmkyQ7DisbPqsV63yy9L
   12H83cLSi7oIv2LRQo8TNfSGtgNgc2VSUwVpxGxdROpo8JYcT9q2IL5yU
   yV0CpRIobHUHvlRuKNNUulYwzVsTSt4TGpdr8Wr2oT4IPrI6XlBneCCY+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384239280"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="384239280"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 22:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790380795"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790380795"
Received: from ingmingt-mobl1.gar.corp.intel.com (HELO intel.com) ([10.214.164.147])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 22:29:42 -0700
Date: Sun, 15 Oct 2023 07:29:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/4] staging: vme_user: Coding style cleanup patches
Message-ID: <ZSt4uZcQxm4jN+Fy@ashyti-mobl2.lan>
References: <cover.1697240381.git.soumya.negi97@gmail.com>
 <20231014200241.GA20874@Negi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231014200241.GA20874@Negi>

Hi Soumya,

On Sat, Oct 14, 2023 at 01:02:42PM -0700, Soumya Negi wrote:
> On Fri, Oct 13, 2023 at 04:47:12PM -0700, Soumya Negi wrote:
> > This patchset performs trivial code cleanups on the driver 
> > staging/vme_user to improve code readability. All patches address 
> > issues reported by checkpatch.pl, and may be applied in any sequence.
> 
> I have made a mistake here in the cover letter message. These patches need to
> be applied in order. I think I will have to send a v2. Will hold off on
> sending it just in case any other problems are pointed out by someone after 
> review.  

No need to resend for this reason. Patches in patchsets are
anyway always applied in the sequence they are sent.

Andi

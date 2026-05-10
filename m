Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004435DA76
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778405197; cv=none; b=bQWB5nHr+fiSz4f3GT4kk2EWOeq8MHkE6gPc5jIa/rpauMM8Cr5lBNvjvL/21rU8ZduTUqc+VLcE+JhMfzk8i7cFuu50zE3Nrm68tACBrASWFbppS1MEZX+AEUSC13PNfkAODus5Wfm25/HH5L5dy19Ze7EzI0rlWQbKOnxWvo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778405197; c=relaxed/simple;
	bh=j0EiPsHjE8R7ODy7EyV//iD/EN0oYIQtmCA2leS0e1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS2zk3rjr7FGK565CY77FNE6STm3jtoZ/rEMrIPaQX/EmAbXT+VNeFuNUu+Y7vCHu4Ji9OfEMT54YNy1jaAZWLynE7qWWNNGM2KzYJ9TIUzgyfgAknnueytdDcmM3xViGXc3aWVId3sUvCfQViMIkISyWLFT0/1cLwSoU+R7ssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bo20qNjQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bo20qNjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778405197; x=1809941197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j0EiPsHjE8R7ODy7EyV//iD/EN0oYIQtmCA2leS0e1g=;
  b=bo20qNjQvLCh0wp8QfuKsPx4mqu9pxbuAVDTcO4nFsmoLXYts+tgGwrT
   PI9pkjWk1qE+5YT9TdXnh7JPU52jNEDEAIc5iS2knHuLNclY7awApreI/
   sjTBPV/hqOoHxYKDhSLaVM/TD51UMGsJU+vS0oPZEVbwNjUaz7bTUUgxP
   vBnLA+H0+ozPEc+fpok4DUeM1WQKYkpsjido6lD82wrTqYqSlEkXtyjWG
   pRvjjrJoEsUDozTN9UHSM3k+j2HH/VsvKtOx8sQHYsYgStxO35DlQsTJx
   RrWqfnU5JBGdPsFPCtUhqqbEQjd/rcqlrNnq+TcSgrSrt9rO1r120gsTh
   Q==;
X-CSE-ConnectionGUID: nEue3+BdQ4Wdjy51kZ9JDw==
X-CSE-MsgGUID: tgZCEBy3RFygGCf1Fa0r9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79220554"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79220554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 02:26:37 -0700
X-CSE-ConnectionGUID: nVWs95t+QfWut84JQpmNrA==
X-CSE-MsgGUID: fvLl5pLlTNyx9GWb/M5CvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="275322638"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.171])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 02:26:34 -0700
Date: Sun, 10 May 2026 12:26:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Denny Lin <dennylin0707@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: document SPI interface
 switching sequence
Message-ID: <agBPR9xke1MTzL0B@ashevche-desk.local>
References: <20260510081041.85880-1-dennylin0707@gmail.com>
 <agBH9QqHW-cJN0iQ@ashevche-desk.local>
 <CAGEkeHf_wueMkwqQmQ0m2drXQ_m9UsvcFwqu5RVvg0WsjAJW1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEkeHf_wueMkwqQmQ0m2drXQ_m9UsvcFwqu5RVvg0WsjAJW1w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 10, 2026 at 02:22:02AM -0700, Denny Lin wrote:
> > This is still odd. Please, put in a format
> >
> > $SNUM "$STITLE"
> >
> > where $SNUM is the section number (like 2.1.4) and "$STITLE" as currently done
> > in this version, Ideally the datasheet also needs a versioning.
> 
> The ADT7316 datasheet does not seem to provide explicit section
> numbering for the "Serial Interface Selection" section, only the
> section title.
> 
> Would it be acceptable to reference it using just the section
> title, or would you prefer using the page number instead?

Do you have the Datasheet version? Maybe URL?

(Yeah, that's unfortunate they do not provide numbering, in such a case
 it's acceptable to have reduced reference.)

-- 
With Best Regards,
Andy Shevchenko



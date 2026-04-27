Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF9270575
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273955; cv=none; b=e2UXag4A+3ygoj6zHwnGG9Rjk02cMKv4ozrIfeXbA5AFRFKii70C6wK1TVSVbzdGX/ejZWl2pEVQhwaSTVh/KrECRYbfuvmz//M6uFcpY78ZMtq5AOs0WjCaWnRYt+gE0BQWHsyEbSzLF4hksG20U0LhDKyDov26yWVD2jkrsPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273955; c=relaxed/simple;
	bh=v8snRz3+q1xR+d3tuuZYjO1TmCzHCbOVOqZq98nWJss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuMOtVXm+G0ng9FaIwxQnG478IrcN5ILJA8eoYVLNAHOBU+Mt/tnYz/7j1SBjcqYIXMGqVgp0/muUPaz4lVXJoTQoBt5R8cW9GG1YeDeK7BVBgD+dhP0khl+vLKTudA4XqbhXFeLNeYtH5L9anPPKHK7Vq/HhCNyAAY072CeNIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkFpCpWV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkFpCpWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777273954; x=1808809954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8snRz3+q1xR+d3tuuZYjO1TmCzHCbOVOqZq98nWJss=;
  b=PkFpCpWVyNQi88hqDDe46iCYu4hl4qn1XXO5IoHUuYFBkpAepXeQZXlg
   +LLWQVKhRX56vpHM23vA3nGVb/u93vGEFA0UHNJuiFwxXASVWDClGERcg
   h9dskcoHPE2KyDmxqRFuNOFomuZSoGdG9tHg58K+FBA/xCwPzeT0vya2Z
   UEpR1/0L4dElCTtQnMjGloOuE87AoJziy45xRvO345raA1y0jfciV81QQ
   C5+nR8flXqim1Cv56hgboSF+Yq92kllrEMlyzGh2/mfdEepCLo+QVRroM
   21ilb//YpLq2rTImXjkx0DFTlww6AS4KkdAiZPo/ZH6OXPV4SIKRTb28e
   A==;
X-CSE-ConnectionGUID: NrWEAj+0QMOeCjhZk4wmvw==
X-CSE-MsgGUID: racMn8+ETgug+U/eJANr0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78266945"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78266945"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:12:33 -0700
X-CSE-ConnectionGUID: F+O8yhb6TsSTVB2L5vC4/w==
X-CSE-MsgGUID: Hw+qTukxRKihv4dnDwnEYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="256862067"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 00:12:31 -0700
Date: Mon, 27 Apr 2026 10:12:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: fix typo "stablization" in
 comments
Message-ID: <ae8MXe9KwvrSu2xN@ashevche-desk.local>
References: <20260425-atomisp-fix-typo-stabilization-v1-1-92f31b43ba63.ref@yahoo.pl>
 <20260425-atomisp-fix-typo-stabilization-v1-1-92f31b43ba63@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425-atomisp-fix-typo-stabilization-v1-1-92f31b43ba63@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Apr 25, 2026 at 12:22:37PM +0200, Tomasz Unger wrote:
> Fix a repeated typo "stablization" -> "stabilization" in comments
> across three files. Found with codespell.

Is it the only spelling error found? (I know the answer and your other patch
supports my knowledge). The one patch per one typo is not scalable solution.

-- 
With Best Regards,
Andy Shevchenko



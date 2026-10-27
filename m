Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122483;
	b=QEYGqiT4TjnQ9rI/zNdC0ewqJ+qx9b/933AHE3VZEKa8qTPYUFED7loELPEmGLDgP+WJ
	 8XQD4LnfoluMcOwthLhDxD2NshXOr6VCVnE7UX84hmyrBarapL81NTcZ574YEXnPupUZ4
	 xVoZTO3XrbVfMI1NqfWFBqe3V4Y9PLZ6oCoArPybKb0oOF7HQP4HONu/fEpGYI8GgTQ3J
	 zjgnZmCVIPJUqi1V2bWBqbh2PdZt9pkw9bKPYfId23OVUkq8ei56B4tVgPy/S0bmbN/nx
	 1FV+wTXJxUR0EJ9XCuS6m782RTg854u9EyCJ8egi0OWaI1nAaP08D1rL7TZpFKOiCBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122483;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=RL5nAvV+62owIFVIs+XCXqF5Edzj/Uv6upiJT9ueV3s=;
	b=MzqFGoTXDmEVOM+oX0NU9l8Gj2JzRcUE5i6UPq2fnlsAvkasJ8JRSgI+mUkQd6GnsFQ9
	 HbShV+PFrfJO2tRi+VBLeE8wuC/VhoY9MVyzs/hqVTg9hB8PeAcaFxp51DmbLXGaAxGt/
	 SF3Hyj3H2rT2khq6nNqKd0rCY97D5Z83RZzWKbD/IETyvVLeWoxtTKDW2CBPMHJoX1Q+A
	 HWvF8yASpvySPdxYhTTq5AvohfToVS91D6PPnPqoNaygzmm9UpvBxfRXZGUAyZETCRfZK
	 0KDkw3hXQwCsZ04SQTx9uAYPy7Xc2HtpW5KZ+hN/X8zXKgf6XvKwEdCX9bjc9lccMUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlnQYmCb;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA1606A31A
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 17:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CA1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlnQYmCb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793122483; x=1824658483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kHLgkjlOKnC8Pk7wCo/Q2uvtQuBN+6AxFVEym4B5Dw0=;
  b=BlnQYmCbfz+0ZNpEQY5bq0nd1aIV8iiKNZe4XigsCBDLA77LPI4YBNs0
   UwJ1IKL47dM8F6lLOkWnr0sY7wLHfMMhuG8nC6tHeZuAKNxzLNSgH4ddU
   YePj4HTUFEopL5oASD6v4dwONy1d7bJEFGpOiW70ZGqRV9m81iJsDdM/7
   IaRlKi2kM679JeMTv/50EwHGKZXBxJ35brTGp/glW6ZMwjIVnMd1Fxxne
   UqMoT0lEgTWw1po/Stdpeb8kh0F6wC1K6kVNEPFGxqouhloDkbfer/1CW
   B6Xt5BAOSBP7xI5ELgRhNK7kjnNc/GPP2QbXIVOJlLGpXxfTu4bbLpzbx
   A==;
X-CSE-ConnectionGUID: rxCiHSTHRk67bC6RXZLfRQ==
X-CSE-MsgGUID: X4g9qdClT6awmkHQ/zrPug==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1853194"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1853194"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:34:42 -0700
X-CSE-ConnectionGUID: F+jlp1g6T7qTOQGsG/2uaQ==
X-CSE-MsgGUID: gRX4KuODSuWNhzK92qbOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4968617"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:34:40 -0700
Date: Tue, 27 Oct 2026 19:34:37 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] media: atomisp: queue: move circbuf types and
 helpers to queue_comm.h
Message-ID: <auDgrXiArqLC99Vb@ashevche-desk.local>
References: <20261027120341.2305533-1-vladurares@gmail.com>
 <20261027120341.2305533-5-vladurares@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027120341.2305533-5-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 12:03:39PM +0000, Rareș-Mihai Vladu wrote:
> The remote queue code only needs the circbuf descriptor and element
> layouts plus five small descriptor helpers from the circbuf library.
> Move them into ia_css_queue_comm.h and include that header instead of
> the circbuf ones.
> 
> The descriptor and element layouts are shared with the SP firmware and
> are moved unchanged, including their static_asserts.
> 
> While at it, drop the OP___assert() NULL checks from the moved helpers,
> as every caller passes the address of a local variable, and convert the
> moved code to the kernel u8/u32 types and the usual function
> declaration style.

Yep, good one
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Next step (after this series lands) is to move from this implementation of
the circular buffer to kFIFO or circbuf from kernel APIs.

-- 
With Best Regards,
Andy Shevchenko



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909437;
	b=QHLyFCHi1kXjR99uA/mjiravASqzrDY6l3m/pi6+Rie12u3crnZyE4x6opwvtJ4oEqnV
	 aHeQv0cY44EIBZqGMLqZ4dEWxV/pnJNo7ihCkTUM5hAQtf37MpwsbvouGLeRRex39oMno
	 Nh9auFhCAjV1Mxh0t81flpQMtbicii7Xl+BUOHGz3KD1ZY4wsqriBv8Ty0GGafm4SXL4+
	 4WpRCYI4SxPrshMj5fXYI5uaFxVCUd/5w9RihbTMPrZExVIhUYG46pRsKYa7+IjfqjIrP
	 JbzCMDZHMAxIBat3P8sG8jdfu0dbpueQgIxYlNGNKIgVqdSf9Oq6EPLx5x5ABhhGcoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909437;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=8LQ5Dy/ADmf7zpiEEPCreTwWA/XdI0vBH6oroij8nrg=;
	b=wz5hbviWdHayPi+l6yOKi2galRbniin/gSXcQqHpOFaWI2OewNusBStS9GVQeymIFWoP
	 PfasRF75KJmqK9CDf8elY0CQUbWF3OWDq4cUtoa38cdi/u7xYPU5xr0h81qqk/fvsxFjl
	 kNXQWEx6F6WJJJ6MQTIeK0ofqkbLlhbavEGzG4SJqaX56C9GSuOWQfRp8OY+b8XSoyPNo
	 /+tfjIYTvSOgxgJcUt9v/KpkZkclcFdoK9Q4IPcoyp4tNFfCtd5OwtcSl388+VhMZ7EFT
	 pPRk6h78RPuSy7myTbnNhqSMBJxjbYxI8/EF/U7m+Hg8ZKs1luo+peZBA8uDSZsOlfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZNg7sns;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA09606A31C
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 09:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA09606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZNg7sns
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794909437; x=1826445437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lY2QJ+dr42ixRPBhzmuMSDm3xf6/nYnvWnvhMZfyCCw=;
  b=PZNg7snsFPW2BzeF2H7tQ+unfqZzNvnTOsGAR/hZu+qMxO7x9UlULTZW
   ymRWpI2p/9SnnlK0/HTWlqxoiihbm3+wrLuMBH+s3MHKWUSTtMTiXXL3N
   BLSn5MuweHKgLP338uCknT2+3iMBb0POv++UdFeA4Mneuvy5U891ZE2pK
   m8SUtOPFv5bJtaGzEZ9Yz5SQFLKZgix0K9U85rdYesMAenkTO+9qe5dH9
   Pus1X9LTnIVPpZz3vjNDMNNP4A45OgluhoIUZm/eGeL17z/t5YWwwekDS
   LuWJyRFidW+GmfOYFeF76on/CEJ+HWGIBODzYTahOdRaLv8emlajKkYnJ
   A==;
X-CSE-ConnectionGUID: I7ngaKspSbe2yJIGTnyDNg==
X-CSE-MsgGUID: Vog2oGQFS4ujTKzQD75Ecg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3667891"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3667891"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:57:16 -0800
X-CSE-ConnectionGUID: TZAdfFoSSH6ji+yZeU0MoQ==
X-CSE-MsgGUID: 9IfV9blZRRyup/Kg8IWVQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10200192"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:57:13 -0800
Date: Tue, 17 Nov 2026 11:57:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
Message-ID: <avwk93N8D7AYGzDX@ashevche-desk.local>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-3-volodymyrchapman@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116175151.20150-3-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 05:51:50PM +0000, Volodymyr Chapman wrote:
> Add the ACPI HID which the Lenovo ThinkPad 10 (20C1/20C3) uses for its
> Sony IMX175 rear camera, with the 320 MHz link frequency supported by the
> imx175 driver, so that ipu-bridge creates the fwnode graph for it. On
> this Bay Trail machine ipu-bridge is used through the atomisp
> csi2-bridge.
> 
> Tested on a Lenovo ThinkPad 10 (20C3) together with the rest of this
> series: the IMX175 is found ("Found supported sensor INTCF1A:00") and
> streams through atomisp.

Enough to mention this in the cover letter message.

> This patch was drafted with the help of an AI coding assistant (Claude)
> and tested on the hardware by the submitter.

This paragraph needs to be once in a cover letter, no need to have it in the
individual commit messages.

...

Since the ACPI HID here is broken (it's actually a PNP ID), can you also
provide (as a comment) the excerpt from DSDT to show that device description?

-- 
With Best Regards,
Andy Shevchenko



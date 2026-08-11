Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E45311C2C
	for <linux-staging@lists.linux.dev>; Tue, 11 Aug 2026 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786426125; cv=none; b=ugQeHrQfOn3WMhZYHFIyNv4wX52f4+EbzJ6ptF6/YbDO3hC8DlqoYy88BRCKZIEgZ3GDVWGl9cnYUfkDjWhSRDwpbIc4oZsEkLV770LZMf88JBdFIlwiWNv2lmxIAMF5Uy3BdiMYzU85ACTtjCx1K9wvUC4nSqBNd8LTUDQTisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786426125; c=relaxed/simple;
	bh=Arog7K2z2QcwiJWvIw9Uy5HHO9Vf0+5jya1uNbCcqKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5pId7LnTI7JTCsD1y8+nMsVp0fMsENh11wz6AwLC1TgXSTwGK4AxlnsRCtCdIzGHALiUhIUfchXj/RAnwdaC1T0o9Q2PwcLB+31ryfT1ZjM5TYqqd29626phPEowEHv3ms6txZFkfFYsWYePHtmG4tF+H/Gqszp+KqH2AAst/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlKf2yeu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlKf2yeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786426124; x=1817962124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Arog7K2z2QcwiJWvIw9Uy5HHO9Vf0+5jya1uNbCcqKM=;
  b=XlKf2yeuppDT+VfTHYg/iiCA9nr/3qmAF64qcFMVqCejuay4MiNBtNw0
   cZmTCBR86vaeN1RaFCe+gL+R7Jkh9YQkV9y/Be/X8wx1+6C5noeuoJ+8F
   fowFyt13MYFviZZ5TjwOtCNcX7oxf9pkN/3Au+6EHob0PSiMcaQ8Hk7bn
   qabDsPR15xR3T5yfphJ5zi6r7JXbKRZAzWQ6VSzivjQ1vq34Y+CGERMhv
   JeqxlvwGslHVXFwG8swo9wy3uTEcZB+3oE0nvI9Ob501C34wuogGJ7cZo
   psZlH0EZ8ispjon8cmPILNIJSbfKYHDvsUAdF6bpb87LqZew+kGgvLdD0
   g==;
X-CSE-ConnectionGUID: oQTKduN6SFqxnf/2C5xT8A==
X-CSE-MsgGUID: /SKscG/NSTSyCrFab3EAEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90764365"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="90764365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 22:28:43 -0700
X-CSE-ConnectionGUID: s4aZb+M9Tkey9ZTMR+Y9wg==
X-CSE-MsgGUID: TUhvwN44Q6yYJICThSHjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="259390092"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 22:28:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F088C11FC6D;
	Tue, 11 Aug 2026 08:28:39 +0300 (EEST)
Date: Tue, 11 Aug 2026 08:28:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Sidharth (Siddhi) Sharma" <wednisegit@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: return 0 for IPC messages that
 expect no response
Message-ID: <anqzBxpnnlin7_we@kekkonen.localdomain>
References: <20260811011718.274510-1-wednisegit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811011718.274510-1-wednisegit@gmail.com>

Hi Sidharth,

On Tue, Aug 11, 2026 at 06:47:18AM +0530, Sidharth (Siddhi) Sharma wrote:
> ipu_buttress_ipc_send_msg() sends a command to the CSE and waits for the
> send_complete completion, which the interrupt handler raises once the CSE
> has executed the command. When a message does not ask for a response,
> that completion is the whole story: the command went through, and the
> caller should be told it succeeded.
> 
> The no-response path does the opposite. Right after the command completes
> successfully it returns -EIO, turning a good send into an error. The IPU6
> driver this code was derived from gets it right, since there the
> no-response case simply moves on to the next message. This looks like a
> slip made when the bulk loop was collapsed into a single-message helper.
> 
> Every caller today passes require_resp = true, so nothing is broken in
> practice yet, but the return value is wrong and will trip up the first
> no-response command that comes along. Return 0 instead.
> 
> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
> Signed-off-by: Sidharth (Siddhi) Sharma <wednisegit@gmail.com>

Thanks for the patch. I'm however inclined to reject this because:

1. There's no actual bug here as all callers pass true for require_resp.

2. This staging driver will be dropped soon, in favour of supporting IPU7
and later in the ipu6 driver.

-- 
Kind regards,

Sakari Ailus

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112BB27467F
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227292; cv=none; b=uV1E2LtzQdNh6yGr/+4j9j7axa3CozNQ/3HHBfboRP1Do2s/c9NMJWVD3msAbkQa5OtnNS247vWxnyAbJqfKoREhuQdo1RZzuhonXDBTkBUC7n71oORZnJR7lqBSeYhU2sKAp3+88py2EI3/ruQCh5ViXeJBDbjroNoJK+vCXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227292; c=relaxed/simple;
	bh=uQl+dyAnTPFkwFvd/f0LstXlbQvleBYcNxbg3BMp9as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGGLahBr3VGveqv6WAhXJlrAfay+6HeqseMfk++3o13s7bAqlx4DHEdVBsxEHkE2iK/YmzTUNQTWTfwSlN4upDy8tq9FbW4aTWgtbNwK+YWwZWQM7g5YwTHKh8/7bDWuu0bSfn97LzYt51Gdsu7Cc/LhxQGJLyquSCZ2Ird+fEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnipS6JE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnipS6JE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785227291; x=1816763291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uQl+dyAnTPFkwFvd/f0LstXlbQvleBYcNxbg3BMp9as=;
  b=ZnipS6JEzuB9eo5LRpT8g5tNEG95BUy2+4yP1jA2Zh5C8sDzE/HPYYY5
   hertT9ljLW8xfZsCihxC462detjrjdeHBBdjNHrR1yGaqAE4uW1bKkd/Q
   hdVvfSm1E53bym7ljkZYXFuZ3q4UaYAr/4X+PC3bfcdeUuctLdbePBV+m
   8hSmg8LipGw2eFTFy2za8FYPX1Glej6vReIMIDweOflw2LImC9jHeS4yH
   agCLfo56TzlHeMyZjoqmVzoS7D7NyQHURkTNg9bYukyPMjzctzGEqxmMd
   KZ+SDbAvFh1GfxQcPngtaUQ10Usr5TeFUPFbQnexaLwIh0TTbrvV3fZsC
   g==;
X-CSE-ConnectionGUID: HnBQ0R2NTJaL6ySD9IikCQ==
X-CSE-MsgGUID: rwEaVIf6S+uz+Jg/Df7VJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85571251"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85571251"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 01:28:10 -0700
X-CSE-ConnectionGUID: ELAWDZ+pTNGmN0ppkeFROw==
X-CSE-MsgGUID: iRffNf1XRMmCdgfnhTd9Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="297872683"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 01:28:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 918D5121BFD;
	Tue, 28 Jul 2026 11:28:08 +0300 (EEST)
Date: Tue, 28 Jul 2026 11:28:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shivesh <chanelshivesh@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu3: fix line ending with '(' in
 atomic_inc_return call
Message-ID: <amhoGB8oJIcNB8dp@kekkonen.localdomain>
References: <6a64b80c.4987c784.13f2de.011a@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a64b80c.4987c784.13f2de.011a@mx.google.com>

Hi Shivesh,

Please fix your patch submission process (no attachments). The easy way is
to use git send-email.

On Sat, Jul 25, 2026 at 06:20:12AM -0700, Shivesh wrote:
> From c753198ad726500786ba04d66d531db4c11e2b03 Mon Sep 17 00:00:00 2001
> From: Shivesh <shivesh@example.com>
> Date: Sat, 25 Jul 2026 13:18:59 +0000
> Subject: [PATCH] media: ipu3: fix line ending with '(' in atomic_inc_return
>  call
> 
> Move the atomic_inc_return() argument to the same line as the
> function call to fix checkpatch 'Lines should not end with a ('
> warning.
> 
> Signed-off-by: Shivesh <chanelshivesh@gmail.com>
> Signed-off-by: Shivesh <shivesh@example.com>

Why two e-mail addresses? The latter isn't valid either.

The change itself seems fine.

> ---
>  drivers/staging/media/ipu3/ipu3.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index 84c4d0bf027d..14e30cf913b8 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -556,8 +556,7 @@ static irqreturn_t imgu_isr_threaded(int irq, void *imgu_ptr)
>  			buf->vid_buf.vbb.vb2_buf.timestamp = ns;
>  			buf->vid_buf.vbb.field = V4L2_FIELD_NONE;
>  			buf->vid_buf.vbb.sequence =
> -				atomic_inc_return(
> -				&imgu_pipe->nodes[node].sequence);
> +				atomic_inc_return(&imgu_pipe->nodes[node].sequence);
>  			dev_dbg(&imgu->pci_dev->dev, "vb2 buffer sequence %d",
>  				buf->vid_buf.vbb.sequence);
>  		}

-- 
Regards,

Sakari Ailus

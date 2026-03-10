Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195639DBF1
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148866; cv=none; b=rJzn6lBknRpXWuOb2jKsjy/zqL3kWteWE6IZDqQUA3HDkvCB0QSWQzO1YMBLygY9FhGfI/fRqKF/KlnpcIjouPACEBh1SnqhpUjjHQpu4cK1UZXlNkC0/ol8wvHHJZxCcKv0Yu5jbfgl8Lf8gMoGCQVcBa9Esfa56bNLD5Mpqcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148866; c=relaxed/simple;
	bh=blLMxUGmwBDKoLMZORWslGZo9VUV9sNrER9y9Ccuckw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klnTHeFmadXlJNu8zaYI3LPv9FzYhzG6eV3JVtVSjSj3v4D0mLLV+fkacZZe37RmJ46+mZSgM7bDdsr5aw6sOTVYgZomLOvKe55qoytjqZXsvwZaTIMa+aH9JaynK/hp4/NINbEe2cRJ8jCzKKTq3nBGVvGSGMYYkogyXjn2IiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDuP7G+m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDuP7G+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773148866; x=1804684866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=blLMxUGmwBDKoLMZORWslGZo9VUV9sNrER9y9Ccuckw=;
  b=DDuP7G+moDeYN8dLqRknt9UrIXzE02mdg98Gw29/+nxvtBftlrC49v0C
   I3PLdkCyV6zHVRMyG4lIv5vzST7EkterEuLpiZB9yvsrkIsqmaWyKFmA6
   arNZQki0gwMOwBlRCLReX5ZVA/orRu2BQKO/odVlRfraiKpKF6WN+gA1o
   3Z6hGOtMNE35182ymoJ+iAvW4xICc3yssxNp1yUgO5fAmcLGr5tUSuO5C
   jhT7O5lsj5y8P5APRpoJfF3qHMBFCDQoGVTbh+2hujDeAI0+5jqztFZ9S
   1Dv0mrYF6Ga7BjX2ZCSo5etZDd60QFCZteldKo8zX76yztjyp02PmvHXH
   w==;
X-CSE-ConnectionGUID: ivDL2AEjTx+73FEPKwb6Ow==
X-CSE-MsgGUID: W9hJSZMQTL62IJF8Af5e+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74385138"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74385138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:21:05 -0700
X-CSE-ConnectionGUID: iqF4VTJqQKCRJlzMxT5IWA==
X-CSE-MsgGUID: 8jdBgldwRV65PGX3PlO8dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216484500"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:21:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 156D5121D13;
	Tue, 10 Mar 2026 15:21:34 +0200 (EET)
Date: Tue, 10 Mar 2026 15:21:34 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: fix block comment style in circbuf.c
Message-ID: <abAa3mVvlmba16kd@kekkonen.localdomain>
References: <20260309213024.5733-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309213024.5733-1-rayfraytech@gmail.com>

Hi Oskar,

On Mon, Mar 09, 2026 at 10:30:24PM +0100, Oskar Ray-Frayssinet wrote:

A more elaborate description of the patch goes here.

> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  .../media/atomisp/pci/base/circbuf/src/circbuf.c  | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> index cb34d0b5abb5..db0b76ea4a29 100644
> --- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> +++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> @@ -192,9 +192,9 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
>   * Please refer to "ia_css_circbuf.h" for details.
>   */
>  bool ia_css_circbuf_increase_size(
> -    ia_css_circbuf_t *cb,
> -    unsigned int sz_delta,
> -    ia_css_circbuf_elem_t *elems)
> +	ia_css_circbuf_t *cb,
> +	unsigned int sz_delta,
> +	ia_css_circbuf_elem_t *elems)

You could improve this more.

>  {
>  	u8 curr_size;
>  	u8 curr_end;
> @@ -206,7 +206,8 @@ bool ia_css_circbuf_increase_size(
>  	curr_size = cb->desc->size;
>  	curr_end = cb->desc->end;
>  	/* We assume cb was pre defined as global to allow
> -	 * increase in size */
> +	 * increase in size
> +	 */
>  	/* FM: are we sure this cannot cause size to become too big? */
>  	if (((uint8_t)(cb->desc->size + (uint8_t)sz_delta) > cb->desc->size) &&
>  	    ((uint8_t)sz_delta == sz_delta))
> @@ -215,12 +216,14 @@ bool ia_css_circbuf_increase_size(
>  		return false; /* overflow in size */
>  
>  	/* If elems are passed update them else we assume its been taken

/*
 * Multi-line
 * comment.
 */

> -	 * care before calling this function */
> +	 * care before calling this function
> +	 */
>  	if (elems) {
>  		/* cb element array size will not be increased dynamically,
>  		 * but pointers to new elements can be added at the end
>  		 * of existing pre defined cb element array of
> -		 * size >= new size if not already added */
> +		 * size >= new size if not already added
> +		 */
>  		for (i = curr_size; i <  cb->desc->size; i++)
>  			cb->elems[i] = elems[i - curr_size];
>  	}

-- 
Regards,

Sakari Ailus

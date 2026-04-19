Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD6F1474CC;
	Sun, 19 Apr 2026 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776577037; cv=none; b=VMnV5pbPHiy1ae2QERgi3GCodQmYmLapFGmTeav4l40mRG1m1WHEBrOHLfUBpKcse1TDQ230iXCASshNNRwMXXL3OtJNPNHWRGHplHTnJ18KDDGWCBEEMMB6w+vrnh2z4vdqiDQTCRR9+pHNzW3sMs6J/s9v8+JGVQYGDOjptDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776577037; c=relaxed/simple;
	bh=YzsUAxmLeaA7FMi3VIhTRq538h8AOOJ03Hw/sBu2uco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEmmuNM5yazHB3RDtCgSDj7S2yXbOFHJETACH8liY643igd/KFUvGH2qE95M+qV2y7+iqGoj4LbjSmIe3zSEwpWddFttXvOrMTgBlbsSNze7XPAfHr0QgImNvpSMO5rFtLpOnO3+M1QYgutwfpZTdtk4lc29KBcwVl1hUNdyQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f1KG8Xct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f1KG8Xct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFEAC2BCAF;
	Sun, 19 Apr 2026 05:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776577036;
	bh=YzsUAxmLeaA7FMi3VIhTRq538h8AOOJ03Hw/sBu2uco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1KG8XctP57+RZjIHQfIT1h5tfr6WwRnh4lrlcxSOR114C32BngiahN446Qnm6b6Z
	 RpIm+5s4VTo5UfSqHAdEOrB6/WPmYp9eEBaWRvd2NSIk1XSflkNFrk+KOidjWQTFGe
	 XZVKu6lcIk6JT5fysr3e5eY1filVvG9GmS0m25xM=
Date: Sun, 19 Apr 2026 07:37:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Robert Mast <rn.mast@zonnet.nl>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	andy@kernel.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 1/1] media: atomisp: mt9m114: Graceful teardown
 atomisp and mt9m114
Message-ID: <2026041943-country-hummus-8321@gregkh>
References: <20260418103136.6911-1-rn.mast@zonnet.nl>
 <20260418103136.6911-2-rn.mast@zonnet.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418103136.6911-2-rn.mast@zonnet.nl>

On Sat, Apr 18, 2026 at 12:31:09PM +0200, Robert Mast wrote:
> Signed-off-by: Robert Mast <rn.mast@zonnet.nl>
> ---
>  drivers/media/i2c/mt9m114.c                   | 118 ++++++++++++++++--
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |   3 +
>  3 files changed, 110 insertions(+), 12 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

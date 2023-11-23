Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C6249E9
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fXkVuCCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03413C433C7;
	Thu, 23 Nov 2023 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700743971;
	bh=EOAR9aStMcqAj4DF61/GK2dpwSnF0ONfVuJDcw9Utyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXkVuCCkg464swbbqS6oYlj++sI478XJM0yJropc+VN9LlD2mEYYAoSXkB9cB46GM
	 b9uNdZl+wQB8g+LQ+tgsSCd5eiaL1Uz1JEyP2R+NwqAETh4wuBXf2LZRAL8QhFg0Xo
	 sU9eFAbQx1IQMnUw/aFcjxOOFQGuasZ9BsOlLfnQ=
Date: Thu, 23 Nov 2023 12:44:13 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: rtl8192e: renaming of 5 different variables
 patch series
Message-ID: <2023112353-appraisal-snort-6d8a@gregkh>
References: <20231121181435.9337-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121181435.9337-1-garyrookard@fastmail.org>

On Tue, Nov 21, 2023 at 01:14:30PM -0500, Gary Rookard wrote:
> Hi,
> 
> This patch series renames 5 different variables from
> Pascal/CamelCase to snake case.
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver/module rtl8291e compiles.
> 
> Patch 1/5) renamed variable from HTMcsToDataRate -> ht_mcs_to_data_rate
> Patch 2/5) renamed variable from TXCountToDAtaRate -> tx-count_to_data_rate
> Patch 3/5) renamed variable from IsHTHalfNmodeAPs -> is_ht_half_nmode_aps
> Patch 4/5) renamed variable from HTIOTPeerDetermine -> ht_iot_peer_determine
> Patch 5/5) renamed variable from HTIOTActIsMgntUseCCK6M -> ht_iot_act_is_mgnt_use_cck_6m
> 
> Regards,
> Gary

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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0435246AE;
	Tue, 18 Oct 2022 17:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60370C433D6;
	Tue, 18 Oct 2022 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666113167;
	bh=k3hmzAggwq111S6Ua4IcYi9FLc6QlVCC6j+yxzC7G9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+5icxseHVI4b2nRDz4rt+5aaJzbqsBd3949EAcrLl5P7lqP152Anm7sOF8OycEyW
	 +58+vpzLk26Bnp5lr6sOf2Av5RtP0xZC4ajRfHIsNHf6P+TSf/bok80wNAzy7nhdg4
	 NuVAjx5OQYvhLDXoCFOVq/qdCDlRS3Xz/kc+g8nw=
Date: Tue, 18 Oct 2022 19:12:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: most: dim2: read done_buffers count locally
 from HDM channel
Message-ID: <Y07ejaO8vrtPU5JX@kroah.com>
References: <cover.1666105876.git.drv@mailo.com>
 <83fd237d2ac157d234e9c7cce1206904c2d8773d.1666105876.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83fd237d2ac157d234e9c7cce1206904c2d8773d.1666105876.git.drv@mailo.com>

On Tue, Oct 18, 2022 at 10:19:21PM +0530, Deepak R Varma wrote:
> The function dim_get_channel_state only serves to initialize the ready and
> done_buffers fields of the structure passed as its second argument. In
> service_done_flag, this structure is never used again and the only purpose
> of the call is to get the value that is put in the done_buffers field.
> But that value is just the done_sw_buffers_number field of the call's
> first argument.  So the whole call is useless, and we can just replace it
> with an access to this field.
> 
> This change implies that the variable st is no longer used, so drop it as
> well.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> 
> PLEASE NOTE:
>    1. I have only built the module on my machine, but have not tested it.
>       I am not sure how to test this change. I am willing to test it with
>       appropriate guidance provided I have the necessary hardware.
>    2. This was a standalone patch earlier. It is now combined into a patch set
>       with another patch for the same driver. Hence I am carry forwarding the
>       change log for this patch here:
> 
> Changes in v3:
>    1. The patch log message is further improved. This revised verbiage is as
>       thankfully provided by julia.lawall@inria.fr
> 
> Changes in v2:
>    1. Update patch log message to be more descriptive about the reason for change.
>       Feedback provided by julia.lawall@inria.fr
> 

You need to say this is a v3 in the subject line as documented :(


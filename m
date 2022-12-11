Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59964186F;
	Sun, 11 Dec 2022 11:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931BFC433EF;
	Sun, 11 Dec 2022 11:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670758414;
	bh=yXxiBhh4kn8sPgZWQf/bxgFMPGx3iwySDzRuKdth0gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/GE4d4nEldb5laZOZUau/uWRTOeoyVvI8z4zwkpGd6wyxgQvpMBkg1cHSkqBDuG5
	 Ertaw8WfJ4oiQtYsQedg75lcpb3DifuYCyLmqjPr0hogcgrF2G7Vnd6/mb+H4M/QO4
	 eICd3mi+/ko3G1AbdijxRQF6NEA8At7D9Ce/LY2Q=
Date: Sun, 11 Dec 2022 12:33:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dalvin Aiguobas <pharcodra@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: wlan-ng: fix checkpatch error for spinlock
Message-ID: <Y5XACri80rFeamVy@kroah.com>
References: <20221211105649.GA4683@koolguy>
 <Y5W5nKtLMV9b4xnm@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5W5nKtLMV9b4xnm@kroah.com>

On Sun, Dec 11, 2022 at 12:06:04PM +0100, Greg Kroah-Hartman wrote:
> On Sun, Dec 11, 2022 at 11:56:49AM +0100, Dalvin Aiguobas wrote:
> > Checkpatch Styleproblem fixed by adding comment.
> > 
> > Signed-off-by: Dalvin <pharcodra@gmail.com>
> > ---
> >  drivers/staging/wlan-ng/hfa384x.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
> > index 0611e37df6ac..ad117d570bb6 100644
> > --- a/drivers/staging/wlan-ng/hfa384x.h
> > +++ b/drivers/staging/wlan-ng/hfa384x.h
> > @@ -1171,6 +1171,7 @@ struct hfa384x_usbctlx {
> >  };
> >  
> >  struct hfa384x_usbctlxq {
> > +	/* lock: Protect structure fields */

Also, does this comment really make sense?  To properly document a lock
takes a bit more text, if you read this would it help out in
understanding the code any?

thanks,

greg k-h

Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ECC4A3B;
	Tue, 18 Oct 2022 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iX2U8THf+pquiaMR5M0K15dQE8WhWpHiv6AT0EQcZUY=;
  b=XknR4xUnCb36LgqEyYpiwSqxy0Urej3cmaVjBncToBcE5jEld1QWiBYx
   v0GiNugIsuobfs1zyW/ZeuC5hW48DxSjnTPUTIFrv4Kno0arfuaQqAEv0
   jbV4nfUX8wbV9VT3Jf3toRTCcnvQLdvDymtLFR38lZj6YlHheifW7wL6Y
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="65749943"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 14:52:21 +0200
Date: Tue, 18 Oct 2022 14:52:21 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH v2] staging: most: dim2: read done_buffers count locally
 from HDM channel
In-Reply-To: <Y06g2llpa5S/025M@debian-BULLSEYE-live-builder-AMD64>
Message-ID: <80696861-c73f-cdb9-b4e1-36c29ece78bb@inria.fr>
References: <Y05TNQBXLMJMgQ2r@debian-BULLSEYE-live-builder-AMD64> <1e2a71a9-4ac5-96f3-b875-a063ff62f3ad@inria.fr> <Y06g2llpa5S/025M@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 18 Oct 2022, Deepak R Varma wrote:

> On Tue, Oct 18, 2022 at 09:39:08AM +0200, Julia Lawall wrote:
> >
> >
> > On Tue, 18 Oct 2022, Deepak R Varma wrote:
> >
> > > The done_buffer count is already available in the hdm_channel struct.
> > > Calling dim_get_channel_state function to source this value out of
> > > the same structure is unnecessary.
> > > Further, the second parameter struct dim_ch_state_t to this function
> > > is filled by using the hdm_channel inside the function. This filled in
> > > variable is never used in the caller and can be altogether removed.
> > > So, a call to dim_get_channel_state function in this context also
> > > deems expensive.
> >
> > Thanks for the rewrite.
> >
> > I find "source this value out of" hard to understand.
> >
> > I would have written something like the following:
> >
> > The function dim_get_channel_state only serves to initialize the ready and
> > done_buffers fields of the structure passed as its second argument.  In
> > service_done_flag, this structure is never used again and the only purpose
> > of the call is to get the value that is put in the done_buffers field.
> > But that value is just the done_sw_buffers_number field of the call's
> > first argument.  So the whole call is useless, and we can just replace it
> > with an access to this field.
> >
> > This change implies that the variable st is no longer used, so drop it as
> > well.
>
> This is really well written. Sounds much structured. Now my own log message
> sounds a little random :)
>
> Is it okay for me to use your verbiage as is in my patch log?

Yes.

julia

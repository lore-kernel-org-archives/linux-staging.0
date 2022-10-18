Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5664C64;
	Tue, 18 Oct 2022 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666100909; bh=8aehwf6lSmpoBzDxdJZjx59IrR44GaUW+YlwpK8P2uU=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=coYheQ5aACvX08iMUatbjBFIxmbASSbqpDcPNQQ8wMBb2Hwdq5mOQcanxkaHjr5i1
	 PgjjL7ZMj59BT4mDPnZ11rbds2XBYb9YxIFj1LNZ/q5TIJ7OGZw2CXduZ+XjCJLQyM
	 1vw9FdFfLQGJUS1q6vvI/hJ4wGA/NF0qyPAzVLKY=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Tue, 18 Oct 2022 15:48:29 +0200 (CEST)
X-EA-Auth: k4G4rsvDakyFRKQIvS/qsd53JTOEyb7ufL/dtXEEHiNrdWCS67WUOrR8aJLkosl6ro7PA6QePOuzV4lABlb8yLTdzYpYmvz4
Date: Tue, 18 Oct 2022 19:18:25 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH v2] staging: most: dim2: read done_buffers count locally
 from HDM channel
Message-ID: <Y06uqcQmtJATZ6YH@debian-BULLSEYE-live-builder-AMD64>
References: <Y05TNQBXLMJMgQ2r@debian-BULLSEYE-live-builder-AMD64>
 <1e2a71a9-4ac5-96f3-b875-a063ff62f3ad@inria.fr>
 <Y06g2llpa5S/025M@debian-BULLSEYE-live-builder-AMD64>
 <80696861-c73f-cdb9-b4e1-36c29ece78bb@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80696861-c73f-cdb9-b4e1-36c29ece78bb@inria.fr>

On Tue, Oct 18, 2022 at 02:52:21PM +0200, Julia Lawall wrote:
>
>
> On Tue, 18 Oct 2022, Deepak R Varma wrote:
>
> > On Tue, Oct 18, 2022 at 09:39:08AM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Tue, 18 Oct 2022, Deepak R Varma wrote:
> > >
> > > > The done_buffer count is already available in the hdm_channel struct.
> > > > Calling dim_get_channel_state function to source this value out of
> > > > the same structure is unnecessary.
> > > > Further, the second parameter struct dim_ch_state_t to this function
> > > > is filled by using the hdm_channel inside the function. This filled in
> > > > variable is never used in the caller and can be altogether removed.
> > > > So, a call to dim_get_channel_state function in this context also
> > > > deems expensive.
> > >
> > > Thanks for the rewrite.
> > >
> > > I find "source this value out of" hard to understand.
> > >
> > > I would have written something like the following:
> > >
> > > The function dim_get_channel_state only serves to initialize the ready and
> > > done_buffers fields of the structure passed as its second argument.  In
> > > service_done_flag, this structure is never used again and the only purpose
> > > of the call is to get the value that is put in the done_buffers field.
> > > But that value is just the done_sw_buffers_number field of the call's
> > > first argument.  So the whole call is useless, and we can just replace it
> > > with an access to this field.
> > >
> > > This change implies that the variable st is no longer used, so drop it as
> > > well.
> >
> > This is really well written. Sounds much structured. Now my own log message
> > sounds a little random :)
> >
> > Is it okay for me to use your verbiage as is in my patch log?
>
> Yes.

Thank you. Can I convert this into a patch set and include the other suggestion
from you to correct the dim_ch_state_t struct name? Or should these be separate
patches now?

./drv



>
> julia
>



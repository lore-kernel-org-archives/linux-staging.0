Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9474C72;
	Tue, 18 Oct 2022 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666114839; bh=pgONLymTn89lOE59p6sJahd4CgjQPy6R1+7mUegtTpc=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=ipqtsBJ5jg9SGQ1M+zCgDdbl9gGV2neJqecHcKNUF+6sqyEhwAg7PVus7C74SYaaa
	 KWCzpZA7uGWPF1ZybEVnu3XongumJQQAoF8Qprg3ggPU/phMCiGHQuKTk96jrlkJEs
	 PV3+oQUnRiM5zFPPP7giYY3kVIzxZq52lrIw4oRI=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Tue, 18 Oct 2022 19:40:39 +0200 (CEST)
X-EA-Auth: kz4u5iGodiiz535+4Dg7OW/WuvWZsV8D06NQQz5xleiM+Ccf4n6xvqO4wlWKnpNSl7hLmjiub7qpG4myGHQQJ8tjTSiB9D5t
Date: Tue, 18 Oct 2022 23:10:34 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: most: dim2: read done_buffers count locally
 from HDM channel
Message-ID: <Y07lEqq+UaA3xTkk@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666105876.git.drv@mailo.com>
 <83fd237d2ac157d234e9c7cce1206904c2d8773d.1666105876.git.drv@mailo.com>
 <Y07ejaO8vrtPU5JX@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y07ejaO8vrtPU5JX@kroah.com>

On Tue, Oct 18, 2022 at 07:12:45PM +0200, Greg KH wrote:
> On Tue, Oct 18, 2022 at 10:19:21PM +0530, Deepak R Varma wrote:
> > The function dim_get_channel_state only serves to initialize the ready and
> > done_buffers fields of the structure passed as its second argument. In
> > service_done_flag, this structure is never used again and the only purpose
> > of the call is to get the value that is put in the done_buffers field.
> > But that value is just the done_sw_buffers_number field of the call's
> > first argument.  So the whole call is useless, and we can just replace it
> > with an access to this field.
> >
> > This change implies that the variable st is no longer used, so drop it as
> > well.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >
> > PLEASE NOTE:
> >    1. I have only built the module on my machine, but have not tested it.
> >       I am not sure how to test this change. I am willing to test it with
> >       appropriate guidance provided I have the necessary hardware.
> >    2. This was a standalone patch earlier. It is now combined into a patch set
> >       with another patch for the same driver. Hence I am carry forwarding the
> >       change log for this patch here:
> >
> > Changes in v3:
> >    1. The patch log message is further improved. This revised verbiage is as
> >       thankfully provided by julia.lawall@inria.fr
> >
> > Changes in v2:
> >    1. Update patch log message to be more descriptive about the reason for change.
> >       Feedback provided by julia.lawall@inria.fr
> >
>
> You need to say this is a v3 in the subject line as documented :(
>
Hi Greg,
This was a standalone patch earlier and first time included in the patch set. I
was not aware I am allowed to version a patch individually, different from the
cover letter. I have posted a query to Outreachy mailing list for additional
clarification. I will send in a v4 once I have clarity.

Thank you,
./drv



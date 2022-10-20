Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225DA15C2;
	Thu, 20 Oct 2022 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666284109; bh=eU4dltmhwC23olawmmrVxzQRXFJ5uD5ED2m42yk39gY=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=nUhwL0Pplz+Y15YoZrIdU3PLW3+NqNpHSundxXqpeM++hDMDAaYaxJdNWkD3HmG8P
	 Y2LLqoIUwrG+Xf+1bmJvfa/2FYND5PHIMuSL0uRjoJWWKXsPCvztF3md9XZpmwVCKy
	 ladIJhCDL/QlE15VBT/I7aZ1yfcJnfrZzMJSXr78=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 18:41:49 +0200 (CEST)
X-EA-Auth: oaKrrkylZFZT71L4Q8fHIOD96HtL5xU2LXsbcHyIbgfFFTV9OHbWZlDZIOaS0DYEEFcARVgTG4zGv9EdnbDD1PXEBmKIWAwW
Date: Thu, 20 Oct 2022 22:11:44 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: Re: [PATCH v4 1/2] staging: most: dim2: read done_buffers count
 locally from HDM channel
Message-ID: <Y1F6SH+k2erboMmu@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666208065.git.drv@mailo.com>
 <83fd237d2ac157d234e9c7cce1206904c2d8773d.1666208065.git.drv@mailo.com>
 <Y1FjMrGHc2CdDCPQ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1FjMrGHc2CdDCPQ@kroah.com>

On Thu, Oct 20, 2022 at 05:03:14PM +0200, Greg KH wrote:
> On Thu, Oct 20, 2022 at 01:24:53AM +0530, Deepak R Varma wrote:
> > The function dim_get_channel_state only serves to initialize the ready and
> > done_buffers fields of the structure passed as its second argument. In
> > service_done_flag, this structure is never used again and the only purpose
> > of the call is to get the value that is put in the done_buffers field.
> > But that value is just the done_sw_buffers_number field of the call's
> > first argument.  So the whole call is useless, and we can just replace it
> > with an access to this field.
>
> Are you sure it is useless?

Hello,
pardon my limited understanding, but I think this function call is not
necessary.

>
> You have changed the logic here, you are now thinking that this value
> can never change, while before you were ensured of getting the "correct"
> value as it is under the lock when the function is called.

I may be wrong, but I do not think there is a change in the long, but I may
entirely wrong. The function was called from inside the lock scope, now we are
extracting the value directly, still inside the lock scope. This should be safe.

>
> I can't take this type of change as a "cleanup" patch for outreachy
> unless you have the hardware as it is NOT a basic "checkpatch" style
> cleanup at all.

Sure. That is fine.

>
> If you want to get this change accepted, please work with the maintainer
> of the code and get them to agree that the change is correct.  And if it
> is, odds are more things also would need to be cleaned up at the same
> time, right?

I am eagerly waiting for a feedback from the maintainer. If they agree with my
viewpoint, I will continue to work on this change outside of the clean up patch
tasks. I will be happy to :)

Thank you Greg!
./drv

>
> thanks,
>
> greg k-h
>



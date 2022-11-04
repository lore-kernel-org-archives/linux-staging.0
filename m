Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028FF1C10;
	Fri,  4 Nov 2022 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667572936; bh=T3OgI0NGyKucc5ebvWG2uKcZ/0JteubuO2ZxTytgP/I=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=HMAP6Fz8KezIEsbOy3MjSIi+qjYMEKBviCJoBDqW3Qld2gF6TCB2s0+QKo38TwBtI
	 bb9gx1EduHn4/h6xaN2zczdtuDNehmB7aeyOmgb+pxlyhnboXkVFLbKdY8VfsQR3oa
	 lcYJbF9Dy0U8CMjCzCOTWfUAzQf9OVXicHvLCFe4=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Fri,  4 Nov 2022 15:42:16 +0100 (CET)
X-EA-Auth: DdVu9IX4hw4A4UzDQdO9q5PajoGUFgj0H9It2PZJAKB2I8CzY4aZOF0ISi2FL8RcG6fVet1LWR9fkyueDxeTTHQoqTZt0r18
Date: Fri, 4 Nov 2022 20:12:11 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
Message-ID: <Y2UkwwUn+IaCq3wf@qemulion>
References: <Y1vZXUi0Bjiub8HZ@ubunlion>
 <Y1zXIjCe3LGwApWD@kroah.com>
 <Y11b0oCmle2pbRel@ubunlion>
 <alpine.DEB.2.22.394.2210291931590.2917@hadrien>
 <Y191LI7zKVRA5LEb@ubunlion>
 <Y1+YC5OuycA5hLFx@ubunlion>
 <7dc9b4d2-413-3f65-1381-b164d810c3ee@inria.fr>
 <Y2T/FA0Ws9ExS+uz@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2T/FA0Ws9ExS+uz@qemulion>

On Fri, Nov 04, 2022 at 05:31:24PM +0530, Deepak R Varma wrote:
> On Mon, Oct 31, 2022 at 01:05:32PM +0100, Julia Lawall wrote:
> >
> >
> > I took a look, but it's pretty complex.  You could take the code and
> > reorganize it so that it is more readable, and then take the definition of
> > the ARRAY_SIZE macro, to better see what is going on.
> >
> > julia
> >
>
> Hello Greg, Julia,
> I was able to successfully build the fbtft object file for arm architecture as
> well. I used gcc 6.5.0 and 9.5.0 tool chains. It was successful using both. I
> have attached the build log from my machine for your reference.
>
> I am also looking at the .i file and rearrange the expanded macro to understand
> it. However, since it is built successfully, I am not sure if that is truly the
> problem area.
>
> Should I resend the patch and check if it still errors the kernel build bot?
> Anything else I can try?

Looks like the change I proposed is causing nesting inside the write_reg
function due to additional set of { & } brackets for the __VA_ARGS__ symbol.

Am I understanding it right?

>
> Thank you,
> ./drv




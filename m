Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10067B;
	Sat, 11 Mar 2023 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1678518356; bh=6RXXEmOqhalKafvrtSgWBo3rDrx3ENS3jdn0iCV/as8=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=K5Y9jjc3b8kbOnXpYcQnXQUYDpYhq0wVuwWnk8G1j6v/4oat254lhC/3vyChzPtN2
	 XAK6a+e9LiC9JSK48ObCsqimOqw1GiwwQE1ik/1MAtOBV3Wuq9yCJl1zFweK5qI/QK
	 yRKtmMSyZ33cMenqJs2pwRQvh+ITLyZ6zecwWmZg=
Received: by b221-2.in.mailobj.net [192.168.90.22] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	Sat, 11 Mar 2023 08:05:56 +0100 (CET)
X-EA-Auth: 6KHaK3MakurOvyfDc6WzzKHmlWaG4pVZ9jwDoJme9TCa3byNOtXeoCwBMtK2bh3pWF3I2eBQW4qOu+CD5c5gR6AP/GEVuvrF
Date: Sat, 11 Mar 2023 12:35:49 +0530
From: Deepak R Varma <drv@mailo.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: remove tabs to fix line length and
 merge lines
Message-ID: <ZAwoTVeMDGu/44Ln@ubun2204.myguest.virtualbox.org>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
 <ZAwelPOv45zThK6j@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAwelPOv45zThK6j@khadija-virtual-machine>

On Sat, Mar 11, 2023 at 11:24:20AM +0500, Khadija Kamran wrote:
> On Sat, Mar 11, 2023 at 07:16:19AM +0300, Dan Carpenter wrote:
> > On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> > > In file drivers/staging/greybus/arche-platform.c,
> > > - Length of line 181 exceeds 100 columns, fix by removing tabs from the
> > >   line.
> > > - If condition and spin_unlock_...() call is split into two lines, join
> > > them to form a single line.
> > > 
> > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > ---
> > > Changes in v2:
> > >  - Change the subject and log message
> > >  - Merge if condition and spin_unlock...() from two lines to one 
> > 
> > Apply your patch and then re-run checkpatch.pl -f on the file.  You will
> > see the problem.
> 
> Hey Dan!
> When I run checkpatch.pl on my file, I can see that my old CHECK no
> longer exists instead a new CHECK is mentioned saying 'Alignment should
> match open parenthesis'. I understand this from your previous email.
> Should I stop working on this file and leave it as is?

Hi Dan,
Not trying to speak for you, so please override my message if this is
inaccurate.

Hi Khadija,
Yes. It is not useful to resolve one warning and introduce another. Tomorrow
someone else is going to try and revert it. So do not make the "remove tab"
change. I still like the merging of the split lines. It appears to improve code
readability. You can send in a v3 with just that merge change and wait for
feedback.

Also, remember to check your change with checkpatch. There is a section about
post-commit hooks on the tutorials page. This will allow you to integrate
checkpatch as part of your git commit step and do the job for you.

And also, always build your change locally on your machine. No new warnings or
errors should arise.

Hope that helps.
Deepak.


> Thank you!
> >
> > regards,
> > dan carpenter
> 



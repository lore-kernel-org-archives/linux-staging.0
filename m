Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1073320FD;
	Wed,  9 Nov 2022 06:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667973918; bh=UpryTxk0IC1D/WMl2KTZAYMoVR3gBZrWsZdRJgHrtjs=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=Vjez+ZUQz+YVS2zskN33qFt+2hTguqOjUIzliYtsRiQjMa+X4ZLdwzpY4edNaHv2R
	 zTbw7yVxlnyROdgByvz31jkvqYb29MODVcSYw37myKcs9w0kOb44WoDjeDNjogDAzs
	 qCa0jxxjHE4sVOdlVL0SwTiHOZFCI07ormEsbmhg=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Wed,  9 Nov 2022 07:05:18 +0100 (CET)
X-EA-Auth: 9O9s//cR3T3uVW5c+r20zFbSlAD3wPMpc1d79hUcLPbruqOtS1v938YK+F3h6BzfmWPLTG2mmS3HaBy4uoXaGvOcK6RzFNYu
Date: Wed, 9 Nov 2022 11:35:12 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, Sven Van Asbroeck <TheSven73@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fieldbus: convert snprintf to scnprintf
Message-ID: <Y2tDGEorM8dkmdB2@qemulion>
References: <Y2K2MD7+WBu4QouU@qemulion>
 <Y2pyCA/tRunNVRQt@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2pyCA/tRunNVRQt@kroah.com>

On Tue, Nov 08, 2022 at 04:13:12PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Nov 02, 2022 at 11:55:52PM +0530, Deepak R Varma wrote:
> > It is recommended to use scnprintf instead of snprintf to accurately
> > return the size of the encoded data. Following article [1] has details
> > on the reason for this kernel level migration. This issue was identified
> > using coccicheck.
> >
> > [1] https://lwn.net/Articles/69419/
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/fieldbus/dev_core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
> > index 5aab734606ea..d51f2b02d5e6 100644
> > --- a/drivers/staging/fieldbus/dev_core.c
> > +++ b/drivers/staging/fieldbus/dev_core.c
> > @@ -70,7 +70,7 @@ static ssize_t card_name_show(struct device *dev, struct device_attribute *attr,
> >  	 * card_name was provided by child driver, could potentially be long.
> >  	 * protect against buffer overrun.
> >  	 */
> > -	return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
> > +	return scnprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
>
> No, neither of these are correct.
>
> Please use sysfs_emit() for sysfs show callbacks.

Hello Greg,
Thank you. I corrected and resubmitted the patch as suggested.

Hi Julia,
The device_attr_show.cocci file should have made the recommendation to use
the sysfs_emit(), however, in this case it instead suggested to use scnprintf.
Is it because the method name was not "show" but "xxx_show"?

Thank you,
./drv

>
> thanks,
>
> greg k-h



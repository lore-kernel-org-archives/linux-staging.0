Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187262F80
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 12:05:56 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157C2NB5005886;
	Mon, 7 Jun 2021 12:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=0GTVZYu3z47WAJvjIpCXUni1kYr1x2mZnI8+0CL8jfc=;
 b=Yg0lhHl7YHo4i3wRfBf46RNv7Qwg4b7A+JW/z0msYL79fCJJDnoWENxU1JLiYWUnkC+g
 0DftXAWO1QoWThnOUmLkFudnAzg8Xikmijly5oTPKWLua8YjGWI6LwZGxrQEpmxD5cd0
 bRe/ZtjRFmJSJQHwa1LWk9NwL9p8Cm4lCldTEFLCBYb/B8/JZn4/q9GQfZ1O0KAcGssq
 VL7Ld3/xG39M7nC87wkSXZ03mZZ/H3li8xc+Gxx+Ns8fR7T6MBHtDeK+5NXJ7zFrR+63
 omYKZ6wxa3TZuHHWAkvjWHSDjzxvP93mY1SFGQLbiWk0oFxxm4W5/84G661Vp7Zr/dR1 Jw== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 3917d4g72c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 12:05:54 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157C0wXT018691;
	Mon, 7 Jun 2021 12:05:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 390k1q09j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 12:05:53 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157C21sG021031;
	Mon, 7 Jun 2021 12:05:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 390k1q09hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 12:05:53 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 157C5p4x012318;
	Mon, 7 Jun 2021 12:05:51 GMT
Received: from kadam (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 07 Jun 2021 12:05:51 +0000
Date: Mon, 7 Jun 2021 15:05:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>,
        NeilBrown <neil@brown.name>
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
Message-ID: <20210607120541.GG10983@kadam>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com>
 <20210607065934.GM1955@kadam>
 <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com>
 <20210607103736.GR1955@kadam>
 <CAMhs-H_6g86wF+M-0iGUqFYRQhHdkuciTLgjSvbPdvxE7q+5WQ@mail.gmail.com>
 <CAMhs-H-X8njQxVG=d5929HL1H4sJ3g7-PQ6T-rzzK4e00QQzYg@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H-X8njQxVG=d5929HL1H4sJ3g7-PQ6T-rzzK4e00QQzYg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: cUvYDaPGXnyaChjsmUz74-HRSTfIXvHX
X-Proofpoint-GUID: cUvYDaPGXnyaChjsmUz74-HRSTfIXvHX

On Mon, Jun 07, 2021 at 01:30:58PM +0200, Sergio Paracuellos wrote:
> Hi Dan,
> 
> On Mon, Jun 7, 2021 at 1:10 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Hi Dan,
> >
> > On Mon, Jun 7, 2021 at 12:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Mon, Jun 07, 2021 at 09:11:13AM +0200, Sergio Paracuellos wrote:
> > > > Hi Dan,
> > > >
> > > > On Mon, Jun 7, 2021 at 8:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> > > > > > Properties 'clocks', 'resets' and 'phys' have been moved from parent
> > > > > > node to the root port childs. Hence we have to adapt the way device
> > > > > > tree is parsed in driver code to properly align things and make all
> > > > > > the stuff work.
> > > > > >
> > > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > >
> > > > > It sounds like this commit needs a fixes tag?  What does "to properly
> > > > > align things and make all the stuff work." in terms of what the user
> > > > > sees?
> > > >
> > > > I submitted this driver to get mainlined and when bindings have been
> > > > reviewed I've been told to move this stuff into child nodes. Until now
> > > > all was also being properly working but with these properties defined
> > > > in the parent node. So I don't think any Fixes tag is needed here. So
> > > > hopefully changes on this patchset are the last need to get this
> > > > properly mainlined. I've been told to just make a 'git mv' without
> > > > zero changes from the staging driver, that's why I am submitting
> > > > changes to staging before.
> > >
> > > I'm really trying to understand how this affects the user experience but
> > > it sounds like you don't know either but you were told it was the
> > > correct thing and it seems to work?
> >
> > What do you mean with "user experience" here? So to work with the
> > future mainlined driver we need the dts file to be aligned with device
> > tree parsing code. If we move these properties into child nodes
> > (previous patch do this) and the code is properly aligned, for the
> > user the change is transparent. This SoC is mostly used in openWRT
> > where new versions compile new code and device tree completely so I
> > don't expect any compatibility problems also because of these changes,
> > AFAICT.
> >
> > > That's not ideal but I can live
> > > with it I guess...  I guess hopefully no change but it's just a
> > > correctness issue?
> >
> > Seems that the bindings are more correct, moving the properties into
> > child nodes.
> >
> > >
> > > Btw, we moved from devm_reset_control_get_exclusive() to
> > > of_reset_control_get_exclusive().  Does that mean we need to add a call
> > > to reset_control_put() in the remove() path?
> >
> > Yes this has moved because we need to access the child node with
> > 'device_node' instead of 'device'. It seems there is not another
> > possibility with devm_* like the ones we have with clk and phy apis.
> > Ok, so I have to manually call 'reset_control_put'. Will add it, thanks.
> 
> Should this be enough for error and remove paths, right?

Looks good to me...  I'm not an expert on this at all...  (When I ask
a question about something it's never rhetorical question so if you had
told me it wasn't required then I would have accepted that as an answer
as well).

regards,
dan carpenter


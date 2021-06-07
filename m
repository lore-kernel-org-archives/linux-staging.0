Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242A42F80
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 10:37:53 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157AWvn0004643;
	Mon, 7 Jun 2021 10:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Cfb4ttXky6Wc7DRAXL4U0NNoGH6dMVrTuC+ZmUN2w98=;
 b=EIVAEWpFIW7GICCVgc2/PcjmGkDIY+cJNNbn4kFt080CuJTY1ipEiRDkrZCaHH6deeYD
 UmJAp8um2dTJYNbrtlXEGOWtSI2rZ933B+969rm6PkRX9e3Kv8gWbrklYsvWPNp3TWsR
 5OPfxUKNUCbNMB1hXFNAP60Kr9HXnVF+lnBxxCSH9JmKk/adzfC4mtj1gOo7lk6r9J+w
 ko5nqf/BGgQp8j3AwAHwC6+MTM7HHW8Vl1aVaHQsfSyhzsLIwNZcKUFUl0kDnF7LsXiy
 ZiNZt4PFPQxtJ86K59TDmeNVx6u3M2koK0KhnFDngvImbsVkKMr79XWPZqbzXlzgdMiO Vg== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3917pwg615-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 10:37:52 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157AYHwi143937;
	Mon, 7 Jun 2021 10:37:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 3906spbtk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 10:37:51 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157AboaC185859;
	Mon, 7 Jun 2021 10:37:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 3906spbtga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 10:37:50 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 157AbmtS031188;
	Mon, 7 Jun 2021 10:37:48 GMT
Received: from kadam (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 07 Jun 2021 03:37:47 -0700
Date: Mon, 7 Jun 2021 13:37:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>,
        NeilBrown <neil@brown.name>
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
Message-ID: <20210607103736.GR1955@kadam>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com>
 <20210607065934.GM1955@kadam>
 <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 5sbJH86RzJcMQlt7SsbtGWTqflxDQDME
X-Proofpoint-GUID: 5sbJH86RzJcMQlt7SsbtGWTqflxDQDME

On Mon, Jun 07, 2021 at 09:11:13AM +0200, Sergio Paracuellos wrote:
> Hi Dan,
> 
> On Mon, Jun 7, 2021 at 8:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> > > Properties 'clocks', 'resets' and 'phys' have been moved from parent
> > > node to the root port childs. Hence we have to adapt the way device
> > > tree is parsed in driver code to properly align things and make all
> > > the stuff work.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >
> > It sounds like this commit needs a fixes tag?  What does "to properly
> > align things and make all the stuff work." in terms of what the user
> > sees?
> 
> I submitted this driver to get mainlined and when bindings have been
> reviewed I've been told to move this stuff into child nodes. Until now
> all was also being properly working but with these properties defined
> in the parent node. So I don't think any Fixes tag is needed here. So
> hopefully changes on this patchset are the last need to get this
> properly mainlined. I've been told to just make a 'git mv' without
> zero changes from the staging driver, that's why I am submitting
> changes to staging before.

I'm really trying to understand how this affects the user experience but
it sounds like you don't know either but you were told it was the
correct thing and it seems to work?  That's not ideal but I can live
with it I guess...  I guess hopefully no change but it's just a
correctness issue?

Btw, we moved from devm_reset_control_get_exclusive() to
of_reset_control_get_exclusive().  Does that mean we need to add a call
to reset_control_put() in the remove() path?

regards,
dan carpenter


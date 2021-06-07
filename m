Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7520429CA
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 13:20:33 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157DCngK017415;
	Mon, 7 Jun 2021 13:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=wqV32jRPJOgeRsS/h0RCSOlPI3BjkgIoPQluuNANVHA=;
 b=EKiDZau2/1t0GKhhtkD4Zv0db/BTwG56LSz3Cwpv2ZW93mK9q8zlXSlyU9fcJn1AnUrU
 T11diBGux/F9YiLyCoJqy9DL0tZNKyWRx30HWQDLFeV8oQNXXcnJI1X7StlLrfL9RxV5
 O7bKmhNKrVMss8rtMIgZqCSGUKvp3rkAOeCBJ7h40KsNnzYTpGMYqqBLQTYZ3Asbnnj2
 B/BBtoFsuERGu/iR2rJ2SEFEJF8gNznrZRiwrKQDRaag/apCH6Xm3voINasjpk/+Iw9T
 a0zHSXGl7RjlLQC4tkbweNFXcV3PCQ1eMFN/E7RLfT/h6rf6NWuV+1pfRuMu81HhF1am Ow== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 391fyr0322-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 13:20:30 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157DGaK9092997;
	Mon, 7 Jun 2021 13:20:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 38yyaa3e67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 13:20:29 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157DIKns095167;
	Mon, 7 Jun 2021 13:20:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 38yyaa3e5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jun 2021 13:20:29 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 157DKRPc032349;
	Mon, 7 Jun 2021 13:20:27 GMT
Received: from kadam (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 07 Jun 2021 06:20:27 -0700
Date: Mon, 7 Jun 2021 16:20:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>,
        NeilBrown <neil@brown.name>
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
Message-ID: <20210607132019.GV1955@kadam>
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com>
 <20210607065934.GM1955@kadam>
 <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com>
 <20210607103736.GR1955@kadam>
 <CAMhs-H_6g86wF+M-0iGUqFYRQhHdkuciTLgjSvbPdvxE7q+5WQ@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H_6g86wF+M-0iGUqFYRQhHdkuciTLgjSvbPdvxE7q+5WQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: hl_i7QI32Id_0nb5B_4MF3IRfveXKkwh
X-Proofpoint-GUID: hl_i7QI32Id_0nb5B_4MF3IRfveXKkwh

On Mon, Jun 07, 2021 at 01:10:57PM +0200, Sergio Paracuellos wrote:
> Hi Dan,
> 
> On Mon, Jun 7, 2021 at 12:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Mon, Jun 07, 2021 at 09:11:13AM +0200, Sergio Paracuellos wrote:
> > > Hi Dan,
> > >
> > > On Mon, Jun 7, 2021 at 8:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> > > > > Properties 'clocks', 'resets' and 'phys' have been moved from parent
> > > > > node to the root port childs. Hence we have to adapt the way device
> > > > > tree is parsed in driver code to properly align things and make all
> > > > > the stuff work.
> > > > >
> > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > >
> > > > It sounds like this commit needs a fixes tag?  What does "to properly
> > > > align things and make all the stuff work." in terms of what the user
> > > > sees?
> > >
> > > I submitted this driver to get mainlined and when bindings have been
> > > reviewed I've been told to move this stuff into child nodes. Until now
> > > all was also being properly working but with these properties defined
> > > in the parent node. So I don't think any Fixes tag is needed here. So
> > > hopefully changes on this patchset are the last need to get this
> > > properly mainlined. I've been told to just make a 'git mv' without
> > > zero changes from the staging driver, that's why I am submitting
> > > changes to staging before.
> >
> > I'm really trying to understand how this affects the user experience but
> > it sounds like you don't know either but you were told it was the
> > correct thing and it seems to work?
> 
> What do you mean with "user experience" here? So to work with the
> future mainlined driver we need the dts file to be aligned with device
> tree parsing code. If we move these properties into child nodes
> (previous patch do this) and the code is properly aligned, for the
> user the change is transparent. This SoC is mostly used in openWRT
> where new versions compile new code and device tree completely so I
> don't expect any compatibility problems also because of these changes,
> AFAICT.
> 

Basically what I want from the commit message is that "I do not expect
most users to notice this change, but it is the correct thing to do".
The original commit message said "make all that stuff work" and it
wasn't clear which things were not working...

regards,
dan carpenter


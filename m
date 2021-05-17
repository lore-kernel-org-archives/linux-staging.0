Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0D12FB0
	for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 11:46:32 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14HBH0tF016120;
	Mon, 17 May 2021 11:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=nbWbCLZdiNvOl+zTWA/f0hHxT58lq412XShXPHbfm4s=;
 b=F1Xa3VLkhalJoJrjmHBpBx9GesTdoYyw/JhJ05KeF1UgSby9dSvTgdICGVsk/rQD1jFQ
 tSNILvROPwZpMpt1AWkyXyukISngoU3iL5QVDyS5Y0fgrslXh9DQ5o4SNE9qDCvfszFe
 5KITDRVVKNUETkXed2f5WUdiULCoizsVdX0zsG6sUDlGYT+dhfUf7jy7Gi07sgw3pScq
 cEQiZ29eHBrkLX00h3jZrdB/gnhSB4qPbMuiGhUou6JdbKn5Q4AlYcGXkPf1gJs8zZLt
 QKw1+p18xUMuz3QD7DTJVp+KSavHGoPGzym8uO/O25MctC6b5pDj/qe4xgiBJ4IcaFKb eQ== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 38ker185q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 May 2021 11:26:22 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14HBQKug100179;
	Mon, 17 May 2021 11:26:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 38kb36sxua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 May 2021 11:26:20 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14HBQJw6100059;
	Mon, 17 May 2021 11:26:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 38kb36sxr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 May 2021 11:26:19 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14HBQ1s8012734;
	Mon, 17 May 2021 11:26:01 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 17 May 2021 11:26:00 +0000
Date: Mon, 17 May 2021 14:25:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/20] staging: vchiq_core: fix return type of
 vchiq_init_state
Message-ID: <20210517112554.GG1955@kadam>
References: <1621105859-30215-1-git-send-email-stefan.wahren@i2se.com>
 <1621105859-30215-2-git-send-email-stefan.wahren@i2se.com>
 <20210516072722.GA1410@agape.jhs>
 <129774c3-884b-19e2-68ab-b1a8d8763458@i2se.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <129774c3-884b-19e2-68ab-b1a8d8763458@i2se.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: OUQCe_FrqveKK-vvnQARURIGpHmy2dyl
X-Proofpoint-ORIG-GUID: OUQCe_FrqveKK-vvnQARURIGpHmy2dyl

On Sun, May 16, 2021 at 11:38:10AM +0200, Stefan Wahren wrote:
> Hi Fabio,
> 
> Am 16.05.21 um 09:27 schrieb Fabio Aiuto:
> > Hi Stefan,
> >
> > On Sat, May 15, 2021 at 09:10:40PM +0200, Stefan Wahren wrote:
> >> Recent commit "staging: vchiq_core: drop vchiq_status from vchiq_init_state"
> >> missed to change the return type in the definition. Let's fix this now.
> > if this patch fixes something that a previous commit broke,
> > it's better adding Fixes: tag
> 
> the mentioned commit is still in next, so a Fixes tag doesn't make sense
> to me. Or do i miss something?
> 

This patch doesn't affect runtime so a Fixes tag is not strictly
required although probably most of the times we would add it.  But it
doesn't matter whether or not the commit is in -next or not.  The git
hash from the fixes tag will remain valid unless Greg rebases (which he
seldom does).  And if a maintainer rebases their tree, they are
responsible for updating the Fixes tag.

Fixes tags are useful for backporting because you can see that the bug
was introduced in the latest release so the patch doesn't need to be
backported.

But it's not all about backporting they're also useful for review so we
can see why a patch was introduced.  Or sometimes I like to look at the
fixes tags and see if "cleanup" patches are introducing bugs into
staging etc.

regards,
dan carpenter


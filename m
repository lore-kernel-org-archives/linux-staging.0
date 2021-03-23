Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4366E
	for <linux-staging@lists.linux.dev>; Tue, 23 Mar 2021 08:29:00 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12N7O0MZ099762;
	Tue, 23 Mar 2021 07:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=T+B/VejJ8g8NWkc9dih7hkY6uVj/+Pd70QoGQIs3YR4=;
 b=hi1t7oaV1eudNT1aiuSERSAJGM9s/kJdtyr7KgY+mFdT3RbeYtRZF4P0PJCzgJTJSQaO
 f8UJCf/SddHNFUvfQ9Fzbx1mIiSV6lyK6muh6J20TyELlbSNiXCy5rHuQCWJjYR1PSK3
 9xhfgBU95GeFy8WM0cUT2VNYSUoD17/XcjnpDHYeLqrQ2uk4HVPCFEE4WRs/psIxtXrp
 CKdcSqb6KJx2dpobsOHwowco66qopXUb2A2lApHYCRB/9n+E5l7swuK3Itzc/WDbwuNm
 2XhsaBRIL9HeMrjjLr4DDtBuudIYaU+uv6WO4z5KvIctNpEiUwGA/ny9lCIpV3ldzGFx zw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 37d9pmwtyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 07:28:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12N7P7wf165913;
	Tue, 23 Mar 2021 07:28:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 37dtmp5a1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 07:28:38 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12N7Sbxp000659;
	Tue, 23 Mar 2021 07:28:37 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 23 Mar 2021 00:28:36 -0700
Date: Tue, 23 Mar 2021 10:28:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc: Marco Cesati <marcocesati@gmail.com>,
        Ross Schmidt <ross.schm.dev@gmail.com>, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev
Subject: Re: Question about rtl8723bs
Message-ID: <20210323072829.GK1667@kadam>
References: <CAOc6etYY0yhsdQv+nM3aPxs9ahaEDd=h+vXAesdi65=SiQZ3eA@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etYY0yhsdQv+nM3aPxs9ahaEDd=h+vXAesdi65=SiQZ3eA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230051
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230051

On Mon, Mar 22, 2021 at 08:40:11PM -0600, Edmundo Carmona Antoranz wrote:
> Hi!
> 
> I was just trying to correct some compiler warnings coming up when
> building this driver. The one problem that took me into kind of a
> rabbit whole was about having K (in rtw_security.h) set as static. So,
> every time it is included somewhere _and_ K is not being used, the
> compiler is nagging about it. Ok.... easy fix, let's remove the static
> keyword and we should be fine. Then I took a look at _where_ it was
> being used.... well, nowhere.... so, ok, let's get rid of it.... oh,
> here are these macros... are they in use? Actually _they are not_....
> let's remove them also.... (I don't know if you are noticing a pattern
> here) then I noticed that _a lot_ of code has been removed recently
> and so I pulled the big guns and cleaned up the file and started to
> add things back as they were being used in the build process.... in
> the end, around 80 lines are gone (give or take) if working on top of
> next, at least.
> 
> Is it a good idea to send a patch with all of these things removed or
> they might be coming back later and so they should be kept?
> 
> Thanks in advance.

So in summary you found some unused code and deleted it?  Please send
that patch.

When I'm reviewing "delete unused code" patches, what I'm basically
looking at are the + lines in the commit.  If there are no plus lines
and we're deleting whole functions and macros and the code still
compiles fine then that's easy to review.

When you're sending patches please consider how to organize and explain
them so they are easy to review.

regards,
dan carpenter

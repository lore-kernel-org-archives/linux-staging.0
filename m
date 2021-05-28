Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E342FB1
	for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 10:42:43 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14SAauep022565;
	Fri, 28 May 2021 10:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=p/KvIOmDwiC64qDbDiNCflb/Hd62oAZPkSdse05KLWA=;
 b=ElHYQ3z+ecMfcEfTdVZj8KPWXK0zC6jly6XKoHovDdR+TsjvotgCjguW7wLmcVIlSpL5
 foIHhgq6KbwfEqf9T6D61OsTuG3lOprdUUXJLmTBAcObn75dWUwwxyAIrgwVfLBXp4tu
 nkMjyxAkEj9009Lazv1Q1vf9JKbFwzl9VklusaF10oAs9VqNFl94IiAMB2qOPKyGMZEC
 683+dQgZAMth2sBL7XDINrGPb4FdW4QgdepNL/Q5WuSEpWcnvT0pz9l5SuH9DhND07bU
 OObPgbPXnf1Zv7NI6ouIiBa5DBUKzYBB1ckxJy1LIE/flCd8gZN9eRnR9HsGACYSuzzf NQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 38sppd0tuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 May 2021 10:42:40 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SAgeIH001996;
	Fri, 28 May 2021 10:42:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 38rehkm59n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 May 2021 10:42:40 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14SAgdNX001978;
	Fri, 28 May 2021 10:42:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 38rehkm58y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 May 2021 10:42:39 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14SAgb4M020204;
	Fri, 28 May 2021 10:42:38 GMT
Received: from kadam (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 28 May 2021 03:42:37 -0700
Date: Fri, 28 May 2021 13:42:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-staging@lists.linux.dev,
        Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: drivers/staging/greybus/bootrom.c: fw is NULL but dereferenced
Message-ID: <20210528104229.GU1955@kadam>
References: <2015099.xVv48VzNit@linux.local>
 <20210528033301.soqgwfwfy4ls6a2a@vireshk-i7>
 <1931377.TGo55UGoA0@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1931377.TGo55UGoA0@linux.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: PmEXsKSxkb2E9Po2lCRvXtUpvWbHxCsT
X-Proofpoint-ORIG-GUID: PmEXsKSxkb2E9Po2lCRvXtUpvWbHxCsT

On Fri, May 28, 2021 at 10:03:52AM +0200, Fabio M. De Francesco wrote:
> On Friday, May 28, 2021 5:33:01 AM CEST Viresh Kumar wrote:
> > On 28-05-21, 01:39, Fabio M. De Francesco wrote:
> > > Coccinelle detected that fw is NULL but dereferenced.
> > > 
> > > static int gb_bootrom_get_firmware(struct gb_operation *op)
> > > {
> > > /* lines of code */
> > > 
> > >         if (!fw) {
> > >         
> > >                 dev_err(dev, "%s: firmware not available\n", __func__);
> > >                 ret = -EINVAL;
> > 
> > ret is set here.
> >
> Oh sorry. I entirely skipped that "ret = -EINVAL". Another case where one 
> should avoid blindly trusting the output of static analyzers without looking 
> carefully at the whole context ... :(
> 
> Unfortunately, Coccinelle has a high false positive rate. Just yesterday I ran 
> it against the entire driver / staging and more than 80% of the warnings / 
> errors weren't true.
> 
> It takes so long to distinguish the fake from the real that I wonder if it's 
> worth it to run the (slow) Coccinelle, wait for the output messages and verify 
> their veracity.

With static checkers, we are always targetting 100% false positive rate
because kernel devs fix the real bugs.

Smatch tracks the relationship between "ret" and "fw" so it knows that
"fw" is non-NULL and you could verify that by applying this diff and
running `smatch_scripts/kchecker drivers/staging/greybus/bootrom.c`

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index a8efb86de140..9976d1bac839 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -238,6 +238,7 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
 	return ret;
 }
 
+#include "/home/dcarpenter/progs/smatch/devel/check_debug.h"
 static int gb_bootrom_get_firmware(struct gb_operation *op)
 {
 	struct gb_bootrom *bootrom = gb_connection_get_data(op->connection);
@@ -298,6 +299,8 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 
 queue_work:
 	/* Refresh timeout */
+	if (!ret)
+		__smatch_implied(fw);
 	if (!ret && (offset + size == fw->size))
 		next_request = NEXT_REQ_READY_TO_BOOT;
 	else

But this test for for potential NULL dereference has a very high false
positive rate so I seldom look at the output for it.  The problem is
that GCC used to complain about uninitialized variables and GCC had a
high false positive rate.  So just to make GCC be quiet, people would do
"fw = NULL;" when the code was too complicated for GCC to understand.
Then all the complicated code stopped being a GCC uninitialized variable
warning and became a static checker warning of dereferencing a NULL
pointer.  It's all the most complicated code to parse which does this
and so that's obviously going to be tricky.  You often need to know
outside context about how the function is called.

And it's tricky, not only for static checkers but also for humans as
well.  So when I'd review it, most of the time I couldn't really figure
out if it's a real bug so I'd have to just leave it.  #frustrating

regards,
dan carpenter

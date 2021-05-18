Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F371
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 08:20:41 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14I8Je8Q003670;
	Tue, 18 May 2021 08:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=bMV0mYfWrGTmWmklGxv/dauj8hgDcMCo2pl7+fXMCws=;
 b=rEaFfvu2doUIozyV5kNw5H3s9KEXaQ19h5EuF4Ln7SsBLhDdsVaZwe6FPe/Eem2CBntX
 jmdssOnh8jKRBV02ZroyfNoC6nPJbVd8qHlyQmwX2QUOiZKcjN6GaGdamWy6y5Whsx38
 uz9XMcQ7CYrClsmZ9f0iCdEG44wvmWwXxZc4ibw+68+X5KSZP+E87nJF5MCtUT6HD8oX
 YND2v8WNXRW3QDrbe9eJ4eIJGvq/XEzogMvpPUzmVOj6E7ZBtqPvYZAAKUUz+9/EcK2f
 BFMiYKGpnm+aCiKfipF14TnfyKSkrnWMlVsepEP6BPaLAugSpShubvhvuX8uzqWmHiZ2 IQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 38m9bgg0ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 May 2021 08:20:38 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14I8KbEm182208;
	Tue, 18 May 2021 08:20:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3030.oracle.com with ESMTP id 38j3du54vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 May 2021 08:20:37 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14I8KaCA182186;
	Tue, 18 May 2021 08:20:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 38j3du54v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 May 2021 08:20:36 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14I8KXLf003686;
	Tue, 18 May 2021 08:20:35 GMT
Received: from kadam (/62.8.83.26)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 18 May 2021 01:20:33 -0700
Date: Tue, 18 May 2021 11:20:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: gregkh@linuxfoundation.org, marcocesati@gmail.com, fabioaiuto83@gmail.com,
        fmdefrancesco@gmail.com, eantoranz@gmail.com, hdegoede@redhat.com,
        Larry.Finger@lwfinger.net, skhan@linuxfoundation.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2 0/7] Staging: rtl8723bs: fix warnings in
 HalBtc8723b1Ant.c
Message-ID: <20210518082025.GA32682@kadam>
References: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: AQla1Mh4Tp_yZL_hCweeFrLOdPQCe5JE
X-Proofpoint-GUID: AQla1Mh4Tp_yZL_hCweeFrLOdPQCe5JE

On Tue, May 18, 2021 at 12:41:12AM -0400, Desmond Cheong Zhi Xi wrote:
> This patchset fixes 134 checkpatch.pl warnings in the file drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
> 
> Although checkpatch.pl reports a large number of checks, these are for issues that were present in the original code. In fact, in the process of fixing warnings, the total number of checks decreased from 548 to 545.
> 
> All patches are syntax fixes and no logic is changed. As there are a lot of different warnings, to make things easier to review, each patch addresses a different set of warnings in the following order:
> 
> - braces {} are not necessary for any arm of this statement
> - please, no space before tabs
> - suspect code indent for conditional statements
> - Statements should start on a tabstop (this type of warning is solved alongside the previous warning type in the same patch because the fix for one warning addresses the other)
> - Comparisons should place the constant on the right side of the test
> - Missing a blank line after declarations
> - Avoid unnecessary line continuations
> - Block comments use * on subsequent lines
> 
> Change in v2:
> - Patch 7: Remove dead code inside block comment instead of changing the comment formatting, as suggested by Dan Carpenter

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter


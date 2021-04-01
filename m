Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9955C70
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 11:00:33 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 131AtO8V155297;
	Thu, 1 Apr 2021 11:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=5uzyfBTDYbTwyhzctIMwM0dAGeez7rliuk3DjVjtV24=;
 b=ldbKxcGXrxE3p+8+OO8oRrODFyeLqC23Xvfz/9X6ySTt6qxaFssMYa5fwk+Irtkt8Rly
 RQlqWRmTnUG60zw5aDNPGku1OCVO0IoY4mwYBErGfMz7WDpFubLJnLpEHAJiKlVgJacV
 g3z7759IRGNsyWxEk7NbH8tM6lCSdMuvlzMPPMuIIKpUl9KHBV3eZZ14ePRipb9UcuqY
 H9Zx1ObH4y0bQJo96Y35rQ6iI+7NGxbQK4l6o2jcNlLdqat3JLX7PgaFAs08L2OreC4E
 gy7+69ELk7Hmr9uDkNze5Ir2ygzegM9LR2UAqxCmMbRjX2fAvIw63NHe1bg4AoNRM9lz Mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 37n30s9ach-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Apr 2021 11:00:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 131AtZ1s086656;
	Thu, 1 Apr 2021 11:00:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3030.oracle.com with ESMTP id 37n2asm4mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Apr 2021 11:00:16 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 131B0BpB018419;
	Thu, 1 Apr 2021 11:00:11 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 01 Apr 2021 04:00:10 -0700
Date: Thu, 1 Apr 2021 14:00:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH -next v3] staging: greybus: camera: Switch to
 memdup_user_nul()
Message-ID: <20210401110002.GT2065@kadam>
References: <20210401103645.1558813-1-yangyingliang@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401103645.1558813-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010076
X-Proofpoint-GUID: 8W_q66Z4z3nNIN1UvaCTKY9t8KmcDaTg
X-Proofpoint-ORIG-GUID: 8W_q66Z4z3nNIN1UvaCTKY9t8KmcDaTg
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010076

On Thu, Apr 01, 2021 at 06:36:45PM +0800, Yang Yingliang wrote:
> Use memdup_user_nul() helper instead of open-coding to
> simplify the code.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter


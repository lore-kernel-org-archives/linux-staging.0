Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7AF2FB1
	for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 10:30:14 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14SAGAcT031954;
	Fri, 28 May 2021 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=h9jfDEFUVI5Qfks9UzQNL1lhenfaxUaMhnkMJ0jygmA=;
 b=QsAYnt5k3+aj/0HMu7eU8rj4QfhZOKAJxuK1MGX7GZXATlrJKQFDESeErSFwv2wKY4KD
 TYMi07FrdQqXojYoW1KnGmwkjPJs7R6rBJxqzjsDKo/bfZneU5eYSisL6pi0ZUqmdf3P
 CQltSmJWT6StFvnatbHAIPmROabO3pvvZHkmVSB92Qc2estyFGthjHTp3PVt5RgbPyB0
 0Q+nTB6o+eDINSfhJr5gnFuag2UPJjPydDNvnvjkn5lnmLA3D5qh9kMaa3a2gGJ2pYIy
 LvVxSbz+JmFEnRTNS5eUfbUMy6hAVkIyqohG2V6SALXx0Z2eID0D5r7U44Kp8MiCiBuq Ng== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
	by mx0b-00069f02.pphosted.com with ESMTP id 38smut0v15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 May 2021 10:30:05 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SAU462021450;
	Fri, 28 May 2021 10:30:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 38qbqvbutx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 May 2021 10:30:04 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14SAU4oZ021386;
	Fri, 28 May 2021 10:30:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 38qbqvbusr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 May 2021 10:30:04 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14SAU2bf011669;
	Fri, 28 May 2021 10:30:03 GMT
Received: from kadam (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 28 May 2021 03:30:02 -0700
Date: Fri, 28 May 2021 13:29:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: drivers/staging/greybus/bootrom.c: fw is NULL but dereferenced
Message-ID: <20210528102954.GT1955@kadam>
References: <2015099.xVv48VzNit@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2015099.xVv48VzNit@linux.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: _SqSWzymCnl6h1qMHuhnOtT9k36HkHew
X-Proofpoint-GUID: _SqSWzymCnl6h1qMHuhnOtT9k36HkHew

On Fri, May 28, 2021 at 01:39:14AM +0200, Fabio M. De Francesco wrote:
> Coccinelle detected that fw is NULL but dereferenced.
> 
> static int gb_bootrom_get_firmware(struct gb_operation *op)
> {
> /* lines of code */
>         if (!fw) {
>                 dev_err(dev, "%s: firmware not available\n", __func__);
>                 ret = -EINVAL;
>                 goto unlock;
>         }
> /* lines of code */
> unlock:
>         unlock:
>         mutex_unlock(&bootrom->mutex);
> 
> queue_work:
>         /* Refresh timeout */
>         if (!ret && (offset + size == fw->size))    <--- here
              ^^^
False positive.  The "!ret" check already ensures that "fw" is non-NULL.

regards,
dan carpenter


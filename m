Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1CE6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 13:42:59 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ODeGh1028788;
	Wed, 24 Mar 2021 13:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=D8FvNx/tifCbbqJOdm5JKhXDq7a4qCrxzS+VBAnNzbk=;
 b=yeZqCnH2FUMt3g33Uo0X4Sv93WlHHupHKgoN71/7Iqb+vxXH5lQvtnttgPK6TWdxBqDV
 LXub2vqcUVV/hkO4/HvlvjfxLuaI2PuzY3d8PbvPwSALptP0JSntl75EVXhPyS7Ogrtb
 tpROyoxV7Qjl8VeZh4rl8yjfynIR+o59bmVgJjxD6Ty7RVDObfWnl7LE7HlFG7n2FtJr
 j7hUJM6KGhqiZLKxyPDrDNU40wXj+XFfK2WvR8YI7QMeGIh/utagql0CxMrgB/Q1EiB5
 MiE4I3J3iIbc/hc47dL+W3agn/DGNNyumg2zVgss8QScLYJx9GlRAswxh4hpw7YIUJed gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2130.oracle.com with ESMTP id 37d6jbjv8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 13:42:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ODfIMw073929;
	Wed, 24 Mar 2021 13:42:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 37dtmqudn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Mar 2021 13:42:55 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12ODgrg4022733;
	Wed, 24 Mar 2021 13:42:53 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 24 Mar 2021 06:42:52 -0700
Date: Wed, 24 Mar 2021 16:42:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/33] Staging: rtl8723bs: remove named enums in
 rtw_mlme.h
Message-ID: <20210324134245.GN1717@kadam>
References: <20210324124456.25221-1-marcocesati@gmail.com>
 <20210324124456.25221-2-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324124456.25221-2-marcocesati@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9932 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240104
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9932 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240104

On Wed, Mar 24, 2021 at 01:44:24PM +0100, Marco Cesati wrote:
> Remove the following unnecessary enum names or definitions in
> include/rtw_mlme.h:
> 
> 	enum dot11AuthAlgrthmNum	[name]
> 	enum  _band			[name]

Sorry, I was unclear.  I liked the names fine, it just that _band was a
bad name.  It's too vague and what's with the underscore character?

> 	enum DriverInterface		[definition]
> 	enum scan_result_type		[definition]

These are good to delete.  And it wouldn't surprise me if you found a
bunch of these enums were duplicates of more standard global enums.

regards,
dan carpenter



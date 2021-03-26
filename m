Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B375F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 16:09:17 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12QG4uZt142120;
	Fri, 26 Mar 2021 16:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=bS6kM9my3Va6PbjpwGy1EmY3FVLVnBOf1fH5GJFBtZw=;
 b=LtleMgOMNXmI5sP5kBu76mN5kksl9UXumfKweUSD3G82X+91giNu1/Ae/5F8I5kbx1IE
 GVhv5l37hH+j7JSsNMtzwJXHIt5ztJSR2oS7Hy3O3Xi7vAkVMQ0s9Hjo4UX7nzLDtAlx
 KVix9YToYvbYra+jt7HA4Qn3wm/QFTMXWewjaIzkYet0ZJiEdQKGEtm+tWGpqfF+flC1
 x2vRTzkbJrcVbI6wFYDvOkEMPHPU3IT8y19702nee+Me0rtJpRbEUZCnB28auyxsVGFv
 ZmScUEbr5JdGCu58my/A/JON6bsHdPpARZt5jgOSYrBQnFsqrVevA8Muqkjfe+fEdcDd yA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 37h13eam8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Mar 2021 16:09:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12QG5NlC112223;
	Fri, 26 Mar 2021 16:09:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 37hff4fquq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Mar 2021 16:09:12 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12QG9ASg001222;
	Fri, 26 Mar 2021 16:09:10 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 26 Mar 2021 09:09:09 -0700
Date: Fri, 26 Mar 2021 19:09:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/33] Staging: rtl8723bs: remove unnecessary enum names
 and definitions
Message-ID: <20210326160902.GF1667@kadam>
References: <20210324124456.25221-1-marcocesati@gmail.com>
 <YF3p2ABUhzSxYRsP@kroah.com>
 <20210326153754.ndl4k3duxsn2qfz3@cesati.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326153754.ndl4k3duxsn2qfz3@cesati.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260120
X-Proofpoint-ORIG-GUID: GMTjAohZIrc3cCgbheqk2e5Xsa3qoT83
X-Proofpoint-GUID: GMTjAohZIrc3cCgbheqk2e5Xsa3qoT83
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9935 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260120

On Fri, Mar 26, 2021 at 04:37:54PM +0100, Marco Cesati wrote:
> On Fri, Mar 26, 2021 at 03:04:08PM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Mar 24, 2021 at 01:44:23PM +0100, Marco Cesati wrote:
> > > The staging/rtl8723bs driver includes 82 enum definitions whose
> > > names are not referenced in the code. Furthermore, 57 enum definitions
> > > are useless, because the enum elements do not appear in the code.
> > > This patchset transforms 82 'named' enums in 'anonymous' enums and
> > > removes 57 enum definitions.
> > > 
> > > 
> > > [PATCH 01/33] Staging: rtl8723bs: remove named enums in rtw_mlme.h
> > > [PATCH 02/33] Staging: rtl8723bs: remove named enums in rtw_cmd.h
> > > [PATCH 03/33] Staging: rtl8723bs: remove named enums in rtw_eeprom.h
> > > [PATCH 04/33] Staging: rtl8723bs: remove named enums in hal_com.h
> > > [PATCH 05/33] Staging: rtl8723bs: remove named enums in rtw_recv.h
> > > [PATCH 06/33] Staging: rtl8723bs: remove named enums in drv_types.h
> > > [PATCH 07/33] Staging: rtl8723bs: remove named enums in rtw_ht.h
> > > [PATCH 08/33] Staging: rtl8723bs: remove named enums in wlan_bssdef.h
> > > [PATCH 09/33] Staging: rtl8723bs: remove named enums in rtw_mp.h
> > > [PATCH 10/33] Staging: rtl8723bs: remove named enums in osdep_service.h
> > > [PATCH 11/33] Staging: rtl8723bs: remove named enums in hal_intf.h
> > > [PATCH 12/33] Staging: rtl8723bs: remove named enums in rtw_pwrctrl.h
> > > [PATCH 13/33] Staging: rtl8723bs: remove named enums in rtl8723b_cmd.h
> > > [PATCH 14/33] Staging: rtl8723bs: remove named enums in hal_com_h2c.h
> > > [PATCH 15/33] Staging: rtl8723bs: remove named enums in rtw_wifi_regd.h
> > > [PATCH 16/33] Staging: rtl8723bs: remove named enums in wifi.h
> > > [PATCH 17/33] Staging: rtl8723bs: remove named enums in rtl8723b_hal.h
> > > [PATCH 18/33] Staging: rtl8723bs: remove named enums in hal_phy.h
> > > [PATCH 19/33] Staging: rtl8723bs: remove named enums in rtw_mlme_ext.h
> > > [PATCH 20/33] Staging: rtl8723bs: remove named enums in rtw_xmit.h
> > > [PATCH 21/33] Staging: rtl8723bs: remove named enums in rtw_rf.h
> > > [PATCH 22/33] Staging: rtl8723bs: remove named enums in HalPwrSeqCmd.h
> > > [PATCH 23/33] Staging: rtl8723bs: remove named enums in hal_com_phycfg.h
> > > [PATCH 24/33] Staging: rtl8723bs: remove named enums in ieee80211.h
> > > [PATCH 25/33] Staging: rtl8723bs: remove named enums in rtw_efuse.h
> > > [PATCH 26/33] Staging: rtl8723bs: remove named enums in odm_interface.h
> > > [PATCH 27/33] Staging: rtl8723bs: remove named enums in HalBtcOutSrc.h
> > > [PATCH 28/33] Staging: rtl8723bs: remove named enums in HalBtc8723b1Ant.h
> > > [PATCH 29/33] Staging: rtl8723bs: remove named enums in odm_types.h
> > > [PATCH 30/33] Staging: rtl8723bs: remove named enums in odm_DIG.h
> > > [PATCH 31/33] Staging: rtl8723bs: remove named enums in HalPhyRf.h
> > > [PATCH 32/33] Staging: rtl8723bs: remove named enums in odm.h
> > > [PATCH 33/33] Staging: rtl8723bs: remove named enums in HalBtc8723b2Ant.h
> > 
> > Was this a "v2" of the series?  Or does it not conflict with your other
> > series?
> > 
> > I'm getting confused...  Please check my tree and see what I have not
> > applied from you and resend...
> > 
> > thanks,
> > greg k-h
> 
> This was the first, original patch set. However, I got a comment from
> Dan Carpenter from which I inferred that transforming named enums like
> "enum XXX { ... };" into anonymous enums like "enum { ...  };", when
> "XXX" is not referenced elsewhere, was not desiderable. Therefore, I
> submitted another version of the patch set ("[PATCH 00/21] Staging:
> rtl8723bs: remove unreferenced enum definitions"), which just removes
> the enums having no reference _at_all_ in the code. To be clear, the 
> patch set ("remove unreferenced enums") removes a strict subset of the
> enums touched by this patch set ("remove named enums").
> 
> This patch set ("remove named enums") has been properly applied to your
> tree, so for me all is fine.  I guess the decision is up to you: do you
> prefer to _not_ remove the useless enum names? In this case, this patch
> set has to be reverted.

Forget about it.  I didn't really endorse removing the enum names
because I thought they were harmless and had some documentation value.
But the value was very minimal...  Let's not revert anything.  Let's
just move forward.

You're over apologizing.  No one is upset with you if your patch doesn't
apply.  Greg just deletes it and moves on.  No one invests any time into
trying to figure out what happened.

Now that Greg has applied whatever can apply he has deleted all the rest
of your patches.  Just rebase and resend.

regards,
dan carpenter

Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7AF6E
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 15:16:11 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12MDJKIM082468;
	Mon, 22 Mar 2021 13:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=4H222lAsmo97JCjrLoly5KhQJ5sG8cFGEiXweYf9d/I=;
 b=dWWXV09YCSwALpvsjme5QMtTK42h5oLV483mf/U6qnYydv4c2yIjY64qus4/4x4NVIJc
 8WlvmJg+oZaN2til3fYL4/piOgwwWqcm6ZNzJ6Ms21Rr5aH9hURu76Nti6VsB9gYGsUf
 W9P/r/DIA7aEk68vtz1VLdMLd9a5EudFbCz8n6iQVMvCROL49dFRDtGg+2aerfsOP9X/
 yTwKl+uGtb7P3kWyJvfZ/tTwxr3ev3OXxfHVRJbEYEfXymdtlSnmuBt6e0y9htYwmjdW
 Yg8n0jceE5FSVlmbH5x7a8A8jPU0Btu8EGbAFb4OKVtjvvGyXtuWqnMCmGpULYAR8XWs 6g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 37d90mbeu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Mar 2021 13:21:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12MDL3SU039460;
	Mon, 22 Mar 2021 13:21:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 37dtmn70np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Mar 2021 13:21:31 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12MDLTt1029663;
	Mon, 22 Mar 2021 13:21:30 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 22 Mar 2021 06:21:29 -0700
Date: Mon, 22 Mar 2021 16:21:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Marco Cesati <marcocesati@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev
Subject: Re: Staging: rtl8723bs: proposed patchset: remove useless structs
Message-ID: <20210322132122.GF1717@kadam>
References: <20210322130921.o4voti2xkmbxonny@cesati.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322130921.o4voti2xkmbxonny@cesati.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9930 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220096
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9930 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220096

On Mon, Mar 22, 2021 at 02:09:21PM +0100, Marco Cesati wrote:
> The staging/rtl8723bs driver code includes 83 unnecessary struct
> definitions (never referenced in the code). Here there are:
> 
> cfg80211_wifidirect_info tdls_info tdls_txmgmt P2P_PS_Offload_t
> P2P_PS_CTWPeriod_t usb_suspend_parm getbasicrate_rsp getdatarate_rsp
> readBB_parm readBB_rsp readTSSI_parm readTSSI_rsp writeBB_parm
> readRF_parm readRF_rsp writeRF_parm getrfintfs_parm settxagctbl_parm
> gettxagctbl_parm gettxagctbl_rsp setagcctrl_parm setssup_parm
> getssup_parm getssup_rsp setssdlevel_parm getssdlevel_parm
> getssdlevel_rsp setssulevel_parm getssulevel_parm getssulevel_rsp
> setratable_parm getratable_parm getratable_rsp gettxretrycnt_parm
> gettxretrycnt_rsp getrxretrycnt_parm getrxretrycnt_rsp getbcnokcnt_parm
> getbcnokcnt_rsp getbcnerrcnt_parm getbcnerrcnt_rsp getcurtxpwrlevel_parm
> getcurtxpwrlevel_rsp setprobereqextraie_parm setassocreqextraie_parm
> setproberspextraie_parm setassocrspextraie_parm smooth_rssi_data
> specific_device_id BSSIDInfo ndis_802_11_association_information
> ndis_802_11_key ndis_802_11_remove_key iocmd_struct rf_reg_param
> bb_reg_param wowlan_ioctl_param addba_event c2hevent_queue
> phystatus_8723b sha256_state country_code_to_enum_rd reg_protocol_rd
> reg_protocol_wt rtw_ieee80211_bar r_antenna_select_ofdm agg_pkt_info
> ieee_ibss_seq ieee80211_rx_stats ieee80211_frag_entry ieee80211_stats
> ieee80211_softmac_stats ieee80211_security ieee80211_header_data
> phy_status_rpt_8812_t odm_sta_info_t odm_ra_info_t
> 
> Should I submit a patchset that removes all of these definitions?
> 

Yeah.  Delete anything that isn't used.

Once in a while we have stuff like:

#define enable  0x1
#define disable 0x2
#define reset   0x3

So it's like a list of commands that we pass to the hardware.  And maybe
we never use the reset command.  But it's still useful to know that it's
0x3 so the unused define serves as hardware documentation.

But this sort of define as hardware documentation isn't common.
Generally if something isn't used, then delete it.

regards,
dan carpenter


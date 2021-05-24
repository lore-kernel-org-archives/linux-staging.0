Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF870
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 09:06:17 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14O8mgwv021513;
	Mon, 24 May 2021 09:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=9WwtdD2OMJf1k13mXmQiiNpBVQXae9uIk+rqaO06fds=;
 b=MLsD8XPuFyhpBIIa50Oc/W60SuXBWXRQjnqoyoaXaMJXsopo6f9wWLz8vBCYP3bTMOjo
 kss9/zZmsFZXTClObQ6tsNCyIjSeUD4NfnXPmmS6rUXvxBygQlR/sSWrv39C9LgH5Cf2
 YYLCVWpKDMbw68kn9K7RZIHDJuxhmAEjXFYrWdoQ01QN4iefjRODMQ/nP5sR1g+ZPA7d
 qgnx8EVJ0Ko6Eg6VKl/vK1wQJoVHVCarFiixi3pjRubd6A30QZsLVr1j1DgxX57wFBdJ
 BeF0FWhnXA9/YmRBIXuqqS29SEkDghuhU/RR7Eq66pZaA1fis6Hy4vT72SMrYqlf9RqW Vw== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 38r7wer0xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 May 2021 09:06:09 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14O8vTmb063108;
	Mon, 24 May 2021 09:06:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 38pss4u41y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 May 2021 09:06:08 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14O968HT127814;
	Mon, 24 May 2021 09:06:08 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 38pss4u3yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 May 2021 09:06:08 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14O966On014165;
	Mon, 24 May 2021 09:06:06 GMT
Received: from kadam (/41.212.42.34)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 24 May 2021 09:06:05 +0000
Date: Mon, 24 May 2021 12:05:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
        ross.schm.dev@gmail.com, straube.linux@gmail.com,
        linux-staging@lists.linux.dev, linux-kernel@bger.kernel.org
Subject: Re: [PATCH 1/2] [RFC] staging: rtl8723bs: refactor to reduce indents
Message-ID: <20210524090557.GM1955@kadam>
References: <20210522091719.64277-1-chouhan.shreyansh630@gmail.com>
 <20210522091719.64277-2-chouhan.shreyansh630@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522091719.64277-2-chouhan.shreyansh630@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: _p4MW915e99lxDhHHqaET4pUvh62EvUP
X-Proofpoint-GUID: _p4MW915e99lxDhHHqaET4pUvh62EvUP

On Sat, May 22, 2021 at 02:47:18PM +0530, Shreyansh Chouhan wrote:
> Reduce the number of indents in rtw_wlan_util.c file by refactoring the
> code.
> 
> Moved the part of code that rearranged ac paramaters in the function
> WMMOnAssocResp to a separate function named sort_wmm_ac_params. It takes
> both the array of ac params and their indexes as arguments and sorts them.
> Has return type void.
> 
> Moved the part of code that checked for the realtek vendor in the
> function check_assoc_AP to a separate function named
> get_realtek_assoc_AP_vender. It takes a pointer to struct
> ndis_80211_var_ie as an argument and returns a u32 realtek vendor.
> 
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> ---
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 108 +++++++++---------
>  1 file changed, 56 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index ce47ef4edea0..36e515a7ab5c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -777,6 +777,32 @@ int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
>  	return true;
>  }
>  
> +static void sort_wmm_ac_params(u32 *inx, u32 *edca)
> +{
> +	u32 i, j, change_inx = false;
> +
> +	/* entry indx: 0->vo, 1->vi, 2->be, 3->bk. */
> +	for (i = 0; i < 4; i++) {
> +		for (j = i + 1; j < 4; j++) {
> +			/* compare CW and AIFS */
> +			if ((edca[j] & 0xFFFF) < (edca[i] & 0xFFFF)) {
> +				change_inx = true;
> +			} else if ((edca[j] & 0xFFFF) == (edca[i] & 0xFFFF)) {
> +				/* compare TXOP */
> +				if ((edca[j] >> 16) > (edca[i] >> 16))
> +					change_inx = true;
> +			}
> +
> +			if (change_inx) {
> +				swap(edca[i], edca[j]);
> +				swap(inx[i], inx[j]);

Using swap() is the correct thing to do, but send that change as a
separate patch.

Don't send RFC patches, just send normal patches.  No need for comments.

> +
> +				change_inx = false;
> +			}
> +		}
> +	}
> +}

regards,
dan carpenter


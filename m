Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD129A2;
	Wed, 30 Mar 2022 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648660041; x=1680196041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JauRNTN/iXFEioeAVJXi5dYw32L+cbz1swoCNS2p/fo=;
  b=d45Eij1njpDBdQf1N3/T02tiB6oUtigR6gWQnkq9mWaKARYWKbWIgfq7
   ExLiurt2bCp3lLFLIIntKpLyk6pTuiYWmtKUbt1WlXxaMxU9QcXmXPl+I
   lOtTvCDH0xhQAsFAwXltrD9Yz5XryHrbjyvrOq8sF15Z9Eueavzzpnx2O
   w3S9PFQBxAo7VI9CcHd5GFPPCi3QxuQ4wCm7YMUGEhS14A6lXqta19ZyH
   IITfHZdto/WSVAtnjdUrDJgdl6I38W/mvS/bzKPcJeczJ1i5y6pDA592H
   Y5peLtmmFLFu4jinSQB2TqQbxo/zZTcqGeSudIqoWTBM/P8HhKaNBwSR/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="241749882"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="241749882"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 10:07:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="565655237"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 10:07:13 -0700
Date: Wed, 30 Mar 2022 10:09:36 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging:rtl8723bs:rtw_cmd.c remove suspect indent
Message-ID: <20220330170936.GA1176693@alison-desk>
References: <20220330153100.5813-1-eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330153100.5813-1-eng.alaamohamedsoliman.am@gmail.com>

On Wed, Mar 30, 2022 at 05:31:00PM +0200, Alaa Mohamed wrote:
> Fix "WARNING: suspect code indent for conditional
> statements (16, 32)" for line 1240
> founded by checkpatch.pl
> 
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>

Hi Alaa,

https://kernelnewbies.org/PatchPhilosophy
Please take a look at the section on "Patch subject formatting" 
and the follow on sections about checkpatch descriptions.

Thanks,
Alison


> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 14d37b369273..46e18a90529f 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1238,7 +1238,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
>  		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
>  		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
> -				BusyThreshold = BusyThresholdLow;
> +			BusyThreshold = BusyThresholdLow;
>  
>  		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
>  			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
> -- 
> 2.35.1
> 
> 

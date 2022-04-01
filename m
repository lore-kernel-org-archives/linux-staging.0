Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6689B1363;
	Fri,  1 Apr 2022 21:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648848846; x=1680384846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gQWF+3nXXQTVuvvNU3qL73QaPoVzfmUyNSXaNlhBWWg=;
  b=IK4c6oV7lZhIK5AkyH0tG03ZqOueEelNxU8UdjJK1/DLdp3ZJU6FF6Gg
   FKtVGAFAJ2afzJtlfTuMsfoCIpyzkp1N2iDJfsSRebt2aqlrgua3VrNjw
   ehkGkvx0IOXDILZz6c/NINVgsp+vfCP2NvPwdkv4QcRdPw5mq21hzlSU9
   Zcy9NMb8+kO0XtRM3VHsaMXi9RAHIgSC/XrZ1xcvqJtNEo1WGdjNVkSIW
   recy8FY/Azj0oDxsBcF482+DdcIjUQdUi5w4RgH35DtPrHdlcSNEnRkFZ
   YXucRwlbgIX3n3v7ATVfbJ0ArEenM3Kr7kZfTw7eQSMd1dS6J2dinokZM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="240823952"
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="240823952"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 14:34:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="656042806"
Received: from kmislam-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.112.89])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 14:34:05 -0700
Date: Fri, 1 Apr 2022 14:34:04 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: simplify control flow
Message-ID: <YkdvzIyz/WGlm2uy@iweiny-desk3>
References: <20220401114635.GA567659@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401114635.GA567659@euclid>

On Fri, Apr 01, 2022 at 07:46:35AM -0400, Sevinj Aghayeva wrote:
> The function iterates an index from 0 to NUM_PMKID_CACHE and returns
> the first index for which the condition is true. If no such index is
> found, the function returns -1. Current code has a complex control
> flow that obfuscates this simple task. Replace it with a loop.
> 
> Also, given the shortened function body, replace the long variable
> name psecuritypriv with a short variable name p.
> 
> Reported by checkpatch:
> 
> WARNING: else is not generally useful after a break or return
> 
> Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>

Wow!  Nice find!  This is a huge clean up.  Extra kudos recognizing that it is
not just the else statement which is broken here!

The only issue for the patch is that I don't see any maintainer emailed?
However, I don't see a maintainer listed in the MAINTAINERS file so ...

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 28 ++++++-----------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index d5bb3a5bd2fb..3eacf8f9d236 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2036,28 +2036,14 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
>  
>  static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
>  {
> -	struct security_priv *psecuritypriv = &Adapter->securitypriv;
> -	int i = 0;
> -
> -	do {
> -		if ((psecuritypriv->PMKIDList[i].bUsed) &&
> -				(!memcmp(psecuritypriv->PMKIDList[i].Bssid, bssid, ETH_ALEN))) {
> -			break;
> -		} else {
> -			i++;
> -			/* continue; */
> -		}
> -
> -	} while (i < NUM_PMKID_CACHE);
> -
> -	if (i == NUM_PMKID_CACHE) {
> -		i = -1;/*  Could not find. */
> -	} else {
> -		/*  There is one Pre-Authentication Key for the specific BSSID. */
> -	}
> -
> -	return i;
> +	struct security_priv *p = &Adapter->securitypriv;
> +	int i;
>  
> +	for (i = 0; i < NUM_PMKID_CACHE; i++)
> +		if ((p->PMKIDList[i].bUsed) &&
> +				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
> +			return i;
> +	return -1;
>  }
>  
>  /*  */
> -- 
> 2.25.1
> 

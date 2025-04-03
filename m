Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BB916C854;
	Thu,  3 Apr 2025 05:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743656824; cv=none; b=LOPtorhuLUtcEVKdoxqJMWeWX5aefyO+FSfnJzagP51MA1mWHnQHRPMoXftIVqlemcpMMD+8P8arp2UuVfNbgu9QLuzD2W5xl/lZUujq4zGA7OdBZBCLzCgWm3sA2xheil7DphWXAw2REPK+OXJvL3RE7Gx3grO6HvwkW1cXpYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743656824; c=relaxed/simple;
	bh=8VKgCgBHxrdknUaI1Mw9feNtY3afR2pJyF2xF2EdXt0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BT0vmiB9tzv3mW+I209ffoRxn7aukXL7sOkdkl5WBdT1rQO4B2qksthGitwlDJYXnzB0n4bCrXsEQSDW9kSjFumPaZIH5cGupbLJAICakpSdr+vmyAENxhvaVFwgvOYJLXKyU8FgplMMZR0M4GaA3PgKp7xK4FGFpub7lf175jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=AqFJERTd; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="AqFJERTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6V8kIiJooYD9onhg8eupmQyigeizgedRchvQTk4+eOA=;
  b=AqFJERTdzp3Z7S/TbpncZRMnKlNca427TKeeZQaXOUNHVNxK3j4swm18
   mothcXV9rzR5jtBc59foAsB0dryO8+2MFQdcSQOd0bVLKk8H4v/Z8wuE4
   KvwvcutJx5XezNHfbM3O+CowSfDA3JwPps6eSWKW8H7+O6WCAvw/zZdNH
   Y=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,184,1739833200"; 
   d="scan'208";a="113317727"
Received: from powered-by.xenosite.net (HELO hadrien) ([89.255.17.162])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:06:53 +0200
Date: Thu, 3 Apr 2025 07:06:52 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: modify struct field to use standard
 bool type
In-Reply-To: <Z+05IEjV3pczMLNQ@HP-650>
Message-ID: <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
References: <Z+05IEjV3pczMLNQ@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 2 Apr 2025, Abraham Samuel Adekunle wrote:

> The struct field uses the uint values 0 and 1 to represent false and
> true values respectively.
>
> Convert cases to use the bool type instead to conform to Linux
> coding styles and ensure consistency.

This is vague.  Ensure consistency with what?  You can point out that true
or false was already being used elsewhere in the code.

>
> reported by Coccinelle:
>
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
>  drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index ed6942e289a5..82f54f769ed1 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
>  		psta->qos_option = 0;
>  		psta->htpriv.ht_option = false;
>
> -		psta->ieee8021x_blocked = 0;
> +		psta->ieee8021x_blocked = false;
>
>  		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
>
> diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
> index b3535fed3de7..63343998266a 100644
> --- a/drivers/staging/rtl8723bs/include/sta_info.h
> +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> @@ -86,7 +86,7 @@ struct sta_info {
>  	uint qos_option;
>  	u8 hwaddr[ETH_ALEN];
>
> -	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
> +	bool ieee8021x_blocked;

This declaration doesn't have the same alignment as the others.

You should also check whether this is a structure that is read from the
hardware.  In that case, it would be a concern if the bool field does not
have the same size as the uint one.

julia

>  	uint	dot118021XPrivacy; /* aes, tkip... */
>  	union Keytype	dot11tkiptxmickey;
>  	union Keytype	dot11tkiprxmickey;
> --
> 2.34.1
>
>

Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCA7770FB
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 18:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724696439; cv=none; b=JzRW0ikiqRg1eRJrBqVDfH6ysIIuG60xaCC4n1XmtBfEekv7ZkvvPzBJf/3+AqkHukw9UK4FRT4iRp7kk5vlti9nO6AE+Uxj9P/GKvxxiB9mdr2aDOLlI1y42NeyKgZgrUsJMUrW+1YRHXB+6qcmrUJlVioY8DVDp9LHXCY9xa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724696439; c=relaxed/simple;
	bh=jqH4p6Nw18tAAVjtgyf5O1c/2Bgr8+Vg5Ak0/Hl5ZAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McxvjYRC+VxY23W8QDAJOZcSSYU/5yd2cea4llwWaRy9LDMOYtLM091+kRfT28i+58zZ9+uE5iY8WQGs55BzuC8qsj1HO1GTdEaHEhyib6LObD61708IUAMdRwPkba69f9yMuJtErCYSqgQ0buk7mFF0wS3dCxZ33PHqENS28q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pCeIoNc1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EKX4WwFj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pCeIoNc1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EKX4WwFj"
Date: Mon, 26 Aug 2024 20:20:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724696434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pwu1YPkn2SOZ6n+Tw+G2w/asRhWOnCADZBLFWLzmw7g=;
	b=pCeIoNc1LW3n0GEiXAMtMOPvbCGep9ie8uydOdx3CfSn88s0TtdgHIy7p6ACns2j8qMn3H
	vdz3bS/zgjGFRijhK3ns4UPcthWLKwx5jMByaioj2rJeQZ3vZ6cPp94dCXYYJQZWjE89s7
	STK3HORQs+VbgcJDWsEsbnljjOoddu+LqamFSUX93CPWDgO3DXbV2nzBOr+m5MrszlPLt5
	9+jojg8RSpSZEATBA/qZZJHpSd0wd2X+7mVMwpCVb2exgj5Zk5PJ2Uu073hEFEkRVAp9Aq
	hd2nUdtTbPnLuFdOPqLWF5OEy92jwZy7/jligr5VycHKdb5te5i2/djd6Bikow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724696434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pwu1YPkn2SOZ6n+Tw+G2w/asRhWOnCADZBLFWLzmw7g=;
	b=EKX4WwFj9VsIQ45afRP1iaTBmhw78HWnJh3JrRgk2CCYKQCzOkmzS/UCPSfL4lMmHGnsNh
	HBUlFNyh7GZN2RCA==
From: Nam Cao <namcao@linutronix.de>
To: Alien Wesley <alienwesley51@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v3] staging: rtl8192e: Fix multiple assignments in
 rtl_wx.c:529
Message-ID: <20240826182029.ZFtqcPCP@linutronix.de>
References: <20240826162804.18996-1-alienwesley51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826162804.18996-1-alienwesley51@gmail.com>

On Mon, Aug 26, 2024 at 01:28:04PM -0300, Alien Wesley wrote:
> Separated assignments for pairwise_key_type and group_key_type
> in order to silence the following checkpatch warning.
> 
> CHECK: multiple assignments should be avoided.
> 
> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> ---
> v3: Fix typo in commit message.
> v2: Removed two spaces in front of "=".
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index 47f1adf30ab4..67c4793e0fc1 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -526,7 +526,7 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
>  	mutex_unlock(&priv->wx_mutex);
>  
>  	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
> -		ieee->pairwise_key_type  = KEY_TYPE_NA;
> +		ieee->pairwise_key_type = KEY_TYPE_NA;

I was completely confused, because the desscription says "Fix multiple
assignments", yet I only see a whitespace fix.

So I looked at v1, and it makes sense, you are sending this as a follow-up
fix for a double-space issue that you added in v1.

Instead of doing this, please just squash your v1 and v3 patches together
and send it as v4. This v3 patch doesn't make sense on its own.

Best regards,
Nam

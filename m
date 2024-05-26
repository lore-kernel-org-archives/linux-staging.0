Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35BCF9DF
	for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716734026; cv=none; b=pMZg2YU1Rn8Xb3QK1YGrKEkFJpJnWedP1A0K1kQNqKhUBHbDXu2L/lQXZ1yfqnEVOljLH+bdpTTApImlid5s6Irhmc2njvSPkQslrBnsaMVwBcb9lDq1+vtwj+pqjjUwvB8URRvNe5OPCVAiegD+rW00BD2DRHdthNMVmpWa7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716734026; c=relaxed/simple;
	bh=QA0dpRGMhYJPQHPub7gg3sxVHBbUEmvxO/7j2q05/bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL9i1lkZsldQxgP3F/e1XqDHBNtMG0d4Lr7cyO+CJFqI1QkMchbV5lOYTI9unCLZXPEXycvXqDfYTHBtOQe6jhgc7GmBKq5QIgr43ePgMJeq4QJU7tSfi3VF7tUgezswgiO2umPc1hWN/QwIyPNPT8TAIWJgpIVK1cXuYesX1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ByHYsSYE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hI8HtTao; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ByHYsSYE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hI8HtTao"
Date: Sun, 26 May 2024 16:33:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716734023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YXGpB/omnYIn3jauojGC79gVRJe/9Up/TN/TGtNhfpY=;
	b=ByHYsSYE5tuKjQwJK38UEN8eieTg5f3+UTMYoJk+nPHiHyswtdsQy6i0kGbTIuNwO5y0Xt
	rhWnTcQgFT4U5r1SdrgIxy/I57nRQH0FtAvxGWUcMpSbfeJOXWX7qdTRLtKq08CNQDj4UB
	1UHT0vlmqsQWJB7tIcWqSkghxL5DNaAyPy3rJjcNQeo5FFApWx7Mo1pjYGcHKQnRf4jUoO
	8H4ArKrc+gvgtoGe2MDmFkGDOrgal9vfeTBvHk5zsFZJdLe6funqh11zTnoPj16+MkaxmJ
	ApOvJhlzvT0nO2+4HO5pPdxWPAVJbX5O8/zrHtOMBQH+UF4HLR+gXZsGXRsNmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716734023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YXGpB/omnYIn3jauojGC79gVRJe/9Up/TN/TGtNhfpY=;
	b=hI8HtTaoVnbK2qYoSmRcFsV7t5186FubjTtHnGJ0z4Zzh6XYvDr1/e3SqPwce5iH64pzGl
	QdTR9Xg0dPFYcyBQ==
From: Nam Cao <namcao@linutronix.de>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8192e: remove unnecessary line breaks
Message-ID: <20240526143342.tPBauUTi@linutronix.de>
References: <20240526111928.14574-1-straube.linux@gmail.com>
 <20240526111928.14574-3-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526111928.14574-3-straube.linux@gmail.com>

On Sun, May 26, 2024 at 01:19:27PM +0200, Michael Straube wrote:
> Remove some unnecessary line breaks after '=' and '==' to improve
> readability.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 24 ++++++++--------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> index 2fda44c5a412..5392d2daf870 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> @@ -1392,8 +1392,7 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
>  				continue;
>  
>  			rf_num++;
> -			cur_cck_pwdb =
> -					dm_rx_path_sel_table.cck_pwdb_sta[i];
> +			cur_cck_pwdb = dm_rx_path_sel_table.cck_pwdb_sta[i];
>  
>  			if (rf_num == 1) {
>  				cck_rx_ver2_max_index = i;
> @@ -1412,27 +1411,20 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
>  				}
>  			} else {
>  				if (cur_cck_pwdb > tmp_cck_max_pwdb) {
> -					tmp_cck_sec_pwdb =
> -							tmp_cck_max_pwdb;
> -					cck_rx_ver2_sec_index =
> -							cck_rx_ver2_max_index;
> +					tmp_cck_sec_pwdb = tmp_cck_max_pwdb;
> +					cck_rx_ver2_sec_index = cck_rx_ver2_max_index;
>  					tmp_cck_max_pwdb = cur_cck_pwdb;
>  					cck_rx_ver2_max_index = i;
> -				} else if (cur_cck_pwdb ==
> -						tmp_cck_max_pwdb) {
> +				} else if (cur_cck_pwdb == tmp_cck_max_pwdb) {
>  					tmp_cck_sec_pwdb = cur_cck_pwdb;
>  					cck_rx_ver2_sec_index = i;
>  				} else if (PWDB_IN_RANGE) {
>  					tmp_cck_sec_pwdb = cur_cck_pwdb;
>  					cck_rx_ver2_sec_index = i;
> -				} else if (cur_cck_pwdb ==
> -						tmp_cck_sec_pwdb) {
> -					if (tmp_cck_sec_pwdb ==
> -						tmp_cck_min_pwdb) {
> -						tmp_cck_sec_pwdb =
> -								cur_cck_pwdb;
> -						cck_rx_ver2_sec_index =
> -								i;
> +				} else if (cur_cck_pwdb == tmp_cck_sec_pwdb) {
> +					if (tmp_cck_sec_pwdb == tmp_cck_min_pwdb) {
> +						tmp_cck_sec_pwdb = cur_cck_pwdb;
> +						cck_rx_ver2_sec_index = i;
>  					}
>  				} else if ((cur_cck_pwdb < tmp_cck_sec_pwdb) &&
>  						(cur_cck_pwdb > tmp_cck_min_pwdb)) {

Reviewed-by: Nam Cao <namcao@linutronix.de>

Best regards,
Nam

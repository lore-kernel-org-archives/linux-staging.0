Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173EC3B2FF3;
	Tue, 31 Mar 2026 06:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939855; cv=none; b=GmoCIAvnSqIC4JwwF3umDouGfZVNrIfZ1E+YyPf5sRPvj7EwGY2KHuDKds6/s6u/tGdZQusjVBVMPdUhp5hFYlMfAZYQHubaOoLVnKPHnEiHlPGMmBT1ypoVc0+EQQaY63sLtCnSXsWK2n+72EYHX2K+g0Qe9cLX7l8q7uhMjCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939855; c=relaxed/simple;
	bh=t43ab77jRhUhgDuKT/p2EJPy0Xoo+YT9xsb+mmTeBXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3JWAira6lApyfhHl8Veu6HIWaKqfbYYal5aqL75HBPtm0CpK8S/RQed+PdULyUuKiJUMONqKOzW+mlYien4GdFeomeQBip/0yw1E0XBCYEuL0DmhudWVweFEy7RShp1nMV3Zi3kPBbpOeXF9T6C/swXEm4M9ijMyT4jxXAhPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zNAWxj/+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zNAWxj/+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A5EC19424;
	Tue, 31 Mar 2026 06:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774939854;
	bh=t43ab77jRhUhgDuKT/p2EJPy0Xoo+YT9xsb+mmTeBXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zNAWxj/+QSv9rhuOQjAwXSXnIDKSn+BI1BNlg+TbpWkzlS9emikbtDX65MopKZTXh
	 ROPC233KfvtfSzSc4N6zyaJY0/zpWaI1DLLdJxZvNL+1JEXW7CbzROff+4hSgiOR5Y
	 0+FB8dW06HCF8nVPrJXl0G5Dsrj0/TE8xwgv0yeM=
Date: Tue, 31 Mar 2026 08:50:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: rename rt_channel_info
 members to snake_case
Message-ID: <2026033127-atypical-deputy-e0dc@gregkh>
References: <message-id-do-email-do-dan>
 <20260321160217.36060-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321160217.36060-1-marcosandrade95963@gmail.com>

On Sat, Mar 21, 2026 at 04:02:15PM +0000, Marcos Andrade wrote:
> This series renames the CamelCase member names ChannelNum and ScanType
> of struct rt_channel_info to their snake_case equivalents channel_num
> and scan_type, updating all their usages across the driver.
> 
> Changes in v2:
> - Fix incorrect member assignment in rtw_mlme_ext.c
>   (channel_num was wrongly assigned from scan_type)
> 
> Marcos Andrade (3):
>   staging: rtl8723bs: rename rt_channel_info members to snake_case
>   staging: rtl8723bs: rename rt_channel_info members to snake_case

You have different patches with identical subject lines, which is not a
good idea.  Please make them unique.

thanks,

greg k-h

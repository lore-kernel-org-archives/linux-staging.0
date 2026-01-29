Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A1437AA6D;
	Thu, 29 Jan 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676882; cv=none; b=SDZxuSmAfrHWNcwktlLOkjQmOiGOEL11lno4+JOoSOye1tDo+0vI0/ijdQlx5jBB1YPvdwHam8QjjggcJbXPhDXByhFznxRd5TuKFNtqdu25xclzvUSpOX9Q8dcVzv0bmVQ61BaGl/n5m4yhiDE4edoSJjjZHd+rkFim8QZqoVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676882; c=relaxed/simple;
	bh=t5t3nm8Khm1+zW2VaGiYK0QaZczS0e7ERNYKk87hoI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+E1uJapeb1Ek6xrVKxxN4XXcMkbiBNF+wnAsyN46I1LaqbcrIsYhHhAITA3BUP2+3dNr/pos26k5Qy8Wiuv9bY9EOX2YityUyc8LAlRT+Lop1Iu1aWgK0UiojszIK6LLTkR7VbJzzGV+bseQzSLpt206S7rq58omPH3XQPBj8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n7uvwXKN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n7uvwXKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19237C4CEF7;
	Thu, 29 Jan 2026 08:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769676881;
	bh=t5t3nm8Khm1+zW2VaGiYK0QaZczS0e7ERNYKk87hoI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7uvwXKNMCykWR4h53qIySsNL5l+ObCMZbmZdTGauGXoyu3TEP5BJOB4B9MF1ZUoW
	 Ysh1GfcLG24MioTKlrowpYqKwL4P7FQQyUVv38nh0mzMachvn7lfFFJFlpstyBEadL
	 7P6BE7wLR/TrHhDw7XYasB7TEO1R7ZPCT7/9C5ng=
Date: Thu, 29 Jan 2026 09:54:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Joe Perches <joe@perches.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: refactor BSS Coexistence channel
 report logic
Message-ID: <2026012943-danger-tweed-8f81@gregkh>
References: <aXsEd2bzf35y8i_E@stanley.mountain>
 <20260129080110.73884-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129080110.73884-1-tehsiu.huang@gmail.com>

On Thu, Jan 29, 2026 at 12:01:10AM -0800, Michael Huang wrote:
> Refactor the 'ICS' array in issue_action_BSSCoexistPacket() to improve
> readability and maintainability. This addresses technical debt related
> to magic numbers and ambiguous array usage.
> 
> The original implementation used a multi-purpose 2D array (ICS[8][15])
> where magic numbers were prevalent and the first element of each row
> was overloaded as a status flag. This patch:
> 
> - Introduces descriptive macros: BSS_COEX_MAX_CLASSES,
>   BSS_COEX_MAX_CHANNELS, and BSS_COEX_MAX_INFO_LEN.
> - Splits the overloaded array into two distinct boolean arrays:
>   'class_active' (for group status) and 'ch_present' (for channel data).
> - Converts the logic to use 'bool' types and 0-indexed loops,
>   conforming to standard C programming practices.
> - Adds defensive boundary checks (ch > 0 && ch < MAX) to ensure
>   robustness against unexpected channel data.

That's a lot of different things all in one single patch.  SHouldn't
this be split up into different ones?

And did you use AI to generate this patch?

Also, how was this tested?  What prompted you to want to make this
change in the first place?

thanks,

greg k-h

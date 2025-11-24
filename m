Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4119644B;
	Mon, 24 Nov 2025 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002770; cv=none; b=YVjV0h4t68+LaKMgrOvrV1EZkPHGrr8lfx+9ZHrv6QXUehA/WwsHb54OiPimE+Dz4OSGU5xLCwkFd7KMlD813akbcPY5iAJjaSCgTUHFCr+c/S73uPkcCgnCB3amv/6zi2TaWJ0g0jmDAEr9KsXDEkJOP+TM6zGT06dlTJ+U1kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002770; c=relaxed/simple;
	bh=mo5ynU6jkAVulzxYjeqG5pPSzIwTkHlX7ql1baxISD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoGuPThceYAs/SABd+VRWhhuxcjYo/Lsvh2aflIEFZpwkvF0WAZrVHew6QsDkHvDLxC0jOHC9Mo+JTmuOXmpyVgsAdtBok32DN/LVzFCP6LXKcGC3NI3+0qLHh6Kyhi05Vuz/UBKRrq0PnpHRQPNbl2Tk4dYoVeAcfdELBwcqig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JsHJYQli; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JsHJYQli"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3B7C116C6;
	Mon, 24 Nov 2025 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764002770;
	bh=mo5ynU6jkAVulzxYjeqG5pPSzIwTkHlX7ql1baxISD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsHJYQliG5df4SZliim8L3roj/hvGPL3ImOrPpVGJrNylpL6FLLAhAzTqDxcikPYk
	 WKbvLoORHzb6pR8/YoUmv9DZ05cxwpITMkDoW/t82aXq1fA/I7S39ie5Ljt1Peitxn
	 IsFSzRP/VYtBEaQGnaLSbLpTsS871Dh/RaQxVr98=
Date: Mon, 24 Nov 2025 17:46:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryant Boatright <bryant.boatright@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH v2 0/3] Checkpatch cleanup patches
Message-ID: <2025112402-deluge-bristle-70ac@gregkh>
References: <cover.1762803720.git.bryant.boatright@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1762803720.git.bryant.boatright@proton.me>

On Mon, Nov 10, 2025 at 07:48:19PM +0000, Bryant Boatright wrote:
> Correct camel case names reported by checkpatch.
> 
> These patches are not required to be applied in any order.
> 
> Bryant Boatright (3):
>   staging: rtl8723bs: Rename camel case enumeration
>   staging: rtl8723bs: Rename camel case argument
>   staging: rtl8723bs: Rename camel case variiable
> 
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 40 +++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
>  drivers/staging/rtl8723bs/include/ieee80211.h |  6 +--
>  3 files changed, 24 insertions(+), 24 deletions(-)
> 
> -- 
> 2.43.0
> 
> 
> 

What changed from v1?

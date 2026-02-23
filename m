Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA60155757;
	Mon, 23 Feb 2026 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856559; cv=none; b=h7nAvVU0NLlM1HKGOIFoe1Z/rnKDldD6Y0K8HgcQeQ/lEHEDJMgOISd3BHLEtZteCBtin8J1ozqPbIDmAyJhhB7y13gY0h5yEH8Yktjo2RssHQGXtQVt58EYbdMckC8Ah5/9mVXgvsFS6WJRImshQUqACp+brR//+qFOE0Umb6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856559; c=relaxed/simple;
	bh=7FTPAZ0kbS82j3+Jx5adpTTWZ3AgyIFGdJ7cCuQlw8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmSYyaStase3JO5worLttFgVRFamX+cZoRlpPOx2k2BbYGXfE7TyRGs7PpXPaLOF8rZNQ0sas4F9wVqOhxJyyc1j+bysyXLktgN1ZJYgCyQpBTHZTyi5dQwWxfGF8aDPBPu6Dx7UbwBL1/61xs5a3ddesRYnEwwCxXCmKg7le2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1yWgPt5m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1yWgPt5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6701DC116C6;
	Mon, 23 Feb 2026 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771856559;
	bh=7FTPAZ0kbS82j3+Jx5adpTTWZ3AgyIFGdJ7cCuQlw8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1yWgPt5mzM0pGtmQvtfXwYHCU9Sw2cX7pPqGvl3wGSAe1eeAA68Fp1ICdNqJYxeWn
	 /FifkKWXywi2mZa3gU6wH7SvHyiN8G+W6Ex2rrwCXKBBwHzjngx4F/svCxs79jc1V3
	 slOsRTidX4dhTjn2VFepWnCsT+Tw7xYk+G1HMKzc=
Date: Mon, 23 Feb 2026 15:22:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Azamat Rakhim <azamatrakhim8@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use u8 instead of unsigned char in
 get_rate_set()
Message-ID: <2026022343-outage-synthesis-4d62@gregkh>
References: <20260209180303.53957-1-azamatrakhim8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209180303.53957-1-azamatrakhim8@gmail.com>

On Mon, Feb 09, 2026 at 11:03:03PM +0500, Azamat Rakhim wrote:
> Replace "unsigned char" with "u8" to address the driver's TODO.

What exact TODO line is that?  Why is it necessary to change these
variables here, you do not explain that.

thanks,

greg k-h

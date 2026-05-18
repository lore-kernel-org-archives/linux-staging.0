Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC589363C5A;
	Mon, 18 May 2026 06:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084013; cv=none; b=jfjyUdejF0nlAcrZ33RXt1WHLcdpF52e95sXrqYwYmlI+NtHX4Ejgi+WrjPle7bC0p6pyKRIbUi3VTX+dUNv8z2I7js22FlPzyEihdFkybJWQZ+VQGQup09LuHOHEt5RIpQj2PbqYncPZGRG6hY/0FrIiQamA2R3n0bzMkMDJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084013; c=relaxed/simple;
	bh=s+Fb/HL3xDl7BLwv6dRg8Ck/m57YOSs3ZCsFn4SEprI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X03CN8AowTz7vs2Q9ZmKJgOvK3xPYC6SGGOzz4WcwApasb0TRx0Xb1gHE1Go0CYtceF8hh/lWBXXGpL7VnIxEMdsrYzItaMNEhngmAryTig+DrUwl30h3/M05zg7zGDfK2MIR72RGILie0t5OiVGc4vcZZVHHNh47r6cLicrEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mxB1us8T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mxB1us8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461BFC2BCC6;
	Mon, 18 May 2026 06:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779084011;
	bh=s+Fb/HL3xDl7BLwv6dRg8Ck/m57YOSs3ZCsFn4SEprI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxB1us8TFhod08edi2sfFAiN8pYMTsTXCVWhs6y+h3zgnjpW9ZUs3fOTlDVbGEYNW
	 azVkryu63EbDWhWIrIIqTc/p0wu1qjl81PiVjl2fraj46tudAGRt+h556cC5nRBk+4
	 1qr3V2c5+VKF+LOgDR+G4XitBtb3jfe5bmyxoxT4=
Date: Mon, 18 May 2026 07:59:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <error27@gmail.com>
Cc: shayderrr <darknessshayder@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: octeon: fix carrier state, null guard, and
 modernize phy ioctl
Message-ID: <2026051814-sample-overdrive-dd05@gregkh>
References: <20260517141955.79666-1-darknessshayder@gmail.com>
 <agqpefJAG-QMcM0_@stanley.mountain>
 <agqpuWWTFYfnmW3Y@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agqpuWWTFYfnmW3Y@stanley.mountain>

On Mon, May 18, 2026 at 08:55:05AM +0300, Dan Carpenter wrote:
> Oh flip.  This is octeon.  It's a MIPS thing.  No way you are
> actually testing this.  I bet this is all AI.

Yeah, it didn't even build :(

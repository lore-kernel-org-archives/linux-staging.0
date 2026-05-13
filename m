Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980313D4128;
	Wed, 13 May 2026 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656366; cv=none; b=HN7aol4oKFkGBAlmyaju8pueadUxes1pldFPOeyOGKhNa5nFfsD0R173yy6kP1oTlA9M0ChY2XmDfv2NsHm0sxXTp8j3cm6vzZJNNpsXZhK3fbizvjIhZB8lzFwAOvrng6hs+dE+8P0yRywCDesQMATkgYB0qLeTwpwSg9X2ytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656366; c=relaxed/simple;
	bh=v+gH2auDX7A95ccsKXO4+9GOZcopye7rYYle1HrrAdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EreDJtjSS3uw37AQfeQd4VkUb7QSb3eDzFhzlWLQ48XxZcPVn1e6/jumB0SJrIVdBkGzmsYl4Crgq2JMSetpZBG0d0pIg1/ozTfB8OAx/T/dlLMN1B20QDP69Hlhth63T7mydXUBdsQmZEzpbfhyR5Jy10mbHW/1PuXfTuUyfIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vt0B4zTr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vt0B4zTr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF637C2BCB7;
	Wed, 13 May 2026 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778656366;
	bh=v+gH2auDX7A95ccsKXO4+9GOZcopye7rYYle1HrrAdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vt0B4zTrq0kNynA9SyK8CaFopjygrqz6q3XMr9pu61vJL+Xjdur2I6CW18dS4SEHn
	 trtw6zHcCCY3euG2YuLT/lrJoysSgqsaG/ZClOmHNVA/oGZ0Uf7lJVz/6iTrLv+3ZO
	 1qK74ArGIjHldwf0ipbaYgi48iLhU/YwPnWFq264=
Date: Wed, 13 May 2026 09:12:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Shaw <shawharshit116@gmail.com>
Cc: andriy.shevchenko@intel.com, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] staging: fbtft: convert sysfs attributes to use
 ATTRIBUTE_GROUPS
Message-ID: <2026051350-puzzle-putdown-40f1@gregkh>
References: <20260513064257.1238-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513064257.1238-1-shawharshit116@gmail.com>

On Wed, May 13, 2026 at 06:42:57AM +0000, Harshit Shaw wrote:
> Replace direct device_create_file() calls with the correct
> ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
> driver structure so the driver core automatically adds and removes
> the sysfs attributes when a device is bound or unbound.
> 
> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>

No, the robot did not report this problem :(

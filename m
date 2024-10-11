Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09551F4FD8;
	Fri, 11 Oct 2024 04:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621645; cv=none; b=QgZgn/1KMa7+595udihQZR9LzBNOhIZK1QZk1GcfQ++o8qrl6CCJcmAE9QnOIdgaWs+1WE9d69HSmUd0Qy3DYtCn7Ax4eXow2bsdVeyX8H+DbCi3f5p4M518RVg17F5VGJd5+A6/9yotfextZSPbry5jHEKhouWlLz4H9m42WyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621645; c=relaxed/simple;
	bh=bp6RkYNXwFrkU9oUwRZiRw2nCvBY8jOTnGWO4ymrtII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evwodZTeFMiLv0axoVvNYgydjFR6bBvxnJL+hlamk5WqFqybSMtLuCKeZoclB+lxW9+3mvt0EEjVmq3NQJneuZEB226OQRUQlBq8mnJT83s3QALQsFpIDJt3TdY9G9G776J0jq6a1lVDLpmxcZaWzqkeaVvHkolkkObyHCYILMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UdHpogs7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UdHpogs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C444C4CEC7;
	Fri, 11 Oct 2024 04:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728621645;
	bh=bp6RkYNXwFrkU9oUwRZiRw2nCvBY8jOTnGWO4ymrtII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdHpogs7Yiep4koHAWQKSqE+6i+tu1k40qUj2+uz/vTuKrPSfJpx0wZ7WOXB2luXb
	 VpD2kXJHaaLtfL1gC5xY3s9ooNgNR/GyMMSrRMF8WOjkt47GUaMXkFQ6a/tCH6E0gS
	 kN1fhF+axfoCuWH+G7GCBclhpPsn7pJmdQFUJe5o=
Date: Fri, 11 Oct 2024 06:36:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/5] staging: vchiq_core: Reflow long lines to 80 columns
Message-ID: <2024101117-drew-repulsion-ef6f@gregkh>
References: <20241010102250.236545-1-umang.jain@ideasonboard.com>
 <20241010102250.236545-4-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010102250.236545-4-umang.jain@ideasonboard.com>

On Thu, Oct 10, 2024 at 03:52:47PM +0530, Umang Jain wrote:
> In order to respect the coding style, wrap long lines in vchiq_core.c
> to fit in 80 columns.

We can go longer than 80 if you want.


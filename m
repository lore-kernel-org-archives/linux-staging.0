Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B1125AC;
	Wed, 18 Oct 2023 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K8ihN9k4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B330C433C8;
	Wed, 18 Oct 2023 08:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697617602;
	bh=FYY5Pw0Y+SetLQv/94Izx/Ga9lYCUK/a+v2DG8+qr3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8ihN9k42Q+zy47NN7jjfBSBCf75PLtqJUOxonlKVPQ7Uc2VVf9w/cCYWm8Idmpye
	 j1pMGnF15msUWEOw1DstX5nhc7LJc34NrUSGx2TGp84nCRjMmICfmtM9HRNk4tKoLK
	 EpUawOspUieZOKkL8SZdod8Hi1pvuJ6V9ri3vdd0=
Date: Wed, 18 Oct 2023 10:26:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dorcas AnonoLitunya <anonolitunya@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	dan.carpenter@linaro.org, andi.shyti@linux.intel.com,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Staging: sm750fb: Rename
 display_control_adjust_sm750LE
Message-ID: <2023101817-cleat-attendee-8884@gregkh>
References: <20231018080416.25931-2-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018080416.25931-2-anonolitunya@gmail.com>

On Wed, Oct 18, 2023 at 11:04:08AM +0300, Dorcas AnonoLitunya wrote:
> Rename function display_control_adjust_sm750LE to
> display_control_adjust_sm750le. This further enforces snakecase naming
> convention for consistent naming style throughout entire file.
> 
> This change was suggested by Andi Shyti <andi.shyti@linux.intel.com>

Please use the "Suggested-by:" tag for this.

thanks,

greg k-h

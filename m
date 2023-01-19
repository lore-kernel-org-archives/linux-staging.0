Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF46FC2
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 12:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F20CC433EF;
	Thu, 19 Jan 2023 12:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674130491;
	bh=CG8mfmfOWM+5nGB+yTL4n2ztHake1TEnvVAcm3gH9lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZizQ1ikMohqI25dF0gqmRcuHtjrZtwFqn6zaPhuhcHEe60u15DNqrGjVykpXRz0D
	 /MKRqV1ADdCpUQ5LILfutfGTEgzmFYebPivszr5vWx7gN0HHRJxF1+Qxtk3rIJopzU
	 58azpQbSUKWiKoAJ4UDxFMsnAGLZ60+RCf0TIigI=
Date: Thu, 19 Jan 2023 13:14:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 1/6] staging: vc04_services: Drop __VCCOREVER__
 remnants
Message-ID: <Y8k0OTYJ1hZ5L6O/@kroah.com>
References: <20230119115503.268693-1-umang.jain@ideasonboard.com>
 <20230119115503.268693-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119115503.268693-2-umang.jain@ideasonboard.com>

On Thu, Jan 19, 2023 at 05:24:58PM +0530, Umang Jain wrote:
> Commit 8ba5f91bab63("staging: vc04_services: remove __VCCOREVER__")

Nit, you need a space before the '(' character :(


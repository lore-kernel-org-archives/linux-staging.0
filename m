Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A46156CA
	for <linux-staging@lists.linux.dev>; Tue, 20 Jun 2023 14:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01C9C433C0;
	Tue, 20 Jun 2023 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687270710;
	bh=OeEz2tijAZvrCEACa8lKFXkp/VG+HjklbwwH/8dtI1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyPNbTD2K+CLX+1/qZuwjr+kkkPE3G/xUO8w8u0ly0O7RasjLLoFPChsMT7Dbu4j3
	 DlWSXpnjmln+w5uFkJofTlqJS0qPOf7jaLq+V/t16XG3oho69OZ1nGZ4igPcmtUGtu
	 2KUjXbd+80I9q4+n2s8VeGV3muAtYMkm869RJdLQ=
Date: Tue, 20 Jun 2023 16:18:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stefan.wahren@i2se.com,
	f.fainelli@gmail.com, athierry@redhat.com, error27@gmail.com,
	dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v7 0/5] staging: vc04_services: vchiq: Register devices
 with a custom bus_type
Message-ID: <2023062010-sandblast-senate-a00c@gregkh>
References: <20230620134152.383569-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620134152.383569-1-umang.jain@ideasonboard.com>

On Tue, Jun 20, 2023 at 07:11:47PM +0530, Umang Jain wrote:
> The patch series added a new bus type vchiq_bus_type and registers
> child devices in order to move them away from using platform
> device/driver.
> 
> Patch 1/5 and 2/5 adds a new bus_type and registers them to vchiq
> interface
> 
> Patch 3/5 and 4/5 moves the bcm2835-camera and bcm2835-audio
> to the new bus respectively
> 
> Patch 5/5 removes a platform registeration helper which is no
> longer required.

License issues asside, this looks very good, thanks for doing this!

greg k-h

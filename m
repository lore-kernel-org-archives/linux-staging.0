Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563617E
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 00:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hgtyWgrVOpmdmBa6/UWlG/v6XpfBN1v67jaf5tLg9qg=; b=SED0Ys76AN59Hhjl7xEtkgFU77
	W8zDTGxY/zNGqf6rFnlu+XLYHRVgv8Uk/q2UXS04NipZJCa/S1omiuOrS3cQMiVZYNSJudypVHnov
	0Xzvj0UGZUDIfifRlTzQC3SS1oKPOgDo/n3YROybZdFhsari44CexGBzR/BdKUUZ0xdo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ovpAO-002kGK-91; Fri, 18 Nov 2022 01:23:36 +0100
Date: Fri, 18 Nov 2022 01:23:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Dan Carpenter <error27@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/3] vc04_services: mmal-vchiq: Use bool for
 vchiq_mmal_component.in_use
Message-ID: <Y3bQiDw11t4pRokP@lunn.ch>
References: <20221117160015.344528-1-umang.jain@ideasonboard.com>
 <20221117160015.344528-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117160015.344528-3-umang.jain@ideasonboard.com>

>  struct vchiq_mmal_component {
> -	u32 in_use:1;
> +	bool in_use:1;
>  	bool enabled:1;

The patch you referenced says:

+If a structure has many true/false values, consider consolidating them into a
+bitfield with 1 bit members, or using an appropriate fixed width type, such as
+u8.

The code did exactly this, using two bits fields, in one u32. A bool
probably takes up 4 bytes, maybe 8 bytes, so this change probably
doubles the storage size for these two fields. Are these fields on the
hot path, where an extra AND instruction would make a difference?

    Andrew

Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D71C3208
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 16:26:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC5884DD;
	Wed, 11 Jan 2023 17:26:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1673454409;
	bh=XcChrOCe2/CPzRm4LhKPTJOLcZhk/V1PHjwC3XbavZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W39L8WLLnnWyqGIk0zc+ZGVYnUCgVZ1pDnf7y7QPKzzGbHP9Jebduh2+CTlMWhveV
	 B9Ny/ZlOxV4tLfy8E/9zbvDWPAUrK2abv/wgKw83Qe6KShBM3C2gysnVtve2cTIEd6
	 Z5nVNYxgdQTLM9pr/5hB7VktuEAwuZstHbKZeuOo=
Date: Wed, 11 Jan 2023 18:26:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Kees Cook <keescook@chromium.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 0/7] staging: vc04_services: Remove custom return
 values
Message-ID: <Y77jR5i+q9Flu0si@pendragon.ideasonboard.com>
References: <20221223122404.170585-1-umang.jain@ideasonboard.com>
 <ba52e6b4-33ec-622e-00b6-1b098f529a90@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ba52e6b4-33ec-622e-00b6-1b098f529a90@ideasonboard.com>

Hi Umang,

On Wed, Jan 11, 2023 at 02:32:17PM +0530, Umang Jain wrote:
> Hi all,
> 
> Gentle ping for review, If it's needs more iterations or ready to be 
> accepted...

I see that Stefan has tested the whole series. Florian is listed as the
maintainer for vc04_services. Florian, do you want to review this series
further, or can we merge it in v6.3 ?

> On 12/23/22 5:53 PM, Umang Jain wrote:
> > The series removes the custom return values from functions
> > and replaces them with linux error codes. This address the TODO
> >   vchiq interface:
> > * Get rid of custom function return values
> >
> > Changes in v3:
> > - Drop fixes tag for 5/7 as suggested in review
> > - Add Tested-by: by Stefan Wahren to the series
> >
> > Changes in V2:
> > - Patch 3/7 now reports for specific errors like -ENOMEM, -EHOSTDOWN
> > - Patch 5/7 reports -ENOTCONN instead of -EINVAL and adds a "Fixes" tag
> >
> > Umang Jain (7):
> >    staging: vc04_services: Replace vchiq_status return type to int
> >    staging: vc04_services: Drop VCHIQ_SUCCESS usage
> >    staging: vc04_services: Drop VCHIQ_ERROR usage
> >    staging: vc04_services: Drop VCHIQ_RETRY usage
> >    vc04_services: vchiq_arm: Drop VCHIQ_RETRY usage on disconnect
> >    staging: vc04_services: Drop enum vchiq_status remnants
> >    staging: vc04_services: vchiq: Drop custom return values from TODO
> >
> >   .../bcm2835-audio/bcm2835-vchiq.c             |  12 +-
> >   .../include/linux/raspberrypi/vchiq.h         |  65 +++---
> >   drivers/staging/vc04_services/interface/TODO  |   5 -
> >   .../interface/vchiq_arm/vchiq_arm.c           | 124 +++++-----
> >   .../interface/vchiq_arm/vchiq_arm.h           |  12 +-
> >   .../interface/vchiq_arm/vchiq_core.c          | 216 +++++++++---------
> >   .../interface/vchiq_arm/vchiq_core.h          |  18 +-
> >   .../interface/vchiq_arm/vchiq_dev.c           |  36 +--
> >   .../interface/vchiq_arm/vchiq_ioctl.h         |   8 +-
> >   .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  11 +-
> >   10 files changed, 246 insertions(+), 261 deletions(-)

-- 
Regards,

Laurent Pinchart

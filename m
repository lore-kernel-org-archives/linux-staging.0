Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C782F3E
	for <linux-staging@lists.linux.dev>; Fri, 10 Feb 2023 16:40:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02CBC904;
	Fri, 10 Feb 2023 17:40:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1676047211;
	bh=YaEKwCTJmUWz47HnY5YY9HGLud9/ahYQqA9BKuV/rRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGi1/EeUUlPsNDIgKQIQImd8l9UZUq9LErfsnNvPk9AJQ2gfC/nOFAsrRDESGHoj5
	 d9byTqjMEbuozHAmdqHhJP8Tz4tVFZ6bJTIGkbctR6ws6OtfZ25MqwoQIH9j56jdCw
	 lZYl0XxRP31g78wkuroySE0DgOmDGMsuJvNWAito=
Date: Fri, 10 Feb 2023 18:40:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+ZzacLYENgnrQaq@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>

Hi Sakari,

On Fri, Feb 10, 2023 at 02:26:31PM +0200, Sakari Ailus wrote:
> On Fri, Feb 10, 2023 at 01:45:10PM +0200, Laurent Pinchart wrote:
> > Regarding the width-specific versions of the helpers, I really think
> > encoding the size in the register macros is the best option. It makes
> > life easier for driver authors (only one function to call, no need to
> > think about the register width to pick the appropriate function in each
> > call) and reviewers (same reason), without any drawback in my opinion.
> 
> As I noted previously, this works well for drivers that need to access
> registers with multiple widths, which indeed applies to the vast majority
> of camera sensor drivers, but not to e.g. flash or lens VCM drivers. Fixed
> width registers are better served with a width-specific function. But these
> can be always added later on.

I still fail to see why they would be *better* served by custom functions.

-- 
Regards,

Laurent Pinchart

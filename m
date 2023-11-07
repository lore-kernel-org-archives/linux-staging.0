Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E559470;
	Tue,  7 Nov 2023 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RN61/wE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FE1C433C7;
	Tue,  7 Nov 2023 06:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699337714;
	bh=w5+ZkUz67F+5dGuiLEvmF9AeKTHXzmhfIbFm4urkvks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RN61/wE/Lzv8JyRARpOQddGs9GQfDJg7sK5FwUxB7Q3SsuMTiyHcs+ywGXtMhXOUF
	 rJg1i0CWlOlR0WolURz1RZHbdBoX5BN7gZaLLm5HMfC3oEC+2I/cLxUAlb4PnjojZP
	 /Ep5bkAQ3Zt9c3z8JAfOO+fb/eG8YPG5uY01ylmg=
Date: Tue, 7 Nov 2023 07:15:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jack Zhu <jack.zhu@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	changhuang.liang@starfivetech.com
Subject: Re: [PATCH v11 0/9] Add StarFive Camera Subsystem driver
Message-ID: <2023110745-tableful-trapezoid-4206@gregkh>
References: <20231025031422.3695-1-jack.zhu@starfivetech.com>
 <15ef0a70-734e-280a-f014-41914a55d8cf@starfivetech.com>
 <a3a2c179-2cbe-5a55-a21e-b45abfb6d494@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a2c179-2cbe-5a55-a21e-b45abfb6d494@starfivetech.com>

On Tue, Nov 07, 2023 at 11:27:27AM +0800, Jack Zhu wrote:
> 
> 
> On 2023/10/31 9:09, Jack Zhu wrote:
> > 
> > 
> > On 2023/10/25 11:14, Jack Zhu wrote:
> >> Hi,
> >> 
> >> This series is the v11 series that attempts to support the Camera Subsystem
> >> found on StarFive JH7110 SoC.
> > 
> > Hi Hans and Laurent,
> > 
> > Could you please help review the code?
> > Thank you for your time!
> > 
> 
> Hi,
> 
> Could you please take some time to help review the code? Thank you so much!

It is the middle of the merge window, no new code can be added to any
maintainers tree at this point in time, please relax there is no rush or
deadline at all here.

While you wait, why not help out and review other patch submissions from
other developers, which will help your changes get to the top of the
queue?  That way everyone's load is reduced and you are not just asking
for others to do work for you with nothing in return.

thanks,

greg k-h

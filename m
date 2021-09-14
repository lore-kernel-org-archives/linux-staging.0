Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451F3FC4
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 04:35:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B700610FB;
	Tue, 14 Sep 2021 04:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631594128;
	bh=ra6VTPUM7uTTtmDygf40MfCsvK85UJSZXairSp1Afw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlJW+Ls3DHrP1M+25UIiAWFMI1sgcPatogBzjaVTF7a0gdjs6MhNLs6UllPISyA8N
	 RfLZ2qk8Acohuhg9pus4YjAC+J3Mp8YH5+fHfk5Y1bqBXVxgGE7v4e+WeqaA8ORgfI
	 zI1seoxdssPKyrB2Gf3mb51Gd2yz7+AKliKCyy48=
Date: Tue, 14 Sep 2021 06:35:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sidraya Jayagond <sidraya.bj@pathpartnertech.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, prashanth.ka@pathpartnertech.com,
	praneeth@ti.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 03/30] v4l: vxd-dec: Create vxd_dec Mem Manager helper
 library
Message-ID: <YUAmeLYf/fvbCHo3@kroah.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-4-sidraya.bj@pathpartnertech.com>
 <20210824133438.GO1931@kadam>
 <20210914034032.orctp5ov5oc33vag@sidraya-laptopU>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914034032.orctp5ov5oc33vag@sidraya-laptopU>

On Tue, Sep 14, 2021 at 09:10:37AM +0530, Sidraya Jayagond wrote:
> This
> message contains confidential information and is intended only 
> for the
> individual(s) named. If you are not the intended
> recipient, you are 
> notified that disclosing, copying, distributing or taking any
> action in 
> reliance on the contents of this mail and attached file/s is strictly
> prohibited. Please notify the
> sender immediately and delete this e-mail 
> from your system. E-mail transmission
> cannot be guaranteed to be secured or 
> error-free as information could be
> intercepted, corrupted, lost, destroyed, 
> arrive late or incomplete, or contain
> viruses. The sender therefore does 
> not accept liability for any errors or
> omissions in the contents of this 
> message, which arise as a result of e-mail
> transmission.
> 

Now deleted, this is not ok for kernel development mailing lists, sorry.

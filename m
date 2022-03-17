Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559E3D79
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 08:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6A2C340E9;
	Thu, 17 Mar 2022 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647507558;
	bh=EWChIzJkgY5d540zO+UopZGnj4MNOCPPUP0Taqlpef0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ct2w2N6rqGNm15PnsgpYVawXUNfaEOaNaDSzfguAPqyO4NUrNNkftn8joBhVPouJz
	 uqcJXkVcd0QOP4LJuWonbmYrymuNqU7/gZmXN/NI7jcuBIZD2PVpJ/DFimHnB1mWOE
	 mTkFsLnOoD1SMhi5w/n7Zxg9myEJvdwhqtI7P8ls=
Date: Thu, 17 Mar 2022 09:59:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <YjL4Y2l6oOabjmpX@kroah.com>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLiC82wSBO1oUIq@kroah.com>
 <PAXPR02MB7310E037FFE7E641C582F67381129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLolEqaRgZKawHl@kroah.com>
 <PAXPR02MB7310A489D636D9BE75108CAC81129@PAXPR02MB7310.eurprd02.prod.outlook.com>
 <YjLy5wHtdYZvUU8t@kroah.com>
 <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB73100E24FCE4E04B45F9285781129@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Thu, Mar 17, 2022 at 08:52:37AM +0000, Czerwacki, Eial wrote:
> >> >What tasks?
> >> support of other information bits like stats
> >
> >I have no idea what that means :)
> in short, the hypervisor can provide stats it collects, future implementation will export that too

The trick will be _how_ you export this information.  Let's wait on that
one for now, your current api has lots of other questions to work out
first :)

thanks,

greg k-h

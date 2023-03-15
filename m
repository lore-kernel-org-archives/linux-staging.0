Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D459120EB;
	Wed, 15 Mar 2023 04:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279AAC433EF;
	Wed, 15 Mar 2023 04:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678856096;
	bh=O6RvoiLqHVNWRlSjoPOvDZ5ZcrH3mZW23TYkGULvn3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U15aTW7BWM4GlSJ5BzvFARwMFMG05aoqqP/ez5goSdwMrrp45aOkyOsp52/xmXXTS
	 AdJdJzKg2oNEiB0lQ6PFJvLrUezvjy86NUf1LkFDboQCQj4YyWpD1fDGxc/mfHueSd
	 a44h7EzshjETQuloFfVCUD63NCHBYdoeLACvnSUs=
Date: Wed, 15 Mar 2023 05:54:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Kloudifold <cloudifold.3125@gmail.com>,
	teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Message-ID: <ZBFPnZbvdI46Ah6r@kroah.com>
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld>
 <ZA/+JlgWfdg2wH8B@debian.me>
 <ZBCS7DR9dZH1yds8@aschofie-mobl2>
 <5fd67671-8e21-ffa8-8571-d8b5533b4758@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fd67671-8e21-ffa8-8571-d8b5533b4758@gmail.com>

On Wed, Mar 15, 2023 at 10:08:27AM +0700, Bagas Sanjaya wrote:
> On 3/14/23 22:29, Alison Schofield wrote:
> >> Fixes: <commit that introduces these camelcase function>
> >> ```
> > 
> > Why are you asking for a Fixes tag on this? 
> > Seems unusual for a staging driver cleanup.
> > 
> 
> I thought this style cleanup also warrants Fixes: since
> it fixes coding style problem on existing code (see
> Documentation/process/submitting-patches.rst).

No, sorry, Fixes: is for real bugs, not style issues.

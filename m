Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC642F21;
	Fri, 31 Mar 2023 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AD2C433D2;
	Fri, 31 Mar 2023 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680280658;
	bh=rpn0aLZZyLJNIeR40vbvDAzKh4f+LRfLgAGGwtXN9KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFruFnS8gZziMITmGQpDmNs6X0npQ51CLuaO4FzflwasON1GwnWRJFJ7Ob/tKUY47
	 TfmNg361Od75L2e4Qr8wnDZYCWitIitY3aJkAzG1OeQHZiwWZXvrhfXy3oYJeFZB0B
	 MfJETPD0W1veiGBS/9MOaYrHMV+/tBT2UI6WfICw=
Date: Fri, 31 Mar 2023 18:37:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alison Schofield <alison.schofield@intel.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Kloudifold <cloudifold.3125@gmail.com>,
	teddy.wang@siliconmotion.com, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, sudipm.mukherjee@gmail.com
Subject: Re: [PATCH v4] staging: sm750: Rename sm750_hw_cursor_* functions to
 snake_case
Message-ID: <2023033117-shindig-grumbling-b99b@gregkh>
References: <ZBfro5U4s0lWA6tl@CloudiRingWorld>
 <ZBlov9bVs4pAJIlA@debian.me>
 <c561746c-6061-4c8e-8961-114a507d72e9@kili.mountain>
 <9c85a688-ef2c-4808-9aed-4acdefaed5f2@kili.mountain>
 <CAM44cXOB3kA03Ay6c5PO_eOkS7npa00A4mQnEj2ahubRPE+MDg@mail.gmail.com>
 <f56002cc-78a1-4972-b66a-b41f7bf124e1@kili.mountain>
 <CAM44cXOgi8pektFFF_sGWZED3LsiHkRPO3WP4skekNWJ+WY=KA@mail.gmail.com>
 <c8e69d93-48e3-4ff2-b684-115b3b501349@kili.mountain>
 <ZCcLKFgM15FY9U5S@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCcLKFgM15FY9U5S@aschofie-mobl2>

On Fri, Mar 31, 2023 at 09:32:40AM -0700, Alison Schofield wrote:
> Despite the fact that the driver is on it's way 'out', GregKH may
> have merged your patch, recognizing it as an Outreachy exercise,
> if it was otherwise correct. 

I did not merge it as it was not correct.

thanks,

greg k-h

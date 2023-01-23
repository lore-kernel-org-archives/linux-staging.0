Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE0D7C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:29:39 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1pK33c-0008P0-NC; Mon, 23 Jan 2023 21:04:44 +0100
Date: Mon, 23 Jan 2023 21:04:44 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] staging: r8188eu: always process urb status
Message-ID: <20230123200444.wrix3bldpalxzcgz@viti.kaiser.cx>
References: <20230110205626.183516-1-martin@kaiser.cx>
 <20230110205626.183516-5-martin@kaiser.cx>
 <bfbdb94f-c965-0b07-3539-c1a057e5b0b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfbdb94f-c965-0b07-3539-c1a057e5b0b4@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Pavel,

Thus wrote Pavel Skripkin (paskripkin@gmail.com):

> Not sure if it matters but we still have that weird rule that after 5 failed
> usb read/writes bSurpriseRemoved will be set to true

> Maybe also worth removing above logic?

thanks for making we aware of this retry counter. It does really look
strange. Still, I'm not sure that I understand this well enough to
submit a patch for removal. I'll play around with this as time
permits...

Best regards,
Martin

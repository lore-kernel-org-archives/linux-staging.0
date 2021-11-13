Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF152C80
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 16:21:52 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mlvmf-0001LT-Ji; Sat, 13 Nov 2021 17:21:41 +0100
Date: Sat, 13 Nov 2021 17:21:41 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] staging: r8188eu: remove haldata's EEPROMVID / PID
Message-ID: <20211113162141.dpqbmkiqb3qxgjo7@viti.kaiser.cx>
References: <20211111212644.9011-1-martin@kaiser.cx>
 <6997531.xZuqOj027S@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6997531.xZuqOj027S@localhost.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Fabio M. De Francesco (fmdefrancesco@gmail.com):

> On Thursday, November 11, 2021 10:26:38 PM CET Martin Kaiser wrote:

> > They are used only in a (disabled) debug print.

> > In practice, lsusb can be used to read the actual vid and pid.

> Hi Martin,

> You seem to have overlooked the usual rules for writing conformant commit 
> messages :)

> Please say "what" you did along with "why" you made the changes.

> Here, and in two or three other patches of your series, you forgot to 
> describe "what" you did. You actually wrote it in the "Subject" lines but, as 
> you know for sure, commit messages must be self-contained entities.

Hi Fabio,

thanks for the reminder. The commit message should indeed make sense
without the title.

> Also, it would be nice to have a cover letter and have all seven patches in 
> one thread in response to the above, even if it (AFAIK) is not strictly 
> required.

There wasn't a common topic in this series so I decided to add no cover
letter.

Best regards,
Martin

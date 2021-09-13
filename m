Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68113FC3
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 19:37:37 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mPrlm-0005hm-0V; Mon, 13 Sep 2021 21:37:34 +0200
Date: Mon, 13 Sep 2021 21:37:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] staging: r8188eu: power management cleanup
Message-ID: <20210913193733.nh5fijjo5jlsmqpk@viti.kaiser.cx>
References: <20210911141521.24901-1-martin@kaiser.cx>
 <YT96cYdbN/n5OY+S@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT96cYdbN/n5OY+S@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Greg Kroah-Hartman (gregkh@linuxfoundation.org):

> On Sat, Sep 11, 2021 at 04:15:09PM +0200, Martin Kaiser wrote:
> > Remove some unused parts of the power management code.

> > Tested with Edimax EW-7811Un V2 on an ARM32 embedded system.

> > Martin Kaiser (12):
> >   staging: r8188eu: btcoex_rfon is always false
> >   staging: r8188eu: setting HW_VAR_SET_RPWM does nothing
> >   staging: r8188eu: remove write-only variable cpwm
> >   staging: r8188eu: remove write-only variable tog
> >   staging: r8188eu: remove rtw_set_rpwm
> >   staging: r8188eu: remove unused power state defines
> >   staging: r8188eu: _free_pwrlock is empty
> >   staging: r8188eu: remove unused pwrctrl definitions
> >   staging: r8188eu: remove unused enum and array
> >   staging: r8188eu: rtw_set_ips_deny is not used
> >   staging: r8188eu: remove unused variable cpwm_tog
> >   staging: r8188eu: remove unused variable b_hw_radio_off

> I applied a subset of these.  Please rebase and resend the reset.

I sent a v2 of this patchset with the outstanding patches as a followup
to this set. I hope that this is generally the right thing to do after
the maintainer applies some patches of a set.

Thanks & best regards,
Martin

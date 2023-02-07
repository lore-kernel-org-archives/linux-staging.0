Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED720E8
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1675763243; bh=g4/MlD54hoVlfb5f3+4otpbQ8xO7M7nknqIn4LbkbkE=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=C67X4R2n+Mt4EeUsnRtHLrDrwYZ95u3CuFuEv0gpoSWaU7OYzVUzd1CQKxcBri2YG
	 M3qffdx/6fOUAcLzD9TMLSZ0xfVPZU/Wf8IW1O5n/n9TdIlxjijDyvXfq7c0RV6/wF
	 5OAKyQRqAJjaoHimtEQiPpMSrisR0M0POCFDIIGQ=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Tue,  7 Feb 2023 10:47:23 +0100 (CET)
X-EA-Auth: NarrQd7/0A2KqSoT3GYKGjyvJjywhpIQ4Ri8lz6vF5RChioLaik+B2udxnD5Qk887Dk/jYjk6RkUsOBV0E1aUglJh4pLTfEw
Date: Tue, 7 Feb 2023 15:17:19 +0530
From: Deepak R Varma <drv@mailo.com>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: vt6655: Macro with braces issue change to
 inline function
Message-ID: <Y+IeJ/j2fUqO4zKh@ubun2204.myguest.virtualbox.org>
References: <Y9/xXHvOAwfqoDxn@combine-ThinkPad-S1-Yoga>
 <3cb45313-209a-8190-12f8-6a2d49e4173b@wanadoo.fr>
 <Y+A+HF1vDeRIqye5@combine-ThinkPad-S1-Yoga>
 <Y+DL3O5lcMyZ/aNR@kroah.com>
 <Y+H9BT8Am4Ik2ZDA@combine-ThinkPad-S1-Yoga>
 <Y+IJgxF52lpgk0RC@ubun2204.myguest.virtualbox.org>
 <Y+IQs0sDfJ+rxsmq@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+IQs0sDfJ+rxsmq@combine-ThinkPad-S1-Yoga>

On Tue, Feb 07, 2023 at 09:49:55AM +0100, Guru Mehar Rachaputi wrote:
> On Tue, Feb 07, 2023 at 01:49:15PM +0530, Deepak R Varma wrote:
> > On Tue, Feb 07, 2023 at 08:25:57AM +0100, Guru Mehar Rachaputi wrote:
> > > On Mon, Feb 06, 2023 at 10:43:56AM +0100, Greg Kroah-Hartman wrote:
> > > > On Mon, Feb 06, 2023 at 12:39:08AM +0100, Guru Mehar Rachaputi wrote:
> > > > good luck!
> > > > 
> > > > greg k-h
> > > 
> > > Thanks for taking time.
> > > 
> > > If my understanding is correct, every version of the patch should
> > > include all the patches/patchfiles and it should explain what happened in each
> > > version(in decrement order) through a coverletter. Please correct me otherwise.
> > 
> > Hi Guru,
> > Other than the cover letter, each individual patch should also include the patch
> > version history in the descending order. If a specific patch(es) that is/are
> > part of a patch-set, did not have any change, we should still increment its
> > version and record "none" as the change in current version for such patches.
> > 
> > However, from the patch-set, any patches that are acked, do not need to be
> > resent along with other patches that are still under revision. But do mentioned
> > about such accepted/acked patches in the cover letter.
> > 
> > Hope this helps.
> > 
> > Thanks,
> > deepak.
> > 
> > > 
> > > I do refer "first patch submission" and above is my current
> > > understanding.
> > > 
> > > -- 
> > > Thanks & Regards,
> > > Guru
> > > 
> > 
> > 
> Thanks for the info, deepak.
> Is is possible for you to share some reference that is easy to
> understand. It would be helpful.

Please read this: https://kernelnewbies.org/FirstKernelPatch#SubmitPatchSet

./drv

> 
> -- 
> Thanks & Regards,
> Guru
> 



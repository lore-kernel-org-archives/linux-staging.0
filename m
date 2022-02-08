Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E52F24
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 08:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3747C004E1;
	Tue,  8 Feb 2022 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644308789;
	bh=/iDMh8+8sXpSoskjRDDOyzMOhIrAveqBuI41oF00f0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=16W82cPIbXPFkpzimXgu9NmUmCFY4ZtIJfNGxLuiwXWjhp2fhZW5crJL0O73SwSj7
	 KT4qNty6mzdpvwSH10QOiOqvmWwdv5s3UvkTOA28GMvQY+RMhzzVjtlrvhAjlWK9Yy
	 XKiCwrmVVwDsH8QR0CYL2zVJ6IEo7c3ZpnzUyaoM=
Date: Tue, 8 Feb 2022 09:26:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	Leonardo Araujo <leonardo.aa88@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: r8188eu: core: 'associcated' may be misspelled
 - perhaps 'associated'?
Message-ID: <YgIpMuShlOamHV68@kroah.com>
References: <20220207234210.26097-1-leonardo.aa88@gmail.com>
 <2122312.NgBsaNRSFp@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2122312.NgBsaNRSFp@leap>

On Tue, Feb 08, 2022 at 09:09:10AM +0100, Fabio M. De Francesco wrote:
> On martedì 8 febbraio 2022 00:42:10 CET Leonardo Araujo wrote:
> > This patch fixes the following checkpatch.pl warning:
> > 
> > CHECK: 'associcated' may be misspelled - perhaps 'associated'?
> > 
> > Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_ap.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> "Staging: r8188eu: core: 'associated' may be misspelled - perhaps 'associated'?" 
> it's not the way patch subjects are created for inclusion in Linux.

I do not see anything wrong with this.  What do you think is not
acceptable?

> Please follow what is clearly described in the "Philosophy of Linux kernel 
> patches" document at https://kernelnewbies.org/PatchPhilosophy...

The in-kernel documentation describes this well also.

> "In patch descriptions and in the subject, it is common and preferable to use 
> present-tense, imperative language. Write as if you are telling git what to do 
> with your patch.".
> 
> It's not my job to accept or reject patches for this subsystem and I don't want 
> to tell you what to write but, if I were you, I'd send a v2 with a subject like 
> "Fix misspelled word in comments" (or something else similar to this subject).
> 
> Furthermore, please take note that the name of this subsystem is "staging" (it 
> is not "Staging").

Either is fine, I will not reject a change for an upper-case letter like
this.

> Decide by yourself whether or not the other two patches that you submitted this 
> morning have to be sent anew as v2 with due changes in the subjects.

I do not see a problem with this change at all, nothing needs to be
resubmitted.

greg k-h

Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE4441F;
	Sat, 22 Oct 2022 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666467954; bh=WUEJ8LIJXWvv1saHl+RLKcZFwmk9DIjuDaA5XV0CvcA=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
	b=lcNCARL43jASSGjMEKI92i+tlWApUTueOU+8pqNUtsO2k4bfCTMM5Ias3439r8S2S
	 qy/13+tuYIRXQFMwzj+ikrtpDvfKX7rUYrZtj+1XLjwxN/RTZRcsG14E1omHibr9t7
	 L2a6/7nSk64jFIl8CPR8g+gOCbOSaZ14vjRi7k/Q=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Sat, 22 Oct 2022 21:45:54 +0200 (CEST)
X-EA-Auth: hfqt9AylkVo773CYc4VKlOR4dKDu7bAeyIc2xThFM+Vr+cYgqcUPYhOm+GZmP6YtXcUmAoY7az6CAoijkSWgBCpvMp2vDe4e
Date: Fri, 21 Oct 2022 22:19:43 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH v4 00/11] staging: r8188eu: trivial code cleanup patches
Message-ID: <Y1LNpxJ6SaEJ8lo8@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666299151.git.drv@mailo.com>
 <Y1OkUMCNb4lMH6Km@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1OkUMCNb4lMH6Km@kroah.com>

On Sat, Oct 22, 2022 at 10:05:36AM +0200, Greg KH wrote:
> On Fri, Oct 21, 2022 at 02:56:10AM +0530, Deepak R Varma wrote:
> > Address different kinds of checkpatch complains for the staging/r8188eu module.
> > The patches are required to be applied in sequence.
> >
> > Changes in v4:
> >    1. Include patch 11 in the set for unused macro clean up. Suggested by julia.lawall@inria.fr
> >    2. Update patch 1 per feedback from David.Laight@ACULAB.COM
> >    3. Update patch 5 & 6 per feedback from dan.carpenter@oracle.com & julia.lawall@inria.fr
> >
> > Changes in v3:
> >    1. Patch 4: Extend the __constant_htons to htons change to other files of the driver.
> >       This was suggested by philipp.g.hortmann@gmail.com
> >    2. Patch 4: Spelling mistake corrected as pointed out by joe@perches.com
> >    3. Patch 5 through 10: Included in this version. Additional clean up patches.
> >
> > Changes in v2:
> >    I incorrectly labeled the first revision as v1 instead of v2. So,
> >    following change recorded under v1 is actually changes for v2. Feedback
> >    provided by philipp.g.hortmann@gmail.com
> >       1. Improve language / grammar for the patch descriptions
> >       2. Further improve code reformatting
> >
>
> I've taken these, but note, your email system is not properly being
> authenticated.  Here's the results I get when I use the tool 'b4' to
> apply the patches:
>
> Grabbing thread from lore.kernel.org/all/cover.1666299151.git.drv%40mailo.com/t.mbox.gz
> Analyzing 20 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   ✗ [PATCH v4 1/11] staging: r8188eu: use Linux kernel variable naming convention
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 2/11] staging: r8188eu: reformat long computation lines
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 3/11] staging: r8188eu: remove {} for single statement blocks
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 4/11] staging: r8188eu: use htons macro instead of __constant_htons
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 5/11] staging: r8188eu: correct misspelled words in comments
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 6/11] staging: r8188eu: Add space between function & macro parameters
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 7/11] staging: r8188eu: Associate pointer symbol with parameter name
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 8/11] staging: r8188eu: replace leading spaces by tabs
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 9/11] staging: r8188eu: Put '{" on the symbol declaration line
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 10/11] staging: r8188eu: Correct missing or extra space in the statements
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ✗ [PATCH v4 11/11] staging: r8188eu: Remove unused macros
>     + Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> (✓ DKIM/gmail.com)
>   ---
>   ✗ BADSIG: DKIM/mailo.com
> ---
> Total patches: 11
>
>
> Please look into fixing up your DKIM settings.

Hi Greg,
Yeah, there is some trouble with my email settings and I have already written to
the tech support.
I will also look DKIM authentication issue and let you know if I need further
guidance from you all.

Thank you for highlight it.


./drv

>
> thanks,
>
> greg k-h



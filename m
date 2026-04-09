Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A973C3C0E;
	Thu,  9 Apr 2026 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746939; cv=none; b=Q+ocBWnzw5Zr4hgbMvpTuuiMFMoWi6FncRfx0lp50I4p/y1LVFZGhCZcuwohe/Wd3IodeGC5zx89u5TOWFDeHJnei4CEzGMMI0BieD8CpLwgF/s6/bqF53w0L8DNM1pNgwDZzKNVHwz/nEqe3jwzfmrU6akakVBKZz3/MqziZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746939; c=relaxed/simple;
	bh=VcItRHFUhyOtf9pFz1qQ8djgACt9DkdlwAn6C6n8XTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZAC5KtJDJrl1n3RX/VZC8W5nLupEH8dEel3eIGOaXxsdwPa5l8G+PGG2ffSYZuJcDUZ2YABaImGKmiUB0zLK4JsBGsouoYVZAuWeGTwZIcRCzkWMPMIqQbWDSWrv9pPbcC0v3OQHM9p/M900HGdrDwdLkMNP03oj4/q9AVjHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OTnobPOc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OTnobPOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DFFC116C6;
	Thu,  9 Apr 2026 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775746939;
	bh=VcItRHFUhyOtf9pFz1qQ8djgACt9DkdlwAn6C6n8XTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTnobPOcXGACpGn5IolVsMHFoq3DgpM3al+FQjXpSWHwaq5ftTeoDtYQdu+f2dqFh
	 vbjqmF+pvEkeeEopXlg50QrPwdvRaQqf8QMVgZIQvFhjY+U3N63v4QolgXe9rW3O2N
	 LjwCZ35wRPrY48WrFqvL5yg2+zYkXCa8Wra/QaUU=
Date: Thu, 9 Apr 2026 17:02:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Prithvi <activprithvi@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com, tmimiharoen@gmail.com,
	filippo.muschera@gmail.com, ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com, rayfraytech@gmail.com,
	david@cardinalsystem.net, weibu@redadmin.org,
	dharanitharan725@gmail.com, ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org, karanja99erick@gmail.com,
	khushalchitturi@gmail.com, suunj1331@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, bryant.boatright@proton.me,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v4 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <2026040942-slicer-rake-4056@gregkh>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <DHOOTLM62TV2.2JOOAA5UQG410@linux.dev>
 <20260409145045.44r4f5bleklkk4ha@inspiron>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409145045.44r4f5bleklkk4ha@inspiron>

On Thu, Apr 09, 2026 at 08:20:45PM +0530, Prithvi wrote:
> On Thu, Apr 09, 2026 at 04:18:28PM +0200, Luka Gejak wrote:
> > On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> > > This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
> > > majorly focusing on fixing checkpatch warnings of constant being on right
> > > side of test in comparisons, deletion of empty if block ,use of
> > > read_poll_timeout_atomic(), and other code simplifications.
> > >
> > > Changes since v3:
> > > - Rebased the patches on top of staging-next
> > > - Remove compilation output from cover letter
> > > - Add changes in each patch version in cover letter
> > >
> > > v3 link: https://lore.kernel.org/linux-staging/1D11A73B-4869-47DB-B8F5-FB3F0D7FF932@linux.dev/T/#m3190af744bc1e1f151e9e8503c7d20951fe27534
> > 
> > ...
> > 
> > Hi Prithvi,
> > this seems better, but I have one question. Did patch series appear on 
> > mailing list to you, because I cant find it and my emails sent today 
> > don't appear either. Not to be misunderstood I don't believe this is 
> > your fault but I would like to know if you are experiencing the same 
> > problem.
> > Best regards,
> > Luka Gejak
> 
> Hi Luka,
> 
> I just observed I am also facing the same issue - I am not able to see the 
> patch series on the mailing list, no idea why :( However I received the 
> sent patches as well as your reviewed by tags on mail but I am not sure why 
> the patch series is not visible on the mailing list.
> 
> Shall I resend the patch series?

No, please wait, lore.kernel.org is currently having some problems.

But next time, trim your "who do I cc:" list, as it is _way_ too big,
how did you generate it?

thanks,

greg k-h

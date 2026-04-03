Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29303590AE
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 06:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775198449; cv=none; b=MbYCuN5/DxCV/lTzVpxwdbFQvDO2d+MzjKfnkZLTyvtJOysZhSpKNqMOi88KkuHN/E5/rEWRjQ6/C9TWNOVzfhjEQQ1EyQmrrPIOapr+dL2A57Z7wZLdgqtZSkeTGZi95CEb50iY+JyTpP7RD8fkQg5GS0Z4XyYLLpNd9nuxNPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775198449; c=relaxed/simple;
	bh=cd2CfPvUfDNGlw9FMZvdfjPfadX/LsHbb0MjBflYeOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktvHb+IWxwXpZXRaoh9zyQPLqS1VhcktE2UL1vwBydr/JXh64w662HjIkWXnaqIUqefRuJVPO98M1Iim3oHwkmPg628YZPEbDVj6wx8HLYrzx+HRt8dJ2q2VYAlfXAwSFB2BhcgDyLaDRyn8+iSBGfLUbPyxrwmBJMHaAA5l7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C7qCYJ11; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C7qCYJ11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F26C4CEF7;
	Fri,  3 Apr 2026 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775198449;
	bh=cd2CfPvUfDNGlw9FMZvdfjPfadX/LsHbb0MjBflYeOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C7qCYJ11/RWm+8ImRJuNTb/I2USgKMiZjS2KPDaTMBvAQi+NZCaxf7SJ190RP33Zf
	 5By/sW8Eu83YlxF2E38LooZs4jDlSmzbyCzftrVkvQPB6D2mdw4C88mYaM8LEP5ftf
	 uuDvb0aOw3P8lt4HCqIiXkqsaj7djAfRrYPPElEM=
Date: Fri, 3 Apr 2026 08:40:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Andrei Khomenkov <khomenkov@mailbox.org>,
	Luka Gejak <luka.gejak@linux.dev>,
	Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 0/6] staging: rtl8723bs: cleanup code and style
Message-ID: <2026040335-ipod-pregnant-d48c@gregkh>
References: <20260402150429.14761-1-khomenkov@mailbox.org>
 <DHIZW7VQ8J91.ON752XZ2E2L8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHIZW7VQ8J91.ON752XZ2E2L8@gmail.com>

On Thu, Apr 02, 2026 at 04:43:06PM -0500, Ethan Tidmore wrote:
> On Thu Apr 2, 2026 at 10:04 AM CDT, Andrei Khomenkov wrote:
> > This series of patches cleans up the rtl8723bs driver code to improve
> > readability and better aligns with the Linux kernel coding style.
> > The first three patches simplify boolean comparisons, and the next
> > three perform general code cleanup.
> >
> > I figured I needed to split the changes into directories, so I did
> > that. I also think each commit should do only one thing, so in the
> > last three commits, I fixed the style that wasn't related to the
> > logical changes with ' == true' and ' == false' that were in the first
> > three commits. However, if both the logic and the style need to be
> > fixed in the same commit, let me know, and I'll make v4.
> >
> > Link: https://lore.kernel.org/linux-staging/20260330184640.17795-1-khomenkov@mailbox.org/
> >
> > v3:
> >  - Split the commits into even more commits, each commit
> >    affecting one driver directory.
> >
> > v2:
> >  - Split the single patch into a two-patch series to separate 
> >    logical changes, as suggested by Luka Gejak.
> >  - Cleaned up additional boolean comparisons found using 'git grep'.
> >
> > Andrei Khomenkov (6):
> >   staging: rtl8723bs: core: simplify boolean comparisons
> >   staging: rtl8723bs: hal: simplify boolean comparisons
> >   staging: rtl8723bs: os_dep: simplify boolean comparisons
> >   staging: rtl8723bs: core: style cleanup
> >   staging: rtl8723bs: hal: style cleanup
> >   staging: rtl8723bs: os_dep: style cleanup
> 
> Instead of "staging: rtl8723bs: os_dep: style cleanup" do "staging:
> rtl8723bs: style cleanup in os_dep/". For this driver the standard
> prefix is "staging: rtl8723bs:".

Either is really fine, we are not _that_ picky :)

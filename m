Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED842F532F;
	Mon, 23 Feb 2026 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860860; cv=none; b=WI5tXmgflYI8+dm1rB1AGII79mhXvzY8k3S8AEUYgCGdVVSMM8BLfMsZU6N6KU+OipDzZMnbcr51NETMMq+DZ3Sd+53shicmbIdB0+knxDwpCcUba5H6fpmfhDcvVnm9hXnWlhDkRudjz9ugc+nLa3ofzsTC/42sLRkM20EV/0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860860; c=relaxed/simple;
	bh=DzsAZ+f9i2APQtSYKGbsPbPfiVn5KQ6fUQFPqOHopA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsxQAjpG+2C27IhDbPD4R/7WCQ/Ml6Zlntw/nRkb1y94Xigv7F2Gd2F6lie4x/el+E/Yk9IdwlgRaYCMd38NoNSCsBazfK/JOWpuV447jD3bXKXS6c8jaS7HTjWaFTGJNTA4ciDg5Q+UJmLNl8AYPF8UuO46RUrtugVo+GCsRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f637zESY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f637zESY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFC9C116D0;
	Mon, 23 Feb 2026 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771860860;
	bh=DzsAZ+f9i2APQtSYKGbsPbPfiVn5KQ6fUQFPqOHopA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f637zESYIa4k/eDM/BHTDL+cC0G+W/aG2PxgiL9NOy6Brtz0U7L7G8PsPkEkg6k9F
	 k7dqq7OG2ymNMCYyySnDUJa8buDn5DesA7uKmbruxTy7+GoIfOQQZafUWV2l+MDQNy
	 6pG1uaJfdLeI3N+JzDVsuyfuwpyTN/mNJReZffcg=
Date: Mon, 23 Feb 2026 16:29:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: properly validate the data in
 rtw_get_ie_ex()
Message-ID: <2026022356-borrower-poise-80a9@gregkh>
References: <2026022336-arrange-footwork-6e54@gregkh>
 <4fa1f4f6-3abe-4acf-938d-abc49a14b6aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa1f4f6-3abe-4acf-938d-abc49a14b6aa@gmail.com>

On Mon, Feb 23, 2026 at 08:53:54PM +0530, Navaneeth K wrote:
> I don't have the physical RTL8723BS hardware on hand anymore to test a live
> connection, but I was able to verify your logic thoroughly in user-space.
> To be absolutely sure, I extracted both the old and patched functions into a
> standalone C harness and ran them through Asan and AFL++.
> Feeding a crafted 5-byte allocation(with a lying length byte) to the old
> code predictably triggered a 47-byte heap-buffer-overflow right at the
> memcpy.
> Against your patched code, I ran that same payload along with 20 other
> edge-case tests (1-byte buffers, empty bodies, OUI boundary mismatches,
> etc.). It cleanly rejected all of them with zero ASan errors.
> I also compiled the patched function as an AFL++ target and let it freely
> mutate the EID, length, and body bytes. After over 100,000 executions, it
> reported 0 crashes and 0 hangs.
> The logic is definitely solid. Changing the loop guard to "while (cnt + 2 <=
> in_len)" guarantees we always have at least 2 bytes before we touch the EID
> and length. Reading ie_len once and explicitly checking if it exceeds in_len
> completely stops the memcpy from reading past the end of the allocation.
> 
> I have the raw ASan logs, AFL stats, and the C test harnesses saved if
> needed!.
> 
> Tested-by: Navaneeth K <knavaneeth786@gmail.com>
> Reviewed-by: Navaneeth K <knavaneeth786@gmail.com>

Wow, that's way more than I expected, thank you!  Raw logs and test
harness is not needed, I'll trust you, worst case, we revert it if
someone complains it breaks their device :)

thanks,

greg k-h

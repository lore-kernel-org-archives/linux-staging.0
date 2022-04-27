Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E623652
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 04:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14116C385A7;
	Wed, 27 Apr 2022 04:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1651035177;
	bh=DxCUyl9p44smzXQftcVWir2mw4zf6/UMSiRlQ4twW6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ag0XENDOV5yFKAC9dzETXOjBBqj+UP190wk2Xfl+oSr4qSpFf5wx6mOCAWyGrqs8T
	 58wVf+JgqNixbOiROO2gGFUPzWynnQCbDBWkJd+zFHf5dmnMAr26ibSBwjT4lF/ihk
	 NniF2jZsF2kosB0bx4oTWU7J6kO9JeDRTAFj2zQE=
Date: Wed, 27 Apr 2022 06:52:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: vt6655: Replace MACvReadMIBCounter with
 VNSvInPortD
Message-ID: <YmjMJHup1TJohVZd@kroah.com>
References: <cover.1651001609.git.philipp.g.hortmann@gmail.com>
 <50cbf7b87759dbfe023554fc42a499dd923b7f8c.1651001609.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50cbf7b87759dbfe023554fc42a499dd923b7f8c.1651001609.git.philipp.g.hortmann@gmail.com>

On Tue, Apr 26, 2022 at 10:02:17PM +0200, Philipp Hortmann wrote:
> Replace macro MACvReadMIBCounter with VNSvInPortD and as it
> was the only user, it can now be removed.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> V1 -> V2: Shorted and simplified patch description

There is no "v2" in the subject lines in this thread anywhere :(

git will create it automatically for you if you use the '-v' option to
git format-patch.

Please fix up and send a v3 series.

thanks,

greg k-h

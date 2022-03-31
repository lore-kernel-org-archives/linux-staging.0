Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FD27C;
	Thu, 31 Mar 2022 11:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63BFC340EE;
	Thu, 31 Mar 2022 11:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648726438;
	bh=cjZmh4LdpDHRvlpgeNidC1QaRwP08X6tDdjVpm3xYGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AaQ5coN5SmKou+2F7UPD6+lpEu+jU0MMHN4fhg6QITovSIruPU1636r/lMrRPBxMW
	 7Egpw8lfRyvT+zTl7oKd7XmWYGoUeRTn04xMJQv8fpFRfaq1DVYJfrcdUqymzn1nxg
	 SLwqGj8zsoRTkghVTd1iluyx8ZnM/meuW3BHAlzk=
Date: Thu, 31 Mar 2022 13:33:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gdm724x: Fix Duplication of Side Effects
Message-ID: <YkWRort8Fsnndxf2@kroah.com>
References: <20220331101849.71046-1-eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331101849.71046-1-eng.alaamohamedsoliman.am@gmail.com>

On Thu, Mar 31, 2022 at 12:18:49PM +0200, Alaa Mohamed wrote:
> Fix Duplication of Side Effects for GDM_TTY_READY(gdm) macro
> reported by checkpatch
> "CHECK: Macro argument reuse 'gdm' - possible side-effects?"

There are no such side-effects here, sorry.  Please always evaluate the
code to see what it does, checkpatch sometimes gets it wrong.

thanks,

greg k-h

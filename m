Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EEC1117
	for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 13:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7ADC433C8;
	Sat, 17 Jun 2023 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687009579;
	bh=JY48Q9h8/zPsasO5RFQPKvoVzkgofY9CUa1T4CXsfmw=;
	h=Date:From:To:Cc:Subject:From;
	b=Kfj/Hu0DzPAof1+l7kgXMtgxOB7LduhDHyh+C+lKxEnvHQLkINUtdP5nPFmxdIUTL
	 cvLgkVFdUUM7NkGbH/PZwO6m8AHbNBEQZgLil4hNScbD4fn5R0eqdBfSp9R+gBAgxJ
	 72lM9aUHJoDPZp1aXFPpEGSCwFzjXPPcx/+HWjkk=
Date: Sat, 17 Jun 2023 15:46:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fix for 6.4-rc7
Message-ID: <ZI25KRBpKGcP0wSf@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.4-rc7

for you to fetch changes up to b3dad076a058916c443c93074dc3ee80baaff4ea:

  staging: octeon: delete my name from TODO contact (2023-05-08 16:09:33 +0200)

----------------------------------------------------------------
Staging driver fix for 6.4-rc7

Here is a single staging driver "fix" for 6.4-rc7.  I've been sitting on
it in my tree for many weeks as it is just a simple documentation
update, with the hope that maybe some other staging driver fixes would
need to be merged for 6.4-final, but that does not seem to be the case.

So please, pull in this one documentation update so that Aaro doesn't
get emails going forward that he can't do anything about.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Aaro Koskinen (1):
      staging: octeon: delete my name from TODO contact

 drivers/staging/octeon/TODO | 1 -
 1 file changed, 1 deletion(-)

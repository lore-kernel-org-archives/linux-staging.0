Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787532;
	b=WOtoB1e3YGTmiEgGX6bWmP5qKmXJPPkanFuOyYafNhAIY6fbTT/fJm5IVCJ7Fge76yJC
	 TyXWmCaoyFqo+EBDnjGnCcC6FR1qGXAOyOO6TDRNzlfkg+w5q6I1SiEw8nmLY9bFyJqND
	 nEzbxOeC1Ayz4OdCTnJu1sw5bwlWg+NHyGRGXfor7Kp0orUBIBcev/MLA/cnx9mqPdrE/
	 KauOY49gch+NbfdAvAJfqn3/DQfbDshuXfAehY2diUInvbcPQ5OWuP0eLu52Hd1kcux+P
	 Q8ZkWaPmYV7n7Fata6Sr6Vl3qEn9WIF/ejV7d4geZm5Jk+LvqMdMmKs2uRhlA08KrwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787532;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=SMA/kJPlMDk9z1lOpWmlCHS9TiE0+16O1BYeHJBkwx0=;
	b=iTvcHh/PS6tsHie4bgY8YFFBpRN7VhmtIJtrgnonMoU3KuVV4qV4uNUwaLsBx2VKUkfx
	 uFrI/y3BmhE1NCVoF/z0AmzGPIC8KGyUunTIlkXmGJUmhH/KwM+/pY3gzyA0+FHn4MT5d
	 Bg8MstTnOMOL+jD4CDExDY8LFh+xuE4nujtVYo4+pEkABpgTtLZ38J8wjIkqFTMTaJV4g
	 Q3+gRDgO9wkBLq8Fg8/iaYz+CP74YMGLWxQI726PlMUjuswo+7QiEUFUUdXCR7GYvdgvS
	 Uavda4cz9kLberynReSA+K8Wehsp7M//YH5jWWCeXBFZcVb6f2qqdnvbQGlkyNNC7Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pxpDbaUc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB60D606A31C;
	Fri, 27 Nov 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pxpDbaUc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A9D1F000C1;
	Fri, 27 Nov 2026 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795787532;
	bh=SMA/kJPlMDk9z1lOpWmlCHS9TiE0+16O1BYeHJBkwx0=;
	h=Date:From:To:Cc:Subject;
	b=pxpDbaUcXmFXUCI23+GgUaJVDLR49bpSUDPiUML8bUlF9JbVHReG+D/LwF/bomcFY
	 AzGchU8LyJVHBYJp0mol3kWfN+htpYelXxj73mOeoyRThQuO3hJZq2oVFqQJwKdBr4
	 A1YMDpAsYElHMUYWPW0OaPDv9p7DVasS6XOBDBAI=
Date: Fri, 27 Nov 2026 14:52:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver removal for 7.4-rc5
Message-ID: <awmLIGoX6sME2IJQ@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit d135ab453a7400a34930bdda1ef4bdc8acfac80e:

  Merge tag 'backlight-next-7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight (2026-10-26 09:10:43 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.4-rc5

for you to fetch changes up to 24934cb6b8cd925b7c86ad818929c272a360ec53:

  staging: vme_user: delete driver (2026-10-27 17:54:34 +0100)

----------------------------------------------------------------
Staging driver removal for 7.4-rc5

Here is a single staging driver patch that removes the vme_user driver.
There is no more users of it and the LLMs are falling all over
themselves attempting to find all of the "security bugs" in this driver,
despite no one ever actually use it.  So just remove it to keep from
wasting everyone's time.

This removal has been in linux-next for quite a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
LiuJunyuan (1):
      staging: vme_user: delete driver

 Documentation/driver-api/index.rst    |    1 -
 Documentation/driver-api/vme.rst      |  297 ----
 MAINTAINERS                           |    7 -
 arch/powerpc/configs/86xx-hw.config   |    2 -
 drivers/staging/Kconfig               |    2 -
 drivers/staging/Makefile              |    1 -
 drivers/staging/vme_user/Kconfig      |   53 -
 drivers/staging/vme_user/Makefile     |    9 -
 drivers/staging/vme_user/vme.c        | 1977 ------------------------
 drivers/staging/vme_user/vme.h        |  190 ---
 drivers/staging/vme_user/vme_bridge.h |  190 ---
 drivers/staging/vme_user/vme_fake.c   | 1308 ----------------
 drivers/staging/vme_user/vme_tsi148.c | 2643 ---------------------------------
 drivers/staging/vme_user/vme_tsi148.h | 1392 -----------------
 drivers/staging/vme_user/vme_user.c   |  812 ----------
 drivers/staging/vme_user/vme_user.h   |   47 -
 16 files changed, 8931 deletions(-)
 delete mode 100644 Documentation/driver-api/vme.rst
 delete mode 100644 drivers/staging/vme_user/Kconfig
 delete mode 100644 drivers/staging/vme_user/Makefile
 delete mode 100644 drivers/staging/vme_user/vme.c
 delete mode 100644 drivers/staging/vme_user/vme.h
 delete mode 100644 drivers/staging/vme_user/vme_bridge.h
 delete mode 100644 drivers/staging/vme_user/vme_fake.c
 delete mode 100644 drivers/staging/vme_user/vme_tsi148.c
 delete mode 100644 drivers/staging/vme_user/vme_tsi148.h
 delete mode 100644 drivers/staging/vme_user/vme_user.c
 delete mode 100644 drivers/staging/vme_user/vme_user.h

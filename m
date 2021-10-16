Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13C62C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 18:14:02 +0000 (UTC)
Received: from ipservice-092-217-067-147.092.217.pools.vodafone-ip.de ([92.217.67.147] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mboBy-0006wS-Ho; Sat, 16 Oct 2021 20:13:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: clean up osdep_service.h
Date: Sat, 16 Oct 2021 20:13:40 +0200
Message-Id: <20211016181343.3686-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused code. Don't allow user space to kill our cmd thread.

This should be applied on top of "staging: r8188eu: clean up the
Makefile".

Martin Kaiser (3):
  staging: r8188eu: res_to_status is unused
  staging: r8188eu: daemonize is not defined
  staging: r8188eu: don't accept SIGTERM for cmd thread

 drivers/staging/r8188eu/core/rtw_cmd.c          |  2 --
 drivers/staging/r8188eu/include/osdep_service.h | 13 -------------
 2 files changed, 15 deletions(-)

-- 
2.20.1


Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049DB2F29
	for <linux-staging@lists.linux.dev>; Thu,  3 Feb 2022 20:18:04 +0000 (UTC)
Received: from dslb-188-096-149-005.188.096.pools.vodafone-ip.de ([188.96.149.5] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nFiYE-0004N1-EF; Thu, 03 Feb 2022 21:17:54 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] staging: r8188eu: clean up phy_BB8188E_Config_ParaFile
Date: Thu,  3 Feb 2022 21:17:43 +0100
Message-Id: <20220203201745.251826-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two simple patches to clean up the error handling of
phy_BB8188E_Config_ParaFile.

Martin Kaiser (2):
  staging: r8188eu: remove unnecessary error check
  staging: r8188eu: simplify error handling in
    phy_BB8188E_Config_ParaFile

 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

-- 
2.30.2


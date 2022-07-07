Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0472F2596
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 19:49:30 +0000 (UTC)
Received: from dslb-188-097-214-244.188.097.pools.vodafone-ip.de ([188.97.214.244] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1o9XV2-0008AP-5b; Thu, 07 Jul 2022 21:49:20 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] clean up sta2sta_data_frame
Date: Thu,  7 Jul 2022 21:49:12 +0200
Message-Id: <20220707194914.63794-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two patches that clean up the sta2sta_data_frame function.

Martin Kaiser (2):
  staging: r8188eu: remove sta2sta_data_frame prototype
  staging: r8188eu: pattrib addresses were already set by the caller

 drivers/staging/r8188eu/core/rtw_recv.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

-- 
2.30.2


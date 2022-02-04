Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B7D2F26
	for <linux-staging@lists.linux.dev>; Fri,  4 Feb 2022 09:10:01 +0000 (UTC)
Received: from dslb-188-096-149-005.188.096.pools.vodafone-ip.de ([188.96.149.5] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nFubL-0002IT-OV; Fri, 04 Feb 2022 10:09:55 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/4] staging: r8188eu: remove unused code for RF_PATH_B
Date: Fri,  4 Feb 2022 10:09:37 +0100
Message-Id: <20220204090941.309900-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220203203217.252156-1-martin@kaiser.cx>
References: <20220203203217.252156-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems that the r8188eu driver uses only RF_PATH_A. Remove RF_PATH_B
handling in some places where it's certainly not used

Martin Kaiser (4):
  staging: r8188eu: remove constant parameter of phy_LCCalibrate_8188E
  staging: r8188eu: remove dead code for tx power tracking
  staging: r8188eu: remove constant parameter of odm_ConfigRFReg_8188E
  staging: r8188eu: remove constant variable eRFPath

 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 90 ++-----------------
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |  7 +-
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  5 +-
 3 files changed, 10 insertions(+), 92 deletions(-)

-- 
2.30.2


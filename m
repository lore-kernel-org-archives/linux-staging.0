Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B847C
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 11:14:18 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKHks-0001FX-6V; Sat, 06 Aug 2022 13:14:06 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/5] staging: r8188eu: use struct ieee80211_mgmt in OnAssocRsp
Date: Sat,  6 Aug 2022 13:13:47 +0200
Message-Id: <20220806111352.690650-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724153917.138848-1-martin@kaiser.cx>
References: <20220724153917.138848-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a struct ieee80211_mgmt in OnAssocRsp to read elements of the
association response message. This should be easier than parsing the
message manually.

v2:
 - rewrite the commit messages to say to more clearly why (in my opinion)
   the patches change the code for the better

Martin Kaiser (5):
  staging: r8188eu: replace a get_da call
  staging: r8188eu: read status_code from struct ieee80211_mgmt
  staging: r8188eu: read capability info from struct ieee80211_mgmt
  staging: r8188eu: read aid from struct ieee80211_mgmt
  staging: r8188eu: simplify the calculation of ie start offset

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.30.2


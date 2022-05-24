Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD287F4
	for <linux-staging@lists.linux.dev>; Tue, 24 May 2022 09:01:02 +0000 (UTC)
Received: from 162.sub194.ddfr.nl ([83.136.194.162] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ntQPM-0006Y3-0P; Tue, 24 May 2022 11:00:52 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 00/12] staging: r8188eu: start cleaning up issue_action_BA
Date: Tue, 24 May 2022 11:00:17 +0200
Message-Id: <20220524090029.242584-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220521153824.218196-1-martin@kaiser.cx>
References: <20220521153824.218196-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start cleaning up the issue_action_BA function. Use helpers from
ieee80211.h to populate some of the fields of the outgoing frame.

(I'll send more patches for the remaining fields and messages.)

v2
- patch 5: remove a variable that's no longer used

Martin Kaiser (12):
  staging: r8188eu: remove unnecessary category check
  staging: r8188eu: use defines for the block action codes
  staging: r8188eu: use ieee80211_mgmt in issue_action_BA
  staging: r8188eu: use mgmt to set the addresses
  staging: r8188eu: use mgmt to set the sequence number
  staging: r8188eu: use mgmt to set the category
  staging: r8188eu: use mgmt to set the action codes
  staging: r8188eu: use mgmt to set the dialog token
  staging: r8188eu: use mgmt to set the timeout
  staging: r8188eu: use ieee80211 to set addba capabilities
  staging: r8188eu: use mgmt to set start sequence number
  staging: r8188eu: calculate the addba request length

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 126 ++++++++++----------
 1 file changed, 63 insertions(+), 63 deletions(-)

-- 
2.30.2


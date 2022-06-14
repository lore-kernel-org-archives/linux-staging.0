Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5D4686
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 02:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VGcRSjLbV9ZwhBfGleDibb3DqhkmCY5REWvPttnsKmE=; b=hCDYokHHkYRXevfvOlQR/aKGnF
	iktpm/cCXqT7ibOI3bCAz2IslF5oS7ilcHx2wkTl5q6IuC5CnDlvmFWjiZEET50oNOGy7HiySvM7Q
	VColeqOY4csXLccXUvusNODUkjuI94DcT79HaBur/BWY6bjAiPBAEHYv26fBVK2zajLk=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1o0vy8-00087N-0a; Mon, 13 Jun 2022 19:07:48 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Daniel Watson <ozzloy@challenge-bot.com>
Subject: [PATCH 0/4] remove wrappers on _rtw_IOL_append_*_cmd
Date: Mon, 13 Jun 2022 19:07:29 -0700
Message-Id: <cover.1655171591.git.ozzloy@challenge-bot.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Watson <ozzloy@challenge-bot.com>

This patchset removes the #define wrappers around the
rtl_IOL_append_*_cmd group of functions.  They are not needed.

Daniel Watson (4):
  staging: r8188eu: remove leading '_' on _rtw_IOL_append_WB_cmd
  staging: r8188eu: remove leading '_' on _rtw_IOL_append_WW_cmd
  staging: r8188eu: remove leading '_' on _rtw_IOL_append_WD_cmd
  staging: r8188eu: remove leading '_' on _rtw_IOL_append_WRF_cmd

 drivers/staging/r8188eu/core/rtw_iol.c    |  8 ++++----
 drivers/staging/r8188eu/include/rtw_iol.h | 24 ++++++++---------------
 2 files changed, 12 insertions(+), 20 deletions(-)

-- 
2.34.1


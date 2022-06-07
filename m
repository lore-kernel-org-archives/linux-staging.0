Received: from challenge-bot.com (ozzloy.lifeafterking.org [208.85.243.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B227C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 06:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=challenge-bot.com; s=20180430; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NDHKKSmM/1awbA139++eN0BK1p5M4NDk8HA8lGCAbmY=; b=SNJKp+iyI1ltJjQhHkpFDpcoHV
	Rn52ZpilNAVcmQ8COz/zmDXKCpDomonDTUL0IZTTnGmuZI3bJFQEPWjjOITvZOcS0ZdWwn7kVkWx5
	nfvaq28AjcPebA2xD62m2Y4tIKyUIUOVUqhpWkRgOtXaNterNabTaf+T3h8GItepTivA=;
Received: from ozzloy by challenge-bot.com with local (Exim 4.92)
	(envelope-from <ozzloy@challenge-bot.com>)
	id 1nySQt-0008Vi-6s; Mon, 06 Jun 2022 23:11:15 -0700
From: daniel watson <ozzloy@challenge-bot.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Daniel Watson <ozzloy@challenge-bot.com>
Subject: [PATCH] staging: r8188eu: fix declaration to match 'foo *bar'
Date: Mon,  6 Jun 2022 23:11:13 -0700
Message-Id: <20220607061113.32633-1-ozzloy@challenge-bot.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Watson <ozzloy@challenge-bot.com>

put '*' next to variable to match kernel style from checkpatch

Signed-off-by: Daniel Watson <ozzloy@challenge-bot.com>
---
 drivers/staging/r8188eu/include/rtw_io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 6910e2b430e24..0e390eda5b4d3 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -283,7 +283,7 @@ void free_io_queue(struct adapter *adapter);
 void async_bus_io(struct io_queue *pio_q);
 void bus_sync_io(struct io_queue *pio_q);
 u32 _ioreq2rwmem(struct io_queue *pio_q);
-void dev_power_down(struct adapter * Adapter, u8 bpwrup);
+void dev_power_down(struct adapter *Adapter, u8 bpwrup);
 
 #define PlatformEFIOWrite1Byte(_a,_b,_c)		\
 	rtw_write8(_a,_b,_c)
-- 
2.34.1


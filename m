Received: from p-impout003.msg.pkvw.co.charter.net (p-impout003aa.msg.pkvw.co.charter.net [47.43.26.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F415A8
	for <linux-staging@lists.linux.dev>; Sun, 29 May 2022 00:48:59 +0000 (UTC)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com.com ([24.31.246.181])
	by cmsmtp with ESMTP
	id v75WnJjj4R0wIv75WnCgjx; Sun, 29 May 2022 00:47:23 +0000
X-Authority-Analysis: v=2.4 cv=FYAkeby6 c=1 sm=1 tr=0 ts=6292c29b
 a=cAe/7qmlxnd6JlJqP68I9A==:117 a=cAe/7qmlxnd6JlJqP68I9A==:17
 a=IkcTkHD0fZMA:10 a=yQdBAQUQAAAA:8 a=OUNqcoRDPagEZD6Yk-wA:9 a=QEXdDO2ut3YA:10
 a=SzazLyfi1tnkUD6oumHU:22
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH v2 0/2] Fix some compile warnings in v5.18+
Date: Sat, 28 May 2022 19:47:09 -0500
Message-Id: <20220529004711.27545-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNJmB+gcPpnZ8Dr4CUPFbiyGhAvY0LuZZesniX76hpu730ddl8S602W6MZVfRKfTL8ZaBPbXf3lslB14IbqACkFYxzHDdjydHeVonXBuTQYP2BVklI0C
 7dSGdPvsV8vU//rHyUbn8mbynLYQSxNHM6nK5Ugj3TxsX6wRvlCY2PM17cH10WmuRyIdesdkW1G52R4R9n2zLMjhPSnSRbv81gTV1BYy5sfNHirnk1GQuCbJ
 tMlsk/cOwqSSbDwjSpzpIzKkN2CkUXtVMAMJsS+3IYu65dqAHG38OO19/BXTaHaTfuQcWMHI1aTv3FwIfqmN6892ZC1gTJgNUktUZ5fTuFAVOhYq7MCY0bzM
 5xbqz0V5UpXkLMMFbrPClchndm0JzDZtnjTH7aMX/dimAL5xdk36pGlskV2Vvm42e/Mw1lGD

Building driver r8188eu in staging with -warray-bounds exposes two places
where arrays are too small.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
v2 - get proper To and Cc

Larry Finger (2):
  staging: r8188eu: Fix warning of array overflow in ioctl_linux.c
  staging: r8188eu: Fix undersized array in rtw_xmit.c

 drivers/staging/r8188eu/include/rtw_xmit.h   | 2 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.36.1

